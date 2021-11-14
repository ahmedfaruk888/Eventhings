using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Services;
using Eventhings.Common;
using Eventhings.Dto;
using Eventhings.Response;
using SendGrid;
using SendGrid.Helpers.Mail;

namespace Eventhings.Services
{
    /// <summary>
    /// Summary description for mail
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class mail : System.Web.Services.WebService
    {

        [WebMethod]
        public async Task<string> SendInvoiceAsync(MailDto mail)
        {
            var response = new MailResponse();
            try
            {

                var apiKey = "SG.uTctO3DRSXS0QE2Hjt187g.kGktuYQL3vuB8SRYqlvLESv6cLF2Z30YfcGuX8r6udA";//Environment.GetEnvironmentVariable("NAME_OF_THE_ENVIRONMENT_VARIABLE_FOR_YOUR_SENDGRID_KEY");
                var client = new SendGridClient(apiKey);
                var from = new EmailAddress(mail.from, mail.from_display_name);
                var subject = mail.subject;
                var to = new EmailAddress(mail.to, mail.to_display_name);
                var plainTextContent = mail.body;
                var htmlContent = mail.html_body;
                var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
                response.Message = await client.SendEmailAsync(msg);

            }
            catch(Exception ex)
            {
                response.Status = 0;
                response.Message = "Internal server error";
            }
            return "Hello World";
        }
    }
}
