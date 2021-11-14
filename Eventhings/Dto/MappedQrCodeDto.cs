using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Dto
{
    public class MappedQrCodeDto
    {
        public int user_id { get; set; }
        public string email_address { get; set; }

        public string code { get; set; }
        public decimal? base_point { get; set; }
        public decimal? base_amount { get; set; }
        public string payment_channel { get; set; }
        public DateTime? date_mapped { get; set; }
        public int event_id { get; set; }
    }
}