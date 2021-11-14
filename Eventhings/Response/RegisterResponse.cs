using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Response
{
    public class RegisterResponse : BaseResponse
    {
        public string verification_code { get; set; }
        public string verification_token { get; set; }
    }
}