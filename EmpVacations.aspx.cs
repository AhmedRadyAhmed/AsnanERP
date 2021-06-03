
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class EmpVacations : System.Web.UI.Page
{
    MyAdo mycl = new MyAdo();
    string vuserid;

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
            mycl.FillListt("select  EmpCode,Empname_ar from Emp where Active=1 ", EmpName);
            mycl.FillListt("select  VisaTypeId,VisaType from VisaTypes", VisaTypeId);


            if (Request.QueryString["Serial"] != null)
            {
                RecId.Text = (Request.QueryString["Serial"]);
                mycl.GetData("select * from EmpVacations where  Serial=" + RecId.Text, RecId, Page.Controls);
                EmpName.SelectedValue = EmpCode.Text;
                BtnSave.Visible = false;
                BtnUpdate.Visible = true;
            }
        }

    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
       string sl;
       if (isRefresh == false)
        {
            try
            {
                mycl.BeginTran();
                sl = mycl.Insert("EmpVacations", Page.Controls);
                mycl.Execute(sl);
                int Maxserial = mycl.GetId("Select  max(Serial) from EmpVacations ");

                sl = mycl.InsertTbLog("EmpVacations Addition", "insert", "EmpVacations", "EmpVacations.aspx", Maxserial.ToString());
                mycl.Execute(sl);
                mycl.mytrancommit();
                mycl.Clear(Page.Controls);

            }
            catch (Exception ex)
            {
                mycl.mytrayrollback();
                lblmsg.Text = "Error :" + ex.Message;
                Msg_Modal.Show();
            }
        }
    }




    
    protected void BtnNew_Click(object sender, EventArgs e)
    {
        mycl.Clear(Page.Controls);
        BtnSave.Visible = true;
        BtnUpdate.Visible = false;

    }

    protected void BtnUpdate_Click(object sender, EventArgs e)
    {

        string sl;
        if (isRefresh == false)
        {
            try
            {
                mycl.BeginTran();
                sl = mycl.update("EmpVacations", Page.Controls, "Serial", int.Parse(RecId.Text));
                mycl.Execute(sl);

                sl = mycl.InsertTbLog("EmpVacations Update", "Update", "EmpVacations", "EmpVacations.aspx",RecId.Text);
                mycl.Execute(sl);
                mycl.mytrancommit();
                mycl.Clear(Page.Controls);

            }
            catch (Exception ex)
            {
                mycl.mytrayrollback();
                lblmsg.Text = "Error :" + ex.Message;
                Msg_Modal.Show();
            }
        }
    }
    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        string r;
        string sl = mycl.Search("VEmpVacations", "select * from VEmpVacations", Page.Controls, "Serial");
        Session.Add("EmpVacations_Sl", sl);

        sl = mycl.InsertTbLog("EmpVacations Search", "Search", "EmpVacations", "EmpVacations.aspx", "0");
        mycl.Execute(sl);

        Response.Redirect("EmpVacations_Search.aspx");
    }
    protected void EmpName_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (EmpName.SelectedValue != "0")
            EmpCode.Text = EmpName.SelectedValue.ToString();
    }
    protected void EmpCode_TextChanged(object sender, EventArgs e)
    {
        EmpName.SelectedValue = "0";
        if (EmpCode.Text != "")
        {

            try
            {
                EmpName.SelectedValue = EmpCode.Text;
            }
            catch (Exception)
            {

                EmpName.SelectedValue = "0";
            }

        }
    }
}