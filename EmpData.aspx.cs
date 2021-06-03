
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;
using AjaxControlToolkit;

public partial class EmpData : System.Web.UI.Page
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

        if (Session["All_Emp"] != null)
        {
            string sl = Session["All_Emp"].ToString();
            SqlDataSource1.SelectCommand = sl;
            Grid.DataBind();
            LblCount.Text = Grid.Rows.Count.ToString();
        }
        if (IsPostBack == false)
        {
            for (int i = 0; i < Grid.Columns.Count; i++)
            {
                ListCols.Items.Add(Grid.Columns[i].HeaderText);
                ListCols.Items[i].Selected = true;
            }
           

            if (Grid.Rows.Count == 0)
            {
                lblerror.Text = "No Data";
                lblerror.Visible = true;
                return;
            }
        }
       
    }

   protected void Grid_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        HyperLink lnk1 = new HyperLink();
        lnk1.Text = e.Row.Cells[0].Text;
      

        lnk1.Target = "_blank";
        lnk1.NavigateUrl = "Emp.aspx?EmpCode=" + e.Row.Cells[0].Text;
        e.Row.Cells[0].Controls.Add(lnk1);

        for (int i = 0; i < Grid.Columns.Count; i++)
        {
            Grid.Columns[i].ItemStyle.Width = 300;
            Grid.Columns[i].ItemStyle.Wrap = false;
        }
    }


    protected void Grid_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    
   
    protected void BtnDeleteGrid_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton b = (ImageButton)sender;
        GridViewRow r = (GridViewRow)b.NamingContainer;
        try
        {
            mycl.BeginTran();

            int x = int.Parse(r.Cells[0].Text);
            mycl.Execute("Delete from PO_Documents where Serial=" + x);
            string sl = mycl.InsertTbLog("PO File Delete", "Delete", "PO_Documents", "PO_documents.aspx", x.ToString());
            mycl.Execute(sl);
            mycl.mytrancommit();
            Grid.DataBind();
            LblCount.Text = Grid.Rows.Count.ToString();
        }
        catch (Exception)
        {
            mycl.mytrayrollback();
        }
    }
    protected void BtnPdf_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton b = (ImageButton)sender;
        GridViewRow r = (GridViewRow)b.NamingContainer;
        string fname = mycl.Exec_scalar("select MyFil_name from PO_Documents where Serial=" + r.Cells[0].Text);


        System.Text.StringBuilder cstext2 = new System.Text.StringBuilder();
        cstext2.Append("<script language=\"javascript\">");
        cstext2.Append("window.open('" + "PO_Files/" + fname + "','_newtab')");
        cstext2.Append("</script>");
        ClientScript.RegisterStartupScript(GetType(), "Asnan", cstext2.ToString());

    }


    protected void BtnSavePdf_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton b = (ImageButton)sender;
        GridViewRow r = (GridViewRow)b.NamingContainer;
        string fname = mycl.Exec_scalar("select MyFil_name from PO_Documents where Serial=" + r.Cells[0].Text);

        Response.ClearContent();
        Response.ClearHeaders();
       
        Response.ContentType = "application/octet-stream";
       
        Response.AddHeader("Content-Disposition", "attachment; filename=" + fname );
        Response.WriteFile(Server.MapPath("~/PO_Files/" + fname));
        Response.Flush();
        Response.Close();

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
    
    protected void BtnRef_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < ListCols.Items.Count; i++)
        {
            if (ListCols.Items[i].Selected == true)
                Grid.Columns[i].Visible = true;
            else
                Grid.Columns[i].Visible = false;
        }
    }
    protected void Chk_all_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i < ListCols.Items.Count; i++)
        {
            ListCols.Items[i].Selected = Chk_all.Checked;
        }
    }
}