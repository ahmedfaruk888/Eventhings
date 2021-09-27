namespace Eventhings.DbEntities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tcoreevent
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tcoreevent()
        {
            tcoremappedcodes = new HashSet<tcoremappedcode>();
        }

        public int id { get; set; }

        [Required]
        [StringLength(128)]
        public string name { get; set; }

        [StringLength(256)]
        public string description { get; set; }

        [StringLength(256)]
        public string location { get; set; }

        public DateTime? start_date { get; set; }

        public DateTime? end_date { get; set; }

        public int? duration { get; set; }

        public int host_id { get; set; }

        public int active { get; set; }

        public int deleted { get; set; }

        [StringLength(128)]
        public string created_by { get; set; }

        public DateTime? created_at { get; set; }

        [StringLength(128)]
        public string updated_by { get; set; }

        public DateTime? updated_at { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tcoremappedcode> tcoremappedcodes { get; set; }
    }
}
