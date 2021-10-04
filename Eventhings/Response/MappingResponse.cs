using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Response
{
    public class MappingResponse : BaseResponse
    {
        public int id { get; set; }
        public string item_id { get; set; }

        public int unit_id { get; set; }

        public decimal cost { get; set; }

        public decimal? price { get; set; }

        public decimal? point { get; set; }

        public int active { get; set; }

        public int is_deleted { get; set; }
    }
}