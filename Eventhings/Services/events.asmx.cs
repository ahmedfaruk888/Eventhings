using Eventhings.DbContexts;
using Eventhings.DbEntities;
using Eventhings.Dto;
using Eventhings.Response;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace Eventhings.Services
{
    /// <summary>
    /// Summary description for events
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [ScriptService]
    public class events : System.Web.Services.WebService
    {
        [WebMethod]
        public List<EventResponse> Get()
        {
            var response = new List<EventResponse>();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = _context.tcoreevents
                        .Where(e => e.active == 1 && e.deleted == 0)
                        .Select(n => new EventResponse() 
                        {
                            id = n.id,
                            name = n.name,
                            description = n.description,
                            location = n.location,
                            active = n.active,
                            deleted = n.deleted,
                            Status = 1,
                            duration = n.duration,
                            start_date = n.start_date,
                            host_id = n.host_id,
                            end_date = n.end_date,
                            created_at = n.created_at,
                            created_by = n.created_by
                        }).ToList();

                    foreach(var ss in query)
                    {
                        response.Add(ss);
                    }
                }
            }
            catch (Exception ex)
            {
                response.Add(new EventResponse()
                {
                    Status = 0,
                    Message = ex.ToString()
                });
            }

            return response;
        }

        [WebMethod]
        public List<EventResponse> GetEventPayment()
        {
            var response = new List<EventResponse>();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = _context.tcoreevents
                        .Where(e => e.active == 1 && e.deleted == 0)
                        .Select(n => new EventResponse()
                        {
                            id = n.id,
                            name = n.name,
                            description = n.description,
                            location = n.location,
                            active = n.active,
                            deleted = n.deleted,
                            Status = 1,
                            duration = n.duration,
                            start_date = n.start_date,
                            host_id = n.host_id,
                            end_date = n.end_date,
                            created_at = n.created_at,
                            created_by = n.created_by
                        }).ToList();

                    foreach (var ss in query)
                    {
                        response.Add(ss);
                    }
                }
            }
            catch (Exception ex)
            {
                response.Add(new EventResponse()
                {
                    Status = 0,
                    Message = ex.ToString()
                });
            }

            return response;
        }

        [WebMethod]
        public EventResponse Save(EventDto eventdto)
        {
            var response = new EventResponse();

            try
            {
                using (var _context = new EventhingsDbContext())
                {

                    var query = _context.tcoreevents.Where(name => name.name == eventdto.name).FirstOrDefault();
                    if (query != null)
                    {
                        response.Status = 0;
                        response.Message = "Event name is required";
                        return response;
                    }
                    else
                    {
                        _context.tcoreevents.Add(new tcoreevent
                        {
                            name = eventdto.name,
                            description = eventdto.description,
                            host_id = eventdto.host_id,

                            location = eventdto.location,
                            start_date = eventdto.start_date,
                            end_date = eventdto.end_date,
                            duration = eventdto.duration,

                            active = eventdto.active,
                            created_by = eventdto.created_by,
                            created_at = DateTime.Now,
                        });

                        var affected = _context.SaveChanges();

                        if (affected > 0)
                        {
                            response.Status = affected;
                            response.Message = $"{affected} Event created successfuly, switch to 'Manage Event' tab to view it";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                response.Status = 0;
                response.Message = "An internal server error occured";
                //response.Message = ex.ToString();
            }

            return response;
        }
    }
}
