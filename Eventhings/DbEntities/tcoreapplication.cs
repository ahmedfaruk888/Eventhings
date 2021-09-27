namespace Eventhings.DbEntities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("tcoreapplication")]
    public partial class tcoreapplication
    {
        public int Id { get; set; }

        [Required]
        [StringLength(256)]
        public string name { get; set; }

        [StringLength(256)]
        public string description { get; set; }

        [StringLength(256)]
        public string urltest { get; set; }

        [StringLength(256)]
        public string urllive { get; set; }

        public int active { get; set; }

        public int is_deleted { get; set; }

        [StringLength(128)]
        public string createdby { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? created_at { get; set; }

        [StringLength(128)]
        public string updated_by { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? updated_at { get; set; }
    }
}
