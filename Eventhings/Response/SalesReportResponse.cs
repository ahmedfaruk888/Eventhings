using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Response
{
    public class SalesReportResponse : BaseResponse
    {
        public int id { get; set; }
        public string vendor { get; set; }
        public int total_sales_point { get; set; }
        public decimal total_sales_amount { get; set; }
        public DateTime? last_tranx_date { get; set; }
    }
}