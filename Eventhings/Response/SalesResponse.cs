using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Response
{
    public class SalesResponse : BaseResponse
    {
        public int id { get; set; }
        public int vendor_id { get; set; }
        public int user_id { get; set; }
        public int event_id { get; set; }
        public int allowed_payment { get; set; }
        public int quantity { get; set; }
        public decimal price { get; set; }
        public decimal point { get; set; }
        public decimal new_point { get; set; }
        public decimal new_balance { get; set; }
        public decimal prev_balance { get; set; }
        public int active { get; set; }
        public int is_deleted { get; set; }
    }

    public class SalesResponse2 : BaseResponse
    {
        public int point_id { get; set; }
        public string item_name { get; set; }
        public decimal mapped_point { get; set; }
        public decimal point_price { get; set; }
        public int quantity { get; set; }
        public decimal total { get; set; }
        public int active { get; set; }
        public int is_deleted { get; set; }
    }
}