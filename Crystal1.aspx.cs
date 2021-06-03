using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Configuration;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

public partial class Crystal1 : System.Web.UI.Page
{
    MyAdo mycl = new MyAdo();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sl = "select * from emp where branchid=N'" + TextBox1.Text + "'";
        Response.Redirect("Crystal2.aspx?repsql=" + sl + "&repname=" + "MyRep");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string sl = "select * from emp where branchid=N'" + TextBox1.Text + "'";
        mycl.Begin();
      
        DataTable tb = new DataTable();
        tb = mycl.GetTable(sl);
        ReportDocument repdoc = new ReportDocument();
        string reportPath = Server.MapPath("~/Reports/MyRep.rpt");
        repdoc.Load(reportPath);

        repdoc.SetDataSource(tb);
        repdoc.PrintToPrinter(2, true, 1, 2);
    }
}