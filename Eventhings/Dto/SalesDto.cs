using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Dto
{
    public class SalesDto
    {
        public int id { get; set; }
        public string code { get; set; }
        public string email_address { get; set; }
        public int vendor_id { get; set; }
        public int user_id { get; set; }
        public int event_id { get; set; }
        public int quantity { get; set; }
        public decimal price { get; set; }
        public decimal point { get; set; }
        public int active { get; set; }

        public int is_deleted { get; set; }

        public string created_by { get; set; }

        public DateTime? created_at { get; set; }
    }

    public class SalesDto2
    {
        public int point_id { get; set; }
        public string item_name { get; set; }
        public decimal mapped_point { get; set; }
        public decimal point_price { get; set; }
        public int quantity { get; set; }
        public decimal total { get; set; }
    }
}