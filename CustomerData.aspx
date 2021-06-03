<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomerData.aspx.cs" Inherits="CustomerData" EnableEventValidation="false"  MaintainScrollPositionOnPostback="true" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Customer Data</title>
   
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
                          Text="Export to Excel" Width="170px" onclick="BtExportExcel_Click" />
    
                </td>
           </tr>
       </table>
          
    </div>
  
  <div class="content">
   <asp:Panel ID="Panel1" 
          style="float: left; " 
          runat="server" BorderColor="White" Height="90%">
        &nbsp;  &nbsp;  
       <asp:CheckBox ID="Chk_all" runat="server" AutoPostBack="True" Checked="True" 
           Font-Bold="True" oncheckedchanged="Chk_all_CheckedChanged" Text="All" /> 
       &nbsp; 

          <asp:Button ID="BtnRef" runat="server" Text="Refresh" Width="100px" 
           onclick="BtnRef_Click" />
 
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
            
            SelectCommand="SELECT * From Customer"></asp:SqlDataSource>

  <div  style="border: 1px solid #C0C0C0; height:94%; overflow:auto">

       <asp:GridView ID="Grid" runat="server"  Width="94%" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            AllowSorting="True"  CssClass="bordered" BackColor="White" onrowdatabound="Grid_RowDataBound" 
                  ><Columns>
               <asp:BoundField DataField="Serial" HeaderText="Serial" 
                    SortExpression="Serial" InsertVisible="False" ReadOnly="True" />
               <asp:BoundField DataField="CustomerId" HeaderText="CustomerId" 
                   SortExpression="CustomerId" />
               <asp:BoundField DataField="CustomerTypeId" HeaderText="CustomerTypeId" 
                   SortExpression="CustomerTypeId" />
               <asp:BoundField DataField="CustomerName_En" HeaderText="CustomerName_En" 
                   SortExpression="CustomerName_En" />
               <asp:BoundField DataField="CustomerName_Ar" HeaderText="CustomerName_Ar" 
                   SortExpression="CustomerName_Ar" />
<asp:CheckBoxField DataField="IsCustQout" HeaderText="IsCustQout" 
                    SortExpression="IsCustQout" />
<asp:BoundField DataField="BussTypeId" HeaderText="BussTypeId" 
                    SortExpression="BussTypeId" />
<asp:BoundField DataField="CompId" HeaderText="CompId" 
                    SortExpression="CompId" />
<asp:BoundField DataField="CustomerGroupId" HeaderText="CustomerGroupId" 
                    SortExpression="CustomerGroupId" />
<asp:BoundField DataField="BranchId" HeaderText="BranchId" 
                    SortExpression="BranchId" />
<asp:BoundField DataField="Cust_date" HeaderText="Cust_date" 
                    SortExpression="Cust_date" />
<asp:BoundField DataField="Comm_RegisterId" HeaderText="Comm_RegisterId" 
                    SortExpression="Comm_RegisterId" />
<asp:BoundField DataField="Comm_RegisterDate" HeaderText="Comm_RegisterDate" 
                    SortExpression="Comm_RegisterDate" />
<asp:BoundField DataField="Comm_RegisterSource" HeaderText="Comm_RegisterSource" 
                    SortExpression="Comm_RegisterSource" />
<asp:BoundField DataField="Moh_LicenceId" HeaderText="Moh_LicenceId" 
                    SortExpression="Moh_LicenceId" />
<asp:BoundField DataField="Moh_LicenceDate" HeaderText="Moh_LicenceDate" 
                    SortExpression="Moh_LicenceDate"/>
<asp:BoundField DataField="Moh_LicenceSource" HeaderText="Moh_LicenceSource" 
                    SortExpression="Moh_LicenceSource" />
<asp:BoundField DataField="Notes" HeaderText="Notes" 
                    SortExpression="Notes" />
<asp:BoundField DataField="CityId" HeaderText="CityId" 
                    SortExpression="CityId" />
<asp:BoundField DataField="Hyid" HeaderText="Hyid" 
                    SortExpression="Hyid" />
<asp:BoundField DataField="Street" HeaderText="Street" 
                    SortExpression="Street" />
<asp:BoundField DataField="ZipCode" HeaderText="ZipCode" 
                    SortExpression="ZipCode" />
<asp:BoundField DataField="Tel1" HeaderText="Tel1" 
                    SortExpression="Tel1" />
<asp:BoundField DataField="Tel2" HeaderText="Tel2" 
                    SortExpression="Tel2" />
<asp:BoundField DataField="Tel3" HeaderText="Tel3" 
                    SortExpression="Tel3" />
<asp:BoundField DataField="Tel4" HeaderText="Tel4" 
                    SortExpression="Tel4" />
