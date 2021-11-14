using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Dto
{
    public class MailDto
    {
        public string from { get; set; }
        public string from_display_name { get; set; }
        public string to { get; set; }
        public string to_display_name { get; set; }
        public string subject { get; set; }
        public string body { get; set; }
        public string html_body { get; set; }
    }
}