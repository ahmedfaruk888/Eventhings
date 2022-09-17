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
    /// Summary description for sales
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class sales : System.Web.Services.WebService
    {

        [WebMethod]
        public SalesResponse2 Save(int itempointid)
        {
            var response = new SalesResponse2();
            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    
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
        public SalesResponse TotalSales()
        {
            var response = new SalesResponse();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = _context.tcoresales.Where(e => e.active == 1 && e.is_deleted == 0).Count();
                    response.Status = 1;
                    response.Message = query;
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
        public SalesResponse TotalSalesByVendor(string email)
        {
            var response = new SalesResponse();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = _context.tcoresales.Where(e => e.active == 1 && e.is_deleted == 0 && e.created_by == email).Count();
                    response.Status = 1;
                    response.Message = query;
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
        public SalesResponse MakeSales(SalesDto mappeddto)
        {
            var response = new SalesResponse();
            int affected = 0;
            try
            {
                if (string.IsNullOrWhiteSpace(mappeddto.code))
                {
                    response.Status = 0;
                    response.Message = "The QR code text is required";
                    return response;
                } //if qr code text is empty or missing
                if (string.IsNullOrWhiteSpace(mappeddto.email_address))
                {
                    response.Status = 0;
                    response.Message = "Vendor details can not be found in the request";
                    return response;
                }
                if (string.IsNullOrWhiteSpace(mappeddto.item_id.ToString()))
                {
                    response.Status = 0;
                    response.Message = "Item details can not be found in the request";
                    return response;
                }

                using (var _context = new EventhingsDbContext())
                {
                    var codeQuery = _context.tcorecodestores.Where(c => c.code == mappeddto.code && c.is_deleted == 0).FirstOrDefault();

                    if (codeQuery == null)
                    {
                        response.Status = 0;
                        response.Message = "The QR code text does not exists... Contact The Organizer";
                        return response;
                    } //check the qr code exists or not

                    //New mapping
                    //var codeStore = _context.tcorecodestores.Where(id => id.code == mappeddto.code).FirstOrDefault();
                    var mappedCode = _context.tcoremappedcodes.Where(id => id.code_id == codeQuery.id).FirstOrDefault();
                    if (mappedCode == null || mappedCode.date_mapped == null) //Qr Code has not been mapped
                    {
                        response.Status = 2; //set the QR code not mapped status code
                        response.Message = "The customer QR code has not been mapped or invalid... Contact The Organizer";
                        return response;
                    }
                    else
                    {

                        response.user_id = mappedCode.user_id;
                        response.event_id = mappedCode.event_id;
                        int eventIdentity = 0;

                        //get vendor details from the user table - id
                        var vendor = _context.tcoreusers.Where(e => e.email == mappeddto.email_address && e.active == 1 && e.is_deleted == 0).FirstOrDefault();

                        if (vendor == null)
                        {
                            response.Status = 3; //vendor details can not be retirved
                            response.Message = "Vendor details can not be retrieved, logout and login again";
                            return response;
                        }

                        response.vendor_id = vendor.id;

                        //Get product item from vendoritem table by the vendor id
                        var venndoritem = _context.tcorevendoritems.Where(n => n.active == 1 && n.is_deleted == 0 && n.vendor_id == vendor.id).FirstOrDefault();
                        response.item_id = venndoritem.item_id;
                        if (venndoritem == null)
                        {
                            response.Status = 4; //vendor details can not be retirved
                            response.Message = "You don't have a product mapped to you yet... Contact The Organizer";
                            return response;
                        }

                        //Get the product details (id and point) by the product id
                        var product = _context.tcoreitems.Where(n => n.id == mappeddto.item_id && n.active == 1 && n.is_deleted == 0).FirstOrDefault();
                        var productPoint = product.point.Value;
                        var productPrice = product.price.Value;
                        var productCost = product.cost;

                        if (product.point == null || product == null || product.price == null)
                        {
                            response.Status = 6; //vendor details can not be retirved
                            response.Message = $"Hello {mappeddto.email_address}! your assigned product point has not been defined... Contact The Organizer";
                            return response;
                        }

                        #region
                        //var userWallet = _context.tcorewallets
                        //    .Where(n => n.user_id == mappedCode.user_id.ToString() && n.active == 1 && n.is_deleted == 0).FirstOrDefault();
                        //if (userWallet == null || userWallet.point < productPoint || userWallet.point <= 0)
                        //{
                        //    response.Status = 5;
                        //    response.Message = "This customer has no enough point left in his/her wallet. Contact The Organizer";
                        //    return response;
                        //}
                        #endregion

                        int _eventId = (venndoritem.event_id == 0) ? -1 : venndoritem.event_id;

                        var userSalesCalc = _context.vw_customer_credit_balance
                            .Where(n => n.user_id == mappedCode.user_id.ToString() && n.event_id == _eventId).FirstOrDefault();

                        if (userSalesCalc == null || userSalesCalc.total_wallet_point < productPoint)
                        {
                            userSalesCalc = _context.vw_customer_credit_balance
                            .Where(n => n.user_id == mappedCode.user_id.ToString() && n.event_id == 0).FirstOrDefault();

                            if (userSalesCalc == null || userSalesCalc.total_wallet_point < productPoint)
                            {
                                userSalesCalc = _context.vw_customer_credit_balance
                                .Where(n => n.user_id == mappedCode.user_id.ToString() && n.event_id == 0).FirstOrDefault();

                                response.Status = 5;
                                response.point = productPoint;
                                response.Message = "This customer has no enough point left in his/her wallet. Contact The Organizer";
                                return response;
                            }
                        }

                        //if (userWallet == null || userWallet.current_balance < productPrice || userWallet.current_balance <= 0)
                        //{
                        //    response.Status = 5;
                        //    response.Message = "This customer has no enough balance left in his/her wallet. Contact The Organizer";
                        //    return response;
                        //}

                        //var currentPoint = userWallet.point;
                        //var currentBalance = userWallet.current_balance.Value;
                        //var amountPaid = productPrice;
                        //var prevBalance = userWallet.prev_balance.Value;

                        //var newPoint = currentPoint - productPoint;
                        //var newCurrBalance = currentBalance - productPrice;
                        //var newPrevBalance = currentBalance;

                        //update the current active wallet entry and set the active value to zero (0)
                        //userWallet.active = 0;
                        //_context.Entry(userWallet).State = System.Data.Entity.EntityState.Modified;
                        //affected = _context.SaveChanges();

                        //save new entry in the wallet

                        //response.point = currentPoint;
                        response.price = productPrice;
                        //response.new_point = newPoint;
                        //response.new_balance = newCurrBalance;
                        //response.prev_balance = currentBalance;
                        response.allowed_payment = 2;

                        //_context.tcorewallets.Add(new tcorewallet
                        //{
                        //    user_id = mappedCode.user_id.ToString(),
                        //    point = newPoint,
                        //    payment_channel = "e-wallet payment (Point)",
                        //    prev_balance = newPrevBalance,
                        //    amount_paid = amountPaid,
                        //    current_balance = newCurrBalance,
                        //    active = 1,
                        //    is_deleted = 0,
                        //    created_by = mappeddto.email_address,
                        //    created_at = DateTime.Now
                        //});

                        //affected = _context.SaveChanges();

                        //save new entry in the sales
                        _context.tcoresales.Add(new tcoresale
                        {
                            itempoint_id = venndoritem.item_id,
                            event_id = eventIdentity,
                            user_id = mappedCode.user_id,
                            vendor_id = vendor.id,
                            quantity = 1,
                            item_id = mappeddto.item_id,
                            price = product.price.Value,
                            point = productPoint,
                            active = 1,
                            is_deleted = 0,
                            created_by = mappeddto.email_address,
                            created_at = DateTime.Now,
                        });

                        affected = affected + _context.SaveChanges();

                        if (affected > 0)
                        {
                            response.Status = 1;
                            response.Message = "Sales transaction successful";
                            return response;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                response.Status = -1;
                response.Message = "Internal error occured";
                response.exception = ex.ToString();
            }

            return response;
        }

        [WebMethod]
        public List<SalesReportResponse> GetVendorSales(int vendorid)
        {
            var response = new List<SalesReportResponse>();

            int _vendorid = vendorid;

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = new List<SalesReportResponse>();

                    if (_vendorid == 0)
                    {
                        query = _context.Database.SqlQuery<SalesReportResponse>("SELECT CONCAT(users.first_name, ' ', users.last_name) as 'vendor', max(sales.created_at) as 'last_tranx_date', count(sales.itempoint_id) as 'total_sales_point', sum(sales.price) as 'total_sales_amount' from tcoresales sales join tcoreusers users on users.email = sales.created_by where sales.active = 1 and sales.is_deleted = 0  group by CONCAT(users.first_name, ' ', users.last_name)").ToList();
                    }
                    else
                    {
                        var userEmail = _context.tcoreusers.Where(n => n.active == 1 && n.is_deleted == 0 && n.id == vendorid).Select(x => x.email).FirstOrDefault();

                        query = _context.Database.SqlQuery<SalesReportResponse>("SELECT CONCAT(users.first_name, ' ', users.last_name) as 'vendor', max(sales.created_at) as 'last_tranx_date', count(sales.itempoint_id) as 'total_sales_point', sum(sales.price) as 'total_sales_amount' from tcoresales sales join tcoreusers users on users.email = sales.created_by where users.email = @user_email and sales.active = 1 and sales.is_deleted = 0  group by CONCAT(users.first_name, ' ', users.last_name)", new SqlParameter("@user_email", userEmail)).ToList();
                    }

                    if(query != null)
                    {
                        foreach(var sales in query)
                        {
                            response.Add(new SalesReportResponse { 
                                
                                vendor = sales.vendor,
                                total_sales_amount = sales.total_sales_amount,
                                total_sales_point = sales.total_sales_point,
                                last_tranx_date = sales.last_tranx_date,
                                Status = 1,
                                Message = "Success"

                            });
                        }
                    }
                    else
                    {
                        response.Add(new SalesReportResponse
                        {
                            Status = 0,
                            Message = "Empty"
                        });
                    }
                }
            }
            catch (Exception ex)
            {
                response.Add(new SalesReportResponse
                {
                    Status = -1,
                    Message = ex.ToString()
                });
            }

            return response;
        }
    }
}
