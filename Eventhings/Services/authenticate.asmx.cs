using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Eventhings.DbContexts;
using Eventhings.DbEntities;
using Eventhings.Dto;
using Newtonsoft.Json;
using Eventhings.Response;
using System.Net.Mail;
using System.Web.Security;
using System.Web.Script.Services;

namespace Eventhings.Services
{
    /// <summary>
    /// Summary description for authenticate
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [ScriptService]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class authenticate : System.Web.Services.WebService
    {
        [WebMethod]
        public List<UserResponse> Get()
        {
            var response = new List<UserResponse>();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = _context.tcoreusers
                        .Where(e => e.active == 1 && e.is_deleted == 0)
                        .Select(n => new UserResponse()
                        {
                            user_code = n.user_code,
                            first_name = n.first_name,
                            last_name = n.last_name,
                            other_name = n.other_name,
                            email = n.email,
                            email_confirmed = n.email_confirmed,
                            phone_number = n.phone_number,
                            phone_number_confirmed = n.phone_number_confirmed,
                            password_hash = n.password_hash,
                            require_password_change = n.require_password_change,
                            active = n.active,
                            created_at = n.created_at,
                            created_by = n.created_by,
                            updated_at = n.updated_at,
                            updated_by = n.updated_by
                        }).ToList();

                    foreach (var ss in query)
                    {
                        response.Add(ss);
                    }
                }
            }
            catch (Exception ex)
            {
                response.Add(new UserResponse()
                {
                    Status = 0,
                    Message = ex.ToString()
                });
            }

