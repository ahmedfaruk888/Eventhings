using Eventhings.DbEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Response
{
    public class QrCodeRespose : BaseResponse
    {
        public int id { get; set; }
        public string batch_number { get; set; }
        public string batch_name { get; set; }
        public int code_count { get; set; }
        public int active { get; set; }
        public string encrypted_code { get; set; }
        public int is_deleted { get; set; }
        public string code { get; set; }
        //public tcorecodestore qr_code { get; set; }
        //public List<tcorecodestore> qr_codes { get; set; }
        public int total_code_count { get; set; }
        public DateTime? date_used { get; set; }
        public DateTime? created_at { get; set; }
        //public string date_string { get; set; }
    }
}