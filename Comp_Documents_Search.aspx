<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Comp_Documents_Search.aspx.cs" Inherits="Comp_Documents_Search" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   
    
    <div style="background-color: #F2F9FF; height: 434px;">
    <table align="left" cellpadding="2" 
            style="width: 100%; background-color: #F2F9FF; height: 363px;">
        <tr>
            <td style="width: 190px; text-align: right; background-color: #F2F9FF;">
                 </td>
            <td style="color: #FF0000; width: 9px;">
                 </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="width: 190px; text-align: right; background-color: #F2F9FF;">
                Company</td>
            <td style="font-family: Tahoma; color: #FF0000; width: 9px;">
                 </td>
            <td style="text-align: left">
                <asp:DropDownList ID="CompId" runat="server" Height="28px" Width="304px" 
                    AutoPostBack="True" onselectedindexchanged="CompId_SelectedIndexChanged" 
                    CssClass="textbox">
                </asp:DropDownList>
 </td>
        </tr>
        <tr>
            <td style="width: 190px; text-align: right; background-color: #F2F9FF;">
                Type</td>
            <td style="color: #FF0000; width: 9px;">
                 </td>
            <td style="text-align: left">
                <asp:DropDownList ID="Comp_DocumentTypeId" runat="server" Height="28px" 
                    Width="304px" 
                    onselectedindexchanged="Comp_DocumentTypeId_SelectedIndexChanged" 
                    AutoPostBack="True" CssClass="textbox">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 190px; text-align: right; background-color: #F2F9FF;">
                Sub Company</td>
            <td style="color: #FF0000; width: 9px;">
                 </td>
            <td style="text-align: left">
                <asp:DropDownList ID="SubCompId" runat="server" Height="28px" 
                    Width="304px" CssClass="textbox">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 190px; text-align: right; background-color: #F2F9FF;">
                Employee</td>
            <td style="color: #FF0000; width: 9px;">
                 </td>
            <td style="text-align: left">
                <asp:DropDownList ID="EmpCode" runat="server" Height="28px" 
                    Width="304px" CssClass="textbox">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 190px; text-align: right; background-color: #F2F9FF;">
                Document Name</td>
            <td style="color: #FF0000; width: 9px;">
                 </td>
            <td style="text-align: left">
                <asp:TextBox ID="docname" runat="server" Height="22px" Width="300px" 
                    CssClass="textbox"></asp:TextBox>
 </td>
        </tr>
        <tr>
            <td style="width: 190px; text-align: right; background-color: #F2F9FF;">
                File Name</td>
            <td style="color: #FF0000; width: 9px;">
                 </td>
            <td style="text-align: left">
                <asp:TextBox ID="MyFil_name" runat="server" Height="22px" Width="300px" 
                    CssClass="textbox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 190px; text-align: right; background-color: #F2F9FF;">
                Date From</td>
            <td style="color: #FF0000; width: 9px;">
                 </td>
            <td style="text-align: left">
                <asp:TextBox ID="DocDateFrom" runat="server" Height="22px" Width="300px" 
                    CssClass="textbox"></asp:TextBox>
                <asp:CalendarExtender ID="DocDateFrom_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="DocDateFrom">
                </asp:CalendarExtender>
 <asp:RangeValidator ID="RangeValidator16" runat="server" 
                    ControlToValidate="DocDateFrom" ErrorMessage="Invalid Date Format" ForeColor="Red" 
                    MaximumValue="1/1/2050" MinimumValue="1/1/1940" Type="Date"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 190px; text-align: right; background-color: #F2F9FF;">
                to</td>
            <td style="color: #FF0000; width: 9px;">
                 </td>
            <td style="text-align: left">
                <asp:TextBox ID="DocDateto" runat="server" Height="22px" Width="300px" 
                    CssClass="textbox"></asp:TextBox>
                <asp:CalendarExtender ID="DocDateto_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="DocDateto">
                </asp:CalendarExtender>
                <asp:RangeValidator ID="RangeValidator18" runat="server" 
                    ControlToValidate="DocDateto" ErrorMessage="Invalid Date Format" ForeColor="Red" 
                    MaximumValue="1/1/2050" MinimumValue="1/1/1940" Type="Date" 
                    Display="Dynamic"></asp:RangeValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="DocDateFrom" ControlToValidate="DocDateto" Display="Dynamic" 
                    ErrorMessage="Date must be Greater Than Date from or Equal" 
                    Operator="GreaterThanEqual" style="color: #F80000" Type="Date"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 190px; text-align: right; background-color: #F2F9FF;">
                Expire Date From</td>
            <td style="color: #FF0000; width: 9px;">
                 </td>
            <td style="text-align: left">
                <asp:TextBox ID="DocExpireFrom" runat="server" Height="22px" Width="300px" 
                    CssClass="textbox"></asp:TextBox>
                <asp:CalendarExtender ID="DocExpireFrom_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="DocExpireFrom">
                </asp:CalendarExtender>
                <asp:RangeValidator ID="RangeValidator17" runat="server" 
                    ControlToValidate="DocDateFrom" ErrorMessage="Invalid Date Format" 
                    ForeColor="Red" MaximumValue="1/1/2050" MinimumValue="1/1/1940" 
                    Type="Date"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 190px; text-align: right; background-color: #F2F9FF;">
                to</td>
            <td style="color: #FF0000; width: 9px;">
                 </td>
            <td style="text-align: left">
                <asp:TextBox ID="DocExpireto" runat="server" Height="22px" Width="300px" 
                    CssClass="textbox"></asp:TextBox>
                <asp:CalendarExtender ID="DocExpireto_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="DocExpireto">
                </asp:CalendarExtender>
                <asp:RangeValidator ID="RangeValidator19" runat="server" 
                    ControlToValidate="DocExpireto" ErrorMessage="Invalid Date Format" 
                    ForeColor="Red" MaximumValue="1/1/2050" MinimumValue="1/1/1940" 
                    Type="Date" Display="Dynamic"></asp:RangeValidator>
                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                    ControlToCompare="DocExpireFrom" ControlToValidate="DocExpireto" 
                    Display="Dynamic" ErrorMessage="Date must be Greater Than Date from or Equal" 
                    Operator="GreaterThanEqual" style="color: #F80000" Type="Date"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 190px; text-align: right; background-color: #F2F9FF;">
                Notes</td>
            <td style="color: #FF0000; width: 9px;">
                 </td>
            <td style="text-align: left">
                <asp:TextBox ID="DocDesc" runat="server" Height="22px" Width="300px" 
                    CssClass="textbox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 190px; text-align: right; background-color: #F2F9FF;">
                 </td>
            <td style="color: #FF0000; width: 9px;">
                 </td>
            <td style="text-align: left">
                <asp:CheckBox ID="ChkExpire" runat="server" 
                    style="color: #FF0000; font-weight: 700; font-family: Tahoma" 
                    Text="Expire Only" />
            </td>
        </tr>
        <tr>
            <td style="width: 190px; text-align: right; background-color: #F2F9FF;">
                 </td>
            <td style="color: #FF0000; width: 9px;">
                 </td>
            <td style="text-align: left">
                <asp:Button ID="BtnSearch" runat="server" Height="30px" Text="Search" 
                    Width="100px" onclick="BtnSearch_Click"   
                    OnClientClick="Page_ClientValidate();Loading(true);" CssClass="textbox" />
                <asp:Button ID="BtnNew" runat="server" Height="30px" Text="New" 
                    Width="100px" onclick="BtnNew_Click"   
                    OnClientClick="Page_ClientValidate();Loading(true);" CssClass="textbox" />
            </td>
        </tr>
        <tr>
            <td style="width: 190px; text-align: right; background-color: #F2F9FF; height: 26px;">
                </td>
            <td style="color: #FF0000; width: 9px; height: 26px;">
                </td>
            <td style="text-align: left; height: 26px;">
                </td>
        </tr>
        </table>
</div> 

    
   

    
</asp:Content>