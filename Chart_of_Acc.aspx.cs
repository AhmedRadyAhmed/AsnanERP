using System;
using System.Data ;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Chart_of_Acc : System.Web.UI.Page
{
    
    MyAdo mycl = new MyAdo();

    protected void Page_Load(object sender, EventArgs e)
    {
         mycl.Begin();
         if (IsPostBack == false)
         {
            
             Load_tree();

         }
    }
    public void Load_tree()
    {
        DataTable PrSet = mycl.GetTable("SELECT * FROM Acctb order by AccCode");
        TrAcc.Nodes.Clear();
        foreach (DataRow dr in PrSet.Rows)
        {
            if (dr["Sup_AccCode"].ToString() == "0")
            {
                TreeNode tnParent = new TreeNode();
                tnParent.Text = dr["AccCode"].ToString() + "-" + dr["AccName_en"].ToString().Trim() + "-" + dr["AccName_ar"].ToString().Trim();
                string value = dr["AccCode"].ToString();
                tnParent.Expand();
                TrAcc.Nodes.Add(tnParent);
                FillChild(tnParent, value);
            }
        }
    }

    public int FillChild(TreeNode parent, string IID)
    {
        DataTable PrSet = mycl.GetTable("SELECT * FROM Acctb WHERE Sup_AccCode =N'" + IID + "' order by Serial");

        if (PrSet.Rows.Count > 0)
        {

            foreach (DataRow dr in PrSet.Rows)
            {
                TreeNode child = new TreeNode();
                child.Text = dr["AccCode"].ToString() + "-" + dr["AccName_en"].ToString().Trim() + "-" + dr["AccName_ar"].ToString().Trim();
                string temp = dr["AccCode"].ToString();
                child.Collapse();
                parent.ChildNodes .Add(child);
                FillChild(child, temp);
            }
            return 0;
        }
        else
        {
            return 0;
        }

    }


    protected void TrAcc_SelectedNodeChanged(object sender, EventArgs e)
    {
        string[] x;
        x = TrAcc.SelectedValue.Split('-');
        PAccCode.Text = x[0];
        PAccName_en.Text = x[1];
        PAccNameA_Ar.Text = x[2];

    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        string r = null;
        r = mycl.Exec_scalar("select AccCode From AccTb where AccCode=N'" + SubAccountid.Text + "'");

        if (r != "0")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Account No Already Exist')", true);
            return;
        }
        try
        {
            mycl.BeginTran();

            string vcompid = System.Web.HttpContext.Current.Session["compid"].ToString();
           string VBrnachid = System.Web.HttpContext.Current.Session["branchid"].ToString();

            string sl;
            sl = "INSERT INTO Acctb(AccCode,AccName_en,AccName_ar,Sup_AccCode,InsertBy,Compid,Branchid )VALUES(N'";
            sl += SubAccountid.Text + "',N'";
            sl += AccName_en.Text + "',N'";
            sl += AccName_ar.Text + "',N'";
            sl += PAccCode.Text + "',";
            sl += System.Web.HttpContext.Current.Session["userid"].ToString() + ",";
            sl += vcompid + ",";
            sl += VBrnachid + ")";

            mycl.Execute(sl);
            int vserial = mycl.GetId("select max(serial) from acctb");
            sl = mycl.InsertTbLog("SubAccount Add", "insert", "Acctb", "SubAccount.aspx", vserial.ToString());
            mycl.Execute(sl);

            mycl.mytrancommit();
            mycl.Clear(Page.Controls);
             Response.Redirect(Request.Url.ToString(), false);
             Load_tree();
        }
        catch (Exception ex)
        {
            mycl.mytrayrollback();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error')", true);

        }
    }
    protected void Btn_new_cust_emp_Click(object sender, EventArgs e)
    {
        mycl.Clear(Page.Controls);
    }
}