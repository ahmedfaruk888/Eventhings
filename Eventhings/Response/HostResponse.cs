using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Response 
{
    public class HostResponse : BaseResponse
    {
        public int id { get; set; }
        public string full_name { get; set; }
        public string description { get; set; }
        public string phone { get; set; }
        public string email { get; set; }
        public string address { get; set; }
        public int deleted { get; set; }
        public int active { get; set; }
    }
}