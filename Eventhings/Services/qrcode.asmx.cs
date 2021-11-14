using Eventhings.Common;
using Eventhings.DbContexts;
using Eventhings.DbEntities;
using Eventhings.Dto;
using Eventhings.Response;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Eventhings.Services
{
    /// <summary>
    /// Summary description for qrcode
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class qrcode : System.Web.Services.WebService
    {

        [WebMethod]
        public QrCodeRespose SaveNewQrCode(QRCodeDto qrcode)
        {
            var response = new QrCodeRespose();
            try
            {
                if (string.IsNullOrEmpty(qrcode.batch_number)) 
                {
                    response.Status = 0;
                    response.Message = $"Batch  number is required";
                    return response;
                }

                if (string.IsNullOrEmpty(qrcode.batch_name))
                {
                    response.Status = 0;
                    response.Message = $"Batch name is required";
                    return response;
                }

                if (string.IsNullOrEmpty(qrcode.code_count.ToString()) || qrcode.code_count < 1)
                {
                    response.Status = 0;
                    response.Message = $"Generated qr code count is required or must be greate than zero";
                    return response;
                }

                using (var _context = new EventhingsDbContext())
                {
                    var batchExists = _context.tcorecodestores.Where(e => e.batch_name == qrcode.batch_name && e.batch_number == qrcode.batch_number).FirstOrDefault();

                    var codeCount = qrcode.code_count;
                    var randomGuid = CommonRandomNumber.GetRandomGuid(codeCount);
                    var active = qrcode.active;

                    if (randomGuid.Count > 0)
                    {
                        foreach (var ss in randomGuid)
                        {
                            if (batchExists != null) //if bacth exists, update the records
                            {
                                _context.tcorecodestores.AddRange(new List<tcorecodestore>()
                                 {
                                    new tcorecodestore()
                                        {
                                            batch_number = qrcode.batch_number,
                                            batch_name = qrcode.batch_name,
                                            code = ss.Value,
                                            active = qrcode.active,
                                            is_deleted = 0,
                                            created_by = qrcode.created_by,
                                            created_at = DateTime.Now
                                        }
                                 });

                                //batchExists.batch_number = qrcode.batch_number;
                                //batchExists.batch_name = qrcode.batch_name;
                                //batchExists.code = ss.Value;
                                //batchExists.active = qrcode.active;
                                //batchExists.is_deleted = 0;
                                //batchExists.updated_by = "Admin";
                                //batchExists.updated_at = DateTime.Now;

                                //_context.Entry(batchExists).State = System.Data.Entity.EntityState.Modified;
                            }
                            else // insert new records
                            {
                                //validatation : check if qrcode name and number exists before inserting new ones
                                var batchNameExists = _context.tcorecodestores.Where(e => e.batch_name == qrcode.batch_name).FirstOrDefault();

                                var batchNumberExists = _context.tcorecodestores.Where(e => e.batch_number == qrcode.batch_number).FirstOrDefault();

                                if (batchNameExists != null && batchNameExists.batch_name == qrcode.batch_name)
                                {
                                    response.Status = 0;
                                    response.Message = "The batch name specified already exists";
                                    return response;
                                }

                                if (batchNumberExists != null && batchNumberExists.batch_number == qrcode.batch_number)
                                {
                                    response.Status = 0;
                                    response.Message = "The batch number specified already exists";
                                    return response;
                                }
                                _context.tcorecodestores.AddRange(new List<tcorecodestore>()
                                 {
                                    new tcorecodestore()
                                        {
                                            batch_number = qrcode.batch_number,
                                            batch_name = qrcode.batch_name,
                                            code = ss.Value,
                                            active = qrcode.active,
                                            is_deleted = 0,
                                            created_by = "Admin",
                                            created_at = DateTime.Now
                                        }
                                 });
                            }
                        }
                    }

                    var rowsAffected = _context.SaveChanges();

                    if (rowsAffected > 0)
                    {
                        response.Status = rowsAffected;
                        response.Message = $"{rowsAffected} new QR code text was generated successfuly, switch to 'Un-mapped QR Code Text' tab to view it";
                    }
                }
            }
            catch(Exception ex)
            {
                response.Status = 0;
                response.Message = ex.ToString();
            }

            return response;
        }

        [WebMethod]
        public List<MappedQrCodeRespose> GetMappedQrCode()
        {
            var response = new List<MappedQrCodeRespose>();
            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = _context.tcoremappedcodes.Where(p => p.deleted == 0 && p.date_mapped != null).ToList();

                    foreach(var x in query)
                    {
                        response.Add(new MappedQrCodeRespose()
                        {
                            id = x.id,
                            user_id = x.user_id,
                            code_id = x.code_id,
                            date_mapped = x.date_mapped,
                            event_id = x.event_id,
                            deleted = x.deleted,
                            created_by = x.created_by,
                            created_at = x.created_at,
                            Status = 1
                        });
                    }
                }

                //response.Status = 1;
            }
            catch(Exception ex)
            {
                response.Add(new MappedQrCodeRespose()
                {
                    Status = 0,
                    Message = ex.ToString()
                });
            }

            return response;
        }

        [WebMethod]
        public MappedQrCodeRespose GetMappedQrCodeById(int codeid)
        {
            var response = new MappedQrCodeRespose();
            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = _context.tcoremappedcodes.Where(p => p.deleted == 0 && (p.code_id == codeid && p.date_mapped != null)).FirstOrDefault();
                    if (query != null)
                        response.Status = 1;
                    else
                        response.Status = 0;
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
        public QrCodeRespose GetStoreQrCode(string code)
        {
            var response = new QrCodeRespose();
            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = _context.tcorecodestores.Where(p => p.is_deleted == 0 && p.code == code).FirstOrDefault();
                    if (query != null)
                        response.Status = 1;
                    else
                        response.Status = 0;
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
        public List<QrCodeRespose> GetUnMappedQrCode()
        {
            var response = new List<QrCodeRespose>();
            //var qrCode = new QRCodeDto();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = (from p in _context.tcorecodestores
                             where /*p.active == 1 &&*/ p.is_deleted == 0 && p.date_used == null
                             select p).OrderBy(p => p.id).ToList();

                    foreach (var x in query)
                    {
                        response.Add(new QrCodeRespose()
                        {
                            id = x.id,
                            code = x.code,
                            encrypted_code = x.encrypted_code,
                            batch_name = x.batch_name,
                            batch_number = x.batch_number,
                            active = x.active,
                            is_deleted = x.is_deleted,
                            date_used = x.date_used,
                            Status = 1,
                            created_at = x.created_at
                        });
                    }
                    //response.total_code_count = (from p in _context.tcorecodestores select p).Count();
                }
            }
            catch (Exception ex)
            {
                response.Add(new QrCodeRespose()
                {
                    Status = 0,
                    Message = ex.ToString()
                });
            }

            return response;
        }

        [WebMethod]
        public List<QrCodeRespose> DistinctBatchNameNumber()
        {
            var response = new List<QrCodeRespose>();
            //var arrtemp = new List<QrCodeRespose>();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = _context.tcorecodestores.Where(filter => filter.batch_number != null).Select(x => new QrCodeRespose()
                    {
                        //id = x.id,
                        batch_number = x.batch_number,
                        batch_name = x.batch_name
                    }).Distinct().ToList();

                    //bool duplicatefound = false;
                    //foreach (var qr1 in query)
                    //{
                    //    arrtemp.Add(qr1);
                    //    foreach (var qr2 in arrtemp)
                    //    {
                    //        if (qr1.batch_name == qr2.batch_name)
                    //            duplicatefound = true;

                    //        if (!duplicatefound)
                    //        {
                    //            arrtemp.Add(qr2);
                    //        }
                    //    }
                    //}

                    foreach(var qr2 in query)
                    {
                        response.Add(new QrCodeRespose()
                        {
                            //id = qr2.id,
                            batch_name = qr2.batch_name,
                            batch_number = qr2.batch_number,
                            Status = 1,
                            Message = "Success"
                        });
                    }
                }

                //response.Status = 1;
                //response.Message = "Batch details retrieved successfuly";
            }
            catch (Exception ex)
            {
                #if DEBUG
                response.Add(new QrCodeRespose()
                {
                    Status = 0,
                    Message = ex.ToString()
                });
                #endif
                response.Add(new QrCodeRespose()
                {
                    Status = 0,
                    Message = "An network error occured"
                });
            }

            return response;
        }

        [WebMethod]
        public List<QrCodeRespose> GenerteQRCodeImage(string batchname)
        {
            var response = new List<QrCodeRespose>();
            try
            {
                using (var _context = new EventhingsDbContext())
                {

                    var query = _context.tcorecodestores.Where(name => name.batch_name == batchname).ToList();

                    //Get the base qr code text to embed into QR code from the appsettings section of the web.config file
                    var stringToEncode = ConfigurationHelper.GetBaseUrlConfiSection();
                    if (string.IsNullOrEmpty(stringToEncode))
                    {
                        response.Add(new QrCodeRespose()
                        {
                            Status = 0,
                            Message = "Qr code image can not be generated - missing QR code text from the configuration file"
                        });

                        return response;
                    }

                    var msgDelimeter = ',';
                    string messageUrl = string.Empty;

                    foreach(var ss in query)
                    {
                        response.Add(new QrCodeRespose() 
                        { 
                             id = ss.id,
                             base_qrcode_url = stringToEncode,
                             code = ss.code,
                             batch_name = ss.batch_name,
                             batch_number = ss.batch_number,
                             Status = 1,
                             Message = new Uri($"{stringToEncode}?codeid={ss.id},code={ss.code},batch_name={ss.batch_name},batch_number={ss.batch_number}").ToString()
                        });
                    }
                    //response.total_code_count = (from p in _context.tcorecodestores select p).Count();
                }
            }
            catch (Exception ex)
            {
                response.Add(new QrCodeRespose()
                {
                    Status = -1,
                    Message = ex.ToString()
                });
            }

            return response;
        }

        [WebMethod]
        public UserResponse GetCustomer(string phone_number)
        {
            var response = new UserResponse();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    if (string.IsNullOrWhiteSpace(phone_number))
                    {
                        response.Status = 0;
                        response.Message = "Phone number is required";
                    }

                    var query = _context.tcoreusers
                        .Where(e => e.phone_number == phone_number && e.active == 1 && e.is_deleted == 0)
                        .Select(n => new UserResponse()
                        {
                            id = n.id,
                            user_code = n.user_code,
                            first_name = n.first_name,
                            last_name = n.last_name,
                            other_name = n.other_name,
                            email = n.email,
                            email_confirmed = n.email_confirmed,
                            phone_number = n.phone_number,
                            phone_number_confirmed = n.phone_number_confirmed,
                            password_hash = n.password_hash,
                            require_password_change = n.require_password_change,
                            active = n.active,
                            created_at = n.created_at,
                            created_by = n.created_by,
                            updated_at = n.updated_at,
                            updated_by = n.updated_by,
                            Status = 1,
                            Message = "Success"
                        }).FirstOrDefault();

                    //var wallet = _context.tcorewallets.Where(p => p.user_id == query.id.ToString()).FirstOrDefault();
                    //query.current_balance = wallet.current_balance.ToString();
                    if(query == null)
                    {
                        response.Status = 0;
                        response.Message = "The specified phone number does not exists..";
                        return response;
                    }
                    response = query;

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
        public MappedQrCodeRespose MapCodeToCustomer(MappedQrCodeDto map)
        {
            var response = new MappedQrCodeRespose();
            try
            {
                if (string.IsNullOrEmpty(map.base_point.ToString()))
                {
                    response.Status = 0;
                    response.Message = "Customer base point is required before entering the event hall";
                    return response;
                }

                if (string.IsNullOrEmpty(map.base_amount.ToString()))
                {
                    response.Status = 0;
                    response.Message = "Customer base amount is required before entering the event hall";
                    return response;
                }

                if (string.IsNullOrEmpty(map.user_id.ToString()))
                {
                    response.Status = 0;
                    response.Message = "Customer Id is required to map code to customer";
                    return response;
                }

                if (string.IsNullOrEmpty(map.code.ToString()))
                {
                    response.Status = 0;
                    response.Message = "Customer QR code text is required";
                    return response;
                }

                if (string.IsNullOrEmpty(map.event_id.ToString()))
                {
                    response.Status = 0;
                    response.Message = "Event is required to map customer";
                    return response;
                }

                using (var _context = new EventhingsDbContext())
                {
                    //allows only one entry on the foreign key
                    var maping = _context.tcoremappedcodes
                                            .Where(e => e.user_id == map.user_id && e.event_id == map.event_id).FirstOrDefault();
                    
                    if(maping != null) //return error
                    {
                        response.Status = 0;
                        response.Message = $"The specified phone number has been mapped to another QR Code for the same event";
                        return response;
                    }
                    else //insert
                    {
                        //Update the date_used column on the code store table
                        var qr = _context.tcorecodestores
                                            .Where(e => e.code == map.code && e.active == 1).FirstOrDefault();

                        qr.date_used = DateTime.Now;
                        _context.Entry(qr).State = System.Data.Entity.EntityState.Modified;

                        //insert a new entry into the mapped code table
                        _context.tcoremappedcodes.Add(new tcoremappedcode
                        {
                            user_id = map.user_id,
                            code_id = qr.id,
                            event_id = map.event_id,
                            deleted = 0,
                            created_at = DateTime.Now,
                            date_mapped = DateTime.Now
                        });

                        //check if the user has an entry in the wallet table before
                        var wallet = _context.tcorewallets.Where(identity => identity.user_id == map.user_id.ToString() && identity.active == 1).FirstOrDefault();
                        
                        if(wallet != null) //update the entry
                        {
                            //if the user currently have an active e-wallet
                            //var newPrevBal = wallet.current_balance;

                            wallet.point = (wallet.point + map.base_point.Value);
                            wallet.prev_balance = wallet.current_balance;
                            wallet.amount_paid = (wallet.amount_paid + map.base_amount.Value);
                            wallet.current_balance = (wallet.current_balance + map.base_amount.Value);

                            _context.Entry(wallet).State = System.Data.Entity.EntityState.Modified;
                        }
                        else //insert a new entry
                        {
                            //Insert a new default record for the user in the wallet table
                            _context.tcorewallets.Add(new tcorewallet
                            {
                                user_id = map.user_id.ToString(),
                                point = map.base_point.Value,
                                payment_channel = map.payment_channel,
                                prev_balance = 0,
                                amount_paid = map.base_amount.Value,
                                current_balance = map.base_amount.Value,
                                active = 1,
                                is_deleted = 0,
                                created_by = map.email_address,
                                created_at = DateTime.Now
                            });
                        }


                        //_context.tcorewallets.Add(new tcorewallet
                        //{
                        //    user_id = map.user_id.ToString(),
                        //    point = map.base_point.Value,

                        //    prev_balance = 0,
                        //});

                        //save the changes to the database
                        var affected = _context.SaveChanges();
                        if (affected > 0)
                        {
                            response.Status = 1;
                            response.Message = $"Customer QR code text '{map.code}' was successfully mapped";
                            return response;
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

        [WebMethod]
        public MappedQrCodeRespose GetMappedQrCodeByCode(string code)
        {
            var response = new MappedQrCodeRespose();
            try
            {
                if (string.IsNullOrWhiteSpace(code))
                {
                    response.Status = 0;
                    response.Message = "The QR code text is required";
                    return response;
                }

                using (var _context = new EventhingsDbContext())
                {
                    var codeQuery = _context.tcorecodestores.Where(c => c.code == code && c.is_deleted == 0).FirstOrDefault();

                    if (codeQuery == null)
                    {
                        response.Status = 0;
                        response.Message = "The QR code text does not exists, please contact eventi.ng administrator";
                        return response;
                    }

                    //New mapping
                    //var codeStore = _context.tcorecodestores.Where(id => id.code == code).FirstOrDefault();
                    var mappedCode = _context.tcoremappedcodes.Where(id => id.code_id == codeQuery.id).FirstOrDefault();

                    if (mappedCode == null || mappedCode.date_mapped == null)
                    {
                        //Open the floor for insertion
                        response.Status = 2;
                        response.Message = "The QR code text has not been mapped";
                        return response;
                    }
                    else
                    {
                        //Display
                        //Get the user details
                        var user = _context.tcoreusers.Where(id => id.id == mappedCode.user_id).FirstOrDefault();
                        if (user != null)
                        {
                            response.full_name = user.last_name + " " + user.first_name;
                            response.phone_number = user.phone_number;
                            response.date_mapped = mappedCode.date_mapped;

                            //Wallet details retrived
                            var wallet = _context.tcorewallets.Where(id => id.user_id == user.id.ToString() && id.active == 1 && id.is_deleted == 0).FirstOrDefault();
                            if(wallet != null)
                            {
                                response.point = wallet.point;
                                response.current_balance = wallet.current_balance.Value;
                            }

                            var events = _context.tcoreevents.Where(id => id.id == mappedCode.event_id && id.active == 1).FirstOrDefault();
                            if(events != null)
                            {
                                response.event_id = events.id;
                                response.event_name = events.name;
                            }

                            response.Status = 1;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                response.Status = -1;
                response.Message = ex.ToString();
                //response.Message = "An internal exception occured";
            }

            return response;
        }
    }
}
