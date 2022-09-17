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
                    var alreadyMapped = _context.tcorevendoritems
                                        .Where(n => n.vendor_id == mapdto.vendor_id && n.item_id == mapdto.item_id && n.active == 1 && n.is_deleted == 0)
                                        .FirstOrDefault();

                    if(alreadyMapped != null)
                    {
                        response.Status = 0;
                        response.Message = "This product has already been mapped to this vendor";
                        return response;
                    }

                    _context.tcorevendoritems.Add(new tcorevendoritem
                    {
                        vendor_id = mapdto.vendor_id,
                        item_id = mapdto.item_id,
                        event_id = mapdto.event_id,
                        active = mapdto.active,
                        created_by = mapdto.created_by,
                        created_date = DateTime.Now,
                    });

                    var rowsAffected = _context.SaveChanges();

                    if (rowsAffected > 0)
                    {
                        response.Status = rowsAffected;
                        response.Message = $"{rowsAffected} product has been mapped successfuly, switch to 'Manage' tab to view it";
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
                            //name = n.,
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
