using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Response
{
    public abstract class BaseResponse
    {
        public int Status { get; set; }
        public object Message { get; set; }

        public string created_by { get; set; }

        public DateTime? created_at { get; set; }

        public string updated_by { get; set; }
        public DateTime? updated_at { get; set; }
    }
}