using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        string vuserid = Session["userid"].ToString();

        MyAdo mycl = new MyAdo();
        string r = null;

        if (uPassword.Text.Length < 8)
        {
            lblerror.Text = "Password Length  Atleast 8 characters";
            lblerror.Visible = true;
            return;
        
        }
        mycl.Begin();

        r = mycl.Exec_scalar("select EmpCode From emp where EmpCode=" + vuserid + " and upassword='" + Currenpassword.Text + "'");

        if (r == "0")
        {
            lblerror.ForeColor = System.Drawing.Color.Red;
            lblerror.Text = "Invalid Current Password";
            lblerror.Visible = true;
            return;
        }
           
        else
        {

            string sl = "update emp set upassword=N'" + uPassword.Text + "' where EmpCode=N'" + vuserid + "'";
            mycl.Execute(sl);
            lblerror.ForeColor = System.Drawing.Color.Green; 
            lblerror.Text = "Password Changes Successfuly";
            lblerror.Visible = true;
        }
    }
}