
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Customer_Documents : System.Web.UI.Page
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
       
        vuserid = Session["userid"].ToString();
      
        mycl.Begin();
     
        if (Page.IsPostBack == false)
        {
            mycl.FillListt("SELECT Customerid,customername_en FROM customer", LstCustomername);
            mycl.FillListt("SELECT Customerid,customername_en FROM customer", Customer_Search);
            mycl.FillListt("SELECT CustomerDocTypeId,CustomerDocType FROM CustomerDocTypes", CustomerDocTypeId);
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
                sl = "select count(*) from Customer_Documents where docname=N'" + docname.Text + "' or MyFil_name=N'" + filename + "'";
                if (mycl.Exec_scalar(sl) != "0")
                {
                    lblmsg.Text = "Invalid Data Document name or file name already Exist";
                    Msg_Modal.Show();
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

              
                lblmsg.Text = "File Upload Successfully";
                Msg_Modal.Show();

                Customer_Search_SelectedIndexChanged(sender, e);

            }
            catch (Exception ex)
            {
                mycl.mytrayrollback();
                lblmsg.Text = "Error :" + ex.Message ;
                Msg_Modal.Show();
            }
        }
    }

   

   
   
    protected void BtnNew_Click(object sender, EventArgs e)
    {
        mycl.Clear(Page.Controls);
        LstFiles.Items.Clear();
       
        BtnSave.Visible =true ;
        BtnUpdate.Visible = false;
        MyFil_name.Visible = false;

    }


    
    protected void LstFiles_SelectedIndexChanged(object sender, EventArgs e)
    {
        string x = Customer_Search.SelectedValue.ToString();
        if (LstFiles.SelectedValue.ToString() != "0")
        {
            BtnSave.Visible = false;
            BtnUpdate.Visible = true;
            RecId.Text = LstFiles.SelectedValue.ToString();
            mycl.GetData("select * from Customer_Documents where serial=" + RecId.Text, RecId, Page.Controls);
            LstCustomername.SelectedValue = CustomerId.Text;
            MyFil_name.Visible = true;
         }
        Customer_Search.SelectedValue = x;
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

    protected void CustomerId_TextChanged(object sender, EventArgs e)
    {
        LstCustomername.SelectedValue = "0";
        if (CustomerId.Text != "")
        {
            try
            {
                LstCustomername.SelectedValue = CustomerId.Text;
            }
            catch (Exception)
            {

                LstCustomername.SelectedValue = "0";
            }

        }
    }
    protected void LstCustomername_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (LstCustomername.SelectedValue != "0")
            CustomerId.Text = LstCustomername.SelectedValue.ToString();
    }

    protected void Customer_Search_SelectedIndexChanged(object sender, EventArgs e)
    {
        LstFiles.Items.Clear();
        string sl;
        if (Customer_Search.SelectedValue.ToString() != "0")
        {
            sl = "select count(*) from Customer_Documents where Customerid=N'" + Customer_Search.SelectedValue .ToString() + "'";
            int r = mycl.GetId(sl);
            if (r != 0)
                {
               
                    LstFiles.Visible = true;
                    sl = "select serial,docname from Customer_Documents where  Customerid=N'" + Customer_Search.SelectedValue.ToString() + "' order  by docname";
                    mycl.FillListt(sl, LstFiles);
               
                }
          }

        }
 }