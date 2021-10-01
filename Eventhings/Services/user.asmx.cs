using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Eventhings.Dto;
using Eventhings.Response;
using Eventhings.DbContexts;

namespace Eventhings.Services
{
    /// <summary>
    /// Summary description for user
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class user : System.Web.Services.WebService
    {
        [WebMethod]
        public List<UserResponse> Get()
        {
            var response = new List<UserResponse>();
            try
            {
                using(var _context = new EventhingsDbContext())
                {
                    var query = _context.tcoreusers
                        .Where(x => x.is_deleted == 0 && x.active == 1)
                        .Select(n => new UserResponse() 
                        {
                            id = n.id,
                            user_code = n.user_code,
                            email = n.email,
                            email_confirmed = n.email_confirmed,
                            active = n.active,
                            phone_number = n.phone_number,
                            phone_number_confirmed = n.phone_number_confirmed,
                            first_name = n.first_name,
                            last_name = n.last_name,
                            other_name = n.other_name,
                            Status = 1,
                            is_deleted = n.is_deleted
                        }).ToList();

                    foreach(var ss in query)
                    {
                        response.Add(ss);
                    }
                }
            }
            catch(Exception ex)
            {
                response.Add(new UserResponse()
                {
                    Status = 0,
                    Message = ex.ToString()
                });
            }

            return response;
        }

        //[WebMethod]
        //public UserResponse Get(int id)
        //{
        //    return "Hello World";
        //}

        //[WebMethod]
        //public UserResponse Get(string usercode)
        //{
        //    return "Hello World";
        //}
    }
}
