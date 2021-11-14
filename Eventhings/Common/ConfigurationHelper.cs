using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace Eventhings.Common
{
    public static class ConfigurationHelper
    {
        public static string GetConfiSection(string sectionname)
        {
            if (!string.IsNullOrEmpty(sectionname))
            {
                return ConfigurationManager.AppSettings["qr-scan-base-url"].ToString();
            }
            else
            {
                return string.Empty;
            }
        }

        public static string GetBaseUrlConfiSection()
        {
            var x = ConfigurationManager.AppSettings["qr-scan-base-url"].ToString();
            if (!string.IsNullOrEmpty(x))
            {
                return x;
            }
            else
            {
                return string.Empty;
            }
        }
    }
}