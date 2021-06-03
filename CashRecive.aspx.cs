    using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class CashRecive : System.Web.UI.Page
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

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> Getaccountnumber(string prefixText)
    {
        DataTable dt = new DataTable();
        string constr = ConfigurationManager.ConnectionStrings["Myconnection"].ToString();
        SqlConnection con = new SqlConnection(constr);

        SqlCommand cmd = new SqlCommand("select AccCode from acctb where AccCode like N'1111%' and AccCode like @accid+'%'", con);
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
    protected void Page_Load(object sender, EventArgs e)
    {
        mycl.Begin();
        VCompId = System.Web.HttpContext.Current.Session["compid"].ToString();
        VBranchId = System.Web.HttpContext.Current.Session["branchid"].ToString();
        VCondition = " where  Compid='" + VCompId + "' and BranchId='" + VBranchId + "'";
        if (!Page.IsPostBack)
        {
            BtnNew_Click(sender, e);
            mycl.FillListt("SELECT CustTypeId,CustType FROM Cust_Type_Comm ", CustTypeId );
        }
    }
    protected void MoveToRecord(int i)
    {
        Set_Page_Perm("CashRecive.aspx", false );
        CashMasId.Text = i.ToString();
        mycl.GetData("select * from CashMas " + VCondition + " and Doctypeid=15 And CashMasId=" + CashMasId.Text, CashMasId, Page.Controls);
          
        InsertByy.Text = mycl.Exec_scalar("select insertBy from CashMas " + VCondition + " and Doctypeid=15 And CashMasId=" + CashMasId.Text);
        InsertDatee.Text = mycl.Exec_scalar("select InsertDate from CashMas " + VCondition + " and Doctypeid=15 And CashMasId=" + CashMasId.Text);
        UpdateByy.Text = mycl.Exec_scalar("select UpdateBy from CashMas " + VCondition + " and Doctypeid=15 And CashMasId=" + CashMasId.Text);
        UpdateDatee.Text = mycl.Exec_scalar("select UpdateDate from CashMas " + VCondition + " and Doctypeid=15 And CashMasId=" + CashMasId.Text);

        string r = mycl.Exec_scalar("Select Accname_en From Acctb where  AccCode=N'" + CAccCode.Text + "'");
        CAccName.Text = r;
        SmanName.Text = mycl.Exec_scalar("select Empname_en from Emp  where Empcode=N'" + SmanId.Text + "'");

        DataTable dt = mycl.GetTable("select acccode, AccName,amount,jdesc,itm_inv_order  from VcashDet " + VCondition + "  and Doctypeid=15 and DocNo=" + CashMasId.Text);

        Grid.DataSource = dt;
        Grid.DataBind();
        ViewState["CurrentTable"] = dt;
        Ref_summary();
    }
    protected void BtnFirst_Click(object sender, EventArgs e)
    {

        int v = mycl.GetId("Select  min(CashMasId) from CashMas " + VCondition + " And Doctypeid=15");
        MoveToRecord(v);
    }
    protected void BtnPrev_Click(object sender, EventArgs e)
    {
          int v;
        if (CashMasId.Text == "")
            v = mycl.GetId("Select  max(CashMasId) from CashMas " + VCondition +  "  and Doctypeid=15");
        else
            v = mycl.GetId("Select  top 1 (CashMasId) from CashMas "  + VCondition +  "  and Doctypeid=15 and CashMasId<" + CashMasId.Text + " order by CashMasId desc");
        if(v!=0)
            MoveToRecord(v);

    }
    protected void BtnNext_Click(object sender, EventArgs e)
    {
        int v;
        if (CashMasId.Text == "")
            v = 1;
        else
            v = mycl.GetId("Select  top 1 (CashMasId) from CashMas " + VCondition + "  and Doctypeid=15 and CashMasId>" + CashMasId.Text + " order by CashMasId asc");
        if (v != 0)
            MoveToRecord(v);
    }
    protected void Btnlast_Click(object sender, EventArgs e)
    {
        int v = mycl.GetId("Select  max(CashMasId) from CashMas " + VCondition + "  and Doctypeid=15");
        MoveToRecord(v);
    }
    protected void BtnNew_Click(object sender, EventArgs e)
    {
        mycl.Clear(Page.Controls);
        Set_Page_Perm("CashRecive.aspx", true);

        int Maxserial = mycl.GetId("Select  max(CashMasId) from CashMas ");
        CashMasId.Text = (Maxserial + 1).ToString();
        VrDate.Text = mycl.Get_ServerDate(true);
      
        SmanName.Text = "";
        CAccName.Text = "";
        AccName.Text = "";
        ViewState["CurrentTable"] = null;
        Grid.DataSource =(DataTable ) ViewState["CurrentTable"];
        Grid.DataBind();
     
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        if (CAccCode.Text == "" || CAccName.Text =="0")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :Invalid Account Number')", true);
            CAccCode.Focus();
            return;
        }

        if (SmanId.Text == "" || SmanName.Text == "0")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :Invalid Sales Man')", true);
            SmanId.Focus();
            return;
        }

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
            DocTypeId.Text  = "15";
            string v_CashMasId = mycl.Exec_scalar("select max(CashMasId)+1 from CashMas");
            CashMasId.Text = v_CashMasId;
            string sl = mycl.Insert("CashMas", Page.Controls);
            mycl.Execute(sl);

            int Maxserial = mycl.GetId("Select  max(CashMasId) from CashMas ");

            sl = mycl.InsertTbLog("CashMas Entry Addition", "insert", "CashMas", "CashRecive.aspx", Maxserial.ToString());
            mycl.Execute(sl);
            //---------------------------------------------insert into journal--------------------------------------------------------------------------------
            for (int i = 0; i < tb.Rows.Count; i++)
            {
                string sl_grid = "INSERT INTO CashDet (  AccCode,Amount , Jdesc , DocNo,Doctypeid,Docdate , CompId , BranchId,itm_inv_order  ) VALUES (N'";
                sl_grid += tb.Rows[i][0].ToString() + "',";
                sl_grid += tb.Rows[i][2].ToString() + ",N'";
                sl_grid += tb.Rows[i][3].ToString() + "',";
                
                sl_grid += Maxserial + ",";
                sl_grid +=  "15,'";
                sl_grid += VrDate.Text + "',";  //pricee

                sl_grid += CompId.Text + ",";
                sl_grid += BranchId.Text + ",'";
                sl_grid += tb.Rows[i][4].ToString() + "')";
                mycl.Execute(sl_grid);
            }
            //---------------------------------------------insert into journal--------------------------------------------------------------------------------

            mycl.insert_Journal(CAccCode.Text, Maxserial.ToString(), "15", TotAmount.Text, "0", VrDesc.Text, VrDate.Text);//15 cash Recieve
            //---------------------------------------------journal Detail---------------------------------------------------------------------------------------
            for (int i = 0; i < tb.Rows.Count; i++)
            {
                mycl.insert_Journal(tb.Rows[i][0].ToString(), Maxserial.ToString(), "15", "0", tb.Rows[i][2].ToString(), tb.Rows[i][3].ToString(), VrDate.Text);//15 cash Recieve
            }

            mycl.mytrancommit();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Data Saved')", true);
            CashMasId.Text = mycl.Exec_scalar("Select  max(CashMasid) from CashMas ");
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
      
        if (r.Cells[6].Text != " ")
            JDesc.Text = r.Cells[6].Text;
        else
            JDesc.Text = "";

      
       
    }
    protected void AccCode_TextChanged(object sender, EventArgs e)
    {
        AccName.Text = "";
        if (AccCode.Text != "")
        {
            string r = mycl.Exec_scalar("Select Accname_en From Acctb where AccCode like N'112%' and AccCode=N'" + AccCode.Text + "'");
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
       string sl = "select * from VCashMas " + VCondition + " and doctypeid=15 and CashMasId=" + CashMasId.Text ;
       mycl.Redirect("Crystal2.aspx?repsql=" + sl + "&repname=" + "CashRecieve", "_blank", "menubar=0,width=900,height=900");
    }
    protected void SmanId_TextChanged(object sender, EventArgs e)
    {
        SmanName.Text = "";
        if (SmanId.Text == "")
            return;
        SmanName.Text = mycl.Exec_scalar("select Empname_en from Emp  where Empcode=N'" + SmanId.Text + "'");
        if(SmanName.Text =="0")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :Invalid Sales man Number')", true);
            SmanId.Text = "";
        }
    }
    protected void CAccCode_TextChanged(object sender, EventArgs e)
    {
        CAccName.Text = "";
        if (CAccCode.Text != "")
        {
            string r = mycl.Exec_scalar("Select Accname_en From Acctb where AccCode like N'1111%' and AccCode=N'" + CAccCode.Text + "'");
            CAccName.Text = r;
            if (r == "0")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :Invalid Account Number')", true);
                CAccCode.Text = "";
                CAccName.Text = "";
                CAccCode.Focus();
                return;
            }
            SmanId.Focus();
        }
    }
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        if (CAccCode.Text == "" || CAccName.Text == "0")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :Invalid Account Number')", true);
            CAccCode.Focus();
            return;
        }

        if (SmanId.Text == "" || SmanName.Text == "0")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :Invalid Sales Man')", true);
            SmanId.Focus();
            return;
        }

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
            DocTypeId.Text = "15";
            string sl = mycl.update("CashMas", Page.Controls, VCondition + " and CashMasid=" + CashMasId.Text);
            mycl.Execute(sl);



            sl = mycl.InsertTbLog("CashMas Update", "Update", "CashMas", "CashRecive.aspx", CashMasId.Text);
            mycl.Execute(sl);
            //-----------------------------------------------------------------------------------------------------------------------------------------------
            mycl.Execute("Delete from CashDet " + VCondition + " And Doctypeid=15 and DocNo=" + CashMasId.Text);
            mycl.Execute("Delete from JournalDet " + VCondition + "  And Doctypeid=15 and DocNo=" + CashMasId.Text);
            //---------------------------------------------insert into CashDet--------------------------------------------------------------------------------
            for (int i = 0; i < tb.Rows.Count; i++)
            {
                string sl_grid = "INSERT INTO CashDet (  AccCode,Amount , Jdesc , DocNo,Doctypeid,Docdate , CompId , BranchId ,itm_inv_order ) VALUES (N'";
                sl_grid += tb.Rows[i][0].ToString() + "',";
                sl_grid += tb.Rows[i][2].ToString() + ",N'";
                sl_grid += tb.Rows[i][3].ToString() + "',";
                sl_grid += CashMasId.Text + ",";
                sl_grid += "15,'";
                sl_grid += VrDate.Text  + "',";  //pricee

                sl_grid += CompId.Text + ",";
                sl_grid += BranchId.Text + ",'";
                sl_grid += tb.Rows[i][4].ToString() + "')";
                mycl.Execute(sl_grid);
            }
            //---------------------------------------------insert into journal--------------------------------------------------------------------------------

            mycl.insert_Journal(CAccCode.Text, CashMasId.Text, "15", TotAmount.Text, "0", VrDesc.Text,VrDate.Text );//15 cash Recieve
            //---------------------------------------------journal Detail---------------------------------------------------------------------------------------
            for (int i = 0; i < tb.Rows.Count; i++)
            {
                mycl.insert_Journal(tb.Rows[i][0].ToString(), CashMasId.Text, "15", "0", tb.Rows[i][2].ToString(), tb.Rows[i][3].ToString(), VrDate.Text);//15 cash Recieve
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
    protected void Grid_RowCreated(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[6].Visible = false;
    }
    protected void VoucherNum_TextChanged(object sender, EventArgs e)
    {
        BtnSearch_Click(sender, e);
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        string sl = "";
        if (mycl.ISNumber(txtSearch.Text )==true )
             sl = "select AccCode,AccName_en,AccName_ar from Acctb where AccCode like N'" + txtSearch.Text + "%'";
        else
            sl = "select AccCode,AccName_en,AccName_ar from Acctb where AccName_en like N'%" + txtSearch.Text + "%'  or AccName_ar like N'%" + txtSearch.Text + "%'";
        
        mycl.FillGrid(sl, GridView1);

        Lblcount.Text = GridView1.Rows.Count.ToString();
    }
    protected void VrDesc_TextChanged(object sender, EventArgs e)
    {

    }
    
    protected void Btn_Select_Click(object sender, EventArgs e)
    {
        Button b = (Button)sender;
        GridViewRow r = (GridViewRow)b.NamingContainer;
        if (Lblopt.Text == "1")
        {  
            CAccCode.Text = r.Cells[1].Text;
            CAccCode_TextChanged(sender, e);
            TabContainer1.ActiveTabIndex = 0;
            return;
        }
       
        if (Lblopt.Text == "2")
        {  
            SmanId.Text = r.Cells[1].Text;
            SmanId_TextChanged(sender, e);
            TabContainer1.ActiveTabIndex = 0;
            return;
        }

        if (Lblopt.Text == "3")
        {
            AccCode.Text = r.Cells[1].Text;
            AccCode_TextChanged(sender, e);
            TabContainer1.ActiveTabIndex = 0;
            return;
        }
        if (Lblopt.Text == "0")
        {
            if ( CAccCode.Text =="")
            { CAccCode.Text = r.Cells[1].Text;
            CAccCode_TextChanged(sender, e);
            }
               
            else if(AccCode.Text =="")
            {
            AccCode.Text = r.Cells[1].Text;
            AccCode_TextChanged(sender, e);
            }
                
        }
        TabContainer1.ActiveTabIndex = 0;
        
    }
   
    protected void BtnGridSelect0_Click(object sender, ImageClickEventArgs e)
    {
        GridView1.DataSource = null;
        GridView1.DataBind();
        Lblcount.Text = "";
        Lblopt.Text = "1";
        if (CAccCode.Text != "")
        {
            txtSearch.Text = CAccCode.Text;
            txtSearch_TextChanged(sender, e);
        }

        else
            txtSearch.Text = "";

      
        TabContainer1.ActiveTabIndex = 1;
    }
    protected void BtnGridSelect1_Click(object sender, ImageClickEventArgs e)
    {
       GridView1.DataSource = null;
        GridView1.DataBind();
        Lblcount.Text = "";
        Lblopt.Text = "3";
        if (AccCode.Text != "")
        {
            txtSearch.Text = AccCode.Text;
            txtSearch_TextChanged(sender, e);
        }

        else
            txtSearch.Text = "";

        TabContainer1.ActiveTabIndex = 1;
    
    }

    protected void Btn2_Click(object sender, ImageClickEventArgs e)
    {
        //GridView1.DataSource = null;
        //GridView1.DataBind();
        //Lblcount.Text = "";
        //Lblopt.Text = "2";
        //if (SmanId.Text != "")
        //{
        //    txtSearch.Text = SmanId.Text;
        //    txtSearch_TextChanged(sender, e);
        //}

        //else
        //    txtSearch.Text = "";


        //TabContainer1.ActiveTabIndex = 1;
    }
}
    