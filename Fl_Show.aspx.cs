using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Fl_Show : System.Web.UI.Page
{
    MyAdo mycl = new MyAdo();
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
           server control at run time. */
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        mycl.Begin();

        if (Session["AlFl"] != null)
        {

            string sl = Session["AlFl"].ToString();
            SqlDataSource1.SelectCommand = sl;
            Grid.DataBind();
            lblerror.Text = Grid.Rows.Count.ToString();

        }

        if (Grid.Rows.Count == 0)
        {
            

            lblerror.Text = "No Data";
          
            return;
        }
    }
    protected void BtnDeleteGrid_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton b = (ImageButton)sender;
        GridViewRow r = (GridViewRow)b.NamingContainer;
        int x = int.Parse(r.Cells[0].Text);
        mycl.Execute("Delete from Fltb where Serial=" + x);
        Grid.DataBind();
        lblerror.Text = Grid.Rows.Count.ToString();
    }

    protected void BtnEdit_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void BtExportExcel_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.AddHeader("content-disposition", "attachment;filename=Employees.xls");
        // Response.ContentEncoding = Encoding.GetEncoding("utf-8");
        Response.Write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
        Response.Charset = "utf-8";
        Response.ContentType = "application/vnd.xls";
        StringWriter StringWriter = new System.IO.StringWriter();
        HtmlTextWriter HtmlTextWriter = new HtmlTextWriter(StringWriter);

        Grid.RenderControl(HtmlTextWriter);
        Response.Write(StringWriter.ToString());
        Response.End();
    }
    protected void backButton_Click(object sender, EventArgs e)
    {

    }
}