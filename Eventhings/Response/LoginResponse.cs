using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Response
{
    public class LoginResponse : BaseResponse
    {
        public string full_name { get; set; }
        public int user_id { get; set; }
        public string user_code { get; set; }
        public string email_address { get; set; }
        public int role_id { get; set; }
        public string role_name { get; set; }
        public string phone_number { get; set; }
        public int active { get; set; }
        public int is_deleted { get; set; }
        public string verification_token { get; set; }
        public string verification_code { get; set; }
    }
}