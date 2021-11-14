using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Eventhings.DbEntities;
using Eventhings.Response;
using Eventhings.Dto;
using Eventhings.DbContexts;

namespace Eventhings.Services
{
    /// <summary>
    /// Summary description for hosts
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class hosts : System.Web.Services.WebService
    {
        [WebMethod]
        public List<HostResponse> Get()
        {
            var response = new List<HostResponse>();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = _context.tcorehosts
                        .Where(e => e.active == 1 && e.deleted == 0)
                        .Select(n => new HostResponse()
                        {
                            id = n.id,
                            full_name = n.full_name,
                            description = n.description,
                            phone = n.phone,
                            email = n.email,
                            address = n.address,
                            active = n.active,
                            deleted = n.deleted,
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
                response.Add(new HostResponse()
                {
                    Status = 0,
                    Message = ex.ToString()
                });
            }

            return response;
        }

        [WebMethod]
        public HostResponse Save(HostDto hostdto)
        {
            var response = new HostResponse();

            try
            {
                using (var _context = new EventhingsDbContext())
                {

                    var query = _context.tcorehosts.Where(name => name.full_name == hostdto.full_name || name.phone == hostdto.phone || name.email == hostdto.email).FirstOrDefault();
                    if (query != null)
                    {
                        if (query.phone == hostdto.phone)
                        {
                            response.Status = 0;
                            response.Message = "The specified phone number already exists";
                            return response;
                        }

                        if (query.email == hostdto.email)
                        {
                            response.Status = 0;
                            response.Message = "The specified email address already exists";
                            return response;
                        }

                        if (query.full_name == hostdto.full_name)
                        {
                            response.Status = 0;
                            response.Message = "The host specified already exists";
                            return response;
                        }
                    }
                    else
                    {
                        _context.tcorehosts.Add(new tcorehost
                        {
                            full_name = hostdto.full_name,
                            description = hostdto.description,
                            phone = hostdto.phone,
                            email = hostdto.email,
                            address = hostdto.address,
                            
                            deleted = 0,
                            active = hostdto.active,
                            created_by = hostdto.created_by,
                            created_at = DateTime.Now,
                        });

                        var rowsAffected = _context.SaveChanges();

                        if (rowsAffected > 0)
                        {
                            response.Status = rowsAffected;
                            response.Message = $"{rowsAffected} Host created successfuly";
                        }
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
