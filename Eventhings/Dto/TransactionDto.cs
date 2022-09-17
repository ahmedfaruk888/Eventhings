using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Dto
{
    public class TransactionDto
    {
        public int id { get; set; }

        public int ref_code { get; set; }

        public int user_id { get; set; }
        public int event_id { get; set; }
        public string channel { get; set; }

        public decimal tranx_amount { get; set; }

        public int active { get; set; }

        public int is_deleted { get; set; }

        public string created_by { get; set; }
        public DateTime? created_at { get; set; }
    }

    public class DashboardDto
    {
        public int total_customer { get; set; }

        public int total_vendor { get; set; }

        public int total_paid_absent_customer { get; set; }
    }
}