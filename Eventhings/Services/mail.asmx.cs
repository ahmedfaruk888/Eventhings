using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
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
        public enum EmailBodyType
        {
            IsHtmlBody = 0,
            IsPlainTextBody = 1
        };

        public void SendEmailWithGmail(string SendMailFrom, string SendMailTo, string SendMailSubject, string SendMailBody)
        {
            //String  = "Sender Email";
            //String  = "Reciever Email";
            //String  = "Email Subject";
            //String  = "Email Body";

            try
            {
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com", 587);
                SmtpServer.DeliveryMethod = SmtpDeliveryMethod.Network;
                MailMessage email = new MailMessage();
                // START
                email.From = new MailAddress(SendMailFrom);
                email.To.Add(SendMailTo);
                email.CC.Add(SendMailFrom);
                email.Subject = SendMailSubject;
                email.Body = SendMailBody;
                //END
                SmtpServer.Timeout = 5000;
                SmtpServer.EnableSsl = true;
                SmtpServer.UseDefaultCredentials = false;
                SmtpServer.Credentials = new NetworkCredential(SendMailFrom, ConfigurationManager.AppSettings["apppassword"]);
                SmtpServer.Send(email);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                Console.ReadKey();
            }
        }

        public static void Send(EmailBodyType emailtype, string from, string to, string subject, string body, string host, bool enablessl, string password, int? port = null)
        {
            //Base class for sending email  
            MailMessage _mailmsg = new MailMessage();

            var deliveryNotif = _mailmsg.DeliveryNotificationOptions;

            //Make TRUE because our body text is html  
            if (emailtype == EmailBodyType.IsHtmlBody)
                _mailmsg.IsBodyHtml = true;
            else
                _mailmsg.IsBodyHtml = false;

            //Set From Email ID  
            _mailmsg.From = new MailAddress(from);

            //Set To Email ID  
            _mailmsg.To.Add(to);

            //Set Subject  
            _mailmsg.Subject = subject;

            //Set Body Text of Email   
            _mailmsg.Body = body;


            //Now set your SMTP   
            SmtpClient _smtp = new SmtpClient();

            //Set HOST server SMTP detail  
            _smtp.Host = host;

            //Set PORT number of SMTP  
            _smtp.Port = port.Value;

            //Set SSL --> True / False  
            _smtp.EnableSsl = enablessl;

            _smtp.UseDefaultCredentials = false;

            //Set Sender UserEmailID, Password  
            NetworkCredential _network = new NetworkCredential(from, password);
            _smtp.Credentials = _network;

            //Send Method will send your MailMessage create above.  
            _smtp.Send(_mailmsg);
        }

        public void SendEmail(string address, string subject, string message, string to = "localhost@localhost.com")
        {
            try
            {
                MailMessage mailMessage = new MailMessage();
                MailAddress fromAddress = new MailAddress(address, "Eventiix Management");
                mailMessage.From = fromAddress;
                mailMessage.To.Add(to);
                mailMessage.Body = message;
                mailMessage.IsBodyHtml = true;
                mailMessage.Subject = subject;
                SmtpClient smtpClient = new SmtpClient();
                smtpClient.Host = "localhost";
                smtpClient.Send(mailMessage);
            }
            catch (Exception)
            {
            }
        }
    }
}
