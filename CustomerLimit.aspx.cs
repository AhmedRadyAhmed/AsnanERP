using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerLimit : System.Web.UI.Page
{
    MyAdo mycl = new MyAdo();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CustomerId_TextChanged(object sender, EventArgs e)
    {
        if (CustomerId.Text != "")
        {
            mycl.Begin();
            CustName.Text = mycl.Exec_scalar("Select CustomerName_En from Customer where CustomerId=N'" + CustomerId.Text + "'");
            cLimit.Text = mycl.Exec_scalar("select Crdtlmt from Customer where CustomerId=N'" + CustomerId.Text + "'");
        }
    }
    protected void BtnChange_Click(object sender, EventArgs e)
    {
        string sl="";
        mycl.Begin();
        string r = mycl.Exec_scalar("select Crdtlmt from customer" + " where CustomerId=N'" + CustomerId.Text + "'");
        sl = "update customer set Crdtlmt =" + cLimit.Text + " where CustomerId=N'" + CustomerId.Text + "'";
        mycl.Execute(sl);
        sl = mycl.InsertTbLog(r, "limit", cLimit.Text, "Customerlimit.aspx", CustomerId.Text);
        mycl.Execute(sl);
        mycl.Clear(Page.Controls);
      
    }
}