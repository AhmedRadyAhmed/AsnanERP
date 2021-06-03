<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="All_PO_Documents.aspx.cs" Inherits="Al_PO_Documents" EnableEventValidation="false" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
   
   
        <asp:Panel ID="Panel1" runat="server">
       
    <asp:Panel ID="PanelMainheader" runat="server" BackColor="#D0D0CF" 
        BorderColor="#C6C6C6" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" 
        Font-Size="Small" ForeColor="#000066" Height="28px" Width="900px" 
        
        
                style="font-weight: 400; font-family: Tahoma; background-color: #3488BC; color: #FFFFFF;">
        <asp:Image ID="ImgToggle" runat="server" ImageUrl="~/images/collapse.jpg" 
            Height="25px" />
            </asp:Panel>

    <asp:Panel ID="Panel2" runat="server" BackColor="#F7F7F7" 
        
        
        
                style="border: 1px solid #DDDDDD; background-color: #E8F4FF; color: #000066; font-family: Tahoma;">
<div style=" background-color: #E8F4FF; ">
   
    <table border="0" cellpadding="0" cellspacing="0" width="100%" >
        <tr>
            <td>
    
                <asp:Button ID="backButton" runat="server" Height="30px" 
                    OnClientClick="JavaScript:window.history.back(1);return false;" text="Back" 
                    Width="100px" CssClass="textbox" />
                <asp:Button ID="Button1" runat="server" Height="30px" onclick="BtnExport_Click" 
                    Text="Excel" Width="100px" CssClass="textbox" />
        
            </td>
            <td>
                <asp:CheckBox ID="ChkAll" runat="server" AutoPostBack="True" CssClass="style12" 
                    Font-Bold="False" oncheckedchanged="ChkAll_CheckedChanged" TabIndex="3" 
                    Text="ALL" Checked="True" style="font-weight: 400" />
            </td>
            <td>
                <asp:CheckBox ID="ChkAccno" runat="server" AutoPostBack="True" 
                    CssClass="style12" Font-Bold="False" oncheckedchanged="ChkCdate_CheckedChanged" 
                    TabIndex="2" Text="AccNo" Checked="True" />
            </td>
            <td>
                <asp:CheckBox ID="ChkDocname" runat="server" AutoPostBack="True" 
                    CssClass="style12" Font-Bold="False" oncheckedchanged="ChkCdate_CheckedChanged" 
                    TabIndex="3" Text="Name" Checked="True" />
            </td>
            <td>
                <asp:CheckBox ID="ChkInvoiceNo" runat="server" AutoPostBack="True" 
                    CssClass="style12" Font-Bold="False" oncheckedchanged="ChkCdate_CheckedChanged" 
                    TabIndex="4" Text="Inv No" Checked="True" />
            </td>
            <td>
                <asp:CheckBox ID="ChkAmountDollar" runat="server" AutoPostBack="True" 
                    CssClass="style12" Font-Bold="False" oncheckedchanged="ChkCdate_CheckedChanged" 
                    TabIndex="5" Text="Am($)" Checked="True" />
            </td>
            <td>
                <asp:CheckBox ID="ChkAmountRyal" runat="server" AutoPostBack="True" 
                    CssClass="style12" Font-Bold="False" oncheckedchanged="ChkCdate_CheckedChanged" 
                    TabIndex="6" Text="Am(Ryal)" Checked="True" />
            </td>
            <td>
                <asp:CheckBox ID="ChkRecieveNo" runat="server" AutoPostBack="True" 
                    CssClass="style12" Font-Bold="False" oncheckedchanged="ChkCdate_CheckedChanged" 
                    TabIndex="7" Text="RecvNo" Checked="True" />
            </td>
            <td>
                <asp:CheckBox ID="ChkRecieveDate" runat="server" AutoPostBack="True" 
                    CssClass="style12" Font-Bold="False" oncheckedchanged="ChkCdate_CheckedChanged" 
                    TabIndex="8" Text="RecvDt" Checked="True" />
            </td>
            <td>
                <asp:CheckBox ID="FinanceOutNo" runat="server" AutoPostBack="True" 
                    CssClass="style12" Font-Bold="False" oncheckedchanged="ChkCdate_CheckedChanged" 
                    TabIndex="9" Text="FincNo" Checked="True" />
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Label ID="LblCount" runat="server" 
                    style="font-weight: 700; font-family: Tahoma"></asp:Label>
            </td>
            <td>
                 </td>
            <td>
                <asp:CheckBox ID="ChkFincDt" runat="server" AutoPostBack="True" 
                    CssClass="style12" Font-Bold="False" oncheckedchanged="ChkCdate_CheckedChanged" 
                    TabIndex="10" Text="FincDt" Checked="True" />
            </td>
            <td>
                <asp:CheckBox ID="ChkMohNo" runat="server" AutoPostBack="True" 
                    CssClass="style12" Font-Bold="False" oncheckedchanged="ChkCdate_CheckedChanged" 
                    TabIndex="11" Text="MohNo " Checked="True" />
            </td>
            <td>
                <asp:CheckBox ID="Chkindate" runat="server" AutoPostBack="True" 
                    CssClass="style12" Font-Bold="False" oncheckedchanged="ChkCdate_CheckedChanged" 
                    TabIndex="12" Text="In Date" Checked="True" />
            </td>
            <td>
                <asp:CheckBox ID="ChkFlNM" runat="server" AutoPostBack="True" 
                    CssClass="style12" Font-Bold="False" oncheckedchanged="ChkCdate_CheckedChanged" 
                    TabIndex="13" Text="FileNm" Checked="True" />
            </td>
            <td>
                <asp:CheckBox ID="ChkDocDesc" runat="server" AutoPostBack="True" 
                    CssClass="style12" Font-Bold="False" oncheckedchanged="ChkCdate_CheckedChanged" 
                    TabIndex="14" Text="Notes" Checked="True" />
            </td>
            <td>
                <asp:CheckBox ID="ChkEmpCode" runat="server" AutoPostBack="True" 
                    CssClass="style12" Font-Bold="False" oncheckedchanged="ChkCdate_CheckedChanged" 
                    TabIndex="15" Text="userid" Checked="True" />
            </td>
            <td>
                <asp:CheckBox ID="ChkEmpname" runat="server" AutoPostBack="True" 
                    CssClass="style12" Font-Bold="False" oncheckedchanged="ChkCdate_CheckedChanged" 
                    TabIndex="16" Text="userNm" Checked="True" />
            </td>
            <td>
                <asp:CheckBox ID="ChkISfinished" runat="server" AutoPostBack="True" 
                    CssClass="style12" Font-Bold="False" oncheckedchanged="ChkCdate_CheckedChanged" 
                    TabIndex="17" Text="Finished" Checked="True" />
            </td>
        </tr>
    </table>
    </div>
    </asp:Panel>

     <asp:CollapsiblePanelExtender ID="PnMainDet_CollapsiblePanelExtender" 
    runat="server" CollapseControlID="PanelMainheader" 
    CollapsedImage="~/images/expand.jpg" Enabled="True" 
    ExpandControlID="PanelMainheader" ExpandedImage="~/images/collapse.jpg" 
    ImageControlID="ImgToggle" SuppressPostBack="True" TargetControlID="Panel2" 
        Collapsed="True">
