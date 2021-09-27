namespace Eventhings.DbEntities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tcoreapplicant
    {
        public int id { get; set; }

        public int job_id { get; set; }

        [Required]
        [StringLength(128)]
        public string first_name { get; set; }

        [Required]
        [StringLength(128)]
        public string last_name { get; set; }

        [StringLength(128)]
        public string other_name { get; set; }

        [Required]
        [StringLength(256)]
        public string address { get; set; }

        [Required]
        [StringLength(128)]
        public string phone { get; set; }

        [Required]
        [StringLength(128)]
        public string email { get; set; }

        public string cover_letter { get; set; }

        [StringLength(50)]
        public string cv_ext { get; set; }

        [StringLength(128)]
        public string file_name { get; set; }

        [StringLength(512)]
        public string file_path { get; set; }

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

        public virtual tcorejob tcorejob { get; set; }
    }
}
