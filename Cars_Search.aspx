<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Cars_Search.aspx.cs" Inherits="Cars_Search" EnableEventValidation="false" %>

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
                    Width="100px" CssClass="Mybutton" />
                <asp:Button ID="Button1" runat="server" Height="30px" onclick="BtnExport_Click" 
                    Text="Excel" Width="100px" CssClass="Mybutton" />
        
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
                    Text="ALL"  />
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
            
            SelectCommand="SELECT Serial, CarId,LohaId,Branch,CarType,CarSubType,Manif_Year,PurchaseDate,InsuranceExpireDate,EstmaraExpireDate,Notes  FROM VCars ">
        </asp:SqlDataSource>
   
    <div class="MyGrid_Div" >
     <table cellpadding="0" cellspacing="0" dir="ltr" 
            style="width: 100%; background-color: #FFFFFF"; height: 77px;">
    <tr>
        <td width="1%">
             </td>
        <td width="98%">

        <asp:GridView ID="Grid" runat="server"  Width="100%" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            AllowSorting="True" onrowdatabound="Grid_RowDataBound" CssClass="bordered" 
                onselectedindexchanged="Grid_SelectedIndexChanged"  >

      

            <Columns>
                <asp:BoundField DataField="Serial" HeaderText="Serial" 
                    SortExpression="Serial" />

                <asp:BoundField DataField="CarId" HeaderText="CarId" 
                    SortExpression="CarId" />
                <asp:BoundField DataField="LohaId" HeaderText="LohaId" 
                    SortExpression="LohaId" />
                       <asp:BoundField DataField="CarType" HeaderText="CarType" 
                    SortExpression="CarType" />
                <asp:BoundField DataField="Branch" HeaderText="Branch" 
                    SortExpression="Branch" />
                
                 <asp:BoundField DataField="CarSubType" HeaderText="CarSubType" 
                    SortExpression="CarSubType" />
                
                <asp:BoundField DataField="Manif_Year" HeaderText="Manif_Year" 
                    SortExpression="Manif_Year" />
                <asp:BoundField DataField="PurchaseDate" HeaderText="PurchaseDate" 
                    SortExpression="PurchaseDate" DataFormatString="{0:MM/dd/yyyy}"/>
                <asp:BoundField DataField="InsuranceExpireDate" HeaderText="InsuranceExpireDate" 
                    SortExpression="InsuranceExpireDate" DataFormatString="{0:MM/dd/yyyy}" />
                <asp:BoundField DataField="EstmaraExpireDate" HeaderText="EstmaraExpireDate" 
                    SortExpression="EstmaraExpireDate" DataFormatString="{0:MM/dd/yyyy}" />
                <asp:BoundField DataField="Notes" HeaderText="Notes" 
                    SortExpression="Notes" />
                 <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperReply" runat="server" 
                                    NavigateUrl='<%# Eval("CarId", "~/Cars.aspx?Serial={0}") %>' 
                                        Text='Edit'></asp:HyperLink>
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


