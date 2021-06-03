using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Attend : System.Web.UI.Page
{
    MyAdo mycl = new MyAdo();
    protected void clos_Month(DateTime Month_DateFrom, DateTime Month_DateTo)
    {
        int lateMin;
        double lateSalval;
        string sl;
        int late_times_No;
        int Late_time_no_max;
        DataTable late_rang;
        DataTable EmpAttend = new DataTable(); ;


        DataTable Emptb = new DataTable();
        Emptb = mycl.GetTable("Select Empcode,shiftid from Emp where empcode in (select distinct '1141'+ Empcode from  EmpAttLog where donn=0 ) ");



        DataTable EmpAttLog = new DataTable();
        EmpAttLog = mycl.GetTable("Select distinct EmpCode,Atdate,Attime from EmpAttLog where donn=0 and Atdate between '" + Month_DateFrom + "' And '" + Month_DateTo + "'");
       
        for (int i = 0; i < Emptb.Rows.Count; i++)
        {
            for (int j = 0; j < EmpAttLog.Rows.Count; j++)
            {
                if (Emptb.Rows[i][0].ToString() == "1141"+ EmpAttLog.Rows[j][0].ToString())
                {
                    int day_week = Convert.ToInt32((Convert.ToDateTime(EmpAttLog.Rows[j][1].ToString()).DayOfWeek));
                    DataTable Shift_Days = new DataTable();
                    Shift_Days = mycl.GetTable("Select AttTimeFrom,AttTimeTo,LeaveFrom,Leaveto,TimeFrom,TimeTo,Period from Shift_Days where Shiftid=" + Emptb.Rows[i][1].ToString() + " and Dayid=" + day_week);
                    for (int z = 0; z < Shift_Days.Rows.Count; z++)
                    {
                        int emptime = (int)EmpAttLog.Rows[j][2];
                        int AttTimeFrom = (int)Shift_Days.Rows[z][0];
                        int AttTimeto = (int)Shift_Days.Rows[z][1];
                        int LeaveFrom = (int)Shift_Days.Rows[z][2];
                        int Leaveto = (int)Shift_Days.Rows[z][3];
                        int TimeFrom = (int)Shift_Days.Rows[z][4];
                        int TimeTo = (int)Shift_Days.Rows[z][5];
                        int Periodd = (int)Shift_Days.Rows[z][6];
                        if (emptime >= AttTimeFrom && emptime <= AttTimeto)
                        {

                            emptime = int.Parse((System.Math.Floor((double)emptime/2) * 2).ToString());
                            if (emptime > TimeFrom)
                            {
                                lateMin = emptime - TimeFrom;
                                late_rang = mycl.GetTable("select distinct lfrom,lto from TimeRules where ttype=1 and LFrom<=" + lateMin + "  and LTo >=" + lateMin);

                                late_times_No = (int)mycl.GetId("select COUNT(recid) from EmpAttend where Atdate between '" + Month_DateFrom + "' And '" + Month_DateTo + "' And timein_out=1 and EmpCode=N'" + Emptb.Rows[i][0].ToString() + "' and shortTime between " + late_rang.Rows[0][0].ToString() + " and " + late_rang.Rows[0][1].ToString());
                                late_times_No += 1;
                                Late_time_no_max = (int)mycl.GetId("select max(TimeNo) from TimeRules where  ttype=1 and LFrom<= " + lateMin.ToString() + " and  Lto >=" + lateMin.ToString());
                                if (late_times_No < Late_time_no_max)
                                    lateSalval = mycl.DblValue(mycl.Exec_scalar("select DiscountValue from TimeRules where ttype=1 and LFrom<=" + lateMin + "  and LTo >=" + lateMin.ToString() + " and TimeNo=" + (late_times_No ).ToString()));
                                else
                                    lateSalval = mycl.DblValue(mycl.Exec_scalar("select DiscountValue from TimeRules where ttype=1 and LFrom<=" + lateMin + "  and LTo >=" + lateMin.ToString() + " and TimeNo=" + Late_time_no_max.ToString()));
                                if (mycl.Exec_scalar("select WithOriginalTime from TimeRules where ttype=1 and LFrom<=" + lateMin + "  and LTo >=" + lateMin.ToString()) == "1")
                                {
                                    lateSalval += mycl.DblValue((lateMin / 480).ToString());
                                }
                            }
                           else
                            {
                                lateMin = 0;
                                late_times_No = 0;
                                lateSalval = 0;
                            }

                            sl = "INSERT INTO  EmpAttend (EmpCode,AtDate,AtTime,Timein_out,shortTime, TimeNo,DiscountSal,Period)VALUES(N'";
                            sl += Emptb.Rows[i][0].ToString() + "','";
                            sl += EmpAttLog.Rows[j][1].ToString() + "',";
                            sl += emptime.ToString() + ",1,"; //time in
                            sl += lateMin.ToString() + ",";
                            sl += (late_times_No).ToString() + ",";
                            sl += lateSalval.ToString() + ",";
                            sl += Periodd.ToString() + ")";

                            mycl.Execute(sl);
                           
                        }
                            int over_time = 0;
                            if (emptime >= LeaveFrom && emptime <= Leaveto)
                            {
                                emptime = int.Parse((System.Math.Ceiling((double)emptime/2) * 2).ToString());
                                if (emptime < TimeTo)
                                {
                                    lateMin = TimeTo - emptime;  //leave Early
                                    late_rang = mycl.GetTable("select distinct lfrom,lto from TimeRules where ttype=2 and LFrom<=" + lateMin + "  and LTo >=" + lateMin);

                                    late_times_No = (int)mycl.GetId("select COUNT(recid) from EmpAttend where Atdate between '" + Month_DateFrom + "' And '" + Month_DateTo + "' and timein_out=2 and EmpCode=N'" + Emptb.Rows[i][0].ToString() + "' and Shorttime between " + late_rang.Rows[0][0].ToString() + " and " + late_rang.Rows[0][1].ToString());
                                    late_times_No += 1;
                                    Late_time_no_max = (int)mycl.GetId("select max(TimeNo) from TimeRules where ttype=2 and LFrom<= " + lateMin.ToString() + " and  Lto >=" + lateMin.ToString());
                                    if (late_times_No < Late_time_no_max)
                                        lateSalval = mycl.DblValue(mycl.Exec_scalar("select DiscountValue from TimeRules where ttype=2 and LFrom<=" + lateMin + "  and LTo >=" + lateMin.ToString() + " and TimeNo=" + (late_times_No ).ToString()));
                                    else
                                        lateSalval = mycl.DblValue(mycl.Exec_scalar("select DiscountValue from TimeRules where ttype=2 and  LFrom<=" + lateMin + "  and LTo >=" + lateMin.ToString() + " and TimeNo=" + Late_time_no_max.ToString()));
                                    over_time = 0;

                                    if (mycl.Exec_scalar("select WithOriginalTime from TimeRules where ttype=2 and LFrom<=" + lateMin + "  and LTo >=" + lateMin.ToString()) == "1")
                                    {
                                        lateSalval += mycl.DblValue((lateMin / 480).ToString());
                                    }
                                }
                                else
                                {
                                    late_times_No = 0;
                                    lateMin = 0;
                                    late_times_No = 0;
                                    lateSalval = 0;
                                    over_time = emptime - TimeTo;
                                }

                                sl = "INSERT INTO  EmpAttend (EmpCode,AtDate,AtTime,Timein_out,shortTime, TimeNo,DiscountSal,OverTime,period)VALUES(N'";
                                sl += Emptb.Rows[i][0].ToString() + "','";
                                sl += EmpAttLog.Rows[j][1].ToString() + "',";
                                sl += emptime.ToString() + ",2,"; //time out
                                sl += lateMin.ToString() + ",";
                                sl += late_times_No.ToString() + ",";
                                sl += lateSalval.ToString() + ",";
                                sl += over_time.ToString() + ",";
                                sl += Periodd.ToString() + ")";
                                mycl.Execute(sl);
                            }

                        }
                    }
                }
        }
     
        for (int i = 0; i < Emptb.Rows.Count; i++)
        {
            int dif = int.Parse((Convert.ToDateTime(TextBox2.Text) - Convert.ToDateTime(TextBox1.Text)).TotalDays.ToString());
            for (int j = 0; j <= dif; j++)
            {
                string sl2 = "insert into EmpAttendReport(Empcode,AtDate)values(N'";
                sl2 += Emptb.Rows[i][0].ToString() + "','";
                sl2 += (Convert.ToDateTime(TextBox1.Text).AddDays(j)).ToString() + "')";
                mycl.Execute(sl2);
            }
        }

        EmpAttend = mycl.GetTable("SELECT EmpCode,AtDate ,AtTime ,Timein_out ,shortTime ,TimeNo ,DiscountSal ,OverTime ,Period FROM EmpAttend  where Atdate between '" + Month_DateFrom + "' And '" + Month_DateTo + "' order by Empcode, atdate asc");
        DataTable EmpAttendReport = mycl.GetTable("SELECT EmpCode,AtDate from EmpAttendReport order by empcode,atdate");

        for (int ii = 0; ii < EmpAttend.Rows.Count; ii++)
        {

            for (int i = 0; i < EmpAttendReport.Rows.Count; i++)
            {
                string s1, s2, s3, s4;
                s1 = EmpAttendReport.Rows[i][0].ToString();
                s2 = EmpAttend.Rows[ii][0].ToString();
                s3 = EmpAttendReport.Rows[i][1].ToString();
                s4 = EmpAttend.Rows[ii][1].ToString();
                sl = "";
                if ((s1 == s2) && (s3 == s4))
                {
                    sl = "update EmpAttendReport set ";
                    if (EmpAttend.Rows[ii][3].ToString() == "1")  //timin out  1 is in
                    {
                        if (EmpAttend.Rows[ii][8].ToString() == "1")  //period
                            sl += " AtTimein1=" + EmpAttend.Rows[ii][2].ToString() + ",shortTime1=" + EmpAttend.Rows[ii][4].ToString() + ",DisSalIn1=" + EmpAttend.Rows[ii][6].ToString();
                        else
                            sl += " AtTimein2=" + EmpAttend.Rows[ii][2].ToString() + ",shortTime2=" + EmpAttend.Rows[ii][4].ToString() + ",DisSalIn2=" + EmpAttend.Rows[ii][6].ToString();
                    }

                    else  // if out
                    {
                        if (EmpAttend.Rows[ii][8].ToString() == "1")  //period
                            sl += " AtTimeout1=" + EmpAttend.Rows[ii][2].ToString() + ",shortTimeOut1=" + EmpAttend.Rows[ii][4].ToString() + ",DisSalOut1=" + EmpAttend.Rows[ii][6].ToString() + ",OverTime1=" + EmpAttend.Rows[ii][7].ToString();
                        else
                            sl += " AtTimeout2=" + EmpAttend.Rows[ii][2].ToString() + ",shortTimeOut2=" + EmpAttend.Rows[ii][4].ToString() + ",DisSalOut2=" + EmpAttend.Rows[ii][6].ToString() + ",OverTime2=" + EmpAttend.Rows[ii][7].ToString();
                    }
                    sl += " where EmpCode=N'" + EmpAttend.Rows[ii][0].ToString() + "' and AtDate='" + EmpAttend.Rows[ii][1].ToString() + "'";
                    mycl.Execute(sl);
                }
            }
        }
        mycl.Execute("update EmpAttLog set donn=1 where donn=0 and Atdate between '" + Month_DateFrom + "' And '" + Month_DateTo + "'");
    }
    protected void Btn_OK_Click(object sender, EventArgs e)
    {
        clos_Month(Convert.ToDateTime(TextBox1.Text), Convert.ToDateTime(TextBox2.Text));
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        mycl.Begin();
    }
}