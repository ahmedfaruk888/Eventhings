using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Dto
{
    public class HostDto
    {
        public string full_name { get; set; }
        public string description { get; set; }
        public string phone { get; set; }
        public string email { get; set; }
        public string address { get; set; }
        public int deleted { get; set; }
        public int active { get; set; }
        public string created_by { get; set; }
        public DateTime? created_date { get; set; }
        public string updated_by { get; set; }
        public DateTime? updated_at { get; set; }
    }
}