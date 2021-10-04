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
    /// Summary description for products
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class products : System.Web.Services.WebService
    {

        [WebMethod]
        public List<HostResponse> Get()
        {
            var response = new List<HostResponse>();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = _context.tmstrcategories
                        .Where(e => e.active == 1 && e.is_deleted == 0)
                        .Select(n => new HostResponse()
                        {
                            id = n.id,
                            //full_name = n.full_name,
                            //description = n.description,
                            //phone = n.phone,
                            //email = n.email,
                            //address = n.address,
                            //active = n.active,
                            //deleted = n.deleted,
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
        public ProductResponse Save(ProductDto productdto)
        {
            var response = new ProductResponse();

            try
            {
                using (var _context = new EventhingsDbContext())
                {

                    var query = _context.tcoreitems.Where(name => name.name == productdto.name).FirstOrDefault();
                    if (query != null)
                    {
                        if (query.name == productdto.name)
                        {
                            response.Status = 0;
                            response.Message = "The specified product name already exists";
                            return response;
                        }
                    }
                    else
                    {
                        _context.tcoreitems.Add(new tcoreitem
                        {
                            name = productdto.name,
                            description = productdto.description,
                            cost = productdto.cost,
                            price = productdto.price,
                            category = productdto.category,
                            quantity = productdto.quantity,

                            is_deleted = 0,
                            active = productdto.active,
                            created_by = productdto.created_by,
                            created_at = DateTime.Now,
                        });

                        var rowsAffected = _context.SaveChanges();

                        if (rowsAffected > 0)
                        {
                            response.Status = rowsAffected;
                            response.Message = $"{rowsAffected} Product created successfuly, switch to 'Manage' tab to view it";
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
