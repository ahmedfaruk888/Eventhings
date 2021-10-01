using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Response
{
    public class RoleResponse : BaseResponse
    {
        public int id { get; set; }
        public string name { get; set; }

        public string description { get; set; }

        public int level { get; set; }

        public int active { get; set; }

        public int is_deleted { get; set; }
    }
}