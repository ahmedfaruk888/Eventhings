using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Response
{
    public class TransactionResponse : BaseResponse
    {
    }

    public class DashboardResponse : BaseResponse
    {
        public int total_customer { get; set; }

        public int total_vendor { get; set; }

        public int total_sales { get; set; }

        public int total_paid_absent_customer { get; set; }
    }

    //public class EventPaymentResponse : BaseResponse
    //{
        
    //}
}