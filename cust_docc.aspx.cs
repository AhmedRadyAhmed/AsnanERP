using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cust_doc : System.Web.UI.Page
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
    }

    protected void BtnPdf_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton b = (ImageButton)sender;
        GridViewRow r = (GridViewRow)b.NamingContainer;
        string fname = mycl.Exec_scalar("select MyFil_name from Customer_Documents where Serial=" + r.Cells[0].Text);

        Response.Redirect("~/Customer Files/" + fname);
    }
    protected void BtnSavePdf_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton b = (ImageButton)sender;
        GridViewRow r = (GridViewRow)b.NamingContainer;
        string fname = mycl.Exec_scalar("select MyFil_name from Customer_Documents where Serial=" + r.Cells[0].Text);

        Response.ClearContent();
        Response.ClearHeaders();

        Response.ContentType = "application/octet-stream";

        Response.AddHeader("Content-Disposition", "attachment; filename=" + fname);
        Response.WriteFile(Server.MapPath("~/Customer Files/" + fname));
        Response.Flush();
        Response.Close();
    }
    protected void BtnDeleteGrid_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton b = (ImageButton)sender;
        GridViewRow r = (GridViewRow)b.NamingContainer;
        try
        {
            mycl.BeginTran();

            int x = int.Parse(r.Cells[0].Text);
            mycl.Execute("Delete from Customer_Documents where Serial=" + x);
            string sl = mycl.InsertTbLog("Customer File Delete", "Delete", "Customer_Documents", "Customer_documents.aspx", x.ToString());
            mycl.Execute(sl);
            mycl.mytrancommit();
            Grid_Cust_docs.DataBind();

        }
        catch (Exception)
        {
            mycl.mytrayrollback();
        }
    }
    protected void Grid_Cust_docs_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string FilePath = Server.MapPath("~/Customer Files/soha.pdf");
        WebClient User = new WebClient();
        Byte[] FileBuffer = User.DownloadData(FilePath);
        if (FileBuffer != null)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-length", FileBuffer.Length.ToString());
            Response.BinaryWrite(FileBuffer);
        }
       
    }
    protected void Grid_Cust_docs_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       if(e.Row.RowType == DataControlRowType.DataRow )
        {
            HyperLink lnk = new HyperLink();
            lnk.Text = "مشاهدة";
            lnk.NavigateUrl = "~/Customer Files/" +  e.Row.Cells[7].Text ;
            e.Row.Cells[13].Controls.Add(lnk);
        
        }
           
    }
}