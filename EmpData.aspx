<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmpData.aspx.cs" Inherits="EmpData" EnableEventValidation="false"  MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
                    &nbsp;&nbsp;&nbsp;&nbsp;  
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
            
            SelectCommand="SELECT EmpCode, Active, Empname_en, Empname_Ar, Email, Phone, KafilName, jobVisa, Job, HireDate, EnterNumber, EnterDate, EnterPlace, Branch, Gender, Nation, SocialState, Religion, BirthDate, Addressinside, addressoutside, Baridramz, PersonRelative, PersonTel, isdriving, DriveId, DriveExpireDate, HawiaId, HawiaExpiredatehijri, HawiaExpiredate, PassportId, PassportDate, PassportExpireDate, Department, HasTime,   BSalary, TransSalary, CommunSalary, HouseSalary, OtherSalary, InsertBy,MyFil_name  FROM VEmp "></asp:SqlDataSource>

  <div  style="border: 1px solid #C0C0C0; height:94%; overflow:auto">

       <asp:GridView ID="Grid" runat="server"  Width="94%" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            AllowSorting="True"  CssClass="bordered" BackColor="White" onrowdatabound="Grid_RowDataBound" 
                  ><Columns><asp:BoundField DataField="EmpCode" HeaderText="EmpCode" 
                    SortExpression="EmpCode" />
<asp:CheckBoxField DataField="Active" HeaderText="Active" 
                    SortExpression="Active" />
<asp:BoundField DataField="Empname_en" HeaderText="Empname_en" 
                    SortExpression="Empname_en" />
<asp:BoundField DataField="Empname_Ar" HeaderText="Empname_Ar" 
                    SortExpression="Empname_Ar" />
<asp:BoundField DataField="Email" HeaderText="Email" 
                    SortExpression="Email" />
<asp:BoundField DataField="Phone" HeaderText="Phone" 
                    SortExpression="Phone" />
<asp:BoundField DataField="KafilName" HeaderText="KafilName" 
                    SortExpression="KafilName" />
<asp:BoundField DataField="jobVisa" HeaderText="jobVisa" 
                    SortExpression="jobVisa" />
<asp:BoundField DataField="Job" HeaderText="Job" 
                    SortExpression="Job" />
<asp:BoundField DataField="HireDate" HeaderText="HireDate" 
                    SortExpression="HireDate" DataFormatString="{0:d}" />
<asp:BoundField DataField="EnterNumber" HeaderText="EnterNumber" 
                    SortExpression="EnterNumber" />
<asp:BoundField DataField="EnterDate" HeaderText="EnterDate" 
                    SortExpression="EnterDate" DataFormatString="{0:d}"/>
<asp:BoundField DataField="EnterPlace" HeaderText="EnterPlace" 
                    SortExpression="EnterPlace" />
<asp:BoundField DataField="Branch" HeaderText="Branch" 
                    SortExpression="Branch" />
<asp:BoundField DataField="Gender" HeaderText="Gender" 
                    SortExpression="Gender" />
<asp:BoundField DataField="Nation" HeaderText="Nation" 
                    SortExpression="Nation" />
<asp:BoundField DataField="SocialState" HeaderText="SocialState" 
                    SortExpression="SocialState" />
<asp:BoundField DataField="Religion" HeaderText="Religion" 
                    SortExpression="Religion" />
<asp:BoundField DataField="BirthDate" HeaderText="BirthDate" 
                    SortExpression="BirthDate" DataFormatString="{0:d}" />
<asp:BoundField DataField="Addressinside" HeaderText="Addressinside" 
                    SortExpression="Addressinside" />
<asp:BoundField DataField="addressoutside" HeaderText="addressoutside" 
                    SortExpression="addressoutside" />
<asp:BoundField DataField="Baridramz" HeaderText="Baridramz" 
                    SortExpression="Baridramz" />
<asp:BoundField DataField="PersonRelative" HeaderText="PersonRelative" 
                    SortExpression="PersonRelative" />
<asp:BoundField DataField="PersonTel" HeaderText="PersonTel" 
                    SortExpression="PersonTel" />
<asp:CheckBoxField DataField="isdriving" HeaderText="isdriving" 
                    SortExpression="isdriving" />
<asp:BoundField DataField="DriveId" HeaderText="DriveId" 
                    SortExpression="DriveId" />
<asp:BoundField DataField="DriveExpireDate" HeaderText="DriveExpireDate" 
                    SortExpression="DriveExpireDate" DataFormatString="{0:d}" />
<asp:BoundField DataField="HawiaId" HeaderText="HawiaId" 
                    SortExpression="HawiaId" />
<asp:BoundField DataField="HawiaExpiredatehijri" HeaderText="HawiaExpiredatehijri" 
                    SortExpression="HawiaExpiredatehijri"  DataFormatString="{0:d}" />
<asp:BoundField DataField="HawiaExpiredate" HeaderText="HawiaExpiredate" 
                    SortExpression="HawiaExpiredate" DataFormatString="{0:d}" />
<asp:BoundField DataField="PassportId" HeaderText="PassportId" 
                    SortExpression="PassportId" />
<asp:BoundField DataField="PassportDate" HeaderText="PassportDate" 
                    SortExpression="PassportDate" DataFormatString="{0:d}" />
<asp:BoundField DataField="PassportExpireDate" HeaderText="PassportExpireDate" 
                    SortExpression="PassportExpireDate" />
<asp:BoundField DataField="Department" HeaderText="Department" 
                    SortExpression="Department" />
<asp:CheckBoxField DataField="HasTime" HeaderText="HasTime" 
                    SortExpression="HasTime" />
<asp:BoundField DataField="BSalary" HeaderText="BSalary" 
                    SortExpression="BSalary" />
<asp:BoundField DataField="TransSalary" HeaderText="TransSalary" 
                    SortExpression="TransSalary" />
<asp:BoundField DataField="CommunSalary" HeaderText="CommunSalary" 
                    SortExpression="CommunSalary" />
<asp:BoundField DataField="HouseSalary" HeaderText="HouseSalary" 
                    SortExpression="HouseSalary" />
<asp:BoundField DataField="OtherSalary" HeaderText="OtherSalary" 
                    SortExpression="OtherSalary" />
<asp:BoundField DataField="InsertBy" HeaderText="InsertBy" 
                    SortExpression="InsertBy" />
<asp:BoundField DataField="MyFil_name" HeaderText="MyFil_name" 
                    SortExpression="MyFil_name" />
</Columns>

<PagerSettings Visible="False" />

<PagerStyle Width="200px" Wrap="True" />
</asp:GridView>

           
    </div>

    </div>
 
    </form>
</body>
</html>
