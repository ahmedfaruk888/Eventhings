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
    /// Summary description for mapping
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class mapping : System.Web.Services.WebService
    {
        [WebMethod]
        public MappingResponse Save(MappingDto mapdto)
        {
            var response = new MappingResponse();

            try
            {
                using (var _context = new EventhingsDbContext())
                {

                    var query = _context.tcoreitempoints.Where(name => name.item_id == mapdto.item_id || name.unit_id == mapdto.unit_id).FirstOrDefault();
                    if (query != null)
                    {
                        if (query.item_id == mapdto.item_id)
                        {
                            response.Status = 0;
                            response.Message = "The specified product has already been mapped";
                            return response;
                        }

                        if (query.unit_id == mapdto.unit_id)
                        {
                            response.Status = 0;
                            response.Message = "The specified unit has already been mapped";
                            return response;
                        }
                    }
                    else
                    {
                        _context.tcoreitempoints.Add(new tcoreitempoint
                        {
                            item_id = mapdto.item_id,
                            unit_id = mapdto.unit_id,
                            cost = mapdto.cost,
                            price = mapdto.price,
                            point = mapdto.point,

                            active = mapdto.active,
                            created_by = mapdto.created_by,
                            created_at = DateTime.Now,
                        });

                        var rowsAffected = _context.SaveChanges();

                        if (rowsAffected > 0)
                        {
                            response.Status = rowsAffected;
                            response.Message = $"{rowsAffected} product has been mapped successfuly, switch to 'Manage' tab to view it";
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
                    var query = _context.tcoreitempoints
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
