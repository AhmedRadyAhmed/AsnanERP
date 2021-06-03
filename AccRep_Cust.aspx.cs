using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class Acc_Pack : System.Web.UI.Page
{
    MyAdo mycl = new MyAdo();
    protected void Page_Load(object sender, EventArgs e)
    {
        mycl.Begin();
       

    }


    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> Getaccountnumber(string prefixText)
    {
        DataTable dt = new DataTable();
        string constr = ConfigurationManager.ConnectionStrings["Myconnection"].ToString();
        SqlConnection con = new SqlConnection(constr);

        SqlCommand cmd = new SqlCommand("select Accname_en from acctb where Accname_en   like N'%' +  @accid +'%' or Accname_Ar like N'%' +  @accid +'%'", con);
        cmd.Parameters.AddWithValue("@accid", prefixText);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt);
        List<string> accids = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            accids.Add(dt.Rows[i][0].ToString());
        }
        return accids;
    }
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetCategnumber(string prefixText)
    {
        DataTable dt = new DataTable();
        string constr = ConfigurationManager.ConnectionStrings["Myconnection"].ToString();
        SqlConnection con = new SqlConnection(constr);

        SqlCommand cmd = new SqlCommand("select Categg from Acc_categ where Categg   like N'%' +  @accid +'%' ", con);
        cmd.Parameters.AddWithValue("@accid", prefixText);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt);
        List<string> accids = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            accids.Add(dt.Rows[i][0].ToString());
        }
        return accids;
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetstatusNumber(string prefixText)
    {
        DataTable dt = new DataTable();
        string constr = ConfigurationManager.ConnectionStrings["Myconnection"].ToString();
        SqlConnection con = new SqlConnection(constr);

        SqlCommand cmd = new SqlCommand("select Acc_Satatus from Acc_status_tb where Acc_Satatus   like N'%' +  @accid +'%' ", con);
        cmd.Parameters.AddWithValue("@accid", prefixText);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt);
        List<string> accids = new List<string>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            accids.Add(dt.Rows[i][0].ToString());
        }
        return accids;
    }


    protected void AccNm_TextChanged(object sender, EventArgs e)
    {
        string r = "";
        AccCode.Text = "";
        if (AccNm.Text != "")
        {

            r = mycl.Exec_scalar("Select AccCode from Acctb where AccName_en =N'" + AccNm.Text + "'");
            if (r != "0")
                AccCode.Text = r;
        }
    }
    protected void AccCode_TextChanged(object sender, EventArgs e)
    {
        string r = "";
        AccNm.Text = "";
        if (AccCode.Text != "")
        {

            r = mycl.Exec_scalar("Select AccName_en from Acctb where AccCode =N'" + AccCode.Text + "'");
            if (r != "0")
                AccNm.Text = r;
        }
    }
    protected void CategName_TextChanged(object sender, EventArgs e)
    {
        string r = "";
        Categ_id.Text = "";
        if (CategName.Text != "")
        {
            r = mycl.Exec_scalar("Select Categ_id from Acc_categ where Categg =N'" + CategName.Text + "'");
            if (r != "0")
                Categ_id.Text = r;
        }
    }
    protected void Categ_id_TextChanged(object sender, EventArgs e)
    {
        string r = "";
        CategName.Text = "";
        if (Categ_id.Text != "")
        {
            r = mycl.Exec_scalar("Select Categg from Acc_categ where Categ_id =N'" + Categ_id.Text + "'");
            if (r != "0")
                CategName.Text = r;
        }

    }
    protected void Acc_Satatus_TextChanged(object sender, EventArgs e)
    {
        string r = "";
        Acc_statusid.Text = "";
        if (Acc_Satatus.Text != "")
        {

            r = mycl.Exec_scalar("Select Acc_statusid from Acc_status_tb where Acc_Satatus =N'" + Acc_Satatus.Text + "'");
            if (r != "0")
                Acc_statusid.Text = r;
        } 
    }
    protected void Acc_statusid_TextChanged(object sender, EventArgs e)
    {
        string r = "";
        Acc_Satatus.Text = "";
        if (Acc_statusid.Text != "")
        {
            r = mycl.Exec_scalar("Select Acc_Satatus from Acc_status_tb where Acc_statusid =N'" + Acc_statusid.Text + "'");
            if (r != "0")
                Acc_Satatus.Text = r;
        }
    }
    protected void Btn_ok_Click(object sender, EventArgs e)
    {

    }
}