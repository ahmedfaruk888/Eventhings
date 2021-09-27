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
        public object Login(LoginDto login)
        {
            var response = new LoginResponse();

            if (string.IsNullOrWhiteSpace(login.email) || string.IsNullOrWhiteSpace(login.password_hash))
            {
                response.Status = 0;
                response.Message = "Email and password are both required";
                return JsonConvert.SerializeObject(response);
            }

            if (!login.email.Contains("@") || !login.email.Contains("."))
            {
                response.Status = 0;
                response.Message = "Invalid email address, please change it";
                return JsonConvert.SerializeObject(response);
            }

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var userLogin = _context.tcoreusers
                        .Where(e => e.email == login.email && e.password_hash == login.password_hash).FirstOrDefault();

                    if (userLogin != null)
                    {
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

            return JsonConvert.SerializeObject(response);
        }

        [WebMethod]
        public static object Register(RegisterDto register)
        {
            var response = new RegisterResponse();
            
            if (string.IsNullOrWhiteSpace(register.email))
            {
                response.Status = 0;
                response.Message = "Email and password are both required";
                return JsonConvert.SerializeObject(response);
            }

            if (string.IsNullOrWhiteSpace(register.password_hash))
            {
                response.Status = 0;
                response.Message = "Password is required";
                return JsonConvert.SerializeObject(response);
            }

            if (!string.Equals(register.email, register.email_confirmed))
            {
                response.Status = 0;
                response.Message = "Email and confirm email does not match";
                return JsonConvert.SerializeObject(response);
            }

            using (var _context = new EventhingsDbContext())
            {
                var userregister = _context.tcoreusers.Add(new tcoreuser
                {
                    user_code = $"Evt-USR-{new Random().Next().ToString()}",
                    email = register.email,
                    phone_number = register.phone_number,
                    first_name = register.first_name,
                    last_name = register.last_name,
                    password_hash = register.password_hash
                });

                var changes = _context.SaveChanges();

                if (changes >= 1)
                {
                    response.Status = 1;
                    response.Message = "Account created successfully";
                    FormsAuthentication.RedirectToLoginPage();
                    HttpContext.Current.Session["email"] = register.email;
                }
                else
                    response.Status = 0;
            }

            return JsonConvert.SerializeObject(response);
        }
    }
}
