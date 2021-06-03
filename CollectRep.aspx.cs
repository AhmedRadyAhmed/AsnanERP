using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CollectRep : System.Web.UI.Page
{
    MyAdo mycl = new MyAdo();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnLogin_Click(object sender, EventArgs e)
    {

        Session.Remove("sess_repsql"); 
        string sl = "select DocNo,DocDate,AccCode,AccName,Smanid,Empname_en,Amount ,JDesc from VCashMas where Docno <>-1 ";

        if (Smanid.Text != "")
            sl += " and smanid=N'" + Smanid.Text + "'";
        if (CustomerId.Text != "")
            sl += " and AccCode like N'" + CustomerId.Text + "%'";
        if (DateFrom.Text != "" || DateTo.Text != "") 
        {
            sl += " and DocDate  between '" + DateFrom.Text + " 00:00:00.00'" + "  and '" + DateTo.Text + " 23:59:59.000'";
        }

        mycl.Redirect("Crystal2.aspx?repsql=" + sl + "  order by Docdate asc" + "&repname=" + "CollectionBySman", "_blank", "menubar=0,width=900,height=900");
    } 
}