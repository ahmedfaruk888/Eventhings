using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Eventhings.DbContexts;
using Eventhings.Dto;
using Eventhings.Response;

namespace Eventhings.Services
{
    /// <summary>
    /// Summary description for roles
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class roles : System.Web.Services.WebService
    {

        [WebMethod]
        public List<RoleResponse> Get()
        {
            var response = new List<RoleResponse>();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = _context.tcoreroles
                        .Where(e => e.active == 1 && e.is_deleted == 0)
                        .Select(n => new RoleResponse()
                        {
                            id = n.id,
                            name = n.name,
                            description = n.description,
                            is_deleted = n.is_deleted,
                            level = n.level,
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
                response.Add(new RoleResponse()
                {
                    Status = 0,
                    Message = ex.ToString()
                });
            }

            return response;
        }
    }
}
