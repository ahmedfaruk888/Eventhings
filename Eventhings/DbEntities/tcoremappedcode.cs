namespace Eventhings.DbEntities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tcoremappedcode
    {
        public int id { get; set; }

        public int user_id { get; set; }

        public int code_id { get; set; }

        public DateTime? date_mapped { get; set; }

        public int event_id { get; set; }

        public int deleted { get; set; }

        [StringLength(128)]
        public string created_by { get; set; }

        public DateTime? created_at { get; set; }

        [StringLength(128)]
        public string updated_by { get; set; }

        public DateTime? updated_at { get; set; }

        public virtual tcoreevent tcoreevent { get; set; }
    }
}
