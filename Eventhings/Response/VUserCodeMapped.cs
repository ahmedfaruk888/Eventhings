using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Response
{
    public class VUserCodeMapped : BaseResponse
    {
        public int id { get; set; }

        public string full_name { get; set; }
        public string first_name { get; set; }

        public string last_name { get; set; }

       
        public string phone_number { get; set; }

       
        public string email { get; set; }

        public int? event_id { get; set; }

       
        public string event_name { get; set; }

        public decimal? gate_fee { get; set; }

        public int? is_live { get; set; }

        public int? active { get; set; }

        public int? code_id { get; set; }

       
        public string batch_number { get; set; }

       
        public string batch_name { get; set; }

       
        public string qr_code_text { get; set; }

       
        public string encrypted_code { get; set; }
    }
}