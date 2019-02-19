using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Net;
using Property_cls;
using Property_Cryptography;

namespace Property
{
    public partial class ScheduleAppointment : System.Web.UI.Page
    {

        #region Global

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());

        #endregion Global

        protected void Page_Load(object sender, EventArgs e)
        {
            CalendarExtender1.StartDate = DateTime.Now;

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_AddScheduleAppointment";
                cmd.Connection = conn;

                cmd.Parameters.AddWithValue("@ID", 0);
                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNo.Text);
                cmd.Parameters.AddWithValue("@AppointmentDate", txtAppointmentDate.Text);
                cmd.Parameters.AddWithValue("@AppointmentTime", ddlAppointmentTime.SelectedValue);
                cmd.Parameters.AddWithValue("@Notes", txtNotes.Text);

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                cmd.ExecuteNonQuery();

                string email = ConfigurationManager.AppSettings["RegFromMailAddress"];
                //string toemail = ConfigurationManager.AppSettings["MailToAddress"];
                string property_url = HttpContext.Current.Request.Url.AbsoluteUri;
                property_url = property_url.Replace("ScheduleAppointment", "PropertyDetails");
                SendMailToAdmin(email, property_url);
                MailMessage message = new MailMessage();
                message.To.Add(txtEmail.Text);
                message.From = new MailAddress(ConfigurationManager.AppSettings["RegFromMailAddress"]);
                message.Subject = "Your Appointment  has been saved";
                message.Body = "Name:" + txtFirstName.Text + "<br/>" + "Your Appointment  has been saved on " + txtAppointmentDate.Text + "  " + ddlAppointmentTime.SelectedValue + "";
                message.IsBodyHtml = true;
                SmtpClient smtpClient = new SmtpClient(ConfigurationManager.AppSettings["SmtpServer"]);
                smtpClient.Port = Int32.Parse(ConfigurationManager.AppSettings["Port"]);
                smtpClient.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["RegFromMailAddress"], ConfigurationManager.AppSettings["RegPassword"]);
                smtpClient.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
                smtpClient.Send(message);
                clearform();
                //dvshw.Style["display"] = "show";
                //lblmessage.Text = "Thanks For Sending Message!";
                conn.Close();
                if ((Session["FeatureType"]) != null)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ScriptKey", "alert('Your Appointment  has been saved');window.location='featureListing.aspx'; ", true);
                    //   Response.Redirect("~/featureListing.aspx", false);

                }
                else if (Session["Municipality"] != null)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "click", "alert('Your Appointment  has been saved');window.location.href ='Search.aspx?Municipality=" + Convert.ToString(Session["Municipality"]) + "'", true);
                    //  string targeturl=  "~/Search.aspx?Municipality=" + Convert.ToString(Session["Municipality"]);
                }
                else if (Session["Type1"] != null)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "click", "alert('Your Appointment  has been saved..');window.location.href ='PropertyDetails.aspx?MLSID=" + Convert.ToString(Session["MLSID"]) + "&PropertyType=" + Convert.ToString(Session["Type1"]) + "'", true);
                    //     Response.Redirect("PropertyDetails.aspx?MLSID=" + Convert.ToString(Session["MLSID"]) + "&PropertyType=" + Convert.ToString(Session["Type1"]), false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ScriptKey", "alert('Your Appointment  has been saved');window.location=" + property_url + "'ScheduleAppointment.aspx'; ", true);

                    // ScriptManager.RegisterStartupScript(this, this.GetType(), "ScriptKey", "alert('Your Appointment  has been saved');window.location='ScheduleAppointment.aspx'; ", true);
                    //   Response.Redirect("~/Search.aspx", false);
                }
            }
            catch (Exception ex)
            {
                lblmsg.Text = "An error occurred!!Try again";
                // ErrorMessege.Text = "An error occurred!!";
            }
        }
        public void SendMailToAdmin(string UserEmailId, string property_url)
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
            mail.Subject = "Appointment";
            string body = "";
            body = "Name:" + txtFirstName.Text + "<br/>" + "Appointment  has been saved on " + txtAppointmentDate.Text + "  " + ddlAppointmentTime.SelectedValue + "";

            body = body + "<p>Property link : " + property_url + "</p>";
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
        private void clearform()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtPhoneNo.Text = "";
            txtAppointmentDate.Text = "";
            ddlAppointmentTime.Text = "";
            txtNotes.Text = "";
        }

    }
}