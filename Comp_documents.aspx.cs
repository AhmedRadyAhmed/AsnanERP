using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Comp_documents : System.Web.UI.Page
{
    MyAdo mycl = new MyAdo();
    string vuserid;

string Visitors_online;


private bool refreshState;
private bool isRefresh;

protected override void LoadViewState(object savedState)
{
    object[] AllStates = (object[])savedState;
    base.LoadViewState(AllStates[0]);
    refreshState = bool.Parse(AllStates[1].ToString());
    if (Session["ISREFRESH"] != null & Session["ISREFRESH"] != "")
        isRefresh = (refreshState == (bool)Session["ISREFRESH"]);
}

protected override object SaveViewState()
{
    Session["ISREFRESH"] = refreshState;
    object[] AllStates = new object[3];
    AllStates[0] = base.SaveViewState();
    AllStates[1] = !(refreshState);
    return AllStates;
}

    protected void Page_Load(object sender, EventArgs e)
    {

        //UpdatePanel updatePanel = Page.Master.FindControl("UpdatePanel1") as UpdatePanel;
        //UpdatePanelControlTrigger trigger = new PostBackTrigger();
        //trigger.ControlID = BtnSave.UniqueID;
        //updatePanel.Triggers.Add(trigger);
        //trigger.ControlID = BtnUpdate.UniqueID;
        //updatePanel.Triggers.Add(trigger);

        vuserid = Session["userid"].ToString();
      
        mycl.Begin();
     
        if (Page.IsPostBack == false)
        {
          string r = mycl.Exec_scalar("select count(empcode)  From emp where isadmin=1 and Empcode=N'" + vuserid + "'");
         
          if (r == "1")
          {
              mycl.FillListt("SELECT CompId,Compname from comp ", CompId);
              mycl.FillListt("SELECT CompId,Compname from comp ",CompId_Search);
              mycl.FillListt("SELECT Comp_DocumentTypeid,Comp_DocumentType from Comp_DocumentTypes ", Comp_DocumentTypeId);
          }
          else
          {
              mycl.FillListt("select  CompId,Compname from Comp ,Page_permission where CompId=ItemId and TbName=N'Comp' and EmpCode=N'" + vuserid + "'", CompId);
              mycl.FillListt("select  CompId,Compname from Comp ,Page_permission where CompId=ItemId and TbName=N'Comp' and EmpCode=N'" + vuserid + "'", CompId_Search);
              mycl.FillListt("select Comp_DocumentTypeId,Comp_DocumentType from Comp_DocumentTypes ,Page_permission where Comp_DocumentTypeId=ItemId and TbName=N'Comp_DocumentTypes' and EmpCode=N'" + vuserid + "'", Comp_DocumentTypeId);
          
          }
        }
          
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        string sl;
        string filename=null;
        if (isRefresh == false)
        {
            try
            {

                if (Fileupload1.HasFile)
                {
                    filename = Path.GetFileName(Fileupload1.FileName);

                    if (filename.Substring(filename.Length - 3, 3).ToLower() != "pdf")
                    {
                        lblmsg.Text = "Invalid Data :pdf files only allowed";
                        Msg_Modal.Show();
                        return;
                    }

                }
                else
                {

                    lblmsg.Text = "'No File Selected, Choose File First";
                    Msg_Modal.Show();
                    return;
                }
                sl = "select count(*) from Comp_Documents where docname=N'" + docname.Text + "' or MyFil_name=N'" + filename + "'";
                if (mycl.Exec_scalar(sl) != "0")
                {
                    lblmsg.Text = "Invalid Data Document name or file name already Exist";
                    Msg_Modal.Show();
                    return;
                }

                mycl.BeginTran();
                MyFil_name.Text = filename;
                sl = mycl.Insert("Comp_Documents", Page.Controls);
                mycl.Execute(sl);
                int Maxserial = mycl.GetId("Select  max(Serial) from Comp_Documents ");

                sl = mycl.InsertTbLog("Company File Addition", "insert", "Comp_Documents", "Comp_documents.aspx", Maxserial.ToString());
                mycl.Execute(sl);

                Fileupload1.PostedFile.SaveAs(MapPath("~/MyFiles/" + Fileupload1.PostedFile.FileName));

                mycl.mytrancommit();

                CompId.SelectedValue  = "0";
                Comp_DocumentTypeId.SelectedValue = "0";
                SubCompId.Items.Clear();
                docname.Text = "";
                DocDate.Text = "";
                DocExpire.Text = "";
                DocDesc.Text = "";

              
                lblmsg.Text = "File Upload Successfully";
                Msg_Modal.Show();
              
                CompId_Search_SelectedIndexChanged(sender, e);

            }
            catch (Exception ex)
            {
                mycl.mytrayrollback();
                lblmsg.Text = "Error :" + ex.Message ;
                Msg_Modal.Show();
            }
        }
    }

   

   
    protected void CompId_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        SubCompId.Items.Clear();
       
        SubCompId.Enabled = false;
        Comp_DocumentTypeId.SelectedValue = "0";
       
    }
    protected void BtnNew_Click(object sender, EventArgs e)
    {
        mycl.Clear(Page.Controls);
        LstFiles.Items.Clear();
       
        SubCompId.Items.Clear();
        SubCompId.Enabled = false;
        BtnSave.Visible =true ;
        BtnUpdate.Visible = false;
        MyFil_name.Visible = false;

    }


    protected void Ref_subcompid()
    {

      
        SubCompId.Enabled = false;
        SubCompId.Items.Clear();
        string sl;
        if (Comp_DocumentTypeId.SelectedValue.ToString() != "0" & CompId.SelectedValue.ToString() != "0")
        {
            sl = "select count(Compid) from Comp where HasSubComp=1 and  Compid=" + CompId.SelectedValue.ToString();
            if (mycl.Exec_scalar(sl) == "1")
            {
                sl = "select count(Comp_DocumentTypeId) from Comp_DocumentTypes where HasDet=1 and  Comp_DocumentTypeId=" + Comp_DocumentTypeId.SelectedValue.ToString();
                if (mycl.Exec_scalar(sl) == "1")
                {
                    SubCompId.Enabled = true;
                    mycl.FillListt("SELECT SubCompId,SubCompname from Subcomp where Compid=" + CompId.SelectedValue.ToString(), SubCompId);
                }

            }

        }
    }
    protected void Comp_DocumentTypeId_SelectedIndexChanged(object sender, EventArgs e)
    {

        Ref_subcompid();
       
    }


    protected void LstFiles_SelectedIndexChanged(object sender, EventArgs e)
    {
        string x = CompId_Search.SelectedValue.ToString();
        if (LstFiles.SelectedValue.ToString() != "0")
        {
            BtnSave.Visible = false;
            BtnUpdate.Visible = true;
            RecId.Text = LstFiles.SelectedValue.ToString();
            mycl.GetData("select * from Comp_Documents where serial=" + RecId.Text, RecId, Page.Controls);
            string sl = "select subcompid from Comp_Documents where  serial=" + RecId.Text;
            Ref_subcompid();
            string r = mycl.Exec_scalar(sl);
            if (r != "0")
            {
                SubCompId.SelectedValue  = r;
                
            }
            MyFil_name.Visible = true;
        }
        CompId_Search.SelectedValue = x;
    }
    protected void CompId_Search_SelectedIndexChanged(object sender, EventArgs e)
    {
        LstFiles.Items.Clear();
        string sl;
        if (CompId_Search.SelectedValue.ToString() != "0")
        {
            sl = "select count(*) from Comp_Documents where CompId=" + CompId_Search.SelectedValue.ToString();
            int r = mycl.GetId(sl);
            if (r != 0)
            {
                string rr = mycl.Exec_scalar("select count(empcode)  From emp where isadmin=1 and Empcode=N'" + vuserid + "'");

                if (rr == "1")
                {
                    LstFiles.Visible = true;
                    sl = "select serial,docname from Comp_Documents where CompId=" + CompId_Search.SelectedValue.ToString() + " order  by docname";
                    mycl.FillListt(sl, LstFiles);
                }
                else
                {

                    sl = "select count(*) from Comp_Documents where CompId=" + CompId_Search.SelectedValue.ToString() + "  and insertBy=N'" + vuserid + "'";
                    r = mycl.GetId(sl);
                    if (r != 0)
                    {
                        LstFiles.Visible = true;
                        sl = "select serial,docname from Comp_Documents where CompId=" + CompId_Search.SelectedValue.ToString() + "  and insertBy=N'" + vuserid + "'" + " order  by docname";
                        mycl.FillListt(sl, LstFiles);
                    }

                }
            }

        }
        
    }
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {

        string sl;
        string filename = null;
        if (isRefresh == false)
        {
            try
            {

                if (Fileupload1.HasFile)
                {
                    filename = Path.GetFileName(Fileupload1.FileName);

                    if (filename.Substring(filename.Length - 3, 3).ToLower() != "pdf")
                    {
                        lblmsg.Text = "Invalid Data :pdf files only allowed";
                        Msg_Modal.Show();
                        return;
                    }
                    MyFil_name.Text = filename;
                    sl = "select count(*) from Comp_Documents where (docname=N'" + docname.Text + "' or MyFil_name=N'" + filename + "') and serial<>" + LstFiles.SelectedValue.ToString();
                    if (mycl.Exec_scalar(sl) != "0")
                    {
                        lblmsg.Text = "Invalid Data Document name or file name already Exist in another Record";
                        Msg_Modal.Show();
                        return;
                    }
                }


                mycl.BeginTran();

                sl = mycl.update("Comp_Documents", Page.Controls, "Serial", int.Parse(RecId.Text));
                mycl.Execute(sl);


                sl = mycl.InsertTbLog("Company File Update", "Update", "Comp_Documents", "Comp_documents.aspx", RecId.Text);
                mycl.Execute(sl);
                if (Fileupload1.HasFile)
                {
                    Fileupload1.PostedFile.SaveAs(MapPath("~/MyFiles/" + Fileupload1.PostedFile.FileName));
                }
                mycl.mytrancommit();
                mycl.Clear(Page.Controls);

                lblmsg.Text = "Data Updated Successfully";
                Msg_Modal.Show();

                BtnSave.Visible = true;
                BtnUpdate.Visible = false;

            }
            catch (Exception ex)
            {
                mycl.mytrayrollback();

                lblmsg.Text = "Error: " + ex.Message;
                Msg_Modal.Show();
            }
        }
    }

   
}