namespace Eventhings.DbEntities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tcoreuser
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tcoreuser()
        {
            tcoreuserroles = new HashSet<tcoreuserrole>();
        }

        public int id { get; set; }

        [Required]
        [StringLength(128)]
        public string user_code { get; set; }

        [Required]
        [StringLength(128)]
        public string email { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? email_confirmed { get; set; }

        [StringLength(512)]
        public string password_hash { get; set; }

        public int require_password_change { get; set; }

        [Required]
        [StringLength(128)]
        public string phone_number { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? phone_number_confirmed { get; set; }

        public int two_factor_enabled { get; set; }

        [Required]
        [StringLength(128)]
        public string first_name { get; set; }

        [Required]
        [StringLength(128)]
        public string last_name { get; set; }

        [StringLength(128)]
        public string other_name { get; set; }

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

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tcoreuserrole> tcoreuserroles { get; set; }
    }
}
