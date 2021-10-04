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
    /// Summary description for category
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class category : System.Web.Services.WebService
    {

        [WebMethod]
        public List<CetegoryResponse> Get()
        {
            var response = new List<CetegoryResponse>();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = _context.tmstrcategories
                        .Where(e => e.active == 1 && e.is_deleted == 0)
                        .Select(n => new CetegoryResponse()
                        {
                            id = n.id,
                            name = n.name,
                            parent = n.parent,
                            description = n.description,
                            active = n.active,
                            is_deleted = n.is_deleted,

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
                response.Add(new CetegoryResponse()
                {
                    Status = 0,
                    Message = ex.ToString()
                });
            }

            return response;
        }

        [WebMethod]
        public List<CetegoryResponse> GetCategory()
        {
            var response = new List<CetegoryResponse>();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = _context.tmstrcategories
                        .Where(e => e.active == 1 && e.is_deleted == 0)
                        .Select(n => new CetegoryResponse()
                        {
                            id = n.id,
                            name = n.name,
                            parent = n.parent
                        }).ToList();

                    foreach (var ss in query)
                    {
                        response.Add(ss);
                    }
                }
            }
            catch (Exception ex)
            {
                response.Add(new CetegoryResponse()
                {
                    Status = 0,
                    Message = ex.ToString()
                });
            }

            return response;
        }

        [WebMethod]
        public CetegoryResponse Save(CategoryDto catdto)
        {
            var response = new CetegoryResponse();

            try
            {
                using (var _context = new EventhingsDbContext())
                {

                    var query = _context.tmstrcategories.Where(name => name.name == catdto.name).FirstOrDefault();
                    if (query != null)
                    {
                        if (query.name == catdto.name)
                        {
                            response.Status = 0;
                            response.Message = "The specified category name already exists";
                            return response;
                        }
                    }
                    else
                    {
                        _context.tmstrcategories.Add(new tmstrcategory
                        {
                            name = catdto.name,
                            parent = catdto.parent,
                            description = catdto.description,
                            active = catdto.active,
                            created_by = catdto.created_by,
                            created_at = DateTime.Now,
                        });

                        var rowsAffected = _context.SaveChanges();

                        if (rowsAffected > 0)
                        {
                            response.Status = rowsAffected;
                            response.Message = $"{rowsAffected} Category created successfuly, switch to 'Manage' tab to view it";
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
