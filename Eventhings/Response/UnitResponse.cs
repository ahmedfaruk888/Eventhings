using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Response
{
    public class UnitResponse : BaseResponse
    {
        public int id { get; set; }
        public string name { get; set; }
        public int active { get; set; }
    }
}