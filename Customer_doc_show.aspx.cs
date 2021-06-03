using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer_doc_show : System.Web.UI.Page
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

        if (Session["Customer_doc"] != null)
        {

            string sl = Session["Customer_doc"].ToString();
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
        mycl.Execute("Delete from Customer_Documents where Serial=" + x);
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
    
    protected void Grid_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Grid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        HyperLink lnk1 = new HyperLink();
        lnk1.Text = "Open";

        lnk1.Target = "_blank";
        lnk1.NavigateUrl = "Customer Files/" + e.Row.Cells[8].Text;
        e.Row.Cells[0].Controls.Add(lnk1);  
    }
}