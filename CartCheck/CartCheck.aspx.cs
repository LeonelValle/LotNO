using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CartCheck
{
    public partial class CartCheck : System.Web.UI.Page
    {
        Conexion con = new Conexion();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                gw_ListLoc.Visible = false;
                gw_Control.Visible = false;
                Label2.Visible = false;
                Label3.Visible = false;
                btn_Report.Visible = false;

            }

        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {

            gw_Control.DataSource = con.LlenarDG("select * from MEI_LOC_CTL where location = '" + txt_CartLocation.Text.Trim() + "' and wo_no = '" + txt_WO.Text + "'").Tables[0];
            gw_Control.DataBind();


            if (gw_Control.Rows.Count > 0)
            {

                gw_ListLoc.DataSource = con.LlenarDG("select * from OPENQUERY(ME_TRAIN,'Select IPL.Location, IPL.Item_Nbr, IM.Description, IPL.Oh_Qty_By_Loc FROM Administrators.DC_IPL_INVN_DTL IPL LEFT JOIN Administrators.DC_ITEM_MASTER IM ON IM.ID = IPL.ID WHERE IPL.Location = ''" + txt_CartLocation.Text.Trim() + "''')").Tables[0];
                gw_ListLoc.DataBind();

                gw_Control.Visible = true;


                //string script = "alert(\"Hello!\");";
                //ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", script, true);


                if (gw_ListLoc.Rows.Count == 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "alert(\"Cart is empty for WO: " + txt_WO.Text + "!\");", true);

                    if (HiddenField1.Value == "1")
                    {
                        //this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You clicked YES!')", true);
                        con.Crud("update MEI_LOC_CTL set wo_no = NULL where location = '" + txt_CartLocation.Text.Trim() + "' and wo_no = '" + txt_WO.Text + "'");

                    }
                    

                    Label2.Visible = true;
                    gw_ListLoc.Visible = true;

                }
                else
                {
                    Label2.Visible = true;
                    gw_ListLoc.Visible = true;

                    gw_Control.Visible = false;
                    Label3.Visible = false;
                    btn_Report.Visible = true;

                    ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "alert(\"Actual items in cart location\");", true);

                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerControlScript", "alert(\"Cart location not valid!\");", true);

            }


        }

        protected void ExportToExcel()
        {
            // Clear all content output from the buffer stream
            Response.ClearContent();
            // Specify the default file name using "content-disposition" RESPONSE header
            Response.ContentType = "application/ms-excel";
            //Response.AppendHeader("content-disposition", "attachment; filename=" + txt_CartLocation.Text.Trim() + ".xls");
            var cd = new System.Net.Mime.ContentDisposition
            {
                FileName = txt_CartLocation.Text.Trim() + ".xls",
                Inline = false,
            };
            Response.Clear();
            Response.AppendHeader("Content-Disposition", cd.ToString());
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

            // Set excel as the HTTP MIME type
            // Create an instance of stringWriter for writing information to a string
            System.IO.StringWriter stringWriter = new System.IO.StringWriter();
            // Create an instance of HtmlTextWriter class for writing markup 
            // characters and text to an ASP.NET server control output stream
            HtmlTextWriter htw = new HtmlTextWriter(stringWriter);

            // Set white color as the background color for gridview header row
            gw_ListLoc.HeaderRow.Style.Add("background-color", "#FFFFFF");

            // Set background color of each cell of GridView1 header row
            foreach (TableCell tableCell in gw_ListLoc.HeaderRow.Cells)
            {
                tableCell.Style["background-color"] = "#11BB0F";
            }

            // Set background color of each cell of each data row of GridView1
            foreach (GridViewRow gridViewRow in gw_ListLoc.Rows)
            {
                gridViewRow.BackColor = System.Drawing.Color.White;
                foreach (TableCell gridViewRowTableCell in gridViewRow.Cells)
                {
                    gridViewRowTableCell.Style["background-color"] = "#FFF7E7";
                }
            }

            gw_ListLoc.RenderControl(htw);
            Response.Write(stringWriter.ToString());
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            Response.Flush();

            Response.End();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            return;
        }

        protected void btn_Report_Click(object sender, EventArgs e)
        {
            ExportToExcel();
            gw_ListLoc.Visible = true;
            Label2.Visible = true;

        }

        public void OnConfirm(object sender, EventArgs e)
        {
            string confirmValue = Request.Form["confirm_value"];

            if (confirmValue == "Yes")
            {
                //this.lblDisplayMessage.Text = "Added to order!";
                //this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You clicked YES!')", true);
                con.Crud("update MEI_LOC_CTL set wo_no = NULL where location = '" + txt_CartLocation.Text.Trim() + "' and wo_no = '" + txt_WO.Text + "'");

            }
            else
            {
                //this.lblDisplayMessage.Text = "Not added to order!";
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You clicked NO!')", true);
            }
        }
    }
}