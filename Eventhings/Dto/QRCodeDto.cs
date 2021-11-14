using Eventhings.DbContexts;
using Eventhings.DbEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Dto
{
    public class QRCodeDto
    {
        public string batch_number { get; set; }
        public string batch_name { get; set; }
        public int code_count { get; set; }
        public int active { get; set; }
        public string encrypted_code { get; set; }
        public int is_deleted { get; set; }
        public string created_by { get; set; }
    }
}