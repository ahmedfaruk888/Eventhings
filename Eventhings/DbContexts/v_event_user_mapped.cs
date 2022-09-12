//namespace Eventhings.DbContexts
//{
//    using System;
//    using System.Collections.Generic;
//    using System.ComponentModel.DataAnnotations;
//    using System.ComponentModel.DataAnnotations.Schema;
//    using System.Data.Entity.Spatial;

//    public partial class v_event_user_mapped
//    {
//        [Key]
//        [Column(Order = 0)]
//        [DatabaseGenerated(DatabaseGeneratedOption.None)]
//        public int id { get; set; }

//        [Key]
//        [Column(Order = 1)]
//        public string first_name { get; set; }

//        [Key]
//        [Column(Order = 2)]
//        public string last_name { get; set; }

//        [StringLength(128)]
//        public string phone_number { get; set; }

//        [StringLength(128)]
//        public string email { get; set; }

//        public int? event_id { get; set; }

//        [StringLength(128)]
//        public string name { get; set; }

//        public decimal? gate_fee { get; set; }

//        public int? is_live { get; set; }

//        public int? active { get; set; }

//        public int? code_id { get; set; }

//        [StringLength(128)]
//        public string batch_number { get; set; }

//        [StringLength(128)]
//        public string batch_name { get; set; }

//        [StringLength(128)]
//        public string code { get; set; }

//        [StringLength(128)]
//        public string encrypted_code { get; set; }
//    }
//}
