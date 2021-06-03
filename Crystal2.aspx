<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Crystal2.aspx.cs" Inherits="Crystal2"  %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Asnan Reports</title>
     <link id="Link1" runat="server" rel="shortcut icon" href="~/images/Logo.jpg" type="image/x-icon"/>
     <link id="Link2" runat="server" rel="icon" href="~/images/Logo.jpg" type="image/ico" />  
     <link href="~/Styles/SiteData.css" rel="stylesheet" type="text/css" /> 
     <script src="jquery-latest.min.js" type="text/javascript"></script>
 <style type="text/css">
 
     #btnPrint
     {
         height: 30px;
         width: 75px;
     }
     #btnPrint0
     {
         height: 34px;
         width: 145px;
     }
 </style>
</head>
<body>
    <form id="form1" runat="server">
   <div>
   &nbsp;<script type="text/javascript">
        function Print() {
            var dvReport = document.getElementById("mydivv99");
            var frame1 = dvReport.getElementsByTagName("iframe")[0];
            if (navigator.appName.indexOf("Internet Explorer") != -1 || navigator.appVersion.indexOf("Trident") != -1) {
                frame1.name = frame1.id;
                window.frames[frame1.id].focus();
                window.frames[frame1.id].print();
            }
            else {
                var frameDoc = frame1.contentWindow ? frame1.contentWindow : frame1.contentDocument.document ? frame1.contentDocument.document : frame1.contentDocument;
                frameDoc.print();
            }
        }
    </script><asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="PDF" 
           Height="30px" Width="75px" />
           <a href="mailto:""?"" target="_top">Send Mail</a>
   </div>
   <div id="mydivv99">
  <div class="content">
  
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
            AutoDataBind="true" EnableParameterPrompt="False" ShowAllPageIds="True" 
            Height="100%" Width="100%" HasRefreshButton="True" PrintMode="ActiveX" 
            EnableDatabaseLogonPrompt="False" 
            ToolPanelView="None" BestFitPage="False" SeparatePages="False" 
            onunload="CrystalReportViewer1_Unload" />
    
    </div>
    </div>
    </form>
</body>
</html>
