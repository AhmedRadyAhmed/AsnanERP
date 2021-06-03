<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CarData.aspx.cs" Inherits="CarData" EnableEventValidation="false"  MaintainScrollPositionOnPostback="true" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Employee Data</title>
   
     <link id="Link1" runat="server" rel="shortcut icon" href="~/images/Logo.jpg" type="image/x-icon"/>
<link id="Link2" runat="server" rel="icon" href="~/images/Logo.jpg" type="image/ico" /> 
       
     <link href="~/Styles/SiteData.css" rel="stylesheet" type="text/css" /> 
     <script src="jquery-latest.min.js" type="text/javascript"></script>
    <style type="text/css">
        .style1
        {
            width: 698px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">

    
      <div class="Header">
       <table cellspacing="1"  width ="100%" dir="rtl">
           <tr>
               <td>
                      <asp:Label ID="lblerror" runat="server" 
        style="color: #FFFFFF; font-size: large; font-weight: 700" ForeColor="White"></asp:Label>
    
                </td>
               <td style="color: #FFFFFF">
                      <asp:Label ID="LblCount" runat="server" 
        style="color: #FFFFFF; font-size: large; font-weight: 700" ForeColor="White"></asp:Label>
    
                </td>
               <td class="style1">
                          
                    <asp:Button ID="BtExportExcel" runat="server" Height="30px" 
                          Text="Export to Excel" Width="170px" onclick="BtExportExcel_Click" 
                        CssClass="Mybutton" />
    
                </td>
           </tr>
       </table>
          
    </div>
  
  <div class="content">
   <asp:Panel ID="Panel1" 
          style="float: left; " 
          runat="server" BorderColor="White" Height="90%">
       

          <asp:Button ID="BtnRef" runat="server" Text="Refresh" Width="150px" 
           onclick="BtnRef_Click" CssClass="Mybutton" />
 
<asp:Panel ID="checkBoxPanel" runat="server"   
        CssClass="scrollingControlContainer scrollingCheckBoxList" Height="98%" 
         BorderColor="#E0DDD8" BorderStyle="Solid" BorderWidth="1px" 
        BackColor="White">
        
         
    <table style="width: 100%">
        
        <tr>
           
            <td>
                
              </td>
            
            <td>
             
<asp:CheckBoxList ID="ListCols" runat="server" 
                    >
                    
                </asp:CheckBoxList>
                

               </td>
            
        </tr>
        
    </table>
              </asp:Panel>
  
  </asp:Panel> 
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Myconnection %>" 
            
            SelectCommand="SELECT  CarId,LohaId,Branch,CarType,CarSubType,Manif_Year,PurchaseDate,InsuranceExpireDate,EstmaraExpireDate,Notes  FROM VCars ">
        </asp:SqlDataSource>


  <div  style="border: 1px solid #C0C0C0; height:94%; overflow:auto">

        <asp:GridView ID="Grid" runat="server"  Width="100%" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            AllowSorting="True" onrowdatabound="Grid_RowDataBound" CssClass="bordered" 
                onselectedindexchanged="Grid_SelectedIndexChanged"  >

      

            <Columns>
                <asp:BoundField DataField="CarId" HeaderText="CarId" 
                    SortExpression="CarId" />

                <asp:BoundField DataField="LohaId" HeaderText="LohaId" 
                    SortExpression="LohaId" />
                <asp:BoundField DataField="Branch" HeaderText="Branch" 
                    SortExpression="Branch" />
                       <asp:BoundField DataField="CarType" HeaderText="CarType" 
                    SortExpression="CarType" />
                <asp:BoundField DataField="CarSubType" HeaderText="CarSubType" 
                    SortExpression="CarSubType" />
                
                 <asp:BoundField DataField="Manif_Year" HeaderText="Manif_Year" 
                    SortExpression="Manif_Year" />
                
                <asp:BoundField DataField="PurchaseDate" HeaderText="PurchaseDate" 
                    SortExpression="PurchaseDate" />
                <asp:BoundField DataField="InsuranceExpireDate" HeaderText="InsuranceExpireDate" 
                    SortExpression="InsuranceExpireDate"/>
                <asp:BoundField DataField="EstmaraExpireDate" HeaderText="EstmaraExpireDate" 
                    SortExpression="EstmaraExpireDate" />
                <asp:BoundField DataField="Notes" HeaderText="Notes" 
                    SortExpression="Notes" />
            </Columns>
            <PagerSettings Visible="False" />
            <PagerStyle Width="200px" Wrap="True" />
        </asp:GridView>
     

           
    </div>

    </div>
 
    </form>
</body>
</html>
