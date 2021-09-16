using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Response
{
    public class ResponseMessage
    {
        public int Status { get; set; }
        public object Message { get; set; }
    }
}