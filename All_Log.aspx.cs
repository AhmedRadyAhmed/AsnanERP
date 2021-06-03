using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class All_Log : System.Web.UI.Page
{
    MyAdo mycl = new MyAdo();

    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
           server control at run time. */
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["TbLog"] != null)
        {

            string sl = Session["TbLog"].ToString();
            SqlDataSource1.SelectCommand = sl;
            Grid.DataBind();
            LblCount.Text = Request.QueryString["ms"];

        }

        if (Grid.Rows.Count == 0)
        {
            Panel1.Visible = false;

            lblerror.Text = "No Data";
            lblerror.Visible = true;
            return;
        }
    }


    protected void BtnExport_Click(object sender, EventArgs e)
    {


        Response.Clear();
        Response.AddHeader("content-disposition", "attachment;filename=" + Page.Title + ".xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.xls";
        StringWriter StringWriter = new System.IO.StringWriter();
        HtmlTextWriter HtmlTextWriter = new HtmlTextWriter(StringWriter);

        Grid.RenderControl(HtmlTextWriter);
        Response.Write(StringWriter.ToString());
        Response.End();
    }

    protected void Grid_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        for (int i = 0; i < Grid.Columns.Count; i++)
        {

            Grid.Columns[i].ItemStyle.Width = 300;
            Grid.Columns[i].ItemStyle.Wrap = false;

        }
    }





    protected void Grid_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}