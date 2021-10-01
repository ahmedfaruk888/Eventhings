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

        public int user_id { get; set; }

        public int code_id { get; set; }

        public DateTime? date_mapped { get; set; }

        public int event_id { get; set; }
        public string event_name { get; set; }
        public string host_name { get; set; }
        public string user_name  { get; set; }

        public int deleted { get; set; }

        //public string created_by { get; set; }
        //public DateTime? created_at { get; set; }
    }
}