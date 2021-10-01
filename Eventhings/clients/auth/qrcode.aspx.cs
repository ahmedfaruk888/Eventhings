using Eventhings.DbContexts;
using Eventhings.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eventhings.clients.auth
{
    public partial class qrcode : System.Web.UI.Page
    {
        //protected void Page_Load(object sender, EventArgs e)
        //{

        //}

        public IQueryable<QrCodeRespose> BindBatchName()
        {
            return new EventhingsDbContext().tcorecodestores.Where(x => x.batch_name != null).Select(x => new QrCodeRespose() { id = x.id, batch_name = x.batch_name }).Distinct();
        }

        public IQueryable BindBatchNumber()
        {
            return new EventhingsDbContext().tcorecodestores.Distinct().Where(x => x.batch_number != null).Select(x => x.batch_name).Distinct();
        }

        protected void btnSubmit_ServerClick(object sender, EventArgs e)
        {
            
        }
    }
}