<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AccRep_Cust.aspx.cs" Inherits="Acc_Pack" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 477px">
    <table class="style1">
        <tr>
            <td style="text-align: right; width: 142px;">
                 &nbsp;</td>
            <td style="width: 4px">
                 &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right; width: 142px;">
                 &nbsp;</td>
            <td style="width: 4px">
                 &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right; width: 142px;">
                 Acc Number </td>
            <td style="width: 4px">
                 &nbsp;</td>
            <td>
                <asp:TextBox ID="AccCode" runat="server" CssClass="textbox" 
                    Height="22px" Width="131px" AutoPostBack="True" 
                    ontextchanged="AccCode_TextChanged"></asp:TextBox>
                <asp:TextBox ID="AccNm" runat="server" CssClass="textbox" 
                    Height="22px" Width="300px" AutoPostBack="True" 
                    ontextchanged="AccNm_TextChanged"></asp:TextBox>

                    <asp:AutoCompleteExtender 
                    ID="AutoCompleteExtender1" runat="server" CompletionInterval="1000" 
                    CompletionSetCount="2" EnableCaching="true" MinimumPrefixLength="1" 
                    ServiceMethod="Getaccountnumber" TargetControlID="AccNm">
                    
                    </asp:AutoCompleteExtender>
                     </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 142px;">
                 Package</td>
            <td style="width: 4px">
                 </td>
            <td>
                <asp:TextBox ID="Categ_id" runat="server" CssClass="textbox" 
                    Height="22px" Width="131px" AutoPostBack="True" 
                    ontextchanged="Categ_id_TextChanged"></asp:TextBox>
                <asp:TextBox ID="CategName" runat="server" CssClass="textbox" 
                    Height="22px" Width="300px" AutoPostBack="True" 
                    ontextchanged="CategName_TextChanged"></asp:TextBox>

                    <asp:AutoCompleteExtender 
                    ID="CategName_AutoCompleteExtender" runat="server" CompletionInterval="1000" 
                    CompletionSetCount="2" EnableCaching="true" MinimumPrefixLength="1" 
                    ServiceMethod="GetCategnumber" TargetControlID="CategName">
                    
                    </asp:AutoCompleteExtender>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 142px;">
                Satatus</td>
            <td style="width: 4px">
                 </td>
            <td>
                <asp:TextBox ID="Acc_statusid" runat="server" CssClass="textbox" 
                    Height="22px" Width="131px" AutoPostBack="True" 
                    ontextchanged="Acc_statusid_TextChanged"></asp:TextBox>
                <asp:TextBox ID="Acc_Satatus" runat="server" CssClass="textbox" 
                    Height="22px" Width="300px" AutoPostBack="True" 
                    ontextchanged="Acc_Satatus_TextChanged"></asp:TextBox>

                    <asp:AutoCompleteExtender 
                    ID="Acc_Satatus_AutoCompleteExtender" runat="server" CompletionInterval="1000" 
                    CompletionSetCount="2" EnableCaching="true" MinimumPrefixLength="1" 
                    ServiceMethod="GetstatusNumber" TargetControlID="Acc_Satatus">
                    
                    </asp:AutoCompleteExtender>
                     </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 142px;">
                 &nbsp;</td>
            <td style="width: 4px">
                 &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right; width: 142px;">
                 </td>
            <td style="width: 4px">
                 </td>
            <td>
            <asp:Button ID="Btn_ok" runat="server" Text="OK" class="button" 
                 Height="26px" onclick="Btn_ok_Click" Width="135px" CssClass="Mybutton" />
	        </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 142px;">
                 </td>
            <td style="width: 4px">
                 </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 142px;">
                 </td>
            <td style="width: 4px">
                 </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right; width: 142px;">
                 </td>
            <td style="width: 4px">
                 </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 142px;">
                 &nbsp;</td>
            <td style="width: 4px">
                 &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </div>
</asp:Content>


