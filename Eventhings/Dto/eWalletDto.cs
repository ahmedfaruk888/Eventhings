using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Dto
{
    public class eWalletDto
    {
        public string user_id { get; set; }
        public string phone_number { get; set; }
        public decimal point { get; set; } = 0;
        public string payment_channel { get; set; }

        public decimal? prev_balance { get; set; }

        public decimal? amount_paid { get; set; }

        public decimal? current_balance { get; set; }

        public int active { get; set; }

        public int is_deleted { get; set; }
        public string created_by { get; set; }

        public DateTime? created_at { get; set; }
    }
}