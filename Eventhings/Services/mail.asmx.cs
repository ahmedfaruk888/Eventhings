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

        public void Send(EmailBodyType emailtype, string from, string to, string subject, string body, string host, bool enablessl, string password, int? port = null)
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

        public void SendMailToCustomer(string recipient, string subject, string message)
        {
            #region
            //SmtpClient client = new SmtpClient("smtp.freesmtpservers.com");

            //client.Port = 25;
            //client.DeliveryMethod = SmtpDeliveryMethod.Network;
            //client.UseDefaultCredentials = false;
            //System.Net.NetworkCredential credentials = new System.Net.NetworkCredential(_sender, _password);
            //client.EnableSsl = true;
            //client.Credentials = credentials;

            //try
            //{
            //    var mail = new MailMessage(_sender.Trim(), recipient.Trim());
            //    mail.Subject = subject;
            //    mail.Body = message;
            //    client.Send(mail);
            //}
            //catch (Exception ex)
            //{
            //    //Console.WriteLine(ex.Message);
            //    throw ex;
            //}
            #endregion

            try
            {
                SmtpClient SmtpServer = new SmtpClient("smtp.mailgun.org", 25);
                SmtpServer.DeliveryMethod = SmtpDeliveryMethod.Network;
                MailMessage email = new MailMessage();
                // START
                email.From = new MailAddress("eventiix@sandbox7e6417dfd50646bca69acf4e2ad9b361.mailgun.org");
                email.To.Add(recipient);
                email.CC.Add("eventiix@sandbox7e6417dfd50646bca69acf4e2ad9b361.mailgun.org");
                email.Subject = subject;
                email.Body = message;
                //END
                SmtpServer.Timeout = 5000;
                SmtpServer.EnableSsl = false;
                SmtpServer.UseDefaultCredentials = false;
                SmtpServer.Credentials = new NetworkCredential("eventiix@sandbox7e6417dfd50646bca69acf4e2ad9b361.mailgun.org", "cf62f7bd1dba133df908423c09c22ea8-78651cec-d1ffa8b4");
                SmtpServer.Send(email);
            }
            catch(Exception ex)
            {
                throw ex;
            }
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

        public void SendSES(string to, string subject, string html)
        {
            // Replace sender@example.com with your "From" address. 
            // This address must be verified with Amazon SES.
            //String FROM = "sender@example.com";
            //String FROMNAME = "Sender Name";

            //// Replace recipient@example.com with a "To" address. If your account 
            //// is still in the sandbox, this address must be verified.
            //String TO = "recipient@amazon.com";

            //// Replace smtp_username with your Amazon SES SMTP user name.
            //String SMTP_USERNAME = "smtp_username";

            //// Replace smtp_password with your Amazon SES SMTP password.
            //String SMTP_PASSWORD = "smtp_password";

            //// (Optional) the name of a configuration set to use for this message.
            //// If you comment out this line, you also need to remove or comment out
            //// the "X-SES-CONFIGURATION-SET" header below.
            //String CONFIGSET = "ConfigSet";

            //// If you're using Amazon SES in a region other than US West (Oregon), 
            //// replace email-smtp.us-west-2.amazonaws.com with the Amazon SES SMTP  
            //// endpoint in the appropriate AWS Region.
            //String HOST = "email-smtp.us-west-2.amazonaws.com";

            //// The port you will connect to on the Amazon SES SMTP endpoint. We
            //// are choosing port 587 because we will use STARTTLS to encrypt
            //// the connection.
            //int PORT = 587;

            //// The subject line of the email
            //String SUBJECT =
            //    "Amazon SES test (SMTP interface accessed using C#)";

            //// The body of the email
            //String BODY =
            //    "<h1>Amazon SES Test</h1>" +
            //    "<p>This email was sent through the " +
            //    "<a href='https://aws.amazon.com/ses'>Amazon SES</a> SMTP interface " +
            //    "using the .NET System.Net.Mail library.</p>";

            // Create and build a new MailMessage object
            MailMessage message = new MailMessage();
            message.IsBodyHtml = true;
            message.From = new MailAddress("app.eventiix@gmail.com", "Eventiix Management");
            message.To.Add(new MailAddress(to));
            message.Subject = subject;
            message.Body = html;
            // Comment or delete the next line if you are not using a configuration set
            //message.Headers.Add("X-SES-CONFIGURATION-SET", CONFIGSET);

            using (var client = new System.Net.Mail.SmtpClient("email-smtp.us-east-1.amazonaws.com", 587))
            {
                // Pass SMTP credentials
                client.Credentials =
                    new NetworkCredential("AKIAT7ZRHLRIAHOOLX5W", "BIcO/WqI2fYfETX/F9jRVHH55CNTFJtUFAZATVRdQ+X5");

                // Enable SSL encryption
                client.EnableSsl = false;

                // Try to send the message. Show status in console.
                try
                {
                    //Console.WriteLine("Attempting to send email...");
                    client.Send(message);
                    //Console.WriteLine("Email sent!");
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
    }
}
