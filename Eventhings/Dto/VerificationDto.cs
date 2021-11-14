using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Dto
{
    public partial class VerificationDto
    {
        public string verification_code { get; set; }
        public string verification_token { get; set; }
        public string email { get; set; }
    }
}