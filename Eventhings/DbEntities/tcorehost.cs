namespace Eventhings.DbEntities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tcorehost
    {
        public int id { get; set; }

        [Required]
        [StringLength(128)]
        public string full_name { get; set; }

        [StringLength(256)]
        public string description { get; set; }

        [StringLength(128)]
        public string phone { get; set; }

        [StringLength(128)]
        public string email { get; set; }

        [StringLength(256)]
        public string address { get; set; }

        public int deleted { get; set; }

        public int active { get; set; }

        [StringLength(128)]
        public string created_by { get; set; }

        public DateTime? created_at { get; set; }

        [StringLength(128)]
        public string updated_by { get; set; }

        public DateTime? updated_at { get; set; }
    }
}
