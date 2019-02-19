using Property_cls;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Property
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        
        }

        [System.Web.Services.WebMethod]
        public static string Registeration(string Email, string Name, string PhoneNo)
        {
            cls_Property clsp = new cls_Property();
            var ifExists = clsp.GetUsers(Email);
            if (ifExists.Rows.Count > 0)
            {
                return "Email already exists.";
            }
            clsp.Insert_Users(Name, Email, PhoneNo);
            var user = clsp.GetUsers(Email, PhoneNo);
            HttpContext.Current.Session["UserId"] = user.Rows[0]["UserId"];
            SendMailToAdmin(Name, Email, PhoneNo);
            return "Success";
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string Login(string Email, string PhoneNo)
        {
            cls_Property clsp = new cls_Property();
            var ifExists = clsp.GetUsers(Email, PhoneNo);
            if (ifExists.Rows.Count == 0)
            {
                return "Invalid email or phone number.";
            }
            //Setting a value to session variable
            HttpContext.Current.Session["UserId"] = ifExists.Rows[0]["UserId"];

            return "Success";
        }

        public static void SendMailToAdmin(string Name, string Email, string Phone)
        {
            MailMessage mail = new MailMessage();


            string ToEmailID = ConfigurationManager.AppSettings["ToEmailID"].ToString(); //From Email & To Email are same for admin
            //string ToEmailPassword = ConfigurationManager.AppSettings["ToEmailPassword"].ToString();
            string FromEmailID = ConfigurationManager.AppSettings["RegFromMailAddress"].ToString();
            string FromEmailPassword = ConfigurationManager.AppSettings["RegPassword"].ToString();


            string _Host = ConfigurationManager.AppSettings["SmtpServer"].ToString();
            int _Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"].ToString());
            Boolean _UseDefaultCredentials = false;
            Boolean _EnableSsl = true;

            mail.To.Add(ToEmailID);
            mail.From = new MailAddress(FromEmailID);
            mail.Subject = "New user registered";
            string body = "";
            body = "<p>Person Name : " + Name + "</p>";
            body = body + "<p>Email ID : " + Email + "</p>";
            body = body + "<p>Phone Number : " + Phone + "</p>";

            mail.Body = body;

            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = _Host;
            smtp.Port = _Port;
            smtp.UseDefaultCredentials = _UseDefaultCredentials;
            smtp.Credentials = new System.Net.NetworkCredential
            (FromEmailID, FromEmailPassword);// Enter senders User name and password
            smtp.EnableSsl = _EnableSsl;
            smtp.Send(mail);
        }
    }
}