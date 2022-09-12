namespace Eventhings.DbContexts
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tcorebasesetting
    {
        public int id { get; set; }

        [Required]
        [StringLength(128)]
        public string name { get; set; }

        [StringLength(512)]
        public string description { get; set; }

        public int value { get; set; }

        public int active { get; set; }

        [StringLength(128)]
        public string created_by { get; set; }

        public DateTime? created_at { get; set; }

        [StringLength(128)]
        public string updated_by { get; set; }

        public DateTime? updated_at { get; set; }
    }
}
