using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ROI_LotNo
{
    public partial class LotNo : System.Web.UI.Page
    {
        Conexion conexion = new Conexion();


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Search_Click(object sender, EventArgs e)
        {
            grdContent.DataSource = conexion.LlenarDG("select * from LOT_MASTER where item_no    = '" + txt_LotNo.Text + "'").Tables[0];
            grdContent.DataBind();
        }

        protected void btn_Cancel_Click(object sender, EventArgs e)
        {
            txt_LotNo.Text = "";
            grdContent.DataSource = null;
            grdContent.DataBind();
            
        }
    }
}