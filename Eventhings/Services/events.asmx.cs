using Eventhings.DbContexts;
using Eventhings.Dto;
using Eventhings.Response;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace Eventhings.Services
{
    /// <summary>
    /// Summary description for events
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [ScriptService]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class events : System.Web.Services.WebService
    {

        [WebMethod]
        public object Login(LoginDto login)
        {
            var response = new EventResponse();

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
            catch (Exception ex)
            {
                response.Status = 0;
                response.Message = ex.Message;
                //response.Message = "Network error occured.";
            }

            return JsonConvert.SerializeObject(response);
        }
    }
}
