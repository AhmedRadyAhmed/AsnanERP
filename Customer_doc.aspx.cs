using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Customer_doc : System.Web.UI.Page
{
    MyAdo mycl = new MyAdo();
    string vuserid;
    protected void Page_Load(object sender, EventArgs e)
    {
        vuserid = Session["userid"].ToString();

        mycl.Begin();


        UpdatePanel updatePanel = (UpdatePanel)Page.Master.FindControl("UpdatePanel1");

        PostBackTrigger trigger = new PostBackTrigger();
        trigger.ControlID = BtnSave.UniqueID;
        updatePanel.Triggers.Add(trigger);



        PostBackTrigger trigger1 = new PostBackTrigger();
        trigger1.ControlID = CustomerId.UniqueID;
        updatePanel.Triggers.Add(trigger1);

        PostBackTrigger trigger2 = new PostBackTrigger();
        trigger2.ControlID = BtnNew.UniqueID;
        updatePanel.Triggers.Add(trigger2);

        PostBackTrigger trigger3 = new PostBackTrigger();
        trigger3.ControlID = BtnSearch.UniqueID;
        updatePanel.Triggers.Add(trigger3);


        PostBackTrigger trigger4 = new PostBackTrigger();
        trigger4.ControlID = BtnUpdate.UniqueID;
        updatePanel.Triggers.Add(trigger4);

        if (Page.IsPostBack == false)
        {
           
            mycl.FillListt("SELECT CustomerDocTypeId,CustomerDocType FROM CustomerDocTypes", CustomerDocTypeId);
            mycl.FillListt("SELECT CustomerDocTypeId,CustomerDocType FROM CustomerDocTypes", CustomerDocTypeIdFilter);
            if (Request.QueryString["Serial_doc"] != null)
            {
                RecId.Text = (Request.QueryString["Serial_doc"]);
                mycl.GetData("select * from Customer_Documents where Serial=" + RecId.Text, RecId, Page.Controls);
                CustomerId_TextChanged(sender, e);
                BtnSave.Visible = false;
                BtnUpdate.Visible=true ;
            }
            else
            {
                BtnSave.Visible = true;
                BtnUpdate.Visible = false;
            }
        }

       
    }
    protected void BtnNew_Click(object sender, EventArgs e)
    {
        mycl.Clear(Page.Controls);
       

        BtnSave.Visible = true;
        BtnUpdate.Visible = false;
        MyFil_name.Visible = false;
    }
    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        string r;
        string sl = mycl.Search("V_Customer_Documents", "SELECT Serial, CustomerId, CustomerName, CustomerDocType, docname, DocDesc,CONVERT(VARCHAR, [DocDate], 1) as DocDate , CONVERT(VARCHAR, [DocExpire], 1) as DocExpire, MyFil_name FROM V_Customer_Documents", Page.Controls, "Serial");
        //if (DateFrom.Text != "" || DateTo.Text != "")
        //{
        //    sl += " and Fdate between  '" + DateFrom.Text + " 00:00:00.00'" + "  and '" + DateTo.Text + " 23:59:59.999'";

        //}



        Session.Add("Customer_doc", sl + " order by DocDate desc,  CustomerId");



        mycl.Redirect("Customer_docData.aspx", "_blank", "menubar=0,width=900,height=900");
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        string sl;
        string filename = null; 
        try
            {

                if (Fileupload1.HasFile)
                {
                    filename = Path.GetFileName(Fileupload1.FileName);

                    if (filename.Substring(filename.Length - 3, 3).ToLower() != "pdf")
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid Data :pdf files only allowed')", true);
                        return;
                    }

                }
                else
                {

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('No File Selected, Choose File First')", true);
                    return;
                }
                sl = "select count(*) from Customer_Documents where  MyFil_name=N'" + filename + "'";
                if (mycl.Exec_scalar(sl) != "0")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error:File name already Exist')", true);
                    return;
                }

                mycl.BeginTran();
                MyFil_name.Text = filename;
                sl = mycl.Insert("Customer_Documents", Page.Controls);
                mycl.Execute(sl);
                int Maxserial = mycl.GetId("Select  max(Serial) from Customer_Documents ");

                sl = mycl.InsertTbLog("Customer File Addition", "insert", "Customer_Documents", "Customer_Documents.aspx", Maxserial.ToString());
                mycl.Execute(sl);

                Fileupload1.PostedFile.SaveAs(MapPath("~/Customer Files/" + Fileupload1.PostedFile.FileName));

                mycl.mytrancommit();

                CustomerDocTypeId.SelectedValue = "0";

                docname.Text = "";
                DocDate.Text = "";
                DocExpire.Text = "";
                DocDesc.Text = "";
              
                Response.Redirect(Request.Url.ToString(), false);

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('"  +ex.Message  + "')", true);
                mycl.mytrayrollback();
            }

    }
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        string sl;
        string filename = null;
        try
            {

                if (Fileupload1.HasFile)
                {
                    filename = Path.GetFileName(Fileupload1.FileName);

                    if (filename.Substring(filename.Length - 3, 3).ToLower() != "pdf")
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid Data :pdf files only allowed')", true);
                        return;
                    }
                    MyFil_name.Text = filename;
                    sl = "select count(*) from Customer_Documents where (docname=N'" + docname.Text + "' or MyFil_name=N'" + filename + "') and serial<>" +RecId.Text ;
                    if (mycl.Exec_scalar(sl) != "0")
                    {

                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid Data Document name or file name already Exist in another Record')", true);
                        return;
                    }
                }


                mycl.BeginTran();

                sl = mycl.update("Customer_Documents", Page.Controls, "Serial", int.Parse(RecId.Text));
                mycl.Execute(sl);


                sl = mycl.InsertTbLog("Customer File Update", "Update", "Customer_Documents", "Customer_Documents.aspx", RecId.Text);
                mycl.Execute(sl);
                if (Fileupload1.HasFile)
                {
                    Fileupload1.PostedFile.SaveAs(MapPath("~/Customer Files/" + Fileupload1.PostedFile.FileName));
                }
                mycl.mytrancommit();
                mycl.Clear(Page.Controls);

               
                BtnSave.Visible = true;
                BtnUpdate.Visible = false;

            }
            catch (Exception ex)
            {
                mycl.mytrayrollback();

            }
    }
    protected void CustomerId_TextChanged(object sender, EventArgs e)
    {
        if (CustomerId.Text != "")
        {
            //string r = mycl.Exec_scalar("select count(empcode)  From emp where isadmin=1 and Empcode=N'" + vuserid + "'");

            //if (r != "1")
            //{
            //    if (CustomerId.Text.Substring(0, 3) != "112")
            //    {
            //        CustomerId.Text = "0";
            //        CustName.Text = "";
            //        return;
            //    }
                   
            //}
            CustName.Text = mycl.Exec_scalar("Select AccName_en from Acctb where AccCode=N'" + CustomerId.Text + "'");
        }
           
    }
    protected void CustomerDocTypeId_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (CustomerDocTypeId.SelectedValue.ToString() == "4")
        {
            Motabek.Visible = true;
            Balance.Visible = true;
        }
        else
        {
            Motabek.Visible = false;
            Balance.Visible = false;
        }
    }
   
    protected void Grid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        HyperLink lnk1 = new HyperLink();
        lnk1.Text = "Open";
       
        lnk1.Target = "_blank";
        lnk1.NavigateUrl = "Customer Files/" + e.Row.Cells[8].Text;
        e.Row.Cells[0].Controls.Add(lnk1);  
    }
    protected void Grid_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void CustomerDocTypeIdFilter_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (CustomerId.Text == "")
            return;
        SqlDataSource1.SelectCommand = "SELECT top 50 Serial, CustomerId, CustomerName, CustomerDocType, docname, DocDesc,CONVERT(VARCHAR, [DocDate], 1) as DocDate , CONVERT(VARCHAR, [DocExpire], 1) as DocExpire, MyFil_name FROM V_Customer_Documents where CustomerId =N'" + CustomerId .Text  + "'  order by serial desc";

        if (CustomerDocTypeIdFilter.SelectedValue.ToString() !="0")
            SqlDataSource1.SelectCommand = "SELECT top 50 Serial, CustomerId, CustomerName, CustomerDocType, docname, DocDesc,CONVERT(VARCHAR, [DocDate], 1) as DocDate , CONVERT(VARCHAR, [DocExpire], 1) as DocExpire, MyFil_name FROM V_Customer_Documents where CustomerDocTypeId=" + CustomerDocTypeIdFilter.SelectedValue.ToString() + " and CustomerId =N'" + CustomerId.Text + "'  order by serial desc";
        Grid.DataBind();
    }
}