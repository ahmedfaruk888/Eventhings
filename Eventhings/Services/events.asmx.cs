using Eventhings.DbContexts;
using Eventhings.DbEntities;
using Eventhings.Dto;
using Eventhings.Response;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
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
        public List<EventResponse> GetAll()
        {
            var response = new List<EventResponse>();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = _context.tcoreevents
                        .Join(_context.tcorehosts,
                        n => n.host_id,
                        h => h.id,
                        (n, h) => new EventResponse()
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
                            host_id = h.id,
                            host_name = h.full_name,
                            end_date = n.end_date,
                            created_at = n.created_at,
                            created_by = n.created_by,
                            gate_fee = n.gate_fee
                        })
                        .Where(e => e.deleted == 0).ToList();
                        //.Select(n => new EventResponse()
                        //{
                        //    id = n.id,
                        //    name = n.name,
                        //    description = n.description,
                        //    location = n.location,
                        //    active = n.active,
                        //    deleted = n.deleted,
                        //    Status = 1,
                        //    duration = n.duration,
                        //    start_date = n.start_date,
                        //    host_id = n.host_id,
                        //    end_date = n.end_date,
                        //    created_at = n.created_at,
                        //    created_by = n.created_by,
                        //    gate_fee = n.gate_fee
                        //}).ToList();

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
                    Message = ex.ToString(),
                    exception = ex.ToString()
                });
            }

            return response;
        }

        [WebMethod]
        public List<EventResponse> Get(int is_live = 1)
        {
            var response = new List<EventResponse>();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = _context.tcoreevents
                        .Where(e => e.active == 1 && e.deleted == 0 && e.is_live == is_live)
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
                            created_by = n.created_by,
                            gate_fee = n.gate_fee
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
        public List<EventResponse> GetFurtureEents()
        {
            var response = new List<EventResponse>();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = _context.tcoreevents
                        .Join(_context.tcorecodestores, 
                        n => n.id,
                        s => s.event_id,
                        (n, s) => new EventResponse
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
                            created_by = n.created_by,
                            gate_fee = n.gate_fee
                        }).Where(e => e.active == 1 && e.deleted == 0 && e.start_date >= DateTime.Now).Distinct().ToList();

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
        public EventResponse GetById(int eventid)
        {
            var response = new EventResponse();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    response = _context.tcoreevents
                        .Where(e => e.id == eventid && e.active == 1 && e.deleted == 0)
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
                            created_by = n.created_by,
                            gate_fee = n.gate_fee,
                            status = 1
                        }).SingleOrDefault();

                    //if(response == null)
                    //{
                    //    response.Status = 0;
                    //    response.Message = "Event specified does not exists";
                    //    return response;
                    //}
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
                            gate_fee = eventdto.gate_fee,
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
                response.exception = ex.ToString();
            }

            return response;
        }

        [WebMethod]
        public EventResponse SaveEventPayment(EventPaymentDto eventpaymentdto)
        {
            var response = new EventResponse();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    using(var tranx = _context.Database.BeginTransaction())
                    {
                        //var query = _context.tcoreeventpayments.Where(tranx => tranx.tranx_ref_id == eventdto.name).FirstOrDefault();
                        _context.tcoreeventpayments.Add(new tcoreeventpayment
                        {
                            user_id = eventpaymentdto.user_id,
                            event_id = eventpaymentdto.event_id,
                            tranx_ref_id = eventpaymentdto.tranx_ref_id,
                            active = 1,
                            is_deleted = 0,
                            created_by = eventpaymentdto.created_by,
                            created_at = DateTime.Now,
                        });

                        //var currentWallet = _context.tcorewallets.Where(p => p.user_id == currentUser.id.ToString()).FirstOrDefault();
                        //if (currentWallet == null)
                        //{
                        //}

                        //asign a 3 point value to the customer
                        var wallet = _context.tcorewallets.Add(new tcorewallet
                        {
                            user_id = eventpaymentdto.user_id.ToString(),
                            prev_balance = 0,
                            amount_paid = 3,
                            current_balance = 3,
                            point = 3,
                            cr_type = 1,
                            active = 1,
                            is_deleted = 0,
                            payment_channel = "-",
                            created_by = eventpaymentdto.created_by,
                            created_at = DateTime.Now
                        });

                        //map a code to the customer
                        //var queryEvent = _context.tcoreevents.Where(c => c.id == eventpaymentdto.event_id).FirstOrDefault();

                        //get a free code for the user
                        var codeQuery = _context.tcorecodestores.Where(x => x.event_id == eventpaymentdto.event_id && x.date_used == null).FirstOrDefault();
                        if(codeQuery == null)
                        {
                            response.Status = 0;
                            response.Message = "The event you selected has no qr code batch mapped to it yet or does not have a free code to assign";
                            return response;
                        }
                        //asign the code to the user
                        _context.tcoremappedcodes.Add(new tcoremappedcode()
                        {
                            user_id = eventpaymentdto.user_id,
                            code_id = codeQuery.id,
                            date_mapped = DateTime.Now,
                            event_id = eventpaymentdto.event_id
                        });

                        codeQuery.date_used = DateTime.Now;
                        _context.Entry(codeQuery).State = System.Data.Entity.EntityState.Modified;

                        var affected = _context.SaveChanges();

                        if (affected > 0)
                        {
                            //SendPaymentReceipt(eventpaymentdto.amount, eventpaymentdto.event_id, eventpaymentdto.created_by);
                            response.Status = affected;
                            response.Message = "Event payment created successfuly";
                        }

                        tranx.Commit();
                    }
                }
            }
            catch (Exception ex)
            {
                response.Status = 0;
                response.Message = "An internal server error occured, please contact admin for your payment reversal";
                response.exception = ex.ToString();
            }

            return response;
        }

        public void SendPaymentReceipt(decimal amount, int eventid, string useremail)
        {
            string emailTemlatePath = Server.MapPath("~/clients/new/template/invoice.html");
            var streamReader = new System.IO.StreamReader(emailTemlatePath);
            var mailText = streamReader.ReadToEnd();

            //close the stream reader
            streamReader.Close();

            var eventDetails = GetById(eventid);

            mailText = mailText.Replace("[amount]", amount.ToString());
            mailText = mailText.Replace("[paymentdate]", DateTime.Now.ToLongDateString());

            mailText = mailText.Replace("[eventname]", eventDetails.name);
            mailText = mailText.Replace("[address]", eventDetails.location);
            mailText = mailText.Replace("[eventdate]", "From:" + eventDetails.start_date.Value.ToLongDateString() + " To: " + eventDetails.end_date.Value.ToLongDateString());

            new mail().SendEmail("payment.eventiix@gmail.com", "Payment Processed Successfuly", mailText, "ahmedfaruk888@gmail.com");
            //new mail().SendEmail("ahmedfaruk888@gmail.com", "Payment Receipt Successfull", mailText, useremail);
            //new mail().SendEmailWithGmail("payment.eventiix@gmail.com", "ahmedfaruk888@gmail.com", "Payment Processed Successfuly", mailText);
        }
    }
}