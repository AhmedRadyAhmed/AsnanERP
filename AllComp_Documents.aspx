<%@ Page Title="Documents" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AllComp_Documents.aspx.cs" Inherits="AllComp_Documents" EnableEventValidation="false" %>

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
<div style=" background-color: #E8F4FF;">
   
    <table class="style10">
        <tr>
            <td>
    
                <asp:Button ID="backButton" runat="server" Height="30px" 
                    OnClientClick="JavaScript:window.history.back(1);return false;" text="Back" 
                    Width="100px" CssClass="textbox" />
                <asp:Button ID="Button1" runat="server" Height="30px" onclick="BtnExport_Click" 
                    Text="Excel" Width="100px" CssClass="textbox" />
        
            </td>
            <td>
                <asp:Label ID="LblCount" runat="server" 
                    style="font-weight: 400; font-family: Tahoma"></asp:Label>
            </td>
            <td>
                 </td>
            <td>
                 </td>
            <td>
                <asp:CheckBox ID="ChkAll" runat="server" AutoPostBack="True" CssClass="style12" 
                    Font-Bold="False" oncheckedchanged="ChkAll_CheckedChanged" TabIndex="3" 
                    Text="ALL" />
            </td>
            <td>
                <asp:CheckBox ID="Chksubcompany" runat="server" AutoPostBack="True" 
                    CssClass="style12" Font-Bold="False" oncheckedchanged="ChkCdate_CheckedChanged" 
                    TabIndex="3" Text="Sub Company" />
            </td>
            <td>
                <asp:CheckBox ID="Chkempno" runat="server" AutoPostBack="True" 
                    CssClass="style12" Font-Bold="False" oncheckedchanged="ChkCdate_CheckedChanged" 
                    TabIndex="7" Text="Employee Id" />
            </td>
            <td>
                <asp:CheckBox ID="ChkCdate" runat="server" AutoPostBack="True" 
                    CssClass="style12" Font-Bold="False" oncheckedchanged="ChkCdate_CheckedChanged" 
                    TabIndex="8" Text="Transaction Date" />
            </td>
            <td>
                <asp:CheckBox ID="ChkNotes" runat="server" AutoPostBack="True" 
                    CssClass="style12" Font-Bold="False" oncheckedchanged="ChkCdate_CheckedChanged" 
                    TabIndex="9" Text="Notes" />
            </td>
            <td>
                <asp:CheckBox ID="ChkFilename" runat="server" AutoPostBack="True" 
                    CssClass="style12" Font-Bold="False" oncheckedchanged="ChkCdate_CheckedChanged" 
                    TabIndex="10" Text="File Name" />
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

   
    
       
                     <asp:Label ID="lblerror" runat="server" ForeColor="Red" ></asp:Label>
                
    
</div>

   
   
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Myconnection %>" 
            
            SelectCommand="SELECT serial,Compname,Comp_DocumentType,subcompname,docname,DocDesc,DocDate,DocExpire,InsertBy,InsertDate,DocDesc,MyFil_name,CompId,Comp_DocumentTypeId FROM  V_Comp_Documents ">
        </asp:SqlDataSource>
   
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
                <asp:BoundField DataField="Compname" HeaderText="Company" 
                    SortExpression="Compname" />
                <asp:BoundField DataField="Comp_DocumentType" HeaderText="Type" 
                    SortExpression="Comp_DocumentType" />
                
                 <asp:BoundField DataField="SubCompname" HeaderText="Sub Comp" 
                    SortExpression="SubCompname" Visible="False" />
                
                <asp:BoundField DataField="docname" HeaderText="Name" 
                    SortExpression="docname" />
                <asp:BoundField DataField="DocDate" HeaderText="DocDate" 
                    SortExpression="DocDate" DataFormatString="{0:MM/dd/yyyy}" />
                <asp:BoundField DataField="DocExpire" HeaderText="DocExpire" 
                    SortExpression="DocExpire" DataFormatString="{0:MM/dd/yyyy}" />
                <asp:BoundField DataField="InsertBy" HeaderText="Emp Id" SortExpression="InsertBy" 
                    Visible="False" />
                <asp:BoundField DataField="InsertDate" HeaderText="InsertDate" 
                    SortExpression="InsertDate" Visible="False" 
                    DataFormatString="{0:MM/dd/yyyy}" />
                <asp:BoundField DataField="DocDesc" HeaderText="Notes" 
                    SortExpression="DocDesc" Visible="False" />
                       <asp:BoundField DataField="MyFil_name" HeaderText="File Name" 
                    SortExpression="MyFil_name" Visible="False" />
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


