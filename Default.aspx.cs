using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    MyAdo mycl = new MyAdo();
    protected void Page_Load(object sender, EventArgs e)
    {
        mycl.Begin();
        if (!Page.IsPostBack)
        {
            mycl.FillListt("SELECT compid, Compname from comp where issysdata=1", DCompid);
            DCompid.SelectedValue = "1";
            DCompid_SelectedIndexChanged(sender, e);
        }    
    }
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection conlogin = new SqlConnection();
        conlogin.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Myconnection"].ToString();

        conlogin.Open();
        SqlCommand comgg = new SqlCommand();

        comgg.CommandText = "Emplogin";
        comgg.Connection = conlogin;
        comgg.CommandType = CommandType.StoredProcedure;
        comgg.Parameters.AddWithValue("@Usename", EmpCode.Text.ToString());
        comgg.Parameters.AddWithValue("@Password", UPassword.Text.ToString());



        int r = (Int32)comgg.ExecuteScalar();

        if (r == 1)
        {
            Session.Add("userid", EmpCode.Text.ToString());
            Session.Add("compid", DCompid.SelectedValue .ToString());
            Session.Add("branchid", DBranchid.SelectedValue .ToString());
            Session.Timeout = 60;
            string sl = "insert into CurrUsers(Empcode,Datein,Sess_id)values(N'" +
            System.Web.HttpContext.Current.Session["userid"].ToString() + "','" +
            mycl.Get_ServerDate() + "',N'" + System.Web.HttpContext.Current.Session.SessionID + "')";
            mycl.Execute(sl);
            mycl.Finish();
            Response.Redirect("MyPage.aspx");  //for sucsseful login
        }
        else
        {
            conlogin.Close();
            LblLogin.Visible = true;
        }

      

    }
    protected void DCompid_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DCompid.SelectedValue != "0")
        {
            mycl.FillListt("SELECT BranchId, Branch from Branchs where Compid=" + DCompid .SelectedValue.ToString (),DBranchid );
            if (DCompid.SelectedValue == "1")
            DBranchid.SelectedValue = "1";
        }
    }
}