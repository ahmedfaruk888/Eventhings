using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Eventhings.Common;

namespace Eventhings.admin
{
    public partial class codelink : System.Web.UI.Page
    {
        private string _codeKey { get; set; } = "code";
        protected void Page_Load(object sender, EventArgs e)
        {
            var codeValue = CommonHelper.GetQrCodeValueRequest(this.Request, _codeKey);

            //check code status = 1 or 0;

            if (!string.IsNullOrWhiteSpace(codeValue))
            {

            }
        }
    }
}