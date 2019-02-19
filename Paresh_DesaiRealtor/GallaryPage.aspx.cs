using Property_cls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Property
{
    public partial class GallaryPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillGridData();


        }
        protected void FillGridData()
        {
            cls_Property clsobj = new cls_Property();
            DataTable dt = new DataTable();
            dt = clsobj.GetGallary();
            //          DataTable dt = mlsClient.GetAllFeatures();
           

            if (dt.Rows.Count > 0)
            {
                rptGallary.DataSource = dt;
                rptGallary.DataBind();
            }
        }
            }
}