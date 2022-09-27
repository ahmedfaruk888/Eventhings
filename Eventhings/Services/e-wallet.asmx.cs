using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Eventhings.DbContexts;
using Eventhings.DbEntities;
using Eventhings.Dto;
using Newtonsoft.Json;
using Eventhings.Response;
using System.Net.Mail;
using System.Web.Security;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using System.Reflection;

namespace Eventhings.Services
{
    /// <summary>
    /// Summary description for e_wallet
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class e_wallet : System.Web.Services.WebService
    {
        [WebMethod]
        public eWalletResponse Save(eWalletDto wallet)
        {
            var response = new eWalletResponse();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var equery = _context.tcorewallets.Where(e => e.user_id == wallet.user_id && e.active == 1 && e.is_deleted == 0).FirstOrDefault();
                    if(equery == null)
                    {
                        _context.tcorewallets.Add(new tcorewallet
                        {
                            user_id = wallet.user_id,
                            point = wallet.point,
                            payment_channel = wallet.payment_channel,
                            cr_type = 2,
                            prev_balance = 0,
                            amount_paid = wallet.amount_paid,
                            current_balance = 0 + wallet.amount_paid.Value,
                            active = 1,
                            is_deleted = 0,
                            created_by = wallet.created_by,
                            created_at = DateTime.Now
                        });
                    }
                    else
                    {
                        equery.active = 0;
                        //var point = equery.point;
                        //var prePrevvBal = equery.prev_balance;
                        //var prevCurrBal = equery.current_balance;
                        //var amountPaid = equery.amount_paid;

                        //validation
                        #region
                        if (string.IsNullOrWhiteSpace(wallet.amount_paid.Value.ToString()) || wallet.amount_paid < 0)
                        {
                            response.Status = 0;
                            response.Message = "Amount is required or must be greater than zero";
                            return response;
                        }

                        if (string.IsNullOrWhiteSpace(wallet.point.ToString()) || wallet.point < 0)
                        {
                            response.Status = 0;
                            response.Message = "Point is required or must be greater than zero";
                            return response;
                        }
                        #endregion

                        _context.Entry(equery).State = System.Data.Entity.EntityState.Modified;
                        _context.tcorewallets.Add(new tcorewallet
                        {
                            user_id = wallet.user_id,
                            point = wallet.point,
                            payment_channel = wallet.payment_channel,
                            prev_balance = 0,
                            amount_paid = wallet.amount_paid,
                            current_balance = 0,
                            active = 1,
                            cr_type = 2,
                            is_deleted = 0,
                            created_by = wallet.created_by,
                            created_at = DateTime.Now
                        });
                        #region
                        //_context.SaveChanges();

                        //_context.tcorewallets.Add(new tcorewallet
                        //{
                        //    user_id = wallet.user_id,
                        //    point = (point + wallet.point),
                        //    payment_channel = wallet.payment_channel,
                        //    prev_balance = prevCurrBal,
                        //    amount_paid = wallet.amount_paid,
                        //    current_balance = prevCurrBal + wallet.amount_paid,
                        //    active = 1,
                        //    is_deleted = 0,
                        //    created_by = wallet.created_by,
                        //    created_at = DateTime.Now
                        //});
                        #endregion
                    }

                    var affected = _context.SaveChanges();
                    if (affected > 0)
                    {
                        response.Status = 1;
                        response.Message = $"Customer wallet has been toped-up with '{wallet.point}' points sucessfuly";
                        return response;
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
        public List<eWalletResponse> Get()
        {
            var response = new List<eWalletResponse>();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = _context.tcorewallets
                        .Where(e => e.active == 1 && e.is_deleted == 0)
                        .Select(n => new eWalletResponse()
                        {
                            user_id = n.user_id,
                            point = n.point,
                            payment_channel = n.payment_channel,
                            prev_balance = n.prev_balance,
                            amount_paid = n.amount_paid,
                            current_balance = n.current_balance,
                            active = n.active,
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
                response.Add(new eWalletResponse()
                {
                    Status = 0,
                    Message = ex.ToString()
                });
            }

            return response;
        }

        [WebMethod]
        public List<eWalletResponse> GetWalletTranxHistory(eWalletDto wallet)
        {
            var response = new List<eWalletResponse>();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = _context.tcorewallets
                        .Where(e => e.active == 0 && e.is_deleted == 0 && e.user_id == wallet.user_id)
                        .Select(n => new eWalletResponse()
                        {
                            user_id = n.user_id,
                            point = n.point,
                            payment_channel = n.payment_channel,
                            prev_balance = n.prev_balance,
                            amount_paid = n.amount_paid,
                            current_balance = n.current_balance,
                            active = n.active,
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
                response.Add(new eWalletResponse()
                {
                    Status = 0,
                    Message = ex.ToString()
                });
            }

            return response;
        }

        [WebMethod]
        public eWalletResponse Get(eWalletDto wallet)
        {
            var response = new eWalletResponse();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    if (string.IsNullOrWhiteSpace(wallet.user_id) && string.IsNullOrWhiteSpace(wallet.phone_number))
                    {
                        response.Status = 0;
                        response.Message = "User identification or user phone number is required";
                    }

                    var user = _context.tcoreusers.Where(p => p.phone_number == wallet.phone_number).FirstOrDefault();
                    if(user != null)
                    {
                        //int _eventId = (venndoritem.event_id == 0) ? -1 : venndoritem.event_id;

                        var query = _context.vw_customer_credit_balance.Where(e => e.user_id == user.id.ToString())
                        .Select(n => new eWalletResponse()
                        {
                            user_id = n.user_id,
                            prev_balance = 0,
                            amount_paid = 0,
                            point = n.total_wallet_point,
                            current_balance = n.customer_total_balance,
                            active = 1,
                            //created_at = n.created_at,
                            //created_by = n.created_by,
                            //updated_at = n.updated_at,
                            //updated_by = n.updated_by,
                            Status = 1,
                            Message = "Success"
                        }).FirstOrDefault();

                        //var query = _context.tcorewallets.Where(e => e.user_id == user.id.ToString() && e.is_deleted == 0 && e.active == 1)
                        //.Select(n => new eWalletResponse()
                        //{
                        //    user_id = n.user_id,
                        //    prev_balance = n.prev_balance,
                        //    amount_paid = n.amount_paid,
                        //    point = n.point,
                        //    current_balance = n.current_balance,
                        //    active = n.active,
                        //    created_at = n.created_at,
                        //    created_by = n.created_by,
                        //    updated_at = n.updated_at,
                        //    updated_by = n.updated_by,
                        //    Status = 1,
                        //    Message = "Success"
                        //}).FirstOrDefault();

                        response = query;
                    }
                    else
                    {
                        response.current_balance = 0;
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
