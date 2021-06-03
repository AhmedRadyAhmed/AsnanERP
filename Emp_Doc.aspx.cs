using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class  Emp_Doc : System.Web.UI.Page
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
        trigger1.ControlID = EmpCode.UniqueID;
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

        PostBackTrigger trigger5 = new PostBackTrigger();
        trigger5.ControlID = BtnUpload.UniqueID;
        updatePanel.Triggers.Add(trigger5);

        if (Page.IsPostBack == false)
        {
            mycl.FillListt("SELECT EmpDocTypeId,EmpDocType FROM EmpDocTypes", EmpDocTypeId);
            if (Request.QueryString["Serial_doc"] != null)
            {
                RecId.Text = (Request.QueryString["Serial_doc"]);
                mycl.GetData("select * from Emp_Documents where Serial=" + RecId.Text, RecId, Page.Controls);
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
        string sl = mycl.Search("V_Emp_Documents", "SELECT serial, EmpCode, Empname_en, EmpDocType, DocDesc, CONVERT(VARCHAR, [DocDate], 1) as DocDate, CONVERT(VARCHAR, [DocExpire], 1) as DocExpire, MyFil_name FROM V_Emp_Documents", Page.Controls, "Serial");
       

        Session.Add("Emp_doc", sl + " order by DocDate desc,  EmpCode");



        Response.Redirect("Emp_docData.aspx");
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
               
                //sl = "select count(*) from Emp_Documents where  MyFil_name=N'" + filename + "'";
                //if (mycl.Exec_scalar(sl) != "0")
                //{
                //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error: File name already Exist')", true);
                //    return;
                //}

                mycl.BeginTran();
                MyFil_name.Text = filename;
                sl = mycl.Insert("Emp_Documents", Page.Controls);
                mycl.Execute(sl);
                int Maxserial = mycl.GetId("Select  max(Serial) from Emp_Documents ");

                sl = mycl.InsertTbLog("Emp File Addition", "insert", "Emp_Documents", "Emp_Doc.aspx", Maxserial.ToString());
                mycl.Execute(sl);

                Fileupload1.PostedFile.SaveAs(MapPath("~/Emp_Files/" + Fileupload1.PostedFile.FileName));

                mycl.mytrancommit();

                EmpDocTypeId.SelectedValue = "0";

                docname.Text = "";
                DocDate.Text = "";
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
                    sl = "select count(*) from Comp_Documents where (docname=N'" + docname.Text + "' or MyFil_name=N'" + filename + "') and serial<>" +RecId.Text ;
                    if (mycl.Exec_scalar(sl) != "0")
                    {

                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid Data Document name or file name already Exist in another Record')", true);
                        return;
                    }
                }


                mycl.BeginTran();

                sl = mycl.update("Customer_Documents", Page.Controls, "Serial", int.Parse(RecId.Text));
                mycl.Execute(sl);


                sl = mycl.InsertTbLog("Emp File Update", "Update", "Emp_Documents", "Emp_doc.aspx", RecId.Text);
                mycl.Execute(sl);
                if (Fileupload1.HasFile)
                {
                    Fileupload1.PostedFile.SaveAs(MapPath("~/Emp_Files/" + Fileupload1.PostedFile.FileName));
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
        if (EmpCode.Text != "")
        {  
            EmpName.Text = mycl.Exec_scalar("Select Empname_en from Emp where Empcode=N'" + EmpCode.Text + "'");
            txtFilename.Text = mycl.Exec_scalar("Select MyFil_name from Emp where Empcode=N'" + EmpCode.Text + "'");
            if (txtFilename.Text == "")
                ImgEmp.ImageUrl = "~/Emp_Photo/No_Image.jpg";
            else
                ImgEmp.ImageUrl = "~/Emp_Photo/" + txtFilename.Text;
        }
           
    }
   
   
    protected void Grid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        HyperLink lnk1 = new HyperLink();
        lnk1.Text = "Open";
       
        lnk1.Target = "_blank";
        lnk1.NavigateUrl = "Emp_Files/" + e.Row.Cells[8].Text;
        e.Row.Cells[0].Controls.Add(lnk1);  
    }
    protected void BtnUpload_Click(object sender, EventArgs e)
    {
       
        string filename = null;
        string sl = null;
        if(EmpCode.Text=="" && EmpName.Text =="0")
        {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid Data :No Employee Id')", true);
                return;
        }
        if (FileUpload2.HasFile)
        {
            filename = Path.GetFileName(FileUpload2.FileName);
            if (filename.Substring(filename.Length - 3, 3).ToLower() != "jpg")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid Data :jpg files only allowed')", true);
                return;
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('No File Selected, Choose File First')", true);
            return;
        }
        sl = "select count(*) from Emp where  MyFil_name=N'" + filename + "'";
        if (mycl.Exec_scalar(sl) != "0")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid Data: file name already Exist')", true);
            return;
        }
        MyFil_name.Text = filename;
        FileUpload2.PostedFile.SaveAs(MapPath("~/Emp_Photo/" + FileUpload2.PostedFile.FileName));
        mycl.Execute( "update Emp set MyFil_name=N'" + MyFil_name.Text  + "' where EmpCode=N'" + EmpCode.Text + "'");
        ImgEmp.ImageUrl = "~/Emp_Photo/" + MyFil_name.Text;
    }
}