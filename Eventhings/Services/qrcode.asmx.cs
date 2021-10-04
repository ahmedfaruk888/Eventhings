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
                                            created_by = "Admin",
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
                    
                    if(codeQuery == null)
                    {
                        response.Status = 0;
                        response.Message = "The QR code text does not exists, please contact eventi.ng administrator";
                        return response;
                    }

                    //check if code is mapped... (dissable ui control and display who it is mapped to) - plus the event it is mapped to
                    //if not mapped

                    var query = _context.tcoremappedcodes
                        .Join
                        (
                            _context.tcoreevents,
                            mcodes => mcodes.event_id,
                            eventt => eventt.id,
                            (mcodes, eventt) => new MappedQrCodeRespose()
                            {
                                event_id = eventt.id,
                                event_name = eventt.name,
                                date_mapped = mcodes.date_mapped,
                                code_id = mcodes.code_id,
                                deleted = mcodes.deleted,
                                id = mcodes.code_id,
                                Message = "Success",
                                user_id = mcodes.user_id
                            }
                        )
                        .Where(p => p.deleted == 0 && (p.code_id == codeQuery.id && p.date_mapped != null))
                        .Select(cc => new MappedQrCodeRespose() 
                        {
                            event_id = cc.id,
                            event_name = cc.event_name,
                            date_mapped = cc.date_mapped,
                            code_id = cc.code_id,
                            deleted = cc.deleted,
                            id = cc.code_id,
                            Message = "Success",
                            user_id = cc.user_id
                        })
                        .ToList();

                        #region
                    //.Select(n => new MappedQrCodeRespose() 
                    //{
                    //    id = n.id,
                    //    code_id = n.code_id,
                    //    date_mapped = n.date_mapped,
                    //    deleted = n.deleted,
                    //    event_id = n.event_id,
                    //    user_id = n.user_id,
                    //    created_by = n.created_by,
                    //    created_at = n.created_at,
                    //}).FirstOrDefault();
                    #endregion

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

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = _context.tcorecodestores.Where(filter => filter.batch_number != null).Select(x => new QrCodeRespose()
                    {
                        id = x.id,
                        batch_number = x.batch_number,
                        batch_name = x.batch_name
                    }).ToList();

                    var arrtemp = new List<QrCodeRespose>();
                    bool duplicatefound = false;
                    foreach (var qr1 in query)
                    {
                        arrtemp.Add(qr1);
                        foreach (var qr2 in arrtemp)
                        {
                            if (qr1.batch_name == qr2.batch_name)
                                duplicatefound = true;

                            if (!duplicatefound)
                            {
                                arrtemp.Add(qr2);
                            }
                        }
                    }

                    foreach(var qr2 in arrtemp)
                    {
                        response.Add(new QrCodeRespose()
                        {
                            id = qr2.id,
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
                response.Add(new QrCodeRespose()
                {
                    Status = 0,
                    Message = ex.Message
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

                    foreach(var ss in query)
                    {
                        response.Add(new QrCodeRespose() 
                        { 
                             id = ss.id,
                             code = ss.code,
                             batch_name = ss.batch_name,
                             batch_number = ss.batch_number,
                             Status = 1,
                             Message = $"{ss.id}|{ss.code}"
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
    }
}
