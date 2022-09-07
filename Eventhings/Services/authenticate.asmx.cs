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
    [WebServiceBinding(ConformsTo = WsiProfiles.None)]
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
                            //full_name = $"{n.last_name} {n.first_name} {n.other_name}"
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

        [WebMethod(MessageName = "GetCustomerByPhone")]
        public UserResponse Get(UserDto user)
        {
            var response = new UserResponse();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    if(string.IsNullOrWhiteSpace(user.phone_number))
                    {
                        response.Status = 0;
                        response.Message = "Phone number is required";
                    }

                    var query = _context.tcoreusers
                        .Where(e => e.phone_number == user.phone_number && e.active == 1 && e.is_deleted == 0)
                        .Select(n => new UserResponse()
                        {
                            id = n.id,
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
                            updated_by = n.updated_by,
                            Status = 1,
                            Message = "Success"
                        }).FirstOrDefault();

                    //var wallet = _context.tcorewallets.Where(p => p.user_id == query.id.ToString()).FirstOrDefault();
                    //query.current_balance = wallet.current_balance.ToString();
                    response = query;

                }
            }
            catch (Exception ex)
            {
                response.Status = 0;
                response.Message = ex.ToString();
            }

            return response;
        }

        [WebMethod]
        public RegisterResponse Register(RegisterDto register)
        {
            var response = new RegisterResponse();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var existingUser = _context.tcoreusers
                        .Where(phone => phone.phone_number == register.phone_number).FirstOrDefault();

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

                            if (string.IsNullOrWhiteSpace(register.email))
                            {
                                response.Status = 0;
                                response.Message = "Email is required";
                                return response;
                            }

                            if (string.IsNullOrWhiteSpace(register.first_name))
                            {
                                response.Status = 0;
                                response.Message = "First name is required";
                                return response;
                            }

                            if (string.IsNullOrWhiteSpace(register.last_name))
                            {
                                response.Status = 0;
                                response.Message = "Last name is required";
                                return response;
                            }

                            if (!string.Equals(register.password_hash, register.retry_password_hash))
                            {
                                response.Status = 0;
                                response.Message = "Password and confirm password field does not match";
                                return response;
                            }

                            var userregister = _context.tcoreusers.Add(new tcoreuser
                            {
                                user_code = $"Evt-USR-{new Random().Next().ToString()}",
                                email = (string.IsNullOrWhiteSpace(register.email)) ? null : register.email,
                                phone_number = register.phone_number,
                                first_name = register.first_name,
                                last_name = register.last_name,
                                password_hash = register.password_hash,

                                require_password_change = 0,
                                two_factor_enabled = 0,
                                phone_number_confirmed = DateTime.Now,
                                email_confirmed = DateTime.Now,


                                created_at = DateTime.Now,
                                created_by = "Public",
                                active = 1,
                                verification_code = $"Evt-VRC-{new Random().Next().ToString()}",
                                verification_token = Guid.NewGuid().ToString()
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
                                password_hash = "Passw0rd",
                                
                                require_password_change = 0,
                                two_factor_enabled = 0,
                                phone_number_confirmed = DateTime.Now,
                                email_confirmed = DateTime.Now,

                                active = register.active,
                                created_at = DateTime.Now,
                                verification_code = $"Evt-VRC-{new Random().Next().ToString()}",
                                verification_token = Guid.NewGuid().ToString()
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

                        //Send an email here or send an SMS to the user here

                        //Wallet //Create a wallet for the user
                        var currentUser = _context.tcoreusers.Where(p => p.phone_number == register.phone_number).FirstOrDefault();

                        if (currentUser == null)
                        {

                            var currentWallet = _context.tcorewallets.Where(p => p.user_id == currentUser.id.ToString()).FirstOrDefault();
                            if(currentWallet != null)
                            {
                                var wallet = _context.tcorewallets.Add(new tcorewallet
                                {
                                    user_id = currentUser.id.ToString(),
                                    prev_balance = 0,
                                    amount_paid = (register.topup_amount.HasValue) ? register.topup_amount : 0,
                                    current_balance = (0 + register.topup_amount),
                                    active  = 1,
                                    is_deleted = 0,
                                    created_by = register.created_by,
                                    created_at = DateTime.Now
                                });
                            }
                        }

                        changes += _context.SaveChanges();

                        if (changes >= 1)
                        {
                            response.Status = 1;

                            if (register.email == null)
                                response.Message = "Account created successfully";
                            else
                                response.Message = "Account created successfully, a confirmation message has been sent to the email specified";

                            response.verification_token = Guid.NewGuid().ToString();
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
        public RegisterResponse VerifyEmail(VerificationDto verifydto)
        {
            var response = new RegisterResponse();
            using (var _context = new EventhingsDbContext())
            {
                if (string.IsNullOrWhiteSpace(verifydto.verification_token))
                {
                    response.Status = 0;
                    response.Message = "Verification token is required";
                    return response;
                }
                if (string.IsNullOrWhiteSpace(verifydto.verification_code))
                {
                    response.Status = 0;
                    response.Message = "Verification is required";
                    return response;
                }

                var verificate = _context.tcoreusers.Where(user => user.verification_token == verifydto.verification_token).FirstOrDefault();
                if(verificate != null)
                {
                    var suppliedCode = verifydto.verification_code;
                    var storedCode = verificate.verification_code;

                    if (verificate.email_confirmed != null)
                    {
                        response.Status = 2;
                        response.Message = "The supplied verification token has been confirmed";
                        return response;
                    }

                    if (!suppliedCode.Equals(storedCode))
                    {
                        response.Status = 0;
                        response.Message = "Your verification code provided is not valid.";
                        return response;
                    }
                    else
                    {
                        verificate.email_confirmed = DateTime.Now;
                        //Mimic phone number verification
                        verificate.phone_number_confirmed = DateTime.Now;

                        _context.Entry(verificate).State = System.Data.Entity.EntityState.Modified;
                        var affected = _context.SaveChanges();
                        if(affected >= 0)
                        {
                            response.Status = 1;
                            response.Message = "Verification is successful";
                            return response;
                        }
                        else
                        {
                            response.Status = 0;
                            response.Message = "System error occured while verifying code.";
                            return response;
                        }
                    }
                }
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
                            response.Message = "Your account is not active yet, please contact administrator.";
                            return response;
                        }

                        if (userLogin.email_confirmed == null)
                        {
                            response.Status = 3;
                            response.Message = userLogin.verification_token; 
                            //Server.MapPath("~/clients/verify-account.html#");
                            return response;
                        }

                        if(userLogin.phone_number_confirmed == null)
                        {
                            response.Status = 0;
                            response.Message = login.email;
                            return response;
                        }

                        if (userLogin.require_password_change == 1)
                        {
                            response.Status = 2;
                            response.Message = login.email;
                            //response.Message = Server.MapPath("~/clients/create-password.html");
                            return response;
                        }

                        var userRoleLogin = _context.tcoreuserroles.Where(e => e.user_id == userLogin.id).FirstOrDefault();

                        var roleLogin = _context.tcoreroles.Where(e => e.id == userRoleLogin.role_id).FirstOrDefault();

                        if (userRoleLogin == null)
                        {
                            response.Status = 0;
                            response.Message = "Your account has not been added to a role, contact admin";
                            return response;
                        }

                        var x = new LoginResponse
                        {
                            role_name = roleLogin.name.ToLower(),
                            role_id = roleLogin.id,
                            active = userLogin.active,
                            is_deleted = userLogin.is_deleted,
                            full_name = $"{userLogin.first_name} {userLogin.last_name}",
                            user_id = userLogin.id,
                            user_code = userLogin.user_code,
                            email_address = userLogin.email,
                            phone_number = userLogin.phone_number,
                            verification_token = userLogin.verification_token,
                            verification_code = userLogin.verification_code,
                            Status = 1,
                        };

                        switch (roleLogin.name.ToLower())
                        {
                            case "vendor":
                                x.Message = "../clients/auth/vendor-dashboard.aspx";
                                break;
                            case "administrator":
                                //x.Message = "../clients/auth/dashboard.aspx";
                                x.Message = "dashbaord.html";
                                break;
                            case "customer":
                                x.Message = "../clients/auth/customer-dashboard.aspx";
                                break;
                            default:
                                break;
                        }

                        response = x;
                        
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
                //response.Message = ex.Message;
                response.Message = "Can not establish connection with the database server";
                //response.Message = ex.ToString();
            }

            return response;
        }

        [WebMethod]
        public LoginResponse CreatePassword(LoginDto login)
        {
            var response = new LoginResponse();

            if (string.IsNullOrWhiteSpace(login.email) || string.IsNullOrWhiteSpace(login.password_hash))
            {
                response.Status = 0;
                response.Message = "Email is required";
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

                    var userLogin = _context.tcoreusers.Where(e => e.email == login.email).FirstOrDefault();

                    if (userLogin != null)
                    {
                        if (userLogin.active == 0)
                        {
                            response.Status = 0;
                            response.Message = "Your account is in-active, please contact administrator.";
                            return response;
                        }

                        if (string.IsNullOrWhiteSpace(login.password_hash))
                        {
                            response.Status = 0;
                            response.Message = "Password is required.";
                            return response;
                        }

                        if (string.IsNullOrWhiteSpace(login.retry_password_hash))
                        {
                            response.Status = 0;
                            response.Message = "Retry password is required.";
                            return response;
                        }

                        if (!login.retry_password_hash.Equals(login.password_hash))
                        {
                            response.Status = 0;
                            response.Message = "Password and retry password must be equal.";
                            return response;
                        }

                        userLogin.password_hash = login.password_hash;
                        userLogin.updated_at = DateTime.Now;
                        userLogin.updated_by = login.email;
                        userLogin.require_password_change = 0;

                        _context.Entry(userLogin).State = System.Data.Entity.EntityState.Modified;
                        _context.SaveChanges();

                        response.Status = 1;
                        response.Message = "Your new password was created successfuly";
                    }
                    else
                    {
                        response.Status = 0;
                        response.Message = "User account can not be determined.";
                    }
                }
            }
            catch (Exception ex)
            {
                response.Status = 0;
                response.Message = "An network error occured";
            }

            return response;
        }

        [WebMethod]
        public PasswordResetResponse SendPasswordResetLink(PasswordResetDto pwdresetdto)
        {
            var response = new PasswordResetResponse();
            try
            {
                using(var _context = new EventhingsDbContext())
                {
                    var query = _context.tcoreusers.FirstOrDefault(x => x.active == 1 && x.is_deleted == 0 && x.email == pwdresetdto.email_address);
                    if(query != null)
                    {
                        if(string.IsNullOrWhiteSpace(query.email))
                        {

                        }

                        string ReadMsgFile()
                        {
                            var path = Server.MapPath("~/templates/invoces.html");

                            return "";
                        }

                        //send the password reset link to the emil
                        var resp = Eventhings.Common.EmailHelper.SendMail(new MailDto
                        {
                            from = "app@eventi.ng",
                            to = query.email,
                            body = ReadMsgFile()
                        }); ;
                    }
                    else
                    {
                        response.Status = 0;
                        response.Message = "Invalid email address, please change it and try again";
                    }
                }

            }
            catch(Exception ex)
            {
                response.Status = 0;
                response.Message = "A server error occured";
            }

            return response;
        }
    }
}
