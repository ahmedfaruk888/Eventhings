using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Eventhings.Dto;
using Eventhings.Response;
using Eventhings.DbContexts;
using Eventhings.DbEntities;

namespace Eventhings.Services
{
    /// <summary>
    /// Summary description for transaction
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class transaction : System.Web.Services.WebService
    {

        [WebMethod]
        public TransactionResponse Save(TransactionDto tranxdto)
        {
            var response = new TransactionResponse();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    if (string.IsNullOrWhiteSpace(tranxdto.ref_code.ToString()))
                    {
                        response.Status = 0;
                        response.Message = "Transactionn ref code is required";
                        return response;
                    }

                    if (string.IsNullOrWhiteSpace(tranxdto.event_id.ToString()))
                    {
                        response.Status = 0;
                        response.Message = "Event id is required";
                        return response;
                    }

                    if (string.IsNullOrWhiteSpace(tranxdto.user_id.ToString()))
                    {
                        response.Status = 0;
                        response.Message = "Customer id is required";
                        return response;
                    }

                    if (string.IsNullOrWhiteSpace(tranxdto.channel.ToString()))
                    {
                        response.Status = 0;
                        response.Message = "Transaction channel is required";
                        return response;
                    }

                    if (string.IsNullOrWhiteSpace(tranxdto.tranx_amount.ToString()))
                    {
                        response.Status = 0;
                        response.Message = "Transaction amount is required";
                        return response;
                    }

                    _context.tcoretransactions.Add(new tcoretransaction
                    {
                        ref_code = tranxdto.ref_code,
                        event_id = tranxdto.event_id,
                        user_id = tranxdto.user_id,
                        channel = tranxdto.channel,
                        tranx_amount = tranxdto.tranx_amount,

                        active = tranxdto.active,
                        created_by = tranxdto.created_by,
                        created_at = DateTime.Now,
                    });

                    var rowsAffected = _context.SaveChanges();

                    if (rowsAffected > 0)
                    {
                        response.Status = rowsAffected;
                        //response.Message = $"{rowsAffected} Host created successfuly, switch to 'Manage Host' tab to view it";
                    }
                }
            }
            catch (Exception ex)
            {
                response.Status = 0;
                response.Message = "Internal server error";
            }

            return response;
        }

        [WebMethod]
        public DashboardResponse Dashboard()
        {
            var response = new DashboardResponse();
            using (var _context = new EventhingsDbContext())
            {
                var queryCust = _context.tcoreuserroles.Where(x => x.role_id == 1).Count();
                var queryVend = _context.tcoreuserroles.Where(x => x.role_id == 10).Count();
                var querySales = _context.tcoresales.Count();
                response.total_customer = queryCust;
                response.total_vendor = queryVend;
                response.total_sales = querySales;
                response.Status = 1;
            }

            return response;
        }

        [WebMethod]
        public List<EventPaymentResponse> GetEventPayments(int user_id)
        {
            var response = new List<EventPaymentResponse>();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    if (string.IsNullOrWhiteSpace(user_id.ToString()))
                    {
                        response.Add(new EventPaymentResponse()
                        {
                            Status = 0,
                            Message = "User ID is required"
                        });
                        return response;
                    }

                    var queryPayment = _context.tcoreeventpayments.Where(x => x.user_id == user_id).ToList();
                    if(queryPayment == null || queryPayment.Count < 1)
                    {
                        response.Add(new EventPaymentResponse()
                        {
                            Status = 0,
                            Message = "Your payment details can not be found, please pay for an event"
                        });
                        return response;
                    }

                    var queryUser = _context.tcoreusers.Where(x => x.id == user_id).FirstOrDefault();
                    if (queryUser == null)
                    {
                        response.Add(new EventPaymentResponse()
                        {
                            Status = 0,
                            Message = "Your user ID can not be found"
                        });
                        return response;
                    }

                    var queryPoint = _context.vw_customer_credit_balance.Where(x => x.user_id == queryUser.id.ToString()).FirstOrDefault();
                    decimal point_bal = 0;
                    if(queryPoint != null)
                    {
                        point_bal = queryPoint.total_wallet_point;
                    }
                    foreach(var payment in queryPayment)
                    {
                        var queryEvent = _context.tcoreevents.Where(x => x.id == payment.event_id).FirstOrDefault();
                        if (queryEvent == null)
                        {
                            response.Add(new EventPaymentResponse()
                            {
                                Status = 0,
                                Message = "Your event can not be found"
                            });
                            return response;
                        }

                        response.Add(new EventPaymentResponse()
                        {
                            amount_payed = queryEvent.gate_fee,
                            event_name = queryEvent.name,
                            payment_date = payment.created_at.Value,
                            full_name = queryUser.first_name + " " + queryUser.last_name,
                            event_date = queryEvent.start_date.Value,
                            user_id = queryUser.id.ToString(),
                            venue = queryEvent.location,
                            point_balance = point_bal,

                            Status = 1,
                            Message = "Success"
                        });
                    }

                    return response;
                }
            }
            catch (Exception ex)
            {
                response.Add(new EventPaymentResponse() { 
                    Status = 0, 
                    Message = "Internal server error", 
                    exception = ex.ToString() 
                });
            }

            return response;
        }
    }
}
