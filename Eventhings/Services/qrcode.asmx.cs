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
                using (var _context = new EventhingsDbContext())
                {
                    var batchExists = _context.tcorecodestores.Where(e => e.batch_name == qrcode.batch_name && e.batch_number == qrcode.batch_number).FirstOrDefault();

                    //var batchNumberExists = _context.tcorecodestores.Where(e => e.batch_number == qrcode.batch_number).FirstOrDefault();

                    //if (batchNameExists != null && batchNumberExists != null)
                    //{
                    //    response.Status = 0;
                    //    response.Message = "The batch name specified already exists";
                    //    return response;
                    //}

                    
                    //if (batchNameExists != null)
                    //{
                    //    response.Status = 0;
                    //    response.Message = "The batch number specified already exists";
                    //    return response;
                    //}

                    var codeCount = qrcode.code_count;
                    var randomGuid = CommonRandomNumber.GetRandomGuid(codeCount);
                    var active = qrcode.active;

                    if (randomGuid.Count > 0)
                    {
                        foreach (var ss in randomGuid)
                        {
                            if (batchExists != null) //if bacth exists, update the records
                            {
                                batchExists.batch_number = qrcode.batch_number;
                                batchExists.batch_name = qrcode.batch_name;
                                batchExists.code = ss.Value;
                                batchExists.active = qrcode.active;
                                batchExists.is_deleted = 0;
                                batchExists.updated_by = "Admin";
                                batchExists.updated_at = DateTime.Now;

                                _context.Entry(batchExists).State = System.Data.Entity.EntityState.Modified;
                            }
                            else // insert new records
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
                                            created_by = "Admin"
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
                response.Message = ex.Message;
            }

            return response;
        }

        [WebMethod]
        public QrCodeRespose GetMappedQrCode(/*int skip, int take,*/ int active = 1, int mapped = 0)
        {
            var response = new QrCodeRespose();
            //var qrCode = new QRCodeDto();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = new List<tcorecodestore>();
                    if(mapped == 0)
                    {
                        query = (from p in _context.tcorecodestores
                                 where p.active == active && p.is_deleted == 0 && p.date_used == null select p).OrderBy(p => p.id).ToList();
                    }
                    else
                    {
                        query = (from p in _context.tcorecodestores
                                     where p.active == active && p.is_deleted == 0 && p.date_used != null select p).OrderBy(p => p.id).ToList();
                    }

                    //query = _context.tmstrcodestores.Skip(skip).Take(take).ToList();

                    response.qr_codes = query;
                    response.total_code_count = (from p in _context.tcorecodestores select p).Count();
                }

                response.Status = 1;
                //response.Message = qrCode;
            }
            catch(Exception ex)
            {
                response.Status = 0;
                response.Message = ex.Message;
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
                    var query = _context.tcorecodestores.Where(filter => filter.code != null).Select(x => new QrCodeRespose()
                    {
                        id = x.id,
                        batch_number = x.batch_number,
                        batch_name = x.batch_name
                    }).Distinct().ToList();

                    foreach(var ss in query)
                    {
                        response.Add(ss);
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
        public QrCodeRespose Search(QRCodeDto qrcode)
        {
            var response = new QrCodeRespose();
            //var qrCode = new QRCodeDto();

            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    var query = new List<tcorecodestore>();
                    if (qrcode.batch_number != null)
                    {
                        query = (from p in _context.tcorecodestores
                                 where p.active == qrcode.active && p.batch_number == qrcode.batch_number
                                 select p).OrderBy(p => p.batch_number).ToList();
                    }
                    else if(qrcode.batch_name != null)
                    {
                        query = (from p in _context.tcorecodestores
                                 where p.active == qrcode.active && p.batch_name == qrcode.batch_name
                                 select p).OrderBy(p => p.batch_name).ToList();
                    }

                    //query = _context.tmstrcodestores.Skip(skip).Take(take).ToList();

                    response.qr_codes = query;
                    response.total_code_count = (from p in _context.tcorecodestores select p).Count();
                }

                response.Status = 1;
                //response.Message = qrCode;
            }
            catch (Exception ex)
            {
                response.Status = 0;
                response.Message = ex.Message;
            }

            return response;
        }
    }
}
