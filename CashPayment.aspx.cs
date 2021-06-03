 using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class CashPayment : System.Web.UI.Page
{
    MyAdo mycl = new MyAdo();
    string VCompId = null;
    string VBranchId = null;
    string VCondition = null;
    


    private void AddNewRowToGrid()
    {
       
        DataTable dt=null ;
        DataRow dr = null;
        if ( ViewState["CurrentTable"] == null )
        {
            dt = new DataTable();
            dt.Columns.Add(new DataColumn("AccCode", typeof(string)));
            dt.Columns.Add(new DataColumn("AccName", typeof(string)));
            dt.Columns.Add(new DataColumn("Amount", typeof(string)));
            dt.Columns.Add(new DataColumn("JDesc", typeof(string)));
            dt.Columns.Add(new DataColumn("itm_inv_order", typeof(string)));
        }
        else
        {
            dt = (DataTable)ViewState["CurrentTable"];
            if (txtRowindex.Text != "")
            {
                dt.Rows[int.Parse(txtRowindex.Text)].Delete();
                dt.AcceptChanges();
                ViewState["CurrentTable"] = dt;
            }
        }
        dr = dt.NewRow();
        dr["AccCode"] = AccCode.Text;
        dr["AccName"] = AccName.Text;
        dr["Amount"] = Amount.Text;
     
        dr["JDesc"] = JDesc.Text;


        dr["itm_inv_order"] = mycl.Get_ServerDate(true);

        dt.Rows.Add(dr);

        DataView dtvvv = new DataView(dt);
        dtvvv.Sort = "itm_inv_order Asc";
        dt = dtvvv.ToTable();

        Grid.DataSource = dt;
        Grid.DataBind();
      

        ViewState["CurrentTable"] = dt;
        AccCode.Text = "";
        AccName.Text = "";
    
        Amount.Text = "";
      

        JDesc.Text = "";
        txtRowindex.Text = "";
        AccCode.Focus();
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
    protected void Ref_summary()
    {
        double  vtotAmount = 0;
       
        DataTable tb = (DataTable)ViewState["CurrentTable"];
        for (int i = 0; i < tb.Rows.Count; i++)
        {
            if (tb.Rows[i][2].ToString() != "")
                vtotAmount += mycl.DblValue(tb.Rows[i][2].ToString());
          
        }
        TotAmount.Text = vtotAmount.ToString();
        NoCount.Text = Grid.Rows.Count.ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        mycl.Begin();
        VCompId = System.Web.HttpContext.Current.Session["compid"].ToString();
        VBranchId = System.Web.HttpContext.Current.Session["branchid"].ToString();
        VCondition = " where  Compid='" + VCompId + "' and BranchId='" + VBranchId + "'";
        if (!Page.IsPostBack)
        {
            BtnNew_Click(sender, e);
        }
    }
    protected void MoveToRecord(int i)
    {
        Set_Page_Perm("CashPayment.aspx", false);
        CashMasId.Text = i.ToString();
        mycl.GetData("select * from CashPaymentmas " + VCondition + " and Doctypeid=16 And CashMasId=" + CashMasId.Text, CashMasId, Page.Controls);

        string r = mycl.Exec_scalar("Select Accname_en From Acctb where  AccCode=N'" + CAccCode.Text + "'");
        CAccName.Text = r;


        DataTable dt = mycl.GetTable("select acccode, AccName,amount,jdesc ,itm_inv_order from VcashpaymentDet " + VCondition + "  and Doctypeid=16 and DocNo=" + CashMasId.Text);

        Grid.DataSource = dt;
        Grid.DataBind();
      
        
        ViewState["CurrentTable"] = dt;
        Ref_summary();
    }
    protected void BtnFirst_Click(object sender, EventArgs e)
    {
        int v = mycl.GetId("Select  min(CashMasId) from CashPaymentmas " + VCondition + " And Doctypeid=16");
        MoveToRecord(v);
    }
    protected void BtnPrev_Click(object sender, EventArgs e)
    {
        int v;
        if (CashMasId.Text == "")
            v = mycl.GetId("Select  max(CashMasId) from CashPaymentmas " + VCondition +  "  and Doctypeid=16");
        else
            v = mycl.GetId("Select  top 1 (CashMasId) from CashPaymentmas "  + VCondition +  "  and Doctypeid=16 and CashMasId<" + CashMasId.Text + " order by CashMasId desc");
        if(v!=0)
            MoveToRecord(v);

    }
    protected void BtnNext_Click(object sender, EventArgs e)
    {
        int v;
        if (CashMasId.Text == "")
            v = 1;
        else
            v = mycl.GetId("Select  top 1 (CashMasId) from CashPaymentmas " + VCondition + "  and Doctypeid=16 and CashMasId>" + CashMasId.Text + " order by CashMasId asc");
        if (v != 0)
            MoveToRecord(v);
    }
    protected void Btnlast_Click(object sender, EventArgs e)
    {
        int v = mycl.GetId("Select  max(CashMasId) from CashPaymentmas " + VCondition + "  and Doctypeid=16");
        MoveToRecord(v);
    }
    protected void BtnNew_Click(object sender, EventArgs e)
    {
        mycl.Clear(Page.Controls);
        Set_Page_Perm("CashPayment.aspx", true);
        int Maxserial = mycl.GetId("Select  max(CashMasId) from CashPaymentmas ");
        CashMasId.Text = (Maxserial + 1).ToString();
        VrDate.Text = mycl.Get_ServerDate(true);
      
        CAccName.Text = "";
        AccName.Text = "";
        ViewState["CurrentTable"] = null;
        Grid.DataSource =(DataTable ) ViewState["CurrentTable"];
        Grid.DataBind();
     
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        DataTable tb = (DataTable)ViewState["CurrentTable"];
        if (Grid.Rows.Count == 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :There is no  Entries')", true);
            AccCode.Focus();
            return;
        }

       
        try
        {
            mycl.BeginTran();
            CompId.Text = System.Web.HttpContext.Current.Session ["compid"].ToString();
            BranchId.Text = System.Web.HttpContext.Current.Session["branchid"].ToString();
            DocTypeId.Text  = "16";
            string v_CashMasId = mycl.Exec_scalar("select max(CashMasId)+1 from CashPaymentmas");
            CashMasId.Text = v_CashMasId;
            string sl = mycl.Insert("CashPaymentmas", Page.Controls);
            mycl.Execute(sl);

            int Maxserial = mycl.GetId("Select  max(CashMasId) from CashPaymentmas ");

            sl = mycl.InsertTbLog("CashPaymentmas Entry Addition", "insert", "CashPaymentmas", "CashPayment.aspx", Maxserial.ToString());
            mycl.Execute(sl);
            //---------------------------------------------insert into journal--------------------------------------------------------------------------------
            for (int i = 0; i < tb.Rows.Count; i++)
            {
                string sl_grid = "INSERT INTO CashPaymentdet (  AccCode,Amount , Jdesc , itm_inv_order,DocNo,Doctypeid,Docdate , CompId , BranchId  ) VALUES (N'";
                sl_grid += tb.Rows[i][0].ToString() + "',";
                sl_grid += tb.Rows[i][2].ToString() + ",N'";
                sl_grid += tb.Rows[i][3].ToString() + "','";
                sl_grid += tb.Rows[i][4].ToString() + "',";
                sl_grid += Maxserial + ",";
                sl_grid +=  "16,'";
                sl_grid += VrDate.Text + "',";  //pricee

                sl_grid += CompId.Text + ",";
                sl_grid += BranchId.Text + ")";
                mycl.Execute(sl_grid);
            }
            //---------------------------------------------insert into journal--------------------------------------------------------------------------------

            mycl.insert_Journal(CAccCode.Text, Maxserial.ToString(), "16", "0", TotAmount.Text, VrDesc.Text, VrDate.Text);//16 cash Payment
            //---------------------------------------------journal Detail---------------------------------------------------------------------------------------
            for (int i = 0; i < tb.Rows.Count; i++)
            {
                mycl.insert_Journal(tb.Rows[i][0].ToString(), Maxserial.ToString(), "16", tb.Rows[i][2].ToString(), "0", tb.Rows[i][3].ToString(), VrDate.Text);//16 cash Payment
            }
            
            mycl.mytrancommit();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Data Saved')", true);
            CashMasId.Text = mycl.Exec_scalar("Select  max(CashMasid) from CashPaymentmas ");
            BtnSave.Visible = false;
            return;
        }
        catch (Exception ex)
        {
            mycl.mytrayrollback();
        }
    }
    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        if (CashMasId.Text != "" && mycl.ISNumber(CashMasId.Text) == true)
        {
             MoveToRecord(int.Parse(CashMasId.Text)); 
        }
    }
    
    protected void BtnDeleteGrid_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        if (AccCode.Text=="")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :Enter Account Number')", true);
            AccCode.Focus();
            return;
        }

        string r = null;
        r = mycl.Exec_scalar("select AccCode From Acctb where AccCode=N'" + AccCode.Text + "'");

        if (r == "0")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :Invalid Item Number')", true);
            AccCode.Focus();
            return;
        }
        if (Amount.Text == "")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :Enter Amount')", true);
            Amount.Focus();
            return;
        }

        if (mycl.ISNumber(Amount.Text) == false)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :Invalid Amount')", true);
            Amount.Focus();
            return;
        }
        if (mycl.DblValue (Amount.Text) < 0 )
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :Invalid Amount, Must be Positive Value')", true);
            Amount.Focus();
            return;
        }
      
       
        AddNewRowToGrid();
        Ref_summary();
      
    }
    protected void BtnGridDel_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton b = (ImageButton)sender;
        GridViewRow r = (GridViewRow)b.NamingContainer;
        Grid.DeleteRow(r.RowIndex);
        txtRowindex.Text = "";
    }
    protected void Grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataTable dt =(DataTable ) ViewState["CurrentTable"];
        dt.Rows[e.RowIndex].Delete();
        dt.AcceptChanges();
        ViewState["CurrentTable"] = dt;
        Grid.DataSource = dt;
        Grid.DataBind();
        Ref_summary();
    }
    protected void BtnGridSelect_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton b = (ImageButton)sender;
        GridViewRow r = (GridViewRow)b.NamingContainer;
       
        txtRowindex.Text = r.RowIndex.ToString();
        AccCode.Text = r.Cells[2].Text;
        AccName.Text = r.Cells[3].Text;
        Amount.Text = r.Cells[4].Text;
      
        if (r.Cells[5].Text != " ")
            JDesc.Text = r.Cells[5].Text;
        else
            JDesc.Text = "";
       
    }
    protected void AccCode_TextChanged(object sender, EventArgs e)
    {
        AccName.Text = "";
        if (AccCode.Text != "")
        {
            string r = mycl.Exec_scalar("Select Accname_en From Acctb where AccCode like N'1112%' and AccCode=N'" + AccCode.Text + "'");
            AccName.Text = r;
            if (r == "0")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :Invalid Account Number')", true);
                AccCode.Text = "";
                AccName.Text = "";
                AccCode.Focus();
                return;
            }
            Amount.Focus();
        }
    }
    protected void Grid_SelectedIndexChanged(object sender, EventArgs e)
    {

    }


    protected void Grid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       
    }
    protected void Grid_DataBound(object sender, EventArgs e)
    {
      
    }
    protected void JDesc_TextChanged(object sender, EventArgs e)
    {
        BtnAdd_Click(sender, e);
    }
    protected void BtnLook_Click(object sender, EventArgs e)
    {
       
    }

    protected void BtnSearchAccount_Click(object sender, EventArgs e)
    {

    }
    protected void BtnPrint_Click(object sender, EventArgs e)
    {
        mycl.PrintReport("select * from v_journal where VrNom=" + CashMasId.Text, "Journal");

    }
   
    protected void BtnShowReport_Click(object sender, EventArgs e)
    {
        Session.Remove("sess_repsql");
       string sl = "select * from VCashpaymentMas " + VCondition + " and Doctypeid=16 and CashMasId=" + CashMasId.Text ;
       mycl.Redirect("Crystal2.aspx?repsql=" + sl + "&repname=" + "CashPayments", "_blank", "menubar=0,width=900,height=900");
    }
   
    protected void CAccCode_TextChanged(object sender, EventArgs e)
    {
        if (CAccCode.Text != "")
        {
            string r = mycl.Exec_scalar("Select Accname_en From Acctb where AccCode=N'" + CAccCode.Text + "'");
            CAccName.Text = r;
        
        }
    }
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        DataTable tb = (DataTable)ViewState["CurrentTable"];
        if (Grid.Rows.Count == 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :There is no  Entries')", true);
            AccCode.Focus();
            return;
        }


        try
        {
            mycl.BeginTran();
            CompId.Text = System.Web.HttpContext.Current.Session["compid"].ToString();
            BranchId.Text = System.Web.HttpContext.Current.Session["branchid"].ToString();
            DocTypeId.Text = "16";
            string sl = mycl.update("CashPaymentmas", Page.Controls, VCondition + " And Doctypeid=16 and CashMasid=" + CashMasId.Text);
            mycl.Execute(sl);



            sl = mycl.InsertTbLog("CashPaymentmas Update", "Update", "CashPaymentmas", "CashPayment.aspx", CashMasId.Text);
            mycl.Execute(sl);
            //-----------------------------------------------------------------------------------------------------------------------------------------------
            mycl.Execute("Delete from CashPaymentdet " + VCondition + " And Doctypeid=16 and DocNo=" + CashMasId.Text);
            mycl.Execute("Delete from JournalDet " + VCondition + "  And Doctypeid=16 and DocNo=" + CashMasId.Text);
            //---------------------------------------------insert into CashPaymentdet--------------------------------------------------------------------------------
            for (int i = 0; i < tb.Rows.Count; i++)
            {
                string sl_grid = "INSERT INTO CashPaymentdet (  AccCode,Amount , Jdesc ,itm_inv_order, DocNo,Doctypeid,Docdate , CompId , BranchId  ) VALUES (N'";
                sl_grid += tb.Rows[i][0].ToString() + "',";
                sl_grid += tb.Rows[i][2].ToString() + ",N'";
                sl_grid += tb.Rows[i][3].ToString() + "','";
                sl_grid += tb.Rows[i][4].ToString() + "',";
                sl_grid += CashMasId.Text + ",";
                sl_grid += "16,'";
                sl_grid += VrDate.Text  + "',";  //pricee

                sl_grid += CompId.Text + ",";
                sl_grid += BranchId.Text + ")";
                mycl.Execute(sl_grid);
            }
            //---------------------------------------------insert into journal--------------------------------------------------------------------------------

            mycl.insert_Journal(CAccCode.Text, CashMasId.Text, "16", "0", TotAmount.Text, VrDesc.Text,VrDate.Text );//16 cash Recieve
            //---------------------------------------------journal Detail---------------------------------------------------------------------------------------
            for (int i = 0; i < tb.Rows.Count; i++)
            {
                mycl.insert_Journal(tb.Rows[i][0].ToString(), CashMasId.Text, "16", tb.Rows[i][2].ToString(), "0", tb.Rows[i][3].ToString(), VrDate.Text);//16 cash Recieve
            }

            mycl.mytrancommit();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Data Saved')", true);

            return;
        }
        catch (Exception ex)
        {
            mycl.mytrayrollback();
        }
    }
    protected void Grid_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dt = (DataTable)ViewState["CurrentTable"];
        DataView dtv = dt.DefaultView;
        string strSortOrder = "";
        if (ViewState["SortOrder"] == null)
        {
            ViewState["SortOrder"] = "asc";
        }
        if (ViewState["SortOrder"].ToString() == "asc")
        {
            ViewState["SortOrder"] = "desc";
            strSortOrder = "desc";
        }
        else if (ViewState["SortOrder"].ToString() == "desc")
        {
            ViewState["SortOrder"] = "asc";
            strSortOrder = "asc";
        }

        dtv.Sort = e.SortExpression + " " + strSortOrder;
        dt = dtv.ToTable();
        Grid.DataSource = dt;
        Grid.DataBind();
        ViewState["CurrentTable"] = dt;
    }
    protected void VoucherNum_TextChanged(object sender, EventArgs e)
    {
        BtnSearch_Click(sender, e);
    }
}
