using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Response
{
    public class EventPaymentResponse : BaseResponse
    {

        public string user_id { get; set; }
        public string full_name { get; set; }
        public string event_name { get; set; }

        public DateTime event_date { get; set; }

        public string venue { get; set; }
        public string code_text { get; set; }

        public DateTime payment_date { get; set; }
        public decimal amount_payed { get; set; }
        public decimal point_balance { get; set; }
    }
}
