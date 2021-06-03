using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class Customerr : System.Web.UI.Page
{
    MyAdo mycl = new MyAdo();

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> Getaccountnumber2(string prefixText)
    {
        DataTable dt = new DataTable();
        string constr = ConfigurationManager.ConnectionStrings["Myconnection"].ToString();
        SqlConnection con = new SqlConnection(constr);

        SqlCommand cmd = new SqlCommand("select Hy from Hys where Hy like N'%' +  @accid +'%' ", con);
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


    protected void Set_Page_Perm(string Page_name, bool oper)
    {

        string v_userid = Session["userid"].ToString();
        string vadminyes = mycl.Exec_scalar("Select count(empcode) from emp where  isadmin=1 and Empcode=N'" + v_userid + "'");

        string page_id = mycl.Exec_scalar("Select  PageId from PPages where Pagename=N'" + Page_name + "'");
        BtnSave.Visible = false;
        BtnUpdate.Visible = false;
        if (vadminyes != "0")
        {
            if (oper == true)
                BtnSave.Visible = true;
            else if (oper == false)
                BtnUpdate.Visible = true;
            return;
        }
        DataTable tb_perm = mycl.GetTable("Select DisplayPerm,AddPerm,UpdatePerm,DeletePerm from UserPages where Empcode=N'" + v_userid + "' and Pageid=" + page_id);
        string v_AddPerm = tb_perm.Rows[0][1].ToString();
        string v_UpdatePerm = tb_perm.Rows[0][2].ToString();
        if (oper == true && Convert.ToBoolean(v_AddPerm) == true)
            BtnSave.Visible = true;
        else if (oper == false && Convert.ToBoolean(v_UpdatePerm) == true)
            BtnUpdate.Visible = true;

    }
    protected void MoveToRecord()
    {
        Set_Page_Perm("Customer.aspx", false);
        mycl.GetData("select * from Customer where CustomerId=N'" + CustomerId.Text + "'", CustomerId, Page.Controls);
        string sl = mycl.InsertTbLog("Customer Search", "Search", "Customer", "Customer.aspx", CustomerId.Text);
        mycl.Execute(sl);
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
           server control at run time. */
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        mycl.Begin();
      
        string VCustomerId = Request.QueryString["CustomerId"];
        if (IsPostBack == false)
        {
            mycl.FillListt("SELECT BussTypeId,BussType FROM BussTypes", BussTypeId);
            mycl.FillListt("SELECT CustomerGroupId,CustomerGroup FROM CustomerGroups", CustomerGroupId);
            mycl.FillListt("SELECT BranchId,Branch FROM Branchs", BranchId);
            mycl.FillListt("SELECT EmpCode,Empname_en FROM Emp where Jobid=3", SalesMan);
            mycl.FillListt("SELECT CityId,City FROM Citys", CityId);
          
      
           
            
            if (VCustomerId != null && VCustomerId != "N")
            {
                CustomerId.Text = VCustomerId;

                mycl.GetData("select * from Customer where CustomerId=N'" + VCustomerId + "'", CustomerId, Page.Controls);

            }
           
        }      
    }
    protected void BtnNew_Click(object sender, EventArgs e)
    {
        mycl.Clear(Page.Controls);

        Set_Page_Perm("Customer.aspx", true);
       
       
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
           string sl = null;
            string r = null;
            r = mycl.Exec_scalar("select CustomerId From Customer where CustomerId=N'" + CustomerId.Text + "'");

            if (r != "0")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :Invalid Data :Customer Id Already Exist')", true);
                CustomerId.Focus();
                return;
            }
            r = mycl.Exec_scalar("select CustomerId From Customer where CustomerName_en=N'" + CustomerName_En.Text + "' or CustomerName_Ar==N'" + CustomerName_Ar.Text + "'");

            if (r != "0")
            {
               
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :Invalid Data :Customer Name Already Exist')", true);
                CustomerName_En.Focus();
                return;
            }
          
            try
            {
                mycl.BeginTran();


                sl = mycl.Insert("Customer", Page.Controls);
                mycl.Execute(sl);


                //sl = "INSERT INTO Acctb(AccCode,AccName_en,AccName_ar,Sup_AccCode,InsertBy )VALUES(N'";
                //sl += CustomerId.Text + "',N'";
                //sl += CustomerName_En.Text + "',N'";
                //sl += CustomerName_Ar.Text + "',N'";
                //sl += CustomerTypeId.SelectedValue.ToString() + "',";
                //sl += System.Web.HttpContext.Current.Session ["userid"].ToString() + ")";
                //mycl.Execute(sl);



                sl = mycl.InsertTbLog("Customer Addition", "insert", "Customer", "Customer.aspx", CustomerId.Text);
                mycl.Execute(sl);

                mycl.mytrancommit();
                mycl.Clear(Page.Controls);
              
                Response.Redirect(Request.Url.ToString(), false);
            }
            catch (Exception ex)
            {
                mycl.mytrayrollback();
               ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex.Message  + "')", true);

            }
     }
   
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            mycl.BeginTran();


            string sl = "";
            sl = mycl.update("Customer", Page.Controls, "CustomerId", int.Parse(CustomerId.Text));
            mycl.Execute(sl);
          

            sl = mycl.InsertTbLog("Customer Update", "Update", "Customer", "Customer.aspx", CustomerId.Text);
            mycl.Execute(sl);
            mycl.Execute("update Acctb set Smanid=N'" + Smanid.Text + "' where AccCode=N'" + CustomerId.Text  + "'");
            mycl.mytrancommit();

            BtnNew_Click(sender, e);
          

        }
        catch (Exception ex)
        {
            mycl.mytrayrollback();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex.Message + "')", true);
           

        }
        
    }
  
  
    protected void Active_CheckedChanged(object sender, EventArgs e)
    {
        if (Active.Checked == true)
            Active.ForeColor = System.Drawing.Color.Green ;
        else
            Active.ForeColor = System.Drawing.Color.Red;
    }
   
   
    protected void BtnChangeCrditlimit_Click(object sender, EventArgs e)
    {
        string sl = "Update Customer set Crdtlmt=" + Crdtlmt.Text + " Where customerid=N'" + CustomerId.Text  + "'";
        mycl.Execute(sl);
    }
    protected void SalesMan_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (SalesMan.SelectedValue != "0")
            Smanid.Text = SalesMan.SelectedValue.ToString();
    }
    protected void Smanid_TextChanged(object sender, EventArgs e)
    {
        SalesMan.SelectedValue = "0";
        if (CustomerId.Text != "")
        {
           
            try
            {
                SalesMan.SelectedValue = Smanid.Text;
            }
            catch (Exception)
            {

                SalesMan.SelectedValue = "0";
            }

        }
    }
    protected void BtnPdf_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton b = (ImageButton)sender;
        GridViewRow r = (GridViewRow)b.NamingContainer;
        string fname = mycl.Exec_scalar("select MyFil_name from Customer_Documents where Serial=" + r.Cells[0].Text);

   
       Response.Redirect("~/Customer Files/" + fname);
    }
   


    protected void Grid_Cust_docs_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
  

    protected string GetCustomerId(string sss)
    {
            string sl = "select top 1 AccCode from acctb where Sup_AccCode=N'" + sss + "' order by Serial desc";
            string r = mycl.Exec_scalar(sl);
            string newCust_code;
            if (r == "0")
            {
                newCust_code = sss + "00001";
            }
            else
            {
                int n = int.Parse(r.Substring(4, 5));
                newCust_code = sss + (n + 1).ToString().PadLeft(5, '0');

            }
            return  newCust_code;
    }

    protected void CustomerName_Ar_TextChanged(object sender, EventArgs e)
    {

    }
    protected void BtnFirst_Click(object sender, EventArgs e)
    {
        string v = mycl.Exec_scalar("Select  min(Customerid) from Customer " );
        CustomerId.Text = v;
        MoveToRecord();

    }
    protected void BtnPrev_Click(object sender, EventArgs e)
    {
        string v;
        if (CustomerId.Text == "")
            v = mycl.Exec_scalar("Select  max(CustomerId) from Customer " );
        else

            v = mycl.Exec_scalar("Select  top 1 (CustomerId) from Customer  where  CustomerId<" + CustomerId.Text + " order by CustomerId desc");

        if (v != "0")
        {
            CustomerId.Text = v;
            MoveToRecord();
        }
    }
    protected void BtnNext_Click(object sender, EventArgs e)
    {
        string v;
        if (CustomerId.Text == "")
            v = "1";
        else
            v = mycl.Exec_scalar("Select  top 1 (CustomerId) from Customer  where  CustomerId >" + CustomerId.Text + " order by CustomerId asc");
        if (v != "0")
        {
            CustomerId.Text = v;
            MoveToRecord();
        }

    }
    protected void Btnlast_Click(object sender, EventArgs e)
    {
        string v = mycl.Exec_scalar("Select  max(Customerid) from Customer " );
        CustomerId.Text = v;
        MoveToRecord();

    }
    protected void BtnSearchEmp_Click(object sender, EventArgs e)
    {
        string r;
        string sl = mycl.Search("Customer", "select * from Customer", Page.Controls, "Customerid");



        Session.Add("All_Customer", sl + " order by Customerid  asc");

        sl = mycl.InsertTbLog("Customer  Search", "Search", "Customer", "Customer.aspx", "0");
        mycl.Execute(sl);

        mycl.Redirect("CustomerData.aspx", "_blank", "menubar=0,width=900,height=900");
    }
    protected void BtnShowReport_Click(object sender, EventArgs e)
    {

    }
    protected void CustomerId_TextChanged(object sender, EventArgs e)
    {
        if (CustomerId.Text == "")
            return;
       
        string r = mycl.Exec_scalar("select CustomerId From Customer where CustomerId=N'" + CustomerId.Text + "'");

       
        if (r == "0")
        {
            string temp_empno = CustomerId.Text;
            mycl.Clear(Page.Controls);
            CustomerId.Text = temp_empno;
          
            CustomerName_En.Focus();
            return;
        }
        MoveToRecord();
        HyId_TextChanged(sender, e);
    }
    protected void HyId_TextChanged(object sender, EventArgs e)
    {
        if (HyId.Text != "")
            Hy.Text = mycl.Exec_scalar("Select Hy From Hys where Hyid=" + HyId.Text);
        
    }
    protected void Hy_TextChanged(object sender, EventArgs e)
    {
        if (Hy.Text != "")
            HyId.Text = mycl.Exec_scalar("Select Hyid From Hys where Hy=N'" + Hy.Text + "'");
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataTable tbcut;
        tbcut = mycl.GetTable("Select customerid,smanid from customer");

        for (int j = 0; j < tbcut.Rows.Count; j++)
        {
            mycl.Execute("update Acctb set Smanid=N'" + tbcut.Rows[j][1].ToString() + "' where AccCode=N'" +  tbcut.Rows[j][0].ToString() + "'");
        }
    }
}