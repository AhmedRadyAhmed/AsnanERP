<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CollectRep.aspx.cs" Inherits="CollectRep" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 477px">
    <table class="style1">
        <tr>
            <td style="text-align: right">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right">
                Customerid</td>
            <td>
                &nbsp;</td>
            <td>
                 <asp:TextBox ID="CustomerId" runat="server" CssClass="textbox" 
                    Height="22px" Width="131px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="text-align: right">
                Sman id</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:TextBox ID="Smanid" runat="server" CssClass="textbox" 
                    Height="22px" Width="131px"></asp:TextBox>
                     </td>
        </tr>
        <tr>
            <td style="width: 213px; text-align: right;">
                Date From :</td>
            <td style="color: #FF0000; width: 10px;">
                &nbsp;</td>
            <td style="text-align: left">
                <asp:TextBox ID="DateFrom" runat="server" CssClass="textbox" 
                    Height="22px" Width="131px"></asp:TextBox>

                <asp:CalendarExtender ID="DateFrom_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="DateFrom">
                </asp:CalendarExtender>

                <asp:RangeValidator ID="RangeValidator16" runat="server" 
                    ControlToValidate="DateFrom" ErrorMessage="Invalid Date Format" 
                    ForeColor="Red" MaximumValue="1/1/2050" MinimumValue="1/1/1940" 
                    Type="Date" Display="Dynamic"></asp:RangeValidator>
           
                </td>
        </tr>

        <tr>
            <td style="text-align: right">
                To :</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:TextBox ID="DateTo" runat="server" CssClass="textbox" 
                    Height="22px" Width="131px"></asp:TextBox>
                <asp:CalendarExtender ID="DateTo_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="DateTo">
                </asp:CalendarExtender>
                <asp:RangeValidator ID="RangeValidator26" runat="server" 
                    ControlToValidate="DateTo" ErrorMessage="Invalid Date Format" 
                    ForeColor="Red" MaximumValue="1/1/2050" MinimumValue="1/1/1940" 
                    Type="Date" Display="Dynamic"></asp:RangeValidator>
                <asp:CompareValidator ID="CompareValidator3" runat="server" 
                    ControlToCompare="DateFrom" ControlToValidate="DateTo" Display="Dynamic" 
                    ErrorMessage="Date must be Greater Than Date from or Equal" 
                    Operator="GreaterThanEqual" style="color: #F80000" Type="Date"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
            <asp:Button ID="BtnRep" runat="server" Text="Ok" class="button" 
                 Height="26px" onclick="BtnLogin_Click" Width="135px" CssClass="Mybutton" />
	        </td>
        </tr>
        <tr>
            <td style="text-align: right">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </div>
</asp:Content>

