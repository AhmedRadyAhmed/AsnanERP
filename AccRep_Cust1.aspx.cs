using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class Cust_rep : System.Web.UI.Page
{
    MyAdo mycl = new MyAdo();
    protected void Page_Load(object sender, EventArgs e)
    {
        mycl.Begin();
        if (!Page.IsPostBack)
        {
            DateFrom.Text = "01-01-" + mycl.Exec_scalar("Select year(getdate())");
            DateTo.Text = mycl.Exec_scalar("Select CONVERT(VARCHAR, getdate(), 110)");
            
        }
       
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

    protected void BtnRep_Click(object sender, EventArgs e)
    {
        string sl = "select Compname, C_Address, C_Tel, C_Fax, tb1.AccCode,Acctb.AccName_en,tb1.docno,tb1.docdate,dtp.DocType,tb1.jdesc,tb1.jdebit,tb1.jcredit, (  ( ISNULL((SELECT SUM(tb2.jdebit) AS tot_debit FROM vvjournaldet AS tb2  WHERE  tb2.AccCode= tb1.AccCode  and   tb2.Recidd < tb1.Recidd  GROUP BY tb2.AccCode), 0) )-( ISNULL((SELECT SUM(tb2.jcredit) AS tot_Credit FROM vvjournaldet AS tb2  WHERE  tb2.AccCode= tb1.AccCode  and   tb2.Recidd < tb1.Recidd   GROUP BY tb2.AccCode), 0) )  ) as old_balance , (  dbo.getsumcolumns(ISNULL((SELECT SUM(tb2.jdebit) AS tot_debit FROM vvjournaldet AS tb2   WHERE  tb2.AccCode= tb1.AccCode  and   tb2.Recidd < tb1.Recidd    GROUP BY tb2.AccCode), 0),tb1.jdebit)-dbo.getsumcolumns(ISNULL((SELECT SUM(tb2.jcredit) AS tot_Credit FROM vvjournaldet AS tb2  WHERE  tb2.AccCode= tb1.AccCode  and   tb2.Recidd < tb1.Recidd   GROUP BY tb2.AccCode), 0),tb1.jcredit)  )as Currn_balance  FROM vvjournaldet as  tb1 INNER JOIN acctb  ON tb1.AccCode = dbo.acctb.AccCode INNER JOIN DocTypes as dtp ON tb1.DocTypeId = dtp.DocTypeId inner join comp  on tb1.CompId =comp.CompId where tb1.accCode <> '0' ";

       

        if (AccCode.Text != "")
        {
            sl += " And tb1.AccCode like N'" + AccCode.Text + "%'";
        }

        if (DateFrom.Text != "" || DateTo.Text != "")
        {
            sl += " and tb1.DocDate  between '" + DateFrom.Text + " 00:00:00.00'" + "  and '" + DateTo.Text + " 23:59:59.99'";
        }
        sl += " order by tb1.Recidd";
        Session.Remove("sess_repsql");
        Session.Add("sess_repsql", sl);
        mycl.Redirect("Crystal2.aspx?repname=" + "Acc", "_blank", "menubar=0,width=900,height=900");
    }
    
    protected void Get_satat()
    {
        if (AccCode.Text == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :Enter The Account Number')", true);
            AccCode.Focus();
            return;
        }
        DataTable tb;

        String Old_balance="0";
        String Final_balance = "0";
        DataTable tb_rep_pram = new DataTable();

        tb_rep_pram = mycl.GetTable("Select Compname,C_Address,C_tel,C_fax ,Compname  p5,Compname p6 ,Compname p7 ,Compname p8 ,getdate() p9 ,getdate() p10 ,0.0 p11,0.0 p12 from comp");
       
        
        tb_rep_pram.AcceptChanges();
         tb_rep_pram.Columns[4].ReadOnly = false;
      

         tb_rep_pram.Columns[5].ReadOnly = false;
        tb_rep_pram.Columns[5].DataType = System.Type.GetType("System.String");

         tb_rep_pram.Columns[6].ReadOnly = false;
        
         tb_rep_pram.Columns[7].ReadOnly = false;
       
        
       tb_rep_pram.Columns[8].ReadOnly = false;
     

         tb_rep_pram.Columns[9].ReadOnly = false;
   
         tb_rep_pram.Columns[10].ReadOnly = false;
      


        tb_rep_pram.Columns[11].ReadOnly = false;
     

        tb_rep_pram.Rows[0][4]  = AccCode.Text;
        tb_rep_pram.Rows[0][5]  = mycl.Exec_scalar("Select AccName_en From Acctb where accCode=N'" + AccCode.Text + "'");

         tb_rep_pram.Rows[0][6]  = mycl.Exec_scalar("Select smanid From Customer where Customerid=N'" + AccCode.Text + "'");
         tb_rep_pram.Rows[0][7]  = mycl.Exec_scalar("Select Fax1 From customer where Customerid=N'" + AccCode.Text + "'");
        
        
      

        string sl = "select docno,docdate,DocType,jdesc,jdebit,jcredit,0.0 as Currn_balance,AccCode FROM vvjournaldet t inner join doctypes d on d.DocTypeId=t.DocTypeId  where   accCode=N'" + AccCode.Text + "'";

        string slfinalbal = "select  isnull(SUM(jdebit),0) -isnull(SUM(jcredit),0) as openbal from vvJournalDet where AccCode=N'" + AccCode.Text + "'";
        
         tb_rep_pram.Rows[0][8] = "1/1/2014" ;
            tb_rep_pram.Rows[0][9] =mycl.Get_ServerDate(true);

        if (DateFrom.Text != "" || DateTo.Text != "")
        {
            sl += " and  DocDate  between '" + DateFrom.Text + " 00:00:00.00'" + "  and '" + DateTo.Text + " 23:59:59.99'";
            Old_balance =mycl.Exec_scalar( "select  isnull(SUM(jdebit),0) -isnull(SUM(jcredit),0) as openbal from vvJournalDet where AccCode=N'" + AccCode.Text  +  "' and Docdate <'" + DateFrom.Text + " 00:00:00.00'");

            tb_rep_pram.Rows[0][8] = DateFrom.Text ;
            tb_rep_pram.Rows[0][9] = DateTo.Text ;
            slfinalbal += " and docdate<='" + DateTo.Text + " 23:59:59.99'";
        }
        Final_balance = mycl.Exec_scalar(slfinalbal);
        tb_rep_pram.Rows[0][10] = Old_balance;
        tb_rep_pram.Rows[0][11] = Final_balance;
        
        sl += " order by RecIdd";
        tb = mycl.GetTable(sl);
        tb.Columns[6].ReadOnly = false;
        tb.Columns[7].ReadOnly = false;
        tb.AcceptChanges();
        if (tb.Rows.Count > 0)
        {

            tb.Rows[0][6] = (mycl.DblValue(Old_balance) + mycl.DblValue(tb.Rows[0][4].ToString()) - mycl.DblValue(tb.Rows[0][5].ToString())).ToString();
            for (int i = 1; i < tb.Rows.Count; i++)
            {
                tb.Rows[i][6] = (mycl.DblValue(tb.Rows[i - 1][6].ToString()) + mycl.DblValue(tb.Rows[i][4].ToString()) - mycl.DblValue(tb.Rows[i][5].ToString())).ToString();
            }
        }
        else
        {
            DataRow drr ;
            drr = tb.NewRow();
           drr[0] = 0;
           drr[6] = Old_balance;
            drr[7] = AccCode.Text;
            tb.Rows.Add(drr);
        }
           

        Session.Remove("tb_rep_pram");
         Session.Remove("cust_mn");
         Session.Add("cust_mn", tb);
        
         Session.Add("tb_rep_pram", tb_rep_pram);
        
        mycl.Redirect("Reportwithtb.aspx?repname=" + "Acc1", "_blank", "menubar=0,width=900,height=900");
    }

   


    protected void AccNm_TextChanged(object sender, EventArgs e)
    {
        string r = "";
        if (AccNm.Text != "")
        {
            AccCode.Text = "";
            r = mycl.Exec_scalar("Select AccCode from Acctb where AccName_en =N'" + AccNm.Text + "'");
            if (r != "0")
                AccCode.Text = r;
        }
    }
    protected void Btn_ok_Click(object sender, EventArgs e)
    {
       
        if (AccCode.Text == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :Enter The Account Number')", true);
            AccCode.Focus();
            return;
        }

        if (AccCode.Text.StartsWith("112")==false)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :Invalid Account Number')", true);
            AccCode.Focus();
            return;
        }

        DataTable tb;

        String Old_balance="0";
        String Final_balance = "0";
        DataTable tb_rep_pram = new DataTable();

        tb_rep_pram = mycl.GetTable("Select Compname,C_Address,C_tel,C_fax ,Compname  p5,Compname p6 ,Compname p7 ,Compname p8 ,getdate() p9 ,getdate() p10 ,0.0 p11,0.0 p12 from comp");
       
        
        tb_rep_pram.AcceptChanges();
         tb_rep_pram.Columns[4].ReadOnly = false;
      

         tb_rep_pram.Columns[5].ReadOnly = false;
        tb_rep_pram.Columns[5].DataType = System.Type.GetType("System.String");

         tb_rep_pram.Columns[6].ReadOnly = false;
        
         tb_rep_pram.Columns[7].ReadOnly = false;
       
        
       tb_rep_pram.Columns[8].ReadOnly = false;
     

         tb_rep_pram.Columns[9].ReadOnly = false;
   
         tb_rep_pram.Columns[10].ReadOnly = false;
      


        tb_rep_pram.Columns[11].ReadOnly = false;
     

        tb_rep_pram.Rows[0][4]  = AccCode.Text;
        tb_rep_pram.Rows[0][5]  = mycl.Exec_scalar("Select AccName_en From Acctb where accCode=N'" + AccCode.Text + "'");

         tb_rep_pram.Rows[0][6]  = mycl.Exec_scalar("Select smanid From Customer where Customerid=N'" + AccCode.Text + "'");
         tb_rep_pram.Rows[0][7]  = mycl.Exec_scalar("Select Fax1 From customer where Customerid=N'" + AccCode.Text + "'");
        
        
      

        string sl = "select docno,docdate,DocType,jdesc,jdebit,jcredit,0.0 as Currn_balance,AccCode FROM vvjournaldet t inner join doctypes d on d.DocTypeId=t.DocTypeId  where   accCode=N'" + AccCode.Text + "'";

        string slfinalbal = "select  isnull(SUM(jdebit),0) -isnull(SUM(jcredit),0) as openbal from vvJournalDet where AccCode=N'" + AccCode.Text + "'";
        
         tb_rep_pram.Rows[0][8] = "1/1/2014" ;
            tb_rep_pram.Rows[0][9] =mycl.Get_ServerDate(true);

        if (DateFrom.Text != "" || DateTo.Text != "")
        {
            sl += " and  DocDate  between '" + DateFrom.Text + " 00:00:00.00'" + "  and '" + DateTo.Text + " 23:59:59.99'";
            Old_balance =mycl.Exec_scalar( "select  isnull(SUM(jdebit),0) -isnull(SUM(jcredit),0) as openbal from vvJournalDet where AccCode=N'" + AccCode.Text  +  "' and Docdate <'" + DateFrom.Text + " 00:00:00.00'");

            tb_rep_pram.Rows[0][8] = DateFrom.Text ;
            tb_rep_pram.Rows[0][9] = DateTo.Text ;
            slfinalbal += " and docdate<='" + DateTo.Text + " 23:59:59.99'";
        }
        Final_balance = mycl.Exec_scalar(slfinalbal);
        tb_rep_pram.Rows[0][10] = Old_balance;
        tb_rep_pram.Rows[0][11] = Final_balance;
        
        sl += " order by RecIdd";
        tb = mycl.GetTable(sl);
        tb.Columns[6].ReadOnly = false;
        tb.Columns[7].ReadOnly = false;
        tb.AcceptChanges();
        if (tb.Rows.Count > 0)
        {

            tb.Rows[0][6] = (mycl.DblValue(Old_balance) + mycl.DblValue(tb.Rows[0][4].ToString()) - mycl.DblValue(tb.Rows[0][5].ToString())).ToString();
            for (int i = 1; i < tb.Rows.Count; i++)
            {
                tb.Rows[i][6] = (mycl.DblValue(tb.Rows[i - 1][6].ToString()) + mycl.DblValue(tb.Rows[i][4].ToString()) - mycl.DblValue(tb.Rows[i][5].ToString())).ToString();
            }
        }
        else
        {
            DataRow drr ;
            drr = tb.NewRow();
           drr[0] = 0;
           drr[6] = Old_balance;
            drr[7] = AccCode.Text;
            tb.Rows.Add(drr);
        }
           

        Session.Remove("tb_rep_pram");
         Session.Remove("cust_mn");
         Session.Add("cust_mn", tb);
        
         Session.Add("tb_rep_pram", tb_rep_pram);
        
        mycl.Redirect("Reportwithtb.aspx?repname=" + "Acc1", "_blank", "menubar=0,width=900,height=900");
    
    }
}