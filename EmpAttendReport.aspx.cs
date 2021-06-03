using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EmpAttendReport : System.Web.UI.Page
{
    MyAdo mycl = new MyAdo();
    protected void Page_Load(object sender, EventArgs e)
    {
        mycl.Begin();
       string  VCompId = System.Web.HttpContext.Current.Session["compid"].ToString();
        if (IsPostBack == false)
        {

            mycl.FillListt("SELECT BranchId,Branch FROM Branchs where CompId=" + VCompId , BranchId);
            mycl.FillListt("SELECT GenderId,Gender FROM Genders", GenderId);
            mycl.FillListt("SELECT JobId,job FROM jobs", JobId);
            mycl.FillListt("SELECT ShiftId,Shift FROM Shifts", ShiftId);
            mycl.FillListt("SELECT DepartmentId,Department FROM Departments", DepartmentId);
           
            mycl.FillListt("SELECT NationId,Nation FROM Nations", NationId);
           
        }
    }
    protected void Btn_OK_Click(object sender, EventArgs e)
    {
        string sl = "Select * from VEmpAttendReport where Empcode <>-1";
        if (AtDateFrom.Text != "" || AtDateTo.Text != "")
        {
            sl += " and AtDate   between '" + AtDateFrom.Text + " 00:00:00.00'" + "  and '" + AtDateTo.Text + " 23:59:59.999'";
        }

        if (EmpCode.Text != "")
        {
            sl += " And EmpCode =N'" + EmpCode.Text + "'";
        }

        if (BranchId.SelectedValue.ToString() != "0")
        {
            sl += " And BranchId = " + BranchId.SelectedValue.ToString();
        }

        if (GenderId.SelectedValue.ToString() != "0")
        {
            sl += " And GenderId = " + GenderId.SelectedValue.ToString();
        }

        if (GenderId.SelectedValue.ToString() != "0")
        {
            sl += " And GenderId = " + GenderId.SelectedValue.ToString();
        }
        if (NationId.SelectedValue.ToString() != "0")
        {
            sl += " And NationId = " + NationId.SelectedValue.ToString();
        }

        if (DepartmentId.SelectedValue.ToString() != "0")
        {
            sl += " And DepartmentId = " + DepartmentId.SelectedValue.ToString();
        }


        if (JobId.SelectedValue.ToString() != "0")
        {
            sl += " And JobId = " + JobId.SelectedValue.ToString();
        }

        if (ShiftId.SelectedValue.ToString() != "0")
        {
            sl += " And ShiftId = " + ShiftId.SelectedValue.ToString();
        }

        sl += " order by Atdate asc";
        mycl.Redirect("Crystal2.aspx?repsql=" + sl + "&repname=" + "EmpAttend", "_blank", "menubar=0,width=900,height=900");
    }
}