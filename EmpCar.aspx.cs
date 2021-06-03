using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class EmpCar : System.Web.UI.Page
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
            mycl.FillListt("select  carid,lohaid + '' +  cartype + '-' + carsubtype + '-' + str(manif_year)   from vcars ", Carinfo);
            mycl.FillListt("select  Empcode,Empname_En from Emp", EmpName);


            if (Request.QueryString["Serial"] != null)
            {
                RecId.Text = (Request.QueryString["Serial"]);
                mycl.GetData("select * from VEmpCar where  Serial=" + RecId.Text, RecId, Page.Controls);
                EmpName.SelectedValue = EmpCode.Text;
                Carinfo.Text  = Carid.Text;
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

        //   string r="select count(Serial) from empcar where LohaId=N'" + LohaId.Text 
            try
            {
                mycl.BeginTran();
                sl = mycl.Insert("EmpCar", Page.Controls);
                mycl.Execute(sl);
                int Maxserial = mycl.GetId("Select  max(Serial) from EmpCar ");

                sl = mycl.InsertTbLog("EmpCar Addition", "insert", "EmpCars", "EmpCar.aspx", Maxserial.ToString());
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
                sl = mycl.update("EmpCar", Page.Controls, "Serial", int.Parse(RecId.Text));
                mycl.Execute(sl);

                sl = mycl.InsertTbLog("Car Emp Update", "Update", "EmpCar", "EmpCar.aspx", RecId.Text);
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
        string sl = mycl.Search("VEmpCar", "select * from VEmpCar", Page.Controls,"Serial");
        Session.Add("EmpCar_Sl", sl );

        sl = mycl.InsertTbLog("Emp Car Search", "Search", "Emp Car", "EmpCar.aspx", "0");
        mycl.Execute(sl);

        Response.Redirect("EmpCarData.aspx");
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
    protected void LohaId_TextChanged(object sender, EventArgs e)
    {
        Carinfo.SelectedValue = "0";
        if (Carid.Text != "")
        {

            try
            {
                Carinfo.SelectedValue = Carid.Text;
            }
            catch (Exception)
            {

                Carinfo.SelectedValue = "0";
            }

        }
    }
    protected void EmpName_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (EmpName.SelectedValue != "0")
            EmpCode.Text = EmpName.SelectedValue.ToString();
    }
    protected void Carinfo_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Carinfo.SelectedValue != "0")
        { 
             Carid.Text = Carinfo.SelectedValue.ToString();
             
        }
            
    }
}