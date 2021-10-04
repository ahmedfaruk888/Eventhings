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
    /// Summary description for unit
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class unit : System.Web.Services.WebService
    {
        [WebMethod]
        public UnitResponse Save(UnitDto unitto)
        {
            var response = new UnitResponse();

            try
            {
                using (var _context = new EventhingsDbContext())
                {

                    var query = _context.tcoreunitmeasurements.Where(name => name.name == unitto.name).FirstOrDefault();
                    if (query != null)
                    {
                        if (query.name == unitto.name)
                        {
                            response.Status = 0;
                            response.Message = "The specified category measurement unit name already exists";
                            return response;
                        }
                    }
                    else
                    {
                        _context.tcoreunitmeasurements.Add(new tcoreunitmeasurement
                        {
                            name = unitto.name,
                            active = unitto.active,
                            created_by = unitto.created_by,
                            created_at = DateTime.Now,
                        });

                        var rowsAffected = _context.SaveChanges();

                        if (rowsAffected > 0)
                        {
                            response.Status = rowsAffected;
                            response.Message = $"{rowsAffected} Category unit created successfuly, switch to 'Manage' tab to view it";
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

        [WebMethod]
        public List<UnitResponse> Get()
        {
            var response = new List<UnitResponse>();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = _context.tcoreunitmeasurements
                        .Where(e => e.active == 1 && e.is_deleted == 0)
                        .Select(n => new UnitResponse()
                        {
                            id = n.id,
                            name = n.name,
                            Status = 1
                        }).ToList();

                    foreach (var ss in query)
                    {
                        response.Add(ss);
                    }
                }
            }
            catch (Exception ex)
            {
                response.Add(new UnitResponse()
                {
                    Status = 0,
                    Message = ex.ToString()
                });
            }

            return response;
        }
    }
}
