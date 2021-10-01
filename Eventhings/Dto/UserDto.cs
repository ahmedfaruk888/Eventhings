using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Dto
{
    public class UserDto
    {
        public int id { get; set; }
        public string user_code { get; set; }
        public string email { get; set; }
        public DateTime? email_confirmed { get; set; }
        public string password_hash { get; set; }
        public int require_password_change { get; set; }
        public string phone_number { get; set; }
        public DateTime? phone_number_confirmed { get; set; }
        public int two_factor_enabled { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string other_name { get; set; }
        public int active { get; set; }
        public int is_deleted { get; set; }
    }
}