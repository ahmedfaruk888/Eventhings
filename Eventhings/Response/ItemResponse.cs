using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Response
{
    public class ItemResponse : BaseResponse
    {
        public int id { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public decimal cost { get; set; }
        public decimal? price { get; set; }
        public string category { get; set; }
        public int quantity { get; set; }
        public int active { get; set; }
        public int is_deleted { get; set; }
    }

    public class ItemPointResponse : BaseResponse
    {
        public int id { get; set; }
        public int item_id { get; set; }
        public string item_name { get; set; }

        public int unit_id { get; set; }

        public decimal cost { get; set; }

        public decimal? price { get; set; }

        public decimal? point { get; set; }

        public int active { get; set; }

        public int is_deleted { get; set; }
    }

    public class ItemForSalesResponse : BaseResponse
    {
        public int point_id { get; set; }
        public decimal point_cost { get; set; }
        public decimal? point_price { get; set; }
        public decimal? mapped_point { get; set; }
        public int active { get; set; }
        public string item_name { get; set; }
        public string item_description { get; set; }
        public string category_name { get; set; }
        public int item_quantity { get; set; }
        public string measurement_name { get; set; }
        public int is_deleted { get; set; }
    }
}