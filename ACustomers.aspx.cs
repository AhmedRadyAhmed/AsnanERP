using System;
using System.Data ;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ACustomers : System.Web.UI.Page
{
    MyAdo mycl = new MyAdo();

    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
           server control at run time. */
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
    protected void Page_Load(object sender, EventArgs e)
    {
        mycl.Begin();
      
        string VCustomerId = Request.QueryString["CustomerId"];
        if (IsPostBack == false)
        {
            mycl.FillListt("SELECT BussTypeId,BussType FROM BussTypes", BussTypeId);
            mycl.FillListt("SELECT CustomerGroupId,CustomerGroup FROM CustomerGroups", CustomerGroupId);
            mycl.FillListt("SELECT BranchId,Branch FROM Branchs", BranchId);
            mycl.FillListt("SELECT CityId,City FROM Citys", CityId);
            mycl.FillListt("SELECT HyId,Hy FROM Hys", HyId );
           
            
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
       
       
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
           string sl = null;
            string r = null;
            r = mycl.Exec_scalar("select AccCode From Acctb where AccCode=N'" + CustomerId.Text + "'");

            if (r == "0")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :This Customer s not Exist in Account. Create Account First')", true);
                CustomerId.Focus();
                return;
            }

            r = mycl.Exec_scalar("select CustomerId From Customer where CustomerId=N'" + CustomerId.Text + "'");

            if (r == "0")
            {

                try
                {
                    mycl.BeginTran();


                    sl = mycl.Insert("Customer", Page.Controls);
                    mycl.Execute(sl);

                    sl = mycl.InsertTbLog("Customer Addition", "insert", "Customer", "Customer.aspx", CustomerId.Text);
                    mycl.Execute(sl);

                    mycl.mytrancommit();
                    mycl.Clear(Page.Controls);

                    Response.Redirect(Request.Url.ToString(), false);
                }
                catch (Exception ex)
                {
                    mycl.mytrayrollback();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex.Message + "')", true);

                }
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

                    mycl.mytrancommit();

                    BtnNew_Click(sender, e);


                }
                catch (Exception ex)
                {
                    mycl.mytrayrollback();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex.Message + "')", true);


                }
        
    }
   
  
   
   
    
    protected void BtnPdf_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton b = (ImageButton)sender;
        GridViewRow r = (GridViewRow)b.NamingContainer;
        string fname = mycl.Exec_scalar("select MyFil_name from Customer_Documents where Serial=" + r.Cells[0].Text);

   
       Response.Redirect("~/Customer Files/" + fname);
    }
   


    protected void BtnFirst_Click(object sender, EventArgs e)
    {
        string v = mycl.Exec_scalar("Select  min(Customerid) from Customer " );
        CustomerId.Text = v;
      

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
           
        }

    }
    protected void Btnlast_Click(object sender, EventArgs e)
    {
        string v = mycl.Exec_scalar("Select  max(Customerid) from Customer " );
        CustomerId.Text = v;
      

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

        CustomerNameEn.Text = mycl.Exec_scalar("select AccName_en From Acctb where AccCode=N'" + CustomerId.Text + "'");
        SmanName.Text = mycl.Exec_scalar("select AccName_Ar From Acctb where AccCode=N'" + CustomerId.Text + "'");
        Crdtlmtt.Text = mycl.Exec_scalar("select Crdtlmt From Acctb where AccCode=N'" + CustomerId.Text + "'");
        Smaniddd.Text = mycl.Exec_scalar("select Smanid From Acctb where AccCode=N'" + CustomerId.Text + "'");
        SmanName.Text = mycl.Exec_scalar("select Empname_en From Emp where EmpCode=N'" + Smaniddd.Text + "'");
        string r = mycl.Exec_scalar("select CustomerId From Customer where CustomerId=N'" + CustomerId.Text + "'");
        string oldcust_srsh=CustomerId.Text ;
        if (r == "0")
        {
            mycl.Clear(Page.Controls);
           
            CustomerId.Text=oldcust_srsh;
           
                
            Set_Page_Perm("ACustomers.aspx", true);
            return;
        }
        else
        {
            Set_Page_Perm("ACustomers.aspx", false);
            mycl.GetData("select * from Customer where CustomerId=N'" + CustomerId.Text + "'", CustomerId, Page.Controls);

            CustomerNameEn.Text = mycl.Exec_scalar("select AccName_en From Acctb where AccCode=N'" + CustomerId.Text + "'");
            SmanName.Text = mycl.Exec_scalar("select AccName_Ar From Acctb where AccCode=N'" + CustomerId.Text + "'");
            Crdtlmtt.Text = mycl.Exec_scalar("select Crdtlmt From Acctb where AccCode=N'" + CustomerId.Text + "'");
            Smaniddd.Text = mycl.Exec_scalar("select Smanid From Acctb where AccCode=N'" + CustomerId.Text + "'");
            SmanName.Text = mycl.Exec_scalar("select Empname_en From Emp where EmpCode=N'" + Smaniddd.Text + "'");

            string sl = mycl.InsertTbLog("Customer Search", "Search", "Customer", "Customer.aspx", CustomerId.Text);
            mycl.Execute(sl);
        }
    }
}