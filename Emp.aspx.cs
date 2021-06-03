using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

using System.Diagnostics;
using System.Globalization;


public partial class Emp : System.Web.UI.Page
{
    MyAdo mycl = new MyAdo();
    string VCompId = null;
    string VBranchId = null;
    string VCondition = null;

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
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
           server control at run time. */
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        mycl.Begin();
        VCompId = System.Web.HttpContext.Current.Session["compid"].ToString();
        VBranchId = System.Web.HttpContext.Current.Session["branchid"].ToString();
        VCondition = " where  Compid='" + VCompId  + "'";

        string VEmpCode = Request.QueryString["EmpCode"];
        if (IsPostBack == false)
        {
            mycl.FillListt("SELECT SocialStateId,SocialState FROM SocialStates", SocialStateId);
            mycl.FillListt("SELECT BranchId,Branch FROM Branchs", BranchId);
            mycl.FillListt("SELECT GenderId,Gender FROM Genders", GenderId);
            mycl.FillListt("SELECT JobId,job FROM jobs",JobId );
            mycl.FillListt("SELECT ShiftId,Shift FROM Shifts", ShiftId);
            mycl.FillListt("SELECT DepartmentId,Department FROM Departments", DepartmentId);
            mycl.FillListt("SELECT JobId,job FROM jobs", VisaJobId);
            mycl.FillListt("SELECT KafilId,KafilName FROM Kafil", KafilId);
            mycl.FillListt("SELECT NationId,Nation FROM Nations", NationId);
            mycl.FillListt("SELECT ReligionId,Religion FROM Religions", ReligionId);
          

            if (VEmpCode != null && VEmpCode != "N")
            {
                EmpCode.Text = VEmpCode;
                mycl.GetData("select * from Emp where Empcode=N'" + VEmpCode + "'", EmpCode, Page.Controls);
                BtnFirst.Enabled = false;
                Btnlast.Enabled = false;
                BtnPrev.Enabled = false;
                BtnNext.Enabled = false;

                BtnUpdate.Enabled = false;
                BtnSave.Enabled = false;
                BtnNew.Enabled = false;
               
                BtnSearchEmp.Enabled = false;
             
               
                if (MyFil_name.Text == "")
                    ImgEmp.ImageUrl = "~/Emp_Photo/No_Image.jpg";
                else
                    ImgEmp.ImageUrl = "~/Emp_Photo/" + MyFil_name.Text;
            }
        }
    }
    protected void BtnNew_Click(object sender, EventArgs e)
    {
        mycl.Clear(Page.Controls);
        GetEmployeeId();
        Set_Page_Perm("Emp.aspx", true);
        ImgEmp.ImageUrl = "~/Emp_Photo/No_Image.jpg";
        EmpCode.Text = GetEmployeeId();

    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        string sl = null;
        string r = null;
        mycl.BeginTran();
        r = mycl.Exec_scalar("select Empcode From Emp where Empcode=N'" + EmpCode.Text + "'");

        if (r != "0")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :Invalid Data :Employee Id Already Exist')", true);
            return;
        }
        r = mycl.Exec_scalar("select EmpCode From Emp where Empname_en=N'" + Empname_en.Text + "' or  Empname_Ar=N'" + Empname_Ar.Text + "'");

        if (r != "0")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :Invalid Data :Employee Name Already Exist')", true);
            return;
        }
        //if (GetEmployeeId() != EmpCode.Text)
        //{
        //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :Invalid Data :Invalid Employee Id')", true);
        //    return;
        //}


        try
        {
          


            sl = mycl.Insert("Emp", Page.Controls);
            mycl.Execute(sl);


            sl = "INSERT INTO Acctb(AccCode,AccName_en,AccName_ar,Sup_AccCode,InsertBy )VALUES(N'";
            sl += EmpCode.Text + "',N'";
            sl += Empname_en.Text + "',N'";
            sl += Empname_Ar.Text + "',N'1141',";
            sl += System.Web.HttpContext.Current.Session["userid"].ToString() + ")";
            mycl.Execute(sl);

            //------------------add subaccount of emp to acctables--------------------------
            DataTable tb = new DataTable();
            tb = mycl.GetTable("select EmpSubAccid,EmpSubAcc_en,EmpSubAcc_Ar from EmpSubAccs order by EmpSubAccid ");
            for (int i = 0; i < tb.Rows.Count ; i++)
            {
                sl = "INSERT INTO Acctb(AccCode,AccName_en,AccName_ar,Sup_AccCode,InsertBy )VALUES(N'";
                sl += EmpCode.Text  + tb.Rows[i][0].ToString().PadLeft(4, '0') + "',N'";
                sl += tb.Rows[i][1].ToString() + "',N'";
                sl += tb.Rows[i][2].ToString() + "',N'";
                sl += EmpCode.Text + "',";
                sl += System.Web.HttpContext.Current.Session["userid"].ToString() + ")";
                mycl.Execute(sl); 
            }
           



            sl = mycl.InsertTbLog("EmpLoyee Addition", "insert", "Emp", "Emp.aspx", EmpCode.Text);
            mycl.Execute(sl);

            mycl.mytrancommit();
          
         
            
            mycl.Clear(Page.Controls);

            ImgEmp.ImageUrl = "~/Emp_Photo/No_Image.jpg";
           
            Response.Redirect(Request.Url.ToString(), false);
            return;
        }
        catch (Exception ex)
        {
            mycl.mytrayrollback();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :"+ ex.Message + "')", true);
        }
    }

    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            mycl.BeginTran();


            string sl = "";
            sl = mycl.update("Emp", Page.Controls, "EmpCode", int.Parse(EmpCode.Text));
            mycl.Execute(sl);


            sl = mycl.InsertTbLog("Emp Update", "Update", "Emp", "Emp.aspx", EmpCode.Text);
            mycl.Execute(sl);

            mycl.mytrancommit();
            mycl.Clear(Page.Controls);
            BtnSave.Visible = true;
            BtnUpdate.Visible = false;
            ImgEmp.ImageUrl = "~/Emp_Photo/No_Image.jpg";

        }
        catch (Exception ex)
        {
            mycl.mytrayrollback();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error :" + ex.Message + "')", true);
        }
    }
    protected void MoveToRecord(string i)
    {
        Set_Page_Perm("Emp.aspx", false);
        
            mycl.GetData("select * from Emp where  EmpCode=N'" + i + "'", EmpCode, Page.Controls);
            if (MyFil_name.Text == "")
                ImgEmp.ImageUrl = "~/Emp_Photo/No_Image.jpg";
            else
                ImgEmp.ImageUrl = "~/Emp_Photo/" + MyFil_name.Text;
            string sl = mycl.InsertTbLog("Emp Search", "Search", "Emp", "Emp.aspx", i);
            mycl.Execute(sl);
           
        Ref_sal();
    }

   
    protected string GetEmployeeId()
    {
       return mycl.Exec_scalar("select   max(EmpCode) +1 from Emp" );
    }
   

    protected void BtnPdf_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton b = (ImageButton)sender;
        GridViewRow r = (GridViewRow)b.NamingContainer;
        string fname = mycl.Exec_scalar("select MyFil_NM from Emp_Files where Serial=" + r.Cells[0].Text);

        System.Text.StringBuilder cstext2 = new System.Text.StringBuilder();
        cstext2.Append("<script language=\"javascript\">");
        cstext2.Append("window.open('" + "Emp_Files/" + fname + "','_newtab')");
        cstext2.Append("</script>");
        ClientScript.RegisterStartupScript(GetType(), "Asnan", cstext2.ToString());
    }
    protected void BtnSavePdf_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton b = (ImageButton)sender;
        GridViewRow r = (GridViewRow)b.NamingContainer;
        string fname = mycl.Exec_scalar("select MyFil_NM from Emp_Files where Serial=" + r.Cells[0].Text);

        Response.ClearContent();
        Response.ClearHeaders();

        Response.ContentType = "application/octet-stream";

        Response.AddHeader("Content-Disposition", "attachment; filename=" + fname);
        Response.WriteFile(Server.MapPath("~/Emp_Files/" + fname));
        Response.Flush();
        Response.Close();
    }
    protected void BtnDeleteGrid_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton b = (ImageButton)sender;
        GridViewRow r = (GridViewRow)b.NamingContainer;
        try
        {
            mycl.BeginTran();
          
            int x = int.Parse(r.Cells[0].Text);
            string fname = mycl.Exec_scalar("select MyFil_NM from Emp_Files where Serial=" + r.Cells[0].Text);
            mycl.Execute("Delete from Emp_Files where Serial=" + x);
            string sl = mycl.InsertTbLog("Emp_Files", "Delete", "Emp_Files", "Emp.aspx", x.ToString());
            mycl.Execute(sl);
            System.IO.File.Delete(Server.MapPath("~/Emp_Files/" + fname));
            mycl.mytrancommit();
          
           
        }
        catch (Exception)
        {
            mycl.mytrayrollback();
        }
    }
    protected void Grid_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void HasTime_CheckedChanged(object sender, EventArgs e)
    {
        ShiftId.Enabled = HasTime.Checked;
        if (HasTime.Checked == false)
            ShiftId.SelectedValue = "0";

    }
    protected void BtnSearchEmp_Click(object sender, EventArgs e)
    {
        string r;
        string sl = mycl.Search("VEmp", "select * from VEmp", Page.Controls, "EmpCode");



        Session.Add("All_Emp", sl + " order by EmpCode  asc");

        sl = mycl.InsertTbLog("Emp  Search", "Search", "Emp", "Emp.aspx", "0");
        mycl.Execute(sl);

        mycl.Redirect("EmpData.aspx", "_blank", "menubar=0,width=900,height=900");
       
    }
    protected void BtnFirst_Click(object sender, EventArgs e)
    {
        string v = mycl.Exec_scalar("Select  min(EmpCode) from Emp " + VCondition);
        MoveToRecord(v);

    }
    protected void BtnPrev_Click(object sender, EventArgs e)
    {
        string v;
        if (EmpCode.Text == "")
            v = mycl.Exec_scalar("Select  max(EmpCode) from Emp " + VCondition);
        else

            v = mycl.Exec_scalar("Select  top 1 (EmpCode) from Emp  " + VCondition + " and  EmpCode<" + EmpCode.Text + " order by EmpCode desc");

        if (v != "0")
        {
            MoveToRecord(v);
        }
    }
    protected void BtnNext_Click(object sender, EventArgs e)
    {
        string v;
        if (EmpCode.Text == "")
            v = "1";
        else
            v = mycl.Exec_scalar("Select  top 1 (EmpCode) from Emp " + VCondition + " and EmpCode >" + EmpCode.Text + " order by EmpCode asc");
        if (v != "0")
        {
            MoveToRecord(v);
        }

    }
    protected void Btnlast_Click(object sender, EventArgs e)
    {
        string v = mycl.Exec_scalar("Select  max(EmpCode) from Emp " + VCondition);
        MoveToRecord(v);


    }
    protected void BtnPrint_Click(object sender, EventArgs e)
    {

    }
    protected void BtnShowReport_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void BtnSearch_Click(object sender, EventArgs e)
    {
       
    }
    protected void HawiaExpiredatehijri_TextChanged(object sender, EventArgs e)
    {
        if (HawiaExpiredatehijri.Text != "" && mycl.ISMydate(HawiaExpiredatehijri.Text)==true)
        {
            HawiaExpiredatehijri.Text = mycl.To_Mydate(HawiaExpiredatehijri.Text);
            CultureInfo arCI = new CultureInfo("ar-SA");
            string hijri = HawiaExpiredatehijri.Text;

            DateTime tempDate = DateTime.ParseExact(hijri, "MM/dd/yyyy", arCI.DateTimeFormat, DateTimeStyles.AllowInnerWhite);
            HawiaExpiredate.Text = tempDate.ToString("MM/dd/yyyy");
        }
       
 
    }
    protected void HawiaExpiredate_TextChanged(object sender, EventArgs e)
    {
        if (HawiaExpiredate.Text != "" && mycl.ISMydate(HawiaExpiredate.Text))
        {
            HawiaExpiredate.Text = mycl.To_Mydate(HawiaExpiredate.Text);
            CultureInfo arSA = CultureInfo.CreateSpecificCulture("ar-SA");
            DateTime dtt = new DateTime();
            dtt = DateTime.ParseExact(HawiaExpiredate.Text, "MM/dd/yyyy", null);
            HawiaExpiredatehijri.Text = dtt.ToString("MM/dd/yyyy", arSA);
        }
       
    }

    protected void Ref_sal()
    {
        double tsal = 0;
        tsal += mycl.DblValue(BSalary.Text) + mycl.DblValue(TransSalary.Text) + mycl.DblValue(CommunSalary.Text) + mycl.DblValue(HouseSalary.Text) + mycl.DblValue(CommSalary.Text) + mycl.DblValue(OtherSalary.Text);
        TotSal.Text = tsal.ToString();
    }
  
    protected void EmpCode_TextChanged(object sender, EventArgs e)
    {
        string r = mycl.Exec_scalar("select EmpCode From Emp where   EmpCode=" + EmpCode.Text );

        if (r == "0")
        {
            string temp_empno = EmpCode.Text;
            mycl.Clear(Page.Controls);
            EmpCode.Text = temp_empno;
            ImgEmp.ImageUrl = "~/Emp_Photo/No_Image.jpg";
            Empname_en.Focus();
            return;
        }
        MoveToRecord(EmpCode.Text);
        return;
    }
}