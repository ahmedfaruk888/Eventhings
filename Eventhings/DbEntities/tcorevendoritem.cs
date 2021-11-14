namespace Eventhings.DbEntities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tcorevendoritem
    {
        public int id { get; set; }

        public int vendor_id { get; set; }

        public int item_id { get; set; }

        public int active { get; set; }

        public int is_deleted { get; set; }

        [StringLength(128)]
        public string created_by { get; set; }

        public DateTime? created_date { get; set; }

        [MaxLength(128)]
        public byte[] updated_by { get; set; }

        public DateTime? updated_date { get; set; }
    }
}
