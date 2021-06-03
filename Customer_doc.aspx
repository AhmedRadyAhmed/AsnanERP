<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Customer_doc.aspx.cs" Inherits="Customer_doc" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" 
   BackImageUrl="~/images/bgContent.gif" Height="53px">
 <div style=" height: 68px; background-repeat: no-repeat; background-color: #F2F9FF; color: #000000; font-size: small; font-weight: 400; font-family: sans-serif;">
  <table cellpadding="0" cellspacing="0" width="100%" dir="ltr" style="background-image: url('images/bgContent.gif')" 
   >
   <tr>
    <td colspan="7" style="height: 8px">
     </td>
   </tr>
   <tr>
    <td>
      </td>
    <td>
     Customer Id</td>
    <td>
     <asp:TextBox ID="CustomerId" runat="server" AutoPostBack="True" 
      CssClass="textbox" Height="22px" ontextchanged="CustomerId_TextChanged" onkeypress="return isNumberKey(event)"
      Width="200px"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
      ControlToValidate="CustomerId" Display="Dynamic" ErrorMessage="Employee Code" 
      ForeColor="#CC0000">*</asp:RequiredFieldValidator>
     <asp:TextBox ID="CustName" runat="server" AutoPostBack="True" 
      CssClass="textbox" Font-Bold="True" Height="22px" 
      ontextchanged="CustomerId_TextChanged" ReadOnly="True" Width="400px" 
      BackColor="#FFFFCC"></asp:TextBox>
    </td>
    <td>
      </td>
    <td>
      </td>
    <td style="width: 12px">
      </td>
    <td>
      </td>
   </tr>
   </table>
  </div>
 
 </asp:Panel>
<div>

