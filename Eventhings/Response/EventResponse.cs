using Eventhings.DbEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Response
{
    public class EventResponse : BaseResponse
    {
        public int id { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public string location { get; set; }
        public DateTime? start_date { get; set; }
        public DateTime? end_date { get; set; }
        public int? duration { get; set; }
        public int host_id { get; set; }
        public string host_name { get; set; }
        public int active { get; set; }
        public int deleted { get; set; }
        public int status { get; set; } = 0;
        public decimal gate_fee { get; set; }
    }
}