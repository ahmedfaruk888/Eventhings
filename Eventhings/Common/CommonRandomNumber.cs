using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Eventhings.Common
{
    public class CommonRandomNumber
    {
        public static Dictionary<int, string> GetRandomGuid(int value)
        {
            Dictionary<int, string> million = new Dictionary<int, string>();

            for (int i = 0; i < value; i++)
            {
                Guid h = Guid.NewGuid();
                million.Add(i, h.ToString());
            }

            return million;
        }
    }
}