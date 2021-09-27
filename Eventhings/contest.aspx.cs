using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Eventhings.DbContexts;

namespace Eventhings
{
    public partial class contest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                using (var _context = new EventhingsDbContext())
                {
                    _context.Database.Connection.Open();
                    Response.Write($"the connection string : {_context.Database.Connection.ConnectionString} & is = {_context.Database.Connection.State.ToString()}");



                }
            }
            catch(Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
    }
}