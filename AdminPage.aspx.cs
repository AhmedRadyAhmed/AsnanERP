using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPage : System.Web.UI.Page
{
    MyAdo mycl = new MyAdo();
    protected void Page_Load(object sender, EventArgs e)
    {
        mycl.Begin();
        if (IsPostBack == false)
        {
            mycl.FillListt("SELECT EmpCode,empname_en  FROM  Emp Where isadmin=0 and IsSysUSer=1 order by 2", lstEmp);
            DataTable tb = new DataTable();
            tb = mycl.GetTable("SELECT PageId,PageTitle  FROM  PPages Where IsEmpService=0 order by 2");
            GridView1.DataSource = tb;

            GridView1.DataBind();
          
        }
    }
    protected void BtnAdd_Click(object sender, EventArgs e)
    {
       
    }
    protected void lstEmp_SelectedIndexChanged(object sender, EventArgs e)
    {
        string userid = lstEmp.SelectedValue.ToString();
        string sl = "SELECT PageId,DisplayPerm,AddPerm,UpdatePerm  FROM  userpages Where EmpCode=N'" + userid + "'";
        DataTable tb = new DataTable();
        tb = mycl.GetTable(sl);
        for (int x = 0; x <= GridView1.Rows.Count - 1; x++)
        {
            CheckBox ck1, ck2, ck3;
            ck1 = (CheckBox)GridView1.Rows[x].FindControl("ChkDisplay");
            ck2 = (CheckBox)GridView1.Rows[x].FindControl("ChkAdd");
            ck3 = (CheckBox)GridView1.Rows[x].FindControl("ChkUpdate");
            string gx = GridView1.Rows[x].Cells[0].Text;
            ck1.Checked = false;
            ck2.Checked = false;
            ck3.Checked = false;
        }
        for (int i = 0; i < tb.Rows.Count; i++)
        {
            for (int x = 0; x <= GridView1.Rows.Count - 1; x++)
            {
                CheckBox ck1, ck2, ck3;
                ck1 = (CheckBox)GridView1.Rows[x].FindControl("ChkDisplay");
                ck2 = (CheckBox)GridView1.Rows[x].FindControl("ChkAdd");
                ck3 = (CheckBox)GridView1.Rows[x].FindControl("ChkUpdate");
                string gx = GridView1.Rows[x].Cells[0].Text;
                if (tb.Rows[i][0].ToString() == gx)
                {
                    bool b1 = (bool)tb.Rows[i][1];
                    ck1.Checked = b1; 
                    ck2.Checked = (bool)tb.Rows[i][2];
                    ck3.Checked = (bool)tb.Rows[i][3];
                    if (ck1.Checked == true)
                    {
                        ck2.Enabled = true;
                        ck3.Enabled = true;
                    }
                }
            }
        
        }
    }

    protected void BtnSave_Click(object sender, EventArgs e)
    {
        string userid = lstEmp.SelectedValue.ToString();
        try
        {
            mycl.BeginTran();
            string sl = "delete from userpages where EmpCode=N'" + userid + "'";
            mycl.Execute(sl);


            for (int x = 0; x <= GridView1.Rows.Count - 1; x++)
            {
                CheckBox ck1, ck2, ck3;
                ck1 = (CheckBox)GridView1.Rows[x].FindControl("ChkDisplay");
                ck2 = (CheckBox)GridView1.Rows[x].FindControl("ChkAdd");
                ck3 = (CheckBox)GridView1.Rows[x].FindControl("ChkUpdate");
                string gx = GridView1.Rows[x].Cells[0].Text;
                if (ck2.Checked == true || ck3.Checked == true)
                    ck1.Checked = true;
                if (ck1.Checked == true)
                {
                    sl = "INSERT INTO UserPages (EmpCode ,PageId ,DisplayPerm ,AddPerm ,UpdatePerm ) VALUES (N'";
                    sl += lstEmp.SelectedValue.ToString() + "',";
                    sl += gx + ",";
                    sl += Convert.ToInt32(ck1.Checked) + ",";
                    sl += Convert.ToInt32(ck2.Checked) + ",";
                    sl += Convert.ToInt32(ck3.Checked) + ")";
                    mycl.Execute(sl);

                }
            }

            mycl.mytrancommit();
            Response.Redirect(Request.Url.ToString(), false);
            return;
        }
        catch (Exception)
        {
            mycl.mytrayrollback();  
            
        }
    }


    protected void Timer1_Tick(object sender, EventArgs e)
    {
       
    }
    protected void Grid_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void BtnRefresh_Click(object sender, EventArgs e)
    {
        mycl.FillGrid("select * from CurrUsers", Grid);
    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        GridViewRow row = e.Row;
        // Intitialize TableCell list
        List<TableCell> columns = new List<TableCell>();
        foreach (DataControlField column in GridView1.Columns)
        {
            //Get the first Cell /Column
            TableCell cell = row.Cells[0];
            // Then Remove it after
            row.Cells.Remove(cell);
            //And Add it to the List Collections
            columns.Add(cell);
        }

        // Add cells
        row.Cells.AddRange(columns.ToArray());
    }
    protected void ChkDisplay_CheckedChanged(object sender, EventArgs e)
    {
        GridViewRow gr = (GridViewRow)((DataControlFieldCell)((CheckBox)sender).Parent).Parent;
        CheckBox chkdisp = (CheckBox)gr.FindControl("ChkDisplay");
        CheckBox chk1 = (CheckBox)gr.FindControl("ChkAdd");
        CheckBox chk2 = (CheckBox)gr.FindControl("ChkUpdate");
        chk1.Enabled = chkdisp.Checked;
        chk2.Enabled = chkdisp.Checked;
        if (chkdisp.Checked == false)
        {
            chk1.Checked = false;
            chk2.Checked = false;
        }


    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[0].Visible = false;
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true)
            mycl.Execute("Update SysSettings set isthisYear=1");
        else
            mycl.Execute("Update SysSettings set isthisYear=0");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataTable tbp, tbv;
        string sl1 = "select PurchaseMasId, itmnumber,LotNo,[ExpireDate],qty from PurchaseDet  order by PurchaseMasId  desc ,qty desc ";
        string sl2 = " select serial ,docno,ItmNumber,LotNo,ExpireDate,Qty from  InventoryTran  order by serial desc";
        tbp = mycl.GetTable(sl1);
        tbv = mycl.GetTable(sl2);


      


        for (int i = 0; i < tbp.Rows.Count; i++)
        {
            int qp = (int)tbp.Rows[i][4];
            for (int j = 0; j < tbv.Rows.Count; j++)
            {
                string n1 = tbp.Rows[i][1].ToString();
                string n2 = tbv.Rows[j][2].ToString();
                int qv = (int)tbv.Rows[i][5];

                if (n1 == n2)
                {

                    if (qp >= qv)
                    {
                        qp -= qv;
                        mycl.Execute("update InventoryTran set lotno=N'" + tbp.Rows[i][2].ToString() + "' ,[ExpireDate]='" + tbp.Rows[i][3].ToString() + "' where serial=" + tbv.Rows[j][0].ToString());
               
                    }
                    else
                        break;

                }
            }
        }
    }
}