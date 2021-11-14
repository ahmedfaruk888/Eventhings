namespace Eventhings.DbEntities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tcoreitem
    {
        public int id { get; set; }

        [Required]
        [StringLength(128)]
        public string name { get; set; }

        [StringLength(512)]
        public string description { get; set; }

        public decimal cost { get; set; }

        public decimal? price { get; set; }

        [Required]
        [StringLength(128)]
        public string category { get; set; }

        public int quantity { get; set; }

        public decimal? point { get; set; }

        public int active { get; set; }

        public int is_deleted { get; set; }

        [StringLength(128)]
        public string created_by { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? created_at { get; set; }

        [StringLength(128)]
        public string updated_by { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? updated_at { get; set; }
    }
}
