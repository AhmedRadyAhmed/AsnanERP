using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer_Contacts : System.Web.UI.Page
{
    MyAdo mycl = new MyAdo();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        mycl.Begin();
        string VCustomerId = Request.QueryString["CustomerId"];
        if (IsPostBack == false)
        {
            mycl.FillListt("SELECT Customerid,customername_en FROM customer", LstCustomername);
        }
    }
    protected void Btn_new_cust_emp_Click(object sender, EventArgs e)
    {
        Serial_cust_contact.Text = null;
        CustomerId.Text = "";
        LstCustomername.SelectedValue = "0";
        Cust_Empname.Text = null;
        Cust_EmpPosition.Text = null;
        Cust_EmpEmail.Text = null;
        Cust_EmpTel.Text = null;
        Cust_EmpNote.Text = null;
    }
    protected void BtnCust_ContactSave_Click(object sender, EventArgs e)
    {
            string sl = null;
            string r = null;
            r = mycl.Exec_scalar("select CustomerId From Customer where CustomerId=N'" + CustomerId.Text + "'");

            if (r == "0")
            {
                //lblmsg.Text = "Invalid Customer Id ";
                //Msg_Modal.Show();
                return;
            }
         
            if (Serial_cust_contact.Text != "")
            {
                sl = "update Customer_contacts set ";
                sl += "Cust_Empname=N'" + Cust_Empname.Text + "',";
                sl += "Cust_EmpPosition=N'" + Cust_EmpPosition.Text + "',";
                sl += "Cust_EmpEmail=N'" + Cust_EmpEmail.Text + "',";
                sl += "Cust_EmpTel=N'" + Cust_EmpTel.Text + "',";
                sl += "Cust_EmpNote=N'" + Cust_EmpNote.Text + "'";
                sl += " where CustomerId=N'" + CustomerId.Text + "' and Serial=" + Serial_cust_contact.Text;
            }
            else
            {
                sl = "INSERT INTO  Customer_contacts(Cust_Empname ,Cust_EmpPosition,Cust_EmpEmail,Cust_EmpTel ,Cust_EmpNote,CustomerId)VALUES  (N'";
                sl += Cust_Empname.Text + "',N'";
                sl += Cust_EmpPosition.Text + "',N'";
                sl += Cust_EmpEmail.Text + "',N'";
                sl += Cust_EmpTel.Text + "',N'";
                sl += Cust_EmpNote.Text + "',N'";
                sl += CustomerId.Text + "')";
            }
            mycl.Execute(sl);
           Grid.DataBind();
            Response.Redirect(Request.Url.ToString(), false);
          
    }
    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        LstCustomername.SelectedValue = "0";
        if (CustomerId.Text != "")
        {
           Grid.DataBind();
            try
            {
                LstCustomername.SelectedValue = CustomerId.Text;
            }
            catch (Exception)
            {

                LstCustomername.SelectedValue = "0";
            }
           
        }
       
         
    }
    protected void Grid_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = Grid.SelectedRow;

        Serial_cust_contact.Text = row.Cells[1].Text;
        Cust_Empname.Text = row.Cells[2].Text;
        Cust_EmpPosition.Text = row.Cells[3].Text;
        Cust_EmpEmail.Text = row.Cells[4].Text;
        Cust_EmpTel.Text = row.Cells[5].Text;
        Cust_EmpNote.Text = row.Cells[6].Text;
    }
    protected void LstCustomername_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(LstCustomername.SelectedValue !="0")
        CustomerId.Text = LstCustomername.SelectedValue.ToString();
    }
    protected void Btn_del_cust_emp_Click(object sender, EventArgs e)
    {
        string sl = "delete from Customer_contacts where serial=" + Serial_cust_contact.Text;
        mycl.Execute(sl);
        Serial_cust_contact.Text = null;
        Cust_Empname.Text = null;
        Cust_EmpPosition.Text = null;
        Cust_EmpEmail.Text = null;
        Cust_EmpTel.Text = null;
        Cust_EmpNote.Text = null;
       Grid.DataBind();
       
    }

   
}