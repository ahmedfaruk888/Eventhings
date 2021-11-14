using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Dto
{
    public class ProductDto
    {
        public string name { get; set; }
        public string description { get; set; }
        public decimal cost { get; set; }
        public decimal? price { get; set; }
        public decimal? point { get; set; }
        public string category { get; set; }
        public int quantity { get; set; }
        public int active { get; set; }
        public int is_deleted { get; set; }
        public string created_by { get; set; }
        public DateTime? created_at { get; set; }
    }
}