using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Comp_Documents_Search : System.Web.UI.Page
{
    MyAdo mycl = new MyAdo();
    protected void Page_Load(object sender, EventArgs e)
    {
      
        string vuserid = Session["userid"].ToString();

        mycl.Begin();
       
        if (Page.IsPostBack == false)
        {
            string r = mycl.Exec_scalar("select count(empcode)  From emp where isadmin=1 and Empcode=N'" + vuserid + "'");
            SubCompId.Items.Insert(0, new ListItem("---Choose Item---", "0"));
            mycl.FillListt("SELECT EmpCode,Empname_en from Emp ", EmpCode);
            if (r == "1")
            {
                mycl.FillListt("SELECT CompId,Compname from comp ", CompId);
                mycl.FillListt("SELECT Comp_DocumentTypeid,Comp_DocumentType from Comp_DocumentTypes ", Comp_DocumentTypeId);
                EmpCode.Enabled = true;
            }
            else
            {
                mycl.FillListt("select  CompId,Compname from Comp ,Page_permission where CompId=ItemId and TbName=N'Comp' and EmpCode=N'" + vuserid + "'", CompId);
                mycl.FillListt("select Comp_DocumentTypeId,Comp_DocumentType from Comp_DocumentTypes ,Page_permission where Comp_DocumentTypeId=ItemId and TbName=N'Comp_DocumentTypes' and EmpCode=N'" + vuserid + "'", Comp_DocumentTypeId);
                EmpCode.Enabled = false;

            }
        }
    }

    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        string r;
        string sl = mycl.Search("V_Comp_Documents", "select * from V_Comp_Documents", Page.Controls, "Serial");
        if (DocDateto.Text != "" || DocDateFrom.Text != "")
        {
            sl += " and CONVERT(CHAR(10),DocDate,101) between CONVERT(VARCHAR,'" + DocDateFrom.Text + "', 1)" + "  and  CONVERT(VARCHAR,'" + DocDateto.Text + "', 1)";
        }

        if (DocDateto.Text != "" || DocDateFrom.Text != "")
        {
            sl += " and CONVERT(CHAR(10),DocExpire,101) between CONVERT(VARCHAR,'" + DocExpireFrom.Text + "', 1)" + "  and  CONVERT(VARCHAR,'" + DocExpireto.Text + "', 1)";
        }
        //check if user admin or not

          string vuserid = Session["userid"].ToString();
          r= mycl.Exec_scalar("select count(empcode)  From emp where isadmin=1 and Empcode=N'" + vuserid + "'");
          if (r != "1")
          {
              sl += " and Empcode=N'" + vuserid + "'";
          }

          if (ChkExpire.Checked == true)
          {
              sl += " and  CONVERT(CHAR(10),DocExpire,101) < getdate()";
          }


      
        Session.Add("AllComp_Documents", sl + " order by DocDate  asc");

        sl = mycl.InsertTbLog("Company File Search", "Search", "Comp_Documents", "Comp_Documents_Search.aspx", "0");
        mycl.Execute(sl);

        Response.Redirect("AllComp_Documents.aspx");
    }
    protected void BtnNew_Click(object sender, EventArgs e)
    {
        mycl.Clear(Page.Controls);
    }
    protected void Comp_DocumentTypeId0_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Comp_DocumentTypeId_SelectedIndexChanged(object sender, EventArgs e)
    {
        SubCompId.Enabled = false;
        SubCompId.Items.Clear();
        SubCompId.Items.Insert(0, new ListItem("----------Choose Item----------", "0"));
        string sl;
        if (Comp_DocumentTypeId.SelectedValue.ToString() != "0" & CompId.SelectedValue.ToString() != "0")
        {
            sl = "select count(Compid) from Comp where HasSubComp=1 and  Compid=" + CompId.SelectedValue.ToString();
            if (mycl.Exec_scalar(sl) == "1")
            {

                sl = "select count(Comp_DocumentTypeId) from Comp_DocumentTypes where HasDet=1 and  Comp_DocumentTypeId=" + Comp_DocumentTypeId.SelectedValue.ToString();
                if (mycl.Exec_scalar(sl) == "1")
                {
                    SubCompId.Enabled = true;
                    mycl.FillListt("SELECT SubCompId,SubCompname from Subcomp where Compid=" + CompId.SelectedValue.ToString(), SubCompId);
                }
            }
        }
    }
    protected void CompId_SelectedIndexChanged(object sender, EventArgs e)
    {
      
        SubCompId.Items.Clear();
        SubCompId.Items.Insert(0, new ListItem("----------Choose Item----------", "0"));
        SubCompId.Enabled = false;
        Comp_DocumentTypeId.SelectedValue = "0";
       
    }
}