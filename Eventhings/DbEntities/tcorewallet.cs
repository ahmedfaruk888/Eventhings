namespace Eventhings.DbEntities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tcorewallet
    {
        public int id { get; set; }

        [Required]
        [StringLength(256)]
        public string user_id { get; set; }
        public int? cr_type { get; set; } = 1; //either 1 or 2 (1 == initial code link & 2 = top-up)

        public decimal point { get; set; }

        [StringLength(256)]
        public string payment_channel { get; set; }

        public decimal? prev_balance { get; set; }

        public decimal? amount_paid { get; set; }

        public decimal? current_balance { get; set; }

        public int active { get; set; }

        public int is_deleted { get; set; }

        [StringLength(256)]
        public string created_by { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? created_at { get; set; }

        [StringLength(256)]
        public string updated_by { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? updated_at { get; set; }
    }
}
