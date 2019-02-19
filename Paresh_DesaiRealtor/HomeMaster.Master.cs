﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using Property_cls;
using System.Data.SqlClient;
using System.Configuration;

namespace Property
{
    public partial class HomeMaster : System.Web.UI.MasterPage
    {
        #region Global
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ToString());
        cls_Property clsobj = new cls_Property();

        #endregion Global
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["FirstName"] = null;
                BindMenusList();
                SiteSetting();
                bindBnanners();
                GetImages();
                GetFeaturedProperties();
                //GetTestimonials();
                DataTable dt = new DataTable();
                try
                {
                    conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString.ToString());
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }
                    string str = "select URL from tblFiles where RunFirst=1";
                    SqlDataAdapter adp = new SqlDataAdapter(str, conn);
                    adp.Fill(dt);
                    //dt.TableName = "tbl_Virtual";
                }
                catch (Exception ex)
                { }
                finally
                {
                    conn.Close();
                    conn.Dispose();
                }
                string videoURL = "";
                if(dt.Rows.Count>0)
                {
                    videoURL = dt.Rows[0]["URL"].ToString();
                }
               
                frame1.Attributes["src"] = videoURL;


            }
        }
        void GetFeaturedProperties()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = clsobj.GetTopNFeturedProperties("4");
                //DataTable Innerdt = new DataTable();
                //foreach (DataRow dr in dt.Rows)
                //{
                //    String ImageUrl = dr["pImage"].ToString();
                //    var uri = new Uri(ImageUrl);
                //    var fileName = Path.GetFileName(uri.AbsolutePath);
                //    var subPath = HttpContext.Current.Server.MapPath("~/IDXResidential");
                //    var path = Path.Combine(subPath, fileName);

                //    FileInfo file = new FileInfo(path);
                //    if (file.Exists)
                //    {
                //        Innerdt.Rows.Add(dr);
                //    }

                //    //bool IsExist = File.Exists(ImageUrl);
                //    //if (File.Exists(Server.MapPath(ImageUrl)))
                //    //{
                //    //    Innerdt.Rows.Add(dr);
                //    //}

                //}

                rptFeaturedProperties.DataSource = dt;

                rptFeaturedProperties.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;

            }
            finally
            {

            }
        }

      
        private void BindMenusList()
        {
            StringBuilder StrMenu = new StringBuilder();
            DataTable dt = new DataTable();
            DataTable dtSubmenu = new DataTable();
            dt = clsobj.GetMenuList();



            if (dt.Rows.Count > 0)
            {
                string PageName = dt.Rows[0]["PageName"].ToString();
                StrMenu.Append("<a class='toggleMenu' href='#'></a>");
                StrMenu.Append("<ul class='nav'>");
                StrMenu.Append("<li class='test' style='background:none;'><a href='../Home.aspx' title='Home'>Home</a></li>");

                //for (int i = 0; i < dt.Rows.Count; i++)
                //{
                //    clsobj.PageID = Convert.ToInt32(dt.Rows[i]["ID"]);
                //    dtSubmenu = clsobj.GetSubMenuBy_PageID();
                //    //check if it has submenu 
                //    if (dtSubmenu.Rows.Count > 0)
                //    {
                //        StrMenu.Append("<li><a href=#>" + dt.Rows[i]["PageName"] + "</a>");//</li>
                //        StrMenu.Append("<ul>");
                //        for (int j = 0; j < dtSubmenu.Rows.Count; j++)
                //        {
                //            StrMenu.Append("<li><a href='../StaticPages.aspx?PageID=" + dtSubmenu.Rows[j]["id"] + "' title='" + dtSubmenu.Rows[j]["PageName"] + "'>" + dtSubmenu.Rows[j]["PageName"] + "</a> </li>");
                //        }
                //        StrMenu.Append("</ul>");
                //        StrMenu.Append("</li>");
                //    }
                //    else
                //    {
                        
                //        StrMenu.Append("<li><a href='../StaticPages.aspx?PageID=" + dt.Rows[i]["id"] + "' title='" + dt.Rows[i]["PageName"] + "'>" + dt.Rows[i]["PageName"] + "</a>");//</li>
                //        // }
                //    }
                //}

                DataTable exclusive_dt = clsobj.GetExclusiveListing();

                StrMenu.Append("<li><a href=#>My Listing</a>");//</li>
                if (exclusive_dt.Rows.Count > 0)
                {
                    StrMenu.Append("<ul >");

                    for (int j = 0; j < exclusive_dt.Rows.Count; j++)
                    {
                        StrMenu.Append("<li><a href='../ExclusiveDetailPage.aspx?Id=" + exclusive_dt.Rows[j]["Id"] + "' title='Home'>" + exclusive_dt.Rows[j]["Title"] + "</a></li>");
                    }
                    StrMenu.Append("</ul>");
                }
               // StrMenu.Append("<li class='menuu' style='background:none;'><a href='Home_worth.aspx' title='Home Evaluation'>Free Home Evaluation</a></li>");
                StrMenu.Append("<li class='test' style='background:none;'><a href='Calculators.aspx' title='Calculators'>Calculators</a></li>");
                StrMenu.Append("<li class='test' style='background:none;'><a href='View_Testimonials.aspx' title='Testimonials'>Testimonials</a></li>");
                StrMenu.Append("<li>");
                StrMenu.Append("<a href='RealEstateNews.aspx' title='Real Estate news'>Real Estate News</a>");
                StrMenu.Append("</li>");
                StrMenu.Append("<li class='test' style='background:none;'><a href='GallaryPage.aspx' title='Gallary'>Our Models</a></li>");
                StrMenu.Append("<li class='test' style='background:none;'><a href='ContactUs.aspx' title='Contact Us'>Contact Us</a></li>");
                StrMenu.Append("</ul>");


            }


            dynamicmenus.Text = StrMenu.ToString();

        }
        public void GetImages()
        {
            Property1.MLSDataWebServiceSoapClient mlsClient = new Property1.MLSDataWebServiceSoapClient();
           

            DataTable dt = clsobj.GetDreamHouseList_Home("Family_home");
          
                rptImages.DataSource = dt;
                rptImages.DataBind();
          
            mlsClient = null;
        }
        protected void addre_submit_Click(object sender, EventArgs e)
        {
            string s = search.Value;
            Response.Redirect("~/Review_home_worth.aspx?address=" + search.Value, false);
        }
        protected void SiteSetting()
        {
            try
            {
                DataTable dt = clsobj.GetSiteSettings();
                DataTable dt1 = clsobj.GetUserInfo();
                if (dt.Rows.Count > 0)
                {
                    //lblemailid.Text = Convert.ToString(dt.Rows[0]["Email"]);
                    siteTitle.Text = Convert.ToString(dt.Rows[0]["Title"]);
                    //lblemail.Text = Convert.ToString(dt.Rows[0]["Email"]);

                    //lblmobile.Text = Convert.ToString(dt.Rows[0]["Mobile"]);
                    //lblfax.Text = Convert.ToString(dt.Rows[0]["Fax"]);
                    //lblemail.Text = Convert.ToString(dt.Rows[0]["Email"]);
                    if (dt1.Rows.Count > 0)
                    {
                       // lblBrkrOneName.Text = Convert.ToString(dt1.Rows[0]["FirstName"]) + " " + Convert.ToString(dt1.Rows[0]["LastName"]);
                    }
                  
                    byte[] favimage = (byte[])dt.Rows[0]["Favicon.ico"];
                    if (favimage.Length > 0)
                    {
                        Session["MyFavicon"] = favimage;
                        favicon.Visible = true;
                        favicon.Href = "~/ShowFavicon.aspx";
                    }
                    else
                    {
                        favicon.Visible = false;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void bindBnanners()
        {
            StringBuilder html = new StringBuilder();
            DataTable dt = clsobj.GetAllBanner();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string Images;
                Images = "/admin/uploadfiles/" + dt.Rows[i]["FileName"].ToString();
                if (Images != "")
                {
                    html.AppendLine("<img src='" + Images + "'  data-thumb='" + Images + "'  alt='banner" + i + "' />");
                }
            }
            ltrImgsf.Text = html.ToString();
        }
    }
}