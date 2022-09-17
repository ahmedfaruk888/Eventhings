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
    }
}
