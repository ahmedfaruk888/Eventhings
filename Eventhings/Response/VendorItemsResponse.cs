using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Response
{
    public class VendorItemsResponse : BaseResponse
    {
        public int id { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public decimal point { get; set; }
        public decimal? price { get; set; }
        public string category { get; set; }
        public int quantity { get; set; }
        public int active { get; set; }
        public int is_deleted { get; set; }
    }
}