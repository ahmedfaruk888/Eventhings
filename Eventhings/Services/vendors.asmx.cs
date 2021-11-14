using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Eventhings.DbContexts;
using Eventhings.DbEntities;
using Eventhings.Dto;
using Eventhings.Response;

namespace Eventhings.Services
{
    /// <summary>
    /// Summary description for vendors
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class vendors : System.Web.Services.WebService
    {

        [WebMethod]
        public List<UserResponse> Get()
        {
            var response = new List<UserResponse>();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var role = _context.tcoreroles.Where(e => e.name.ToLower() == "vendor" && e.active == 1 && e.is_deleted == 0).FirstOrDefault();
                    var userRole = _context.tcoreuserroles.Where(e => e.role_id == role.id && e.active == 1 && e.is_deleted == 0).Select(x => x.user_id).ToList();

                    var userLogin = _context.tcoreusers.Where(e => e.active == 1 && e.is_deleted == 0).ToList();

                    foreach (var r in userRole)
                    {
                        foreach(var u in userLogin)
                        {
                            if(u.id == r)

                            response.Add(new UserResponse
                            {
                                id = u.id,
                                first_name = u.first_name,
                                last_name = u.last_name,
                                other_name = u.other_name,
                                email = u.email
                            });
                        }
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
    }
}