            return response;
        }

        [WebMethod]
        public RegisterResponse Register(RegisterDto register)
        {
            var response = new RegisterResponse();

            try
            {
                if (string.IsNullOrWhiteSpace(register.email))
                {
                    response.Status = 0;
                    response.Message = "Email and password are both required";
                    return response;
                }

                using (var _context = new EventhingsDbContext())
                {
                    var existingUser = _context.tcoreusers
                        .Where(email => email.email == register.email || email.phone_number == register.phone_number)
                        .FirstOrDefault();

                    var existingRole = _context.tcoreroles.Where(role => role.id == register.user_type).FirstOrDefault();

                    if (existingRole == null)
                    {
                        response.Status = 0;
                        response.Message = "User account can't be created, user type does not exists";
                        return response;
                    }

                    if (existingUser != null)
                    {
                        if (existingUser.email.Equals(register.email))
                        {
                            response.Status = 0;
                            response.Message = "The email specified already exists";
                            return response;
                        }

                        if (existingUser.phone_number.Equals(register.phone_number))
                        {
                            response.Status = 0;
                            response.Message = "The phone number specified already exists";
                            return response;
                        }

                        if (existingUser.email_confirmed == null)
                        {
                            response.Status = 0;
                            response.Message = "The specified email already exists but has not been confirmed";
                            return response;
                        }

                        if (existingUser.phone_number_confirmed == null)
                        {
                            response.Status = 0;
                            response.Message = "The specified phone number already exists but has not been confirmed";
                            return response;
                        }
                    }

                    using (var tranx = _context.Database.BeginTransaction())
                    {
                        var _userid = 0;
                        var _roleid = existingRole.id;

                        if (register.direction == 0) //public 
                        {
                            if (string.IsNullOrWhiteSpace(register.password_hash))
                            {
                                response.Status = 0;
                                response.Message = "Password is required";
                                return response;
                            }

                            if (!string.Equals(register.email, register.email_confirmed))
                            {
                                response.Status = 0;
                                response.Message = "Email and confirm email does not match";
                                return response;
                            }

                            var userregister = _context.tcoreusers.Add(new tcoreuser
                            {
                                user_code = $"Evt-USR-{new Random().Next().ToString()}",
                                email = register.email,
                                phone_number = register.phone_number,
                                first_name = register.first_name,
                                last_name = register.last_name,
                                password_hash = register.password_hash,
                                require_password_change = 0,
                                email_confirmed = null,
                                phone_number_confirmed = null,
                                created_at = DateTime.Now,
                                created_by = "Public",
                                active = 1
                            });

                            _userid = userregister.id;
                        }
                        else if (register.direction == 1) //admin
                        {
                            var userregister = _context.tcoreusers.Add(new tcoreuser
                            {
                                user_code = $"Evt-USR-{new Random().Next().ToString()}",
                                email = register.email,
                                phone_number = register.phone_number,
                                first_name = register.first_name,
                                last_name = register.last_name,
                                password_hash = "kGktuYQL3vuB8SRYqlvLESv6cLF2Z30YfcGuX8r6udA",
                                require_password_change = 1,
                                email_confirmed = null,
                                phone_number_confirmed = null,
                                active = register.active,
                                created_at = DateTime.Now
                            });
                            _userid = userregister.id;
                        }
                        else
                        {
                            response.Status = 0;
                            response.Message = "User account can not be created, user direction not present";
                            return response;
                        }

                        var userInRole = _context.tcoreuserroles
                            .Where(role => role.role_id == _roleid && role.user_id == _userid)
                            .FirstOrDefault();

                        if (userInRole != null)
                        {
                            response.Status = 0;
                            response.Message = "The user account exists and already added to a user type";
                            return response;
                        }

                        var addUserToRole = _context.tcoreuserroles.Add(new tcoreuserrole
                        {
                            user_id = _userid,
                            role_id = _roleid,
                            is_deleted = 0,
                            active = 1,
                            created_by = register.created_by,
                            created_at = register.created_at
                        });

                        var changes = _context.SaveChanges();

                        if (changes >= 1)
                        {
                            response.Status = 1;
                            response.Message = "Account created successfully, a confirmation message has been sent to the email specified";
                        }
                        else
                            response.Status = 0;

                        tranx.Commit();
                    }
                }
            }
            catch(Exception ex)
            {
                response.Status = 0;
                response.Message = ex.ToString();
                return response;
            }

            return response;
        }

        [WebMethod]
        public LoginResponse Login(LoginDto login)
        {
            var response = new LoginResponse();

            if (string.IsNullOrWhiteSpace(login.email) || string.IsNullOrWhiteSpace(login.password_hash))
            {
                response.Status = 0;
                response.Message = "Email and password are both required";
                return response;
            }

            if (!login.email.Contains("@") || !login.email.Contains("."))
            {
                response.Status = 0;
                response.Message = "Invalid email address, please change it";
                return response;
            }

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    //var userInRole = _context.tcoreuserroles.Where(role => role.id == existingRole.id && role.id == existingUser.id).FirstOrDefault();

                    var userLogin = _context.tcoreusers
                        .Where(e => e.email == login.email && e.password_hash == login.password_hash).FirstOrDefault();

                    if (userLogin != null)
                    {
                        if(userLogin.active == 0)
                        {
                            response.Status = 0;
                            response.Message = "Your account is in-active, please contact administrator.";
                            return response;
                        }

                        if (userLogin.email_confirmed == null)
                        {
                            response.Status = 0;
                            response.Message = "Can't login at the moment, please confirm your email";
                            return response;
                        }

                        if(userLogin.phone_number_confirmed == null)
                        {
                            response.Status = 0;
                            response.Message = "Can't login at the moment, please confirm your phone number";
                            return response;
                        }

                        if (userLogin.require_password_change == 1)
                        {
                            response.Status = 2;
                            response.Message = Server.MapPath("~/clients/create-password.html");
                            return response;
                        }

                        response.Status = 1;
                        response.Message = Server.MapPath("~/admin/dashboard.aspx");
                        //FormsAuthentication.RedirectFromLoginPage(login.email, login.keep_me_signin);
                        //HttpContext.Current.Session["email"] = login.email;
                    }
                    else
                    {
                        response.Status = 0;
                        response.Message = "Inavalid username or password.";
                    }
                }
            }
            catch(Exception ex)
            {
                response.Status = 0;
                response.Message = ex.Message;
                //response.Message = "Network error occured.";
            }

            return response;
        }
    }
}