<table cellpadding="0" cellspacing="0" dir="ltr" style="width: 100%">
 <tr>
  <td width="1%">
    </td>
  <td width="98%">
   <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
    Height="418px" Width="100%" CssClass="fancy fancy-green">
    <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="New Document">
     <HeaderTemplate>
         New Document
        </HeaderTemplate>
     
        
     <ContentTemplate>
     
         
 

     
     <div style="height: 333px; background-color: #F2F9FF;">
 <div >
 <table align="left" cellpadding="2" style="width: 100%; " 
            cellspacing="2"><tr>
 <td style="width: 140px; text-align: right;">Document Type</td>
                     
 <td style="font-family: Tahoma; color: #FF0000; width: 9px;">*</td>
                     
 <td style="text-align: left; margin-left: 40px;">
                         

             <asp:DropDownList ID="CustomerDocTypeId" runat="server" 
                    CssClass="textbox" Height="25px" 
                     Width="150px" 
                    onselectedindexchanged="CustomerDocTypeId_SelectedIndexChanged"></asp:DropDownList>
                         &#160;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="CustomerDocTypeId" ErrorMessage="RequiredFieldValidator" 
                    ForeColor="#CC0000" InitialValue="0">*</asp:RequiredFieldValidator>
                         


             <asp:DropDownList ID="Motabek" runat="server" 
                    CssClass="textbox" Height="25px" Width="150px"><asp:ListItem Value="0">--Choose--</asp:ListItem>
                 
                 <asp:ListItem Value="1">مطايق</asp:ListItem>
                 <asp:ListItem Value="2">غير مطابق</asp:ListItem>
                         </asp:DropDownList>
                         


             <asp:TextBox ID="Balance" runat="server" CssClass="textbox" 
                    Height="22px" onkeypress="return isNumberKey(event)" 
                    ontextchanged="CustomerId_TextChanged" Width="150px"></asp:TextBox>
                     </td></tr>
 <tr><td style="width: 140px; text-align: right;">Name</td><td style="color: #FF0000; width: 9px;">*</td><td style="text-align: left"><asp:TextBox ID="docname" runat="server" CssClass="textbox" Height="22px" 
                    Width="300px"></asp:TextBox>
                     &#160;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="docname" ErrorMessage="RequiredFieldValidator" 
                    ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                     </td></tr>
 <tr><td style="width: 140px; text-align: right;">Date</td><td style="color: #FF0000; width: 9px;">*</td><td style="text-align: left">
                     
 <asp:TextBox ID="DocDate" runat="server" Height="22px" Width="300px" 
                    CssClass="textbox"></asp:TextBox>

 <asp:CalendarExtender ID="DocDate_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="DocDate"></asp:CalendarExtender>

 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="DocDate" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000">*</asp:RequiredFieldValidator>

 <asp:RangeValidator ID="RangeValidator16" runat="server" 
                    ControlToValidate="DocDate" ErrorMessage="Invalid Date Format" ForeColor="Red" 
                    MaximumValue="1/1/2050" MinimumValue="1/1/1940" Type="Date"></asp:RangeValidator>
                     
                     </td></tr>
 <tr><td style="width: 140px; text-align: right;">Expire Date</td>
                     
 <td style="color: #FF0000; width: 9px;">&#160;</td>
                     
 <td style="text-align: left"><asp:TextBox ID="DocExpire" runat="server" Height="22px" Width="300px" 
                    CssClass="textbox"></asp:TextBox>

 <asp:CalendarExtender ID="DocExpire_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="DocExpire"></asp:CalendarExtender>
                         &#160;<asp:RangeValidator ID="RangeValidator17" runat="server" 
                    ControlToValidate="DocExpire" ErrorMessage="Invalid Date Format" 
                    ForeColor="Red" MaximumValue="1/1/2050" MinimumValue="1/1/1940" Type="Date"></asp:RangeValidator>
                         

 <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="DocDate" ControlToValidate="DocExpire" Display="Dynamic" 
                    ErrorMessage="Expire Date must be Greater than Document Date" ForeColor="Red" 
                    Operator="GreaterThan" Type="Date"></asp:CompareValidator>
                     </td></tr>
 <tr><td style="width: 140px; text-align: right;">File ( Pdf &#160; Only)</td>
                     
 <td style="color: #FF0000; width: 9px;">*</td>
                     
 <td style="text-align: left">
                         
 <asp:FileUpload ID="Fileupload1" runat="server" />
                         


                         <br />
                         <asp:TextBox ID="MyFil_name" runat="server" Height="22px" ReadOnly="True" 
                    Width="300px" Visible="False" BackColor="#FFFFCC" CssClass="textbox"></asp:TextBox>
                     </td></tr>
 <tr><td style="width: 140px; text-align: right;">Notes</td><td style="color: #FF0000; width: 9px;">&#160;</td><td style="text-align: left">
                     
 <asp:TextBox ID="DocDesc" runat="server" Height="22px" Width="300px" 
                    CssClass="textbox"></asp:TextBox>
                     </td></tr>
 <tr><td style="width: 140px; text-align: right;">&#160;</td><td style="color: #FF0000; width: 9px;">&#160;</td><td style="text-align: left">&#160;</td></tr><tr>
                 
 <td style="width: 140px; text-align: right;">&#160;</td>
                 
 <td style="color: #FF0000; width: 9px;">&#160;</td>
                 
 <td style="text-align: left">
                     <asp:Button ID="BtnSave" runat="server" Height="30px" onclick="BtnSave_Click" 
                    OnClientClick="Page_ClientValidate();Loading(true);" Text="Save" 
                    Width="100px" CssClass="Mybutton" />
                     <asp:Button ID="BtnUpdate" runat="server" Height="30px" 
                    onclick="BtnUpdate_Click" Text="update" 
                    Width="100px" Visible="False" 
                    onclientclick="Page_ClientValidate();Loading(true);" CssClass="Mybutton" />
                     <asp:Button ID="BtnNew" runat="server" CausesValidation="False" Height="30px" 
                    onclick="BtnNew_Click" Text="New" Width="100px" CssClass="Mybutton" />
                     <asp:TextBox ID="RecId" runat="server" Height="17px" Visible="False" 
                    Width="48px"></asp:TextBox>
                     <asp:Button ID="BtnSearch" runat="server" CausesValidation="False" 
                    CssClass="Mybutton" Height="30px" onclick="BtnSearch_Click" Text="Search" 
                    Width="100px" />
                 </td></tr><tr>
 <td style="width: 140px; text-align: right;">&#160;</td>
                     
 <td style="color: #FF0000; width: 9px;">&#160;</td>
                     
 <td style="text-align: left"><asp:Label ID="LblerrorFile" runat="server" ForeColor="Red" 
                    style="font-weight: 400" Visible="False"></asp:Label>
                     </td></tr></table></div></div>
                    
               
 
         
 
                    
               </ContentTemplate>
     
     
        
    </asp:TabPanel>
    
    
    <asp:TabPanel ID="TabPanel4" runat="server" HeaderText="Documents">
     
     <ContentTemplate>
         

     <div style="text-align: right; height: 33px;">
         

         <asp:DropDownList ID="CustomerDocTypeIdFilter" runat="server" CssClass="textbox" 
             Height="25px" OnSelectedIndexChanged="CustomerDocTypeIdFilter_SelectedIndexChanged" 
             Width="150px" AutoPostBack="True">
             

         </asp:DropDownList>
         

     </div>
         

     <div style=" height:389px; overflow:auto">
 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
   ConnectionString="<%$ ConnectionStrings:Myconnection %>" 
   
   
  SelectCommand=" SELECT top 50 Serial, CustomerId, CustomerName, CustomerDocType, docname, DocDesc,CONVERT(VARCHAR, [DocDate], 1) as DocDate , CONVERT(VARCHAR, [DocExpire], 1) as DocExpire, MyFil_name FROM V_Customer_Documents where ([CustomerId] = @CustomerId) order by serial desc" 
  ProviderName="System.Data.SqlClient">
 <SelectParameters>
 <asp:ControlParameter ControlID="CustomerId" Name="CustomerId" PropertyName="Text" Type="String" /></SelectParameters></asp:SqlDataSource><asp:GridView 
             ID="Grid" runat="server"  Width="100%" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            AllowSorting="True"  CssClass="bordered" BackColor="White" 
             onrowdatabound="Grid_RowDataBound" onselectedindexchanged="Grid_SelectedIndexChanged" 
                  ><Columns>
 <asp:BoundField DataField="Serial" 
                    SortExpression="Serial" />
 <asp:BoundField DataField="CustomerId" HeaderText="CustomerId" 
                    SortExpression="CustomerId"/>
 <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" 
                    SortExpression="CustomerName" ></asp:BoundField>
 <asp:BoundField DataField="CustomerDocType" HeaderText="CustomerDocType" 
                    SortExpression="CustomerDocType" ></asp:BoundField>
 <asp:BoundField DataField="docname" HeaderText="docname" 
                    SortExpression="docname" />
 <asp:BoundField DataField="DocDesc" HeaderText="DocDesc" 
                    SortExpression="DocDesc" />
 <asp:BoundField DataField="DocDate" HeaderText="DocDate" 
                    SortExpression="DocDate" ReadOnly="True" />
 <asp:BoundField DataField="DocExpire" HeaderText="DocExpire" 
                    SortExpression="DocExpire" ReadOnly="True" ></asp:BoundField>
 <asp:BoundField DataField="MyFil_name" HeaderText="MyFil_name" 
                    SortExpression="MyFil_name" /></Columns>
 <HeaderStyle ForeColor="Black" />
             
 <PagerSettings Visible="False" />
             
 <PagerStyle Width="200px" Wrap="True" /></asp:GridView></div>
         
        </ContentTemplate>
     
        
    </asp:TabPanel>
   </asp:TabContainer>
  </td>
  <td width="1%">
    </td>
 </tr>
</table>
</div>
 </asp:Content>
