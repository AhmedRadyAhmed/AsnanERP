
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;
using AjaxControlToolkit;

public partial class Al_PO_Documents : System.Web.UI.Page
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
        if (Session["Al_PO_Documents"] != null)
        {

            string sl = Session["Al_PO_Documents"].ToString();
            SqlDataSource1.SelectCommand = sl;
            Grid.DataBind();
            LblCount.Text = Grid.Rows.Count.ToString();

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

    protected void Grid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
       
        for (int i = 0; i < Grid.Columns.Count; i++)
        {
            Grid.Columns[i].ItemStyle.Width = 300;
            Grid.Columns[i].ItemStyle.Wrap = false;

        }

        //for (int i = 0; i < Grid.Rows .Count; i++)
        //{
        //    DateTime ExDate = Convert.ToDateTime( Grid.Rows[i].Cells[8].Text );
        //    int no_days = mycl.Get_no_Days(Convert.ToDateTime( mycl.Get_ServerDate()), ExDate);
        //    if (no_days <= 30 & no_days > 0)
        //    {
        //        Grid.Rows[i].Cells[8].BackColor = System.Drawing.Color.Yellow;
        //    }
        //    else if (no_days >30)
        //    {
        //        Grid.Rows[i].Cells[8].BackColor = System.Drawing.Color.LightGreen ;
        //    }

        //    else if (no_days <=0)
        //    {
        //        Grid.Rows[i].Cells[8].BackColor = System.Drawing.Color.Red;
        //    }
        //}
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

    protected void ChkCdate_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox cc = (CheckBox)sender;
        Grid.Columns[cc.TabIndex].Visible = cc.Checked;
    }
    protected void ChkAll_CheckedChanged(object sender, EventArgs e)
    {
        ChkAccno.Checked = ChkAll.Checked;
        ChkDocname.Checked = ChkAll.Checked;
        ChkInvoiceNo.Checked = ChkAll.Checked;
        ChkAmountDollar.Checked = ChkAll.Checked;
        ChkAmountRyal.Checked = ChkAll.Checked;
        ChkRecieveNo.Checked = ChkAll.Checked;
        ChkRecieveDate.Checked = ChkAll.Checked;
        FinanceOutNo.Checked = ChkAll.Checked;
        ChkFincDt.Checked = ChkAll.Checked;
        ChkMohNo.Checked = ChkAll.Checked;
        Chkindate.Checked = ChkAll.Checked;
        ChkFlNM.Checked = ChkAll.Checked;
        ChkDocDesc.Checked = ChkAll.Checked;
        ChkEmpCode.Checked = ChkAll.Checked;
        ChkEmpname.Checked = ChkAll.Checked;
        ChkISfinished.Checked = ChkAll.Checked;


        System.Collections.ArrayList R = mycl.CLST(Page.Controls);
        for (int i = 2; i < 18; i++)
        {
            Grid.Columns[i].Visible = ChkAll.Checked;
        }
       
      
    }
    protected void HyperLink1_DataBinding(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }
}