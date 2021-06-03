using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CloseYear : System.Web.UI.Page
{
    MyAdo mycl = new MyAdo();
    protected void Page_Load(object sender, EventArgs e)
    {
        mycl.Begin();
    }
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        string r = null;
        r = mycl.Exec_scalar("select YearClose From YearClosed where YearClose=" +  yr.Text.Trim ()) ;
        if (r == "0")

            mycl.Execute("insert  yearclosed (yearclose,isclosed) values(" + yr.Text.Trim() + ",1)");
        else
        {
            string rr = null;
            string x=null;
            rr = mycl.Exec_scalar("select isclosed From YearClosed where YearClose=" + yr.Text.Trim());

            if (rr == "0")
                x = "1";
            else
                x = "0";
            mycl.Execute("update  yearclosed set isclosed=" + x + " where yearclose=" + yr.Text.Trim() );
        
        }
    }
    protected void yr_TextChanged(object sender, EventArgs e)
    {
        string rr = null;
        rr = mycl.Exec_scalar("select YearClose From YearClosed where YearClose=" + yr.Text.Trim());
        if (rr == "0")
            yr.BackColor = System.Drawing.Color.White;

        return;

        rr=mycl.Exec_scalar("select isclosed From YearClosed where YearClose=" + yr.Text.Trim());

        if (rr == "0")
            yr.BackColor = System.Drawing.Color.Red ;
        else
             yr.BackColor = System.Drawing.Color.LawnGreen;
    }
}