using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Data;
using Property;
using Property_cls;

namespace Property.Admin
{
    public partial class Gallary : System.Web.UI.Page
    {
        #region Global
        cls_Property clsobj = new cls_Property();
        #endregion Global

        #region Page Load

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["FirstName"] != null)
            //{
            if (!IsPostBack)
            {
                FillGridData();
            }
            //}
            //else
            //{
            //    Response.Redirect("~/Admin/AdminLogin.aspx", false);
            //}
        }

        #endregion Page Load

        #region PageListGrid Events & Method

        protected void FillGridData()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = clsobj.GetGallary();
                grdBannerShow.DataSource = dt;
                grdBannerShow.DataBind();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }




        protected void GrdBlogList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = 0;
            if (e.CommandName == "Deleterec")
            {
                id = Convert.ToInt32(e.CommandArgument);
                int result = clsobj.DeleteGallary(id);
                FillGridData();
            }
            else if (e.CommandName == "Editrec")
            {
                id = Convert.ToInt32(e.CommandArgument);
                DataTable dt = new DataTable();
                dt = clsobj.GetGallaryByID(id);
                txtName.Text = dt.Rows[0]["Title"].ToString();
                hdnImg.Value = dt.Rows[0]["ImageUrl"].ToString();
                imgbanner.ImageUrl = "/admin/Gallary/" + dt.Rows[0]["ImageUrl"].ToString();
                //ImgLogo.ImageUrl= "/admin/logo/" + dt.Rows[0]["Logo"].ToString();
              
                imgbanner.Visible = true;
               // ImgLogo.Visible = true;
                FillGridData();
            }
            else
            {
                FillGridData();
            }
        }





        #endregion PageListGrid Events & Method

        #region Button Click

        protected void btnUploadImage_Click(object sender, EventArgs e)
        {
            try
            {


                //HttpFileCollection fileCollection = Request.Files;
                //HttpPostedFile uploadfileSingle = fileCollection[0];
                //string fileNameForFirstImage = Path.GetFileName(uploadfileSingle.FileName);
               
                string fileNameForFirstImage = "";
                if (updBannerImage.HasFiles)
                {
                    foreach (var item in updBannerImage.PostedFiles)
                    {
                         fileNameForFirstImage = Path.GetFileName(item.FileName);
                        string fileName = Path.GetFileName(item.FileName);
                        item.SaveAs(Server.MapPath("Gallary") + "\\" + fileName);
                        break;
                    }


                }
                int DreamHouseId = clsobj.InsertGallary(txtName.Text, fileNameForFirstImage);
              
                
                FillGridData();
                txtName.Text = "";
                
                imgbanner.Visible = false;
               
            }
            catch (Exception ex)
            {
                //ErrorLogging.WriteLog(ex.ToString());
            }

        }

        #endregion Button Click

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            
            txtName.Text = "";
           
            imgbanner.Visible = false;
           
        }
    }
}