</asp:CollapsiblePanelExtender>


     </asp:Panel>

    <div style="text-align: center; font-weight: 700; height: 22px;">

      <%--  <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>--%>
    
       
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Myconnection %>" 
            
            SelectCommand="SELECT serial,Compname,AccNo ,docname ,InvoiceNo ,AmountDollar ,AmountRyall ,EstlamNoTemp ,EstlamTempDate ,FinanceOutNo ,FinanceOutDate ,MohNo ,InDate ,MyFil_name ,DocDesc,EmpCode,Empname_en,Empname_Ar ,ISfinished,CompId FROM V_PO_Documents ">
        </asp:SqlDataSource>

   
    
       
                     <asp:Label ID="lblerror" runat="server" ForeColor="Red" ></asp:Label>
                
    
</div>

   
   
    <div class="MyGrid_Div" >
     <table cellpadding="0" cellspacing="0" dir="ltr" 
            style="width: 100%; background-color: #F2F9FF; height: 77px;">
    <tr>
        <td width="1%">
             </td>
        <td width="98%">

        <asp:GridView ID="Grid" runat="server"  Width="100%" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            AllowSorting="True" onrowdatabound="Grid_RowDataBound" CssClass="bordered" 
                onselectedindexchanged="Grid_SelectedIndexChanged"  >

      

            <Columns>


                <asp:BoundField DataField="serial" HeaderText="serial" 
                    SortExpression="serial" />
                <asp:BoundField DataField="Compname" HeaderText="Compname" 
                    SortExpression="Compname" />
                <asp:BoundField DataField="AccNo" HeaderText="AccNo" 
                    SortExpression="AccNo" />
                
                 <asp:BoundField DataField="docname" HeaderText="docname" 
                    SortExpression="docname" />
                
                <asp:BoundField DataField="InvoiceNo" HeaderText="InvoiceNo" 
                    SortExpression="InvoiceNo" />
                <asp:BoundField DataField="AmountDollar" HeaderText="AmountDollar" 
                    SortExpression="AmountDollar" />
                <asp:BoundField DataField="AmountRyall" HeaderText="AmountRyall" 
                    SortExpression="AmountRyall" />
                <asp:BoundField DataField="EstlamNoTemp" HeaderText="EstlamNoTemp" 
                    SortExpression="EstlamNoTemp" />
                <asp:BoundField DataField="EstlamTempDate" HeaderText="EstlamTempDate" 
                    SortExpression="EstlamTempDate" DataFormatString="{0:MM/dd/yyyy}" />
                <asp:BoundField DataField="FinanceOutNo" HeaderText="FinanceOutNo" 
                    SortExpression="FinanceOutNo" />
                       <asp:BoundField DataField="FinanceOutDate" HeaderText="FinanceOutDate" 
                    SortExpression="FinanceOutDate" DataFormatString="{0:MM/dd/yyyy}" />
                <asp:BoundField DataField="MohNo" HeaderText="MohNo" SortExpression="MohNo" />
                <asp:BoundField DataField="InDate" HeaderText="InDate" 
                    SortExpression="InDate" DataFormatString="{0:MM/dd/yyyy}" />
                <asp:BoundField DataField="MyFil_name" HeaderText="MyFil_name" 
                    SortExpression="MyFil_name" />
                <asp:BoundField DataField="DocDesc" HeaderText="DocDesc" 
                    SortExpression="DocDesc" />
                <asp:BoundField DataField="EmpCode" HeaderText="EmpCode" 
                    SortExpression="EmpCode" />
                <asp:BoundField DataField="Empname_en" HeaderText="Empname En" 
                    SortExpression="Empname_en" />
                      <asp:BoundField DataField="Empname_Ar" HeaderText="Empname Ar" 
                    SortExpression="Empname_Ar" />
                <asp:CheckBoxField DataField="ISfinished" HeaderText="ISfinished" 
                    SortExpression="ISfinished" />
                <asp:BoundField DataField="CompId" HeaderText="CompId" 
                    SortExpression="CompId" Visible="False" />
                     <asp:TemplateField HeaderText="Open" ShowHeader="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="BtnPdf" runat="server" ImageUrl="~/images/Open-icon.png" 
                            onclick="BtnPdf_Click"  Width="20px" Height="16px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Save">
                    <ItemTemplate>
                        <asp:ImageButton ID="BtnSavePdf" runat="server" 
                            ImageUrl="~/images/saveicon.jpg" onclick="BtnSavePdf_Click" Width="16px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False" HeaderText="Del">
                    <ItemTemplate>
                    <span onclick="return confirm('Are you Sure you Want to Delete this Record?')">
                        <asp:ImageButton ID="BtnDeleteGrid" runat="server" Height="16px" 
                            ImageUrl="~/images/deleteicon.jpg" onclick="BtnDeleteGrid_Click" />
                            </span>
                        
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerSettings Visible="False" />
            <PagerStyle Width="200px" Wrap="True" />
        </asp:GridView>

            </td>
        <td width="1%">
             </td>
    </tr>
    </table>
    </div>
       

</asp:Content>

