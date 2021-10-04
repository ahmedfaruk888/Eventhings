using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Dto
{
    public class CategoryDto
    {
        public string name { get; set; }
        public int parent { get; set; }
        public string description { get; set; }
        public int active { get; set; }
        public string created_by { get; set; }
        public DateTime? created_at { get; set; }
    }
}