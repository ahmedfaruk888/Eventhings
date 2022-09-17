using System;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
    /// Summary description for items
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class items : System.Web.Services.WebService
    {

        [WebMethod]
        public List<ItemResponse> Get()
        {
            var response = new List<ItemResponse>();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = _context.tcoreitems.Where(e => e.active == 1 && e.is_deleted == 0)
                        .Select(n => new ItemResponse()
                        {
                            id = n.id,
                            name = n.name,
                        }).ToList();

                    foreach (var ss in query)
                    {
                        response.Add(ss);
                    }
                }
            }
            catch (Exception ex)
            {
                response.Add(new ItemResponse()
                {
                    Status = 0,
                    Message = ex.ToString(),
                    exception = ex.ToString()
                });
            }

            return response;
        }

        [WebMethod]
        public List<ItemPointResponse> GetProductWithPoint()
        {
            var response = new List<ItemPointResponse>();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = _context.tcoreitempoints
                        .Where(e => e.active == 1 && e.is_deleted == 0)
                        .Select(n => new ItemPointResponse()
                        {
                            id = n.id,
                            item_name = n.item_name,

                        }).ToList();

                    foreach (var ss in query)
                    {
                        response.Add(ss);
                    }
                }
            }
            catch (Exception ex)
            {
                response.Add(new ItemPointResponse()
                {
                    Status = 0,
                    Message = ex.ToString(),
                    exception = ex.ToString()
                });
            }

            return response;
        }

        [WebMethod]
        public List<VendorItemsResponse> GetMappedItemByVendor(int id)
        {
            var response = new List<VendorItemsResponse>();

            try
            {
                if (string.IsNullOrWhiteSpace(id.ToString()))
                {
                    response.Add(new VendorItemsResponse
                    {
                        Status = 0,
                        Message = "Missing vendor information"
                    });

                    return response;
                }

                using (var _context = new EventhingsDbContext())
                {
                    //get all the item id mapped to the vendor making the request
                    var items = _context.tcorevendoritems.Where(e => e.active == 1 && e.is_deleted == 0 && e.vendor_id == id)
                        .Select(n => n.item_id).ToList();

                    if(items == null || items.Count < 1)
                    {
                        response.Add(new VendorItemsResponse
                        {
                            Status = 0,
                            Message = "No item(s) has been mapped to you yet, contact the Organizer",
                            exception = ""
                        });

                        return response;
                    }

                    //get all the item information from core item store where the item id equal items above
                    foreach(var ids in items)
                    {
                        var itemData = _context.tcoreitems.Where(e => e.active == 1 && e.is_deleted == 0 && e.id == ids)
                            .Select(x => new VendorItemsResponse 
                            {
                                id = x.id,
                                active = 1,
                                name = x.name,
                                price = x.price,
                                Status = 1,
                                Message = "Success"
                            }).FirstOrDefault();
                        response.Add(itemData);
                        //foreach(var x in itemData)
                        //{
                        //    response.Add(new VendorItemsResponse
                        //    {
                        //         active = 1,
                        //          name = x.name,
                        //           id = x.id,
                        //            price = x.price,
                        //            Status = 1,
                        //            Message = "Success"
                        //    });
                        //}
                    }
                    return response;
                }
            }
            catch (Exception ex)
            {
                response.Add(new VendorItemsResponse()
                {
                    Status = 0,
                    Message = ex.Message,
                    exception = ex.ToString()
                });
            }

            return response;
        }

        [WebMethod]
        public List<ItemForSalesResponse> GetItemPoint4Sales()
        {
            var response = new List<ItemForSalesResponse>();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = _context.Database.SqlQuery<ItemForSalesResponse>("select a.id as 'point_id', a.cost as 'point_cost', a.price as 'point_price', a.point as 'mapped_point', a.active as 'active', b.name as 'item_name', b.description as 'item_descripiton', b.category as 'category_name', b.quantity as 'item_quantity', c.name as 'measurement_name' from tcoreitempoints a inner join tcoreitems b on a.item_name = b.name inner join tcoreunitmeasurements c on a.unit_id = c.id where a.active = 1 and a.is_deleted = 0").ToList();

                    foreach (var ss in query)
                    {
                        ss.Status = 1;
                        ss.Message = "Success";
                        response.Add(ss);
                    }
                }
            }
            catch (Exception ex)
            {
                response.Add(new ItemForSalesResponse()
                {
                    Status = 0,
                    Message = ex.ToString(),
                    exception = ex.ToString()
                });
            }

            return response;
        }

        [WebMethod]
        public ItemForSalesResponse GetItemPoint4Sales(int itemid)
        {
            var response = new ItemForSalesResponse();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    if(string.IsNullOrWhiteSpace(itemid.ToString()))
                    {
                        response.Status = 0;
                        response.Message = "Product code is required";
                        return response;
                    }
                    var query = _context.Database.SqlQuery<ItemForSalesResponse>("select a.id as 'point_id', a.cost as 'point_cost', a.price as 'point_price', a.point as 'mapped_point', a.active as 'active', b.name as 'item_name', b.description as 'item_descripiton', b.category as 'category_name', b.quantity as 'item_quantity', c.name as 'measurement_name' from tcoreitempoints a inner join tcoreitems b on a.item_name = b.name inner join tcoreunitmeasurements c on a.unit_id = c.id where a.active = 1 and a.is_deleted = 0 and item_id = @itemid", new SqlParameter("@itemid", itemid)).FirstOrDefault();

                    if(query != null)
                    {
                        query.Status = 1;
                        query.Message = "Success";

                        response = query;
                    }
                }
            }
            catch (Exception ex)
            {
                response.Status = 0;
                response.Message = "An network error occured";
                response.exception = ex.ToString();
            }

            return response;
        }
    }
}
