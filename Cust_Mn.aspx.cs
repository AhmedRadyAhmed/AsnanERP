using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Cust_Mn : System.Web.UI.Page
{
    MyAdo mycl = new MyAdo();
    protected void Page_Load(object sender, EventArgs e)
    {
        mycl.Begin();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       
        string sll = "select customerid,CustomerName_En ,tempf as f1,tempf as f2,tempf as f3,tempf as f4 ,tempf as f5,tempf as f6 from Customer where customerid <>N'0'";
        if (Smanid.Text != "")
            sll += " and smanid=N'" + Smanid.Text + "'";
        if (CustomerId.Text != "")
            sll += " and CustomerId like N'" + CustomerId.Text + "%'";
        if (Active.Checked == true)
            sll += "  And Active=1";
        DataTable tbb = new DataTable();
        DataTable tbb2 = new DataTable();
        DataTable tbb3 = new DataTable();
        tbb = mycl.GetTable(sll);
       // tbb2 = mycl.GetTable("select maccode,trandate,daydiff  ,tot_amnt from VTot_final_cust_loan ");
        string sltb1 = "select accCode ,accCode ,DATEDIFF(DD,DocDate,GETDATE())as  Ndays,SUM(jdebit) tot_debit from JournalDet ";
        if ( DateTo.Text != "")
        {
            sltb1 += " where   DocDate<'" + DateTo.Text + " 23:59:59.000'";
        }
        sltb1 += " group by accCode ,DATEDIFF(DD,DocDate,GETDATE())";
        tbb2 = mycl.GetTable(sltb1);


        string sltb2 = "select accCode,-1*SUM( jcredit) tot_Credit from JournalDet ";
        if (DateTo.Text != "")
        {
            sltb2 += " where   DocDate<'" + DateTo.Text + " 23:59:59.000'";
        }
        sltb2 += "  group by accCode";
        tbb3 = mycl.GetTable(sltb2 );

        if (tbb.Rows.Count == 0)
            return;
        for (int i = 0; i < tbb.Rows.Count; i++)
        {
            for (int j = 0; j < tbb2.Rows.Count; j++)
            {
                if (tbb.Rows[i][0].ToString() == tbb2.Rows[j][0].ToString())
                {
                    double No_Days = mycl.DblValue(tbb2.Rows[j][2].ToString()); 
                    if (No_Days >= 0 && No_Days <= 90)
                    {
                        double b1 = mycl.DblValue(tbb.Rows[i][2].ToString());
                        double b2 = mycl.DblValue(tbb2.Rows[j][3].ToString());
                        tbb.Rows[i][2] = b1 + b2;
                      
                    }
                    if (No_Days >90 && No_Days <= 180)
                    {
                        double b1 = mycl.DblValue(tbb.Rows[i][3].ToString());
                        double b2 = mycl.DblValue(tbb2.Rows[j][3].ToString());
                        tbb.Rows[i][3] = b1 + b2;
                     
                    }
                    if (No_Days > 180 && No_Days<= 270)
                    {
                        double b1 = mycl.DblValue(tbb.Rows[i][4].ToString());
                        double b2 = mycl.DblValue(tbb2.Rows[j][3].ToString());
                        tbb.Rows[i][4] = b1 + b2;
                       
                    }
                    if (No_Days > 270 && No_Days <= 360)
                    {
                        double b1 = mycl.DblValue(tbb.Rows[i][5].ToString());
                        double b2 = mycl.DblValue(tbb2.Rows[j][3].ToString());
                        tbb.Rows[i][5] = b1 + b2;
                       
                    }
                    if (No_Days >360 )
                    {
                        double b1 = mycl.DblValue(tbb.Rows[i][6].ToString());
                        double b2 = mycl.DblValue(tbb2.Rows[j][3].ToString());
                        tbb.Rows[i][6] = b1 + b2;

                    }

                }
            }
        }


      
        
        //-----------------------------------------------------------
        for (int i = 0; i < tbb.Rows.Count; i++)
        {
            for (int j = 0; j < tbb3.Rows.Count; j++)
            {
                if (tbb.Rows[i][0].ToString() == tbb3.Rows[j][0].ToString())
                {

                    double b6 = mycl.DblValue(tbb.Rows[i][6].ToString());
                    double b5 = mycl.DblValue(tbb.Rows[i][5].ToString());
                    double b4 = mycl.DblValue(tbb.Rows[i][4].ToString());
                    double b3 = mycl.DblValue(tbb.Rows[i][3].ToString());
                    double b2 = mycl.DblValue(tbb.Rows[i][2].ToString());
                    double b1 = mycl.DblValue(tbb.Rows[i][1].ToString());

                    double tot_crdt = mycl.DblValue(tbb3.Rows[j][1].ToString());
                    double rs =Math.Round( b6 + tot_crdt,2);
                    if (rs >= 0)
                        tbb.Rows[i][6] = rs.ToString();
                    else
                    {
                        tbb.Rows[i][6] = "0";
                        rs = b5 + rs;
                        if (rs >= 0)
                            tbb.Rows[i][5] = rs.ToString();
                        else
                        {
                            tbb.Rows[i][5] = "0";
                            rs = b4 + rs;
                            if (rs >= 0)
                                tbb.Rows[i][4] = rs.ToString();
                            else
                            {
                                tbb.Rows[i][4] = "0";
                                rs = b3 + rs;
                                if (rs >= 0)
                                    tbb.Rows[i][3] = rs.ToString();
                                else
                                {
                                    tbb.Rows[i][3] = "0";
                                    rs = b2 + rs;
                                    if (rs >= 0)
                                        tbb.Rows[i][2] = rs.ToString();
                                    else
                                    {
                                        tbb.Rows[i][2] = "0";

                                    }
                                }

                            }
                        }
                    }
                }

            }

        }
        tbb.AcceptChanges();
        //-------------------------------------------------------------------
        for (int y = 0; y < tbb.Rows.Count; y++)
        {
            double fbal = 0;
            for (int i = 2; i < 7; i++)
            {
                string x = tbb.Rows[y][i].ToString();
                fbal += mycl.DblValue(x);
            }

            tbb.Rows[y][7] = fbal;
        }
        //-----------------------------------------------------------------
        Session.Remove ("cust_mn");
        Session.Add("cust_mn", tbb);
        mycl.Redirect("Reportwithtb.aspx?repname=" + "Cust_mn", "_blank", "menubar=0,width=900,height=900");
       
    }



}