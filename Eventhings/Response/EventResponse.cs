using Eventhings.DbEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Response
{
    public class EventResponse : BaseResponse
    {
        public tcoreevent eventt { get; set; }
        public List<tcoreevent> events { get; set; }
        public int total_count { get; set; }
    }
}