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
        public List<ProductResponse> Get()
        {
            var response = new List<ProductResponse>();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var queryItems = _context.tcoreitems.Where(e => e.active == 1 && e.is_deleted == 0).ToList();

                    if(queryItems != null)
                    {
                        foreach(var item in queryItems)
                        {
                            response.Add(new ProductResponse
                            {
                                name = item.name,
                                description = item.description,
                                cost = item.cost,
                                price = item.price,
                                quantity = item.quantity,
                                category = item.category,
                                created_at = item.created_at,
                                active = item.active,
                                Status = 1
                            });
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                response.Add(new ProductResponse()
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
                            point = productdto.point,

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
