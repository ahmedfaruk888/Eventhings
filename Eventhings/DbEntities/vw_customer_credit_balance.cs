namespace Eventhings.DbContexts
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public class vw_customer_credit_balance
    {
        [Required]
        [Key]
        [MaxLength(256)]
        public string user_id { get; set; }

        [Required]
        public int event_id { get; set; }

        [Required]
        public decimal total_wallet_point { get; set; }

        [Required]
        public decimal total_sales_point { get; set; }

        public decimal customer_total_balance { get; set; }

    }
}
