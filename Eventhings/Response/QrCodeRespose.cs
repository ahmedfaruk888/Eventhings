﻿using Eventhings.DbEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Response
{
    public class QrCodeRespose : BaseResponse
    {
        public tcorecodestore qr_code { get; set; }
        public List<tcorecodestore> qr_codes { get; set; }
        public int total_code_count { get; set; }
    }
}