using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;

using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

public partial class Crystal2 : System.Web.UI.Page
{
    MyAdo mycl=new MyAdo ();
    string sl = "";
    string repname;
    string TempRepfilename = ""; 
    ReportDocument repdoc = new ReportDocument();
    protected void Page_Load(object sender, EventArgs e)
    {

      
          
            if (repdoc != null)
            {
                repdoc.Close();
                repdoc.Dispose();
                repdoc = null;
               
            }
            // res
            try
            {
                string falgg = "";
                mycl.Begin();
                if (Request.QueryString["repsql"] != null)
                {
                    sl = Request.QueryString["repsql"].ToString();
                }

                if (Session["sess_repsql"] != null)
                {
                    sl = Session["sess_repsql"].ToString();
                }
                repname = Request.QueryString["repname"].ToString();
                if (Request.QueryString["flag"] != null)
                    falgg = Request.QueryString["flag"].ToString();


                if (falgg == "1")
                    repdoc = mycl.GetDocReport(sl, repname, true);
                else
                    repdoc = mycl.GetDocReport(sl, repname);

                if (Request.QueryString["pr"] != null)
                {
                    repdoc.SetParameterValue("tparam", Request.QueryString["pr"].ToString());
                }
                TempRepfilename = repname;
                repdoc.ExportToDisk(ExportFormatType.PortableDocFormat, HttpContext.Current.Server.MapPath("~/MyFiles/" + TempRepfilename + ".pdf"));
                CrystalReportViewer1.ReportSource = repdoc;

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
               // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex.Message + "')", true);
            }
            finally
            {
                //repdoc.Close();
                //repdoc.Dispose();
                //GC.Collect();
            }
      
       

    }
    protected void GetPdfReport()
    {
        System.Text.StringBuilder cstext2 = new System.Text.StringBuilder();
        cstext2.Append("<script language=\"javascript\">");
        cstext2.Append("window.open('MyFiles/" + TempRepfilename + ".pdf','_newtab')");
        cstext2.Append("</script>");
        ClientScript.RegisterStartupScript(GetType(), "Asnan", cstext2.ToString());
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        GetPdfReport();
    }

    protected void Page_Unload(object sender, EventArgs e)
    {
        try
        {
            repdoc.Close();
            repdoc.Dispose();
            repdoc = null;
        }
        catch (Exception)
        {
            
         
        }
       
       
    }

    protected void CrystalReportViewer1_Unload(object sender, EventArgs e)
    {
        try
        {
            repdoc.Close();
            repdoc.Dispose();
            repdoc = null;

        }
        catch (Exception)
        {
            
          
        }
       
       
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string email = "";
        ClientScript.RegisterStartupScript(this.GetType(), "mailto", "parent.location='mailto:" + email + "'", true);
    }
}