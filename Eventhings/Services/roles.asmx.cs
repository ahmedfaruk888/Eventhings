using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Eventhings.DbContexts;
using Eventhings.Dto;
using Eventhings.Response;
using Eventhings.DbEntities;

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

        [WebMethod]
        public RoleResponse Save(RoleDto roledto)
        {
            var response = new RoleResponse();

            try
            {
                using (var _context = new EventhingsDbContext())
                {

                    var query = _context.tcoreroles.Where(name => name.name == roledto.name).FirstOrDefault();
                    if(query != null)
                    {
                        response.Status = 0;
                        response.Message = "The role name specified already exists";
                        return response;
                    }
                    else
                    {
                        _context.tcoreroles.Add(new tcorerole
                        {
                            name = (roledto.name.Contains(" ")) ? roledto.name.Replace(" ", "") : roledto.name,
                            description = roledto.description,
                            level = roledto.level,
                            active = roledto.active,
                            is_deleted = 0,
                            created_by = roledto.created_by,
                            created_at = DateTime.Now,
                        });

                        var affected =_context.SaveChanges();
                        response.Status = (affected >= 1) ? affected : 0;
                        response.Message = "Role created successfuly";
                    }
                }
            }
            catch (Exception ex)
            {
                response.Status = 0;
                response.Message = ex.ToString();
            }

            return response;
        }
    }
}
