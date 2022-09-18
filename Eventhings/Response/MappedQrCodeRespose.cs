using Eventhings.DbEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Response
{
    public class MappedQrCodeRespose : BaseResponse
    {
        public int id { get; set; }
        public decimal point { get; set; } = 0;
        public int user_id { get; set; }
        public int code_id { get; set; }
        public DateTime? date_mapped { get; set; }
        public int event_id { get; set; }
        public string event_name { get; set; }
        public string full_name { get; set; }
        public decimal current_amount { get; set; } = 0;
        public decimal current_balance { get; set; } = 0;
        public string phone_number { get; set; }
        public string host_name { get; set; }
        public string user_name  { get; set; }
        public int deleted { get; set; }
    }
}