<asp:BoundField DataField="Fax1" HeaderText="Fax1" 
                    SortExpression="Fax1" />
<asp:BoundField DataField="Email1" HeaderText="Email1" 
                    SortExpression="Email1" />
               <asp:BoundField DataField="Email2" HeaderText="Email2" 
                   SortExpression="Email2" />
               <asp:BoundField DataField="OwnerName" HeaderText="OwnerName" 
                   SortExpression="OwnerName" />
               <asp:BoundField DataField="QwnerId" HeaderText="QwnerId" 
                   SortExpression="QwnerId" />
               <asp:BoundField DataField="QwnerTel" HeaderText="QwnerTel" 
                   SortExpression="QwnerTel" />
               <asp:BoundField DataField="QwnerSignature" HeaderText="QwnerSignature" 
                   SortExpression="QwnerSignature" />
               <asp:BoundField DataField="Delegate1name" HeaderText="Delegate1name" 
                   SortExpression="Delegate1name" />
               <asp:BoundField DataField="Delegate1Position" HeaderText="Delegate1Position" 
                   SortExpression="Delegate1Position" />
               <asp:BoundField DataField="Delegate1Tel" HeaderText="Delegate1Tel" 
                   SortExpression="Delegate1Tel" />
               <asp:BoundField DataField="Delegate1Signature" HeaderText="Delegate1Signature" 
                   SortExpression="Delegate1Signature" />
               <asp:BoundField DataField="Delegate2name" HeaderText="Delegate2name" 
                   SortExpression="Delegate2name" />
               <asp:BoundField DataField="Delegate2Position" HeaderText="Delegate2Position" 
                   SortExpression="Delegate2Position" />
               <asp:BoundField DataField="Delegate2Tel" HeaderText="Delegate2Tel" 
                   SortExpression="Delegate2Tel" />
               <asp:BoundField DataField="Delegate2Signature" HeaderText="Delegate2Signature" 
                   SortExpression="Delegate2Signature" />
               <asp:BoundField DataField="Smanid" HeaderText="Smanid" 
                   SortExpression="Smanid" />
               <asp:BoundField DataField="TshilatAmount" HeaderText="TshilatAmount" 
                   SortExpression="TshilatAmount" />
               <asp:BoundField DataField="TshilatDays" HeaderText="TshilatDays" 
                   SortExpression="TshilatDays" />
               <asp:BoundField DataField="Crdtlmt" HeaderText="Crdtlmt" 
                   SortExpression="Crdtlmt" />
               <asp:BoundField DataField="CrdtDays" HeaderText="CrdtDays" 
                   SortExpression="CrdtDays" />
<asp:CheckBoxField DataField="Active" HeaderText="Active" 
                    SortExpression="Active" />
<asp:BoundField DataField="Balance" HeaderText="Balance" 
                    SortExpression="Balance" />
<asp:BoundField DataField="info1" HeaderText="info1" 
                    SortExpression="info1" />
<asp:BoundField DataField="info2" HeaderText="info2" 
                    SortExpression="info2" />
<asp:BoundField DataField="info3" HeaderText="info3" 
                    SortExpression="info3" />
<asp:BoundField DataField="info4" HeaderText="info4" 
                    SortExpression="info4" />
<asp:BoundField DataField="info5" HeaderText="info5" 
                    SortExpression="info5" />
<asp:BoundField DataField="info6" HeaderText="info6" 
                    SortExpression="info6" />
<asp:BoundField DataField="info7" HeaderText="info7" 
                    SortExpression="info7" />
<asp:BoundField DataField="info8" HeaderText="info8" 
                    SortExpression="info8" />
<asp:BoundField DataField="InsertBy" HeaderText="InsertBy" 
                    SortExpression="InsertBy" />
<asp:BoundField DataField="InsertDate" HeaderText="InsertDate" 
                    SortExpression="InsertDate" />
<asp:BoundField DataField="UpdateBy" HeaderText="UpdateBy" 
                    SortExpression="UpdateBy" />
<asp:BoundField DataField="UpdateDate" HeaderText="UpdateDate" 
                    SortExpression="UpdateDate" />
<asp:BoundField DataField="DeleteBy" HeaderText="DeleteBy" 
                    SortExpression="DeleteBy" />
<asp:BoundField DataField="DeleteDate" HeaderText="DeleteDate" 
                    SortExpression="DeleteDate" />
<asp:BoundField DataField="Sts" HeaderText="Sts" 
                    SortExpression="Sts" />
               <asp:BoundField DataField="TempF" HeaderText="TempF" SortExpression="TempF" />
</Columns>

<PagerSettings Visible="False" />

<PagerStyle Width="200px" Wrap="True" />
</asp:GridView>

           
    </div>

    </div>
 
    </form>
</body>
</html>
