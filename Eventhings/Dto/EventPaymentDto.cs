using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Dto
{
    public class EventPaymentDto
    {
        public int user_id { get; set; }
        public int event_id { get; set; }

        public string tranx_ref_id { get; set; }

        public decimal amount { get; set; }

        public string created_by { get; set; }
    }
}