using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class AccRep : System.Web.UI.Page
{

    
    MyAdo mycl = new MyAdo();
    protected void Page_Load(object sender, EventArgs e)
    {
        mycl.Begin();
        if (!Page.IsPostBack)
        {
            DateFrom.Text = "01-01-" + mycl.Exec_scalar("Select year(getdate())");
            DateTo.Text = mycl.Exec_scalar("Select CONVERT(VARCHAR, getdate(), 110)");
             mycl.FillListt("SELECT AccLevelId,AccLevel from AccLevels ", AccLevelId);
             mycl.FillListt("SELECT Acc_statusid,Acc_Satatus  FROM  Acc_status_tb order by 1", List_Sts);
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


    protected void BtnRep_Click(object sender, EventArgs e)
    {
        string sl = "select Compname, C_Address, C_Tel, C_Fax, tb1.AccCode,Acctb.AccName_en,tb1.docno,tb1.docdate,dtp.DocType,tb1.jdesc,tb1.jdebit,tb1.jcredit, (  ( ISNULL((SELECT SUM(tb2.jdebit) AS tot_debit FROM vvjournaldet AS tb2  WHERE  tb2.AccCode= tb1.AccCode  and   tb2.Recidd < tb1.Recidd  GROUP BY tb2.AccCode), 0) )-( ISNULL((SELECT SUM(tb2.jcredit) AS tot_Credit FROM vvjournaldet AS tb2  WHERE  tb2.AccCode= tb1.AccCode  and   tb2.Recidd < tb1.Recidd   GROUP BY tb2.AccCode), 0) )  ) as old_balance , (  dbo.getsumcolumns(ISNULL((SELECT SUM(tb2.jdebit) AS tot_debit FROM vvjournaldet AS tb2   WHERE  tb2.AccCode= tb1.AccCode  and   tb2.Recidd < tb1.Recidd    GROUP BY tb2.AccCode), 0),tb1.jdebit)-dbo.getsumcolumns(ISNULL((SELECT SUM(tb2.jcredit) AS tot_Credit FROM vvjournaldet AS tb2  WHERE  tb2.AccCode= tb1.AccCode  and   tb2.Recidd < tb1.Recidd   GROUP BY tb2.AccCode), 0),tb1.jcredit)  )as Currn_balance  FROM vvjournaldet as  tb1 INNER JOIN acctb  ON tb1.AccCode = dbo.acctb.AccCode INNER JOIN DocTypes as dtp ON tb1.DocTypeId = dtp.DocTypeId inner join comp  on tb1.CompId =comp.CompId where tb1.accCode <> '0' ";

        if (WithPending.Checked ==false )
        {
            sl += " And tb1.pending=0";
        }

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
    protected void get_all2()
    {

        string sl = "";
         string mindate="";

         if (DateFrom.Text == "" && DateTo.Text == "")
             mindate = mycl.Exec_scalar("Select min(docdate) from V_Tot_Journaldet");
         else if (DateFrom.Text != "" && DateTo.Text != "")
             mindate = DateFrom.Text;

         sl = "select tb1.CompName,tb1.branch,tb1.C_Address,tb1.C_Tel,tb1.C_Fax,  tb1.AccCode,Acctb.AccName_en as AccName ,isnull(sum(tCredit) ,0)as TCredit, isnull(sum(TDebit),0) as TDebit ,(";
        sl += " SELECT isnull(SUM(tb2.tCredit),0)-isnull(SUM(tb2.TDebit),0) AS old_bal FROM V_Tot_Journaldet AS tb2  WHERE  tb2.AccCode= tb1.AccCode  and  docdate<'" + mindate + "'  ) as oldbal";
            
            
            sl+=" FROM V_Tot_Journaldet as  tb1 right outer  JOIN acctb  ON tb1.AccCode = dbo.acctb.AccCode" ;
            sl += " where docdate>='" + mindate + "'";

            if (AccCode.Text != "")
            {
                sl += " And tb1.AccCode like N'" + AccCode.Text + "%'";
            }

            if (DateFrom.Text != "" || DateTo.Text != "")
            {
                sl += " and tb1.DocDate  between '" + DateFrom.Text + " 00:00:00.00'" + "  and '" + DateTo.Text + " 23:59:59.99'";
            }

            sl += " group by tb1.CompName,tb1.branch,tb1.C_Address,tb1.C_Tel,tb1.C_Fax,  tb1.AccCode,Acctb.AccName_en ";
            Session.Add("sess_repsql", sl);
            mycl.Redirect("Crystal2.aspx?repname=" + "TrialBal", "_blank", "menubar=0,width=900,height=900");

        
    }
    protected void  get_all1()
    {
        DataTable tb1, tb2, tb3, tb_rep_pram;
        tb_rep_pram = Get_hdr();
        string sl2 = "select AccCode ,isnull(SUM(jdebit),0) -isnull(SUM(jcredit),0) as openbal from vvJournalDet where AccCode <>'-1' ";
        string sl1 = "select AccCode,isnull(SUM(jdebit),0)as deb ,isnull(SUM(jcredit),0) as cer ,isnull(SUM(jdebit),0) -isnull(SUM(jcredit),0) as bal from vvJournalDet where AccCode <>'-1' ";
        string sl = "Select AccCode,AccName_en ,isnull(OpenBalance,0) as f1,isnull(OpenBalance,0) as f2,isnull(OpenBalance,0) as f3,isnull(OpenBalance,0) as f4 ,Acc_Satatus,Smanid ,Datefrom ,Dateto,Empname_en from Acctb left outer join Acc_status_tb on acctb.Acc_statusid=Acc_status_tb.Acc_statusid  left outer join V_Emp_shortNames vvv on vvv.Empcode=Acctb.Smanid where AccCode <>'-1'";

        if (AccLevelId.SelectedValue.ToString() != "0")
        {
            sl += " and len(AccCode)=" + mycl.Exec_scalar("Select AccLen from AccLevels where AccLevelid=" + AccLevelId.SelectedValue.ToString());
        }
        if (AccCode.Text != "")
        {
            sl += " And AccCode like N'" + AccCode.Text + "%'";
            sl1 += " And AccCode like N'" + AccCode.Text + "%'";
            sl2 += " And AccCode like N'" + AccCode.Text + "%'";
        }

        if (Categ_id.Text  != "")
        {
            sl += " And Categ_id =" + Categ_id.Text;
           
        }

        //if (Acc_statusid.Text != "")
        //{
        //    sl += " And acctb.Acc_statusid =" + Acc_statusid.Text;
           
        //}

       
        foreach (ListItem item in List_Sts.Items)
        {
            if (item.Selected)
            {
                
                sl += " And acctb.Acc_statusid in( ";
                break;
            }

        }
       
        foreach (ListItem item in List_Sts.Items)
        {
            if (item.Selected)
            {
                sl +=  item.Value.ToString() + ",";
               
            }

        }

        foreach (ListItem item in List_Sts.Items)
        {
            if (item.Selected)
            {
                sl = sl.Substring(0, sl.Length - 1);

                sl += ") ";
                break;
            }

        }


       
        if (DateFrom.Text != "" || DateTo.Text != "")
        {
            sl1 += " and  DocDate  between '" + DateFrom.Text + " 00:00:00.00'" + "  and '" + DateTo.Text + " 23:59:59.99'";
            sl2 += " and Docdate <'" + DateFrom.Text + " 00:00:00.00'";
        }

        sl1 += " group by AccCode";
        sl2 += " group by AccCode";

        tb1 = mycl.GetTable(sl);
        tb2 = mycl.GetTable(sl1);
        tb3 = mycl.GetTable(sl2);

        tb1.Columns[2].ReadOnly = false;
        tb1.Columns[3].ReadOnly = false;
        tb1.Columns[4].ReadOnly = false;
        tb1.Columns[5].ReadOnly = false;

         if (tb1.Rows.Count == 0)
            return;
         for (int i = 0; i < tb1.Rows.Count; i++)
         {
             tb1.Rows[i][2] = "0";
             for (int j = 0; j < tb3.Rows.Count; j++)
             {
                 int n1=tb3.Rows[j][0].ToString().Length;
                 int n2= tb1.Rows[i][0].ToString().Length;
                 if (n1 > n2)
                 {
                     string ss1 = tb3.Rows[j][0].ToString().Substring(0, tb1.Rows[i][0].ToString().Length);
                     string ss2 = tb1.Rows[i][0].ToString();

                     if (ss1 == ss2)
                     {
                         double b1 = mycl.DblValue(tb3.Rows[j][1].ToString());
                         tb1.Rows[i][2] = mycl.DblValue(tb1.Rows[i][2].ToString()) + b1;
                     }
                 }
                 else 
                 {
                     if (tb3.Rows[j][0].ToString() == tb1.Rows[i][0].ToString())
                     {
                         double b1 = mycl.DblValue(tb3.Rows[j][1].ToString());
                         tb1.Rows[i][2] =  b1;
                     }
                 }
             }
         }

         for (int i = 0; i < tb1.Rows.Count; i++)
         {
           
             for (int j = 0; j < tb2.Rows.Count; j++)
             {

                 int n1 = tb2.Rows[j][0].ToString().Length;
                 int n2 = tb1.Rows[i][0].ToString().Length;
                 if (n1 > n2)
                 {
                     string ss1 = tb2.Rows[j][0].ToString().Substring(0, tb1.Rows[i][0].ToString().Length);
                     string ss2 = tb1.Rows[i][0].ToString();

                     if (ss1 == ss2)
                     {
                         double b1 = mycl.DblValue(tb2.Rows[j][1].ToString());
                         double b2 = mycl.DblValue(tb2.Rows[j][2].ToString());
                         tb1.Rows[i][3] = mycl.DblValue(tb1.Rows[i][3].ToString()) + b1;
                         tb1.Rows[i][4] = mycl.DblValue(tb1.Rows[i][4].ToString()) + b2;
                     }
                 }
                 else
                 {
                     if (tb1.Rows[i][0].ToString() == tb2.Rows[j][0].ToString())
                     {
                         double b1 = mycl.DblValue(tb2.Rows[j][1].ToString());
                         double b2 = mycl.DblValue(tb2.Rows[j][2].ToString());
                         tb1.Rows[i][3] = mycl.DblValue(tb1.Rows[i][3].ToString()) + b1;
                         tb1.Rows[i][4] = mycl.DblValue(tb1.Rows[i][4].ToString()) + b2;

                     }
                 }
             }
         }


         for (int i = 0; i < tb1.Rows.Count; i++)
         {
             tb1.Rows[i][5] = mycl.DblValue(tb1.Rows[i][2].ToString()) + mycl.DblValue(tb1.Rows[i][3].ToString()) - mycl.DblValue(tb1.Rows[i][4].ToString()); 
         }

         Session.Remove("tb_rep_pram1");
         Session.Remove("tb_rep_pram");

         Session.Add("tb_rep_pram1", tb_rep_pram);

         
         Session.Remove("cust_mn");
         Session.Add("cust_mn", tb1);
         mycl.Redirect("Reportwithtb.aspx?repname=" + "AllAcc_rep", "_blank", "menubar=0,width=900,height=900");
    }

    protected DataTable  Get_hdr()
    {
        DataTable tb_rep_pram1 = new DataTable();

        tb_rep_pram1 = mycl.GetTable("Select Compname,C_Address,C_tel,C_fax ,Compname  p5,Compname p6 ,Compname p7 ,Compname p8 ,getdate() p9 ,getdate() p10 ,0.0 p11,0.0 p12 from comp where Compid=" + Session["compid"]);


        tb_rep_pram1.AcceptChanges();
        tb_rep_pram1.Columns[4].ReadOnly = false;


        tb_rep_pram1.Columns[5].ReadOnly = false;
        tb_rep_pram1.Columns[5].DataType = System.Type.GetType("System.String");

        tb_rep_pram1.Columns[6].ReadOnly = false;

        tb_rep_pram1.Columns[7].ReadOnly = false;


        tb_rep_pram1.Columns[8].ReadOnly = false;


        tb_rep_pram1.Columns[9].ReadOnly = false;

        tb_rep_pram1.Columns[10].ReadOnly = false;



        tb_rep_pram1.Columns[11].ReadOnly = false;


        tb_rep_pram1.Rows[0][4] = Categ_id.Text;
        tb_rep_pram1.Rows[0][5] = CategName.Text;
        tb_rep_pram1.Rows[0][6] = Acc_statusid.Text;
        tb_rep_pram1.Rows[0][7] = Acc_Satatus.Text;
        
      
      
         tb_rep_pram1.Rows[0][8] = "1/1/2014" ;
            tb_rep_pram1.Rows[0][9] =mycl.Get_ServerDate(true);

        if (DateFrom.Text != "" || DateTo.Text != "")
        {
           
            tb_rep_pram1.Rows[0][8] = DateFrom.Text ;
            tb_rep_pram1.Rows[0][9] = DateTo.Text ;
          
        }

        return tb_rep_pram1;
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

    protected void Btn_ok_Click(object sender, EventArgs e)
    {
        if (R1.Checked == true)
            Get_satat();
        if (R2.Checked == true)
            get_all1();
        if (R3.Checked == true)
            get_all2();
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
    protected void R2_CheckedChanged(object sender, EventArgs e)
    {
        if (R2.Checked == true)
        {
            Categ_id.Visible = true;
            CategName.Visible = true;
            checkBoxPanel.Visible = true;
        }
        else
        {
            Categ_id.Visible = false;
            CategName.Visible = false;
            checkBoxPanel.Visible = false;
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
    protected void CheckBoxAll_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i < List_Sts.Items.Count; i++)
        {
            List_Sts.Items[i].Selected = CheckBoxAll.Checked;
        }
    }
    protected void CheckBoxAll_CheckedChanged1(object sender, EventArgs e)
    {
        for (int i = 0; i < List_Sts.Items.Count; i++)
        {
            List_Sts.Items[i].Selected = CheckBoxAll.Checked;
        }
    }
}