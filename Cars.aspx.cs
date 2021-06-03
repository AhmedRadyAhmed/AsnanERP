using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Cars : System.Web.UI.Page
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
            mycl.FillListt("select  CartypeId,Cartype from Cartypes ", CartypeId);
            mycl.FillListt("select  CarsubtypeId,Carsubtype from CarSubtypes", CarSubTypeId);
            mycl.FillListt("SELECT BranchId,Branch FROM Branchs", BranchId);

            if (Request.QueryString["Carid"] != null)
            {
                RecId.Text = (Request.QueryString["Carid"]);
                mycl.GetData("select * from VCars where  CarId=" + RecId.Text, RecId, Page.Controls);
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
                sl = mycl.Insert("Cars", Page.Controls);
                mycl.Execute(sl);
                int Maxserial = mycl.GetId("Select  max(Carid) from Cars ");

                sl = mycl.InsertTbLog("Car Addition", "insert", "Cars", "Cars.aspx", Maxserial.ToString());
                mycl.Execute(sl);
                mycl.mytrancommit();
                mycl.Clear(Page.Controls);

            }
            catch (Exception ex)
            {
                mycl.mytrayrollback();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + "Error :" + ex.Message  + "')", true);
               
            }
        }
    }




    protected void CompId_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (CartypeId.SelectedValue == "0")
        //    return;
        //mycl.FillListt("select  CarsubtypeId,Carsubtype from CarSubtypes where CartypeId=" + CartypeId.SelectedValue.ToString(), CarSubTypeId);
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
                string r = mycl.Exec_scalar("select lohaid from cars where lohaid=N'" + LohaId.Text + "'");
                //if (r != "0")
                //{
                //    lblmsg.Text = "Error :Car Id Already Exist .";
                //    Msg_Modal.Show();
                //    return;
                //}
                mycl.BeginTran();
                sl = mycl.update("Cars", Page.Controls, "CarId", int.Parse(RecId.Text));
                mycl.Execute(sl);

                sl = mycl.InsertTbLog("Car Update", "Update", "Cars", "Cars.aspx",RecId.Text );
                mycl.Execute(sl);
                mycl.mytrancommit();
                mycl.Clear(Page.Controls);

            }
            catch (Exception ex)
            {
                mycl.mytrayrollback();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + "Error :" + ex.Message + "')", true);
            }
        }
    }
    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        string r;
        string sl = mycl.Search("VCars", "select * from VCars", Page.Controls,"Carid");
        Session.Add("Cars_Sl", sl );

        sl = mycl.InsertTbLog("Car Search", "Search", "Cars", "Cars.aspx", "0");
        mycl.Execute(sl);

        mycl.Redirect("CarData.aspx", "_blank", "menubar=0,width=900,height=900");
    }
    protected void LohaId_TextChanged(object sender, EventArgs e)
    {

    }
    protected void CarId_TextChanged(object sender, EventArgs e)
    {

    }
}