<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CustomerLimit.aspx.cs" Inherits="CustomerLimit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellspacing="1" dir="ltr" style="width: 100%; >
        <tr>
            <td style="width: 127px; text-align: right">
                 </td>
            <td style="width: 8px">
                 </td>
            <td style="width: 8px">
                 </td>
            <td style="width: 4px">
                 </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="width: 127px; text-align: right">
                Customer Id :</td>
            <td style="width: 8px">
                 </td>
            <td style="width: 720px">
                    <asp:TextBox ID="CustomerId" runat="server" AutoPostBack="True" 
                        CssClass="textbox" Height="22px" 
                    ontextchanged="CustomerId_TextChanged" onkeypress="return isNumberKey(event)"
                        Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ForeColor="#CC0000" 
                    ControlToValidate="CustomerId" ErrorMessage="RequiredFieldValidator" 
                    ID="RequiredFieldValidator5">*</asp:RequiredFieldValidator>
            </td>
            <td style="width: 4px">
                 </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="width: 127px; text-align: right">
                Customer Name :</td>
            <td style="width: 8px">
                 </td>
            <td style="width: 720px">
                    <asp:TextBox ID="CustName" runat="server" AutoPostBack="True" 
                        CssClass="textbox" Font-Bold="True" Height="22px" 
                        ontextchanged="CustomerId_TextChanged" ReadOnly="True" Width="100%" 
                        BackColor="#FFFFCC"></asp:TextBox>
                </td>
            <td style="text-align: right; width: 4px">
                 </td>
            <td style="text-align: right">
                 </td>
        </tr>
        <tr>
            <td style="width: 127px; text-align: right">
                Limit :</td>
            <td style="width: 8px">
                 </td>
            <td style="width: 720px">
                <asp:TextBox runat="server" CssClass="textbox" Height="22px" 
                    Width="200px" ID="cLimit" onkeypress="return isNumberKey(event)"  ></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ForeColor="#CC0000" 
                    ControlToValidate="cLimit" ErrorMessage="RequiredFieldValidator" 
                    ID="RequiredFieldValidator4">*</asp:RequiredFieldValidator>
 </td>
            <td style="text-align: right; width: 4px">
                 </td>
            <td style="text-align: right">
                 </td>
        </tr>
        <tr>
            <td style="width: 127px; text-align: right">
                 </td>
            <td style="width: 8px">
                 </td>
            <td style="width: 720px">
                 </td>
            <td style="width: 4px">
                 </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="width: 127px; text-align: right">
                 </td>
            <td style="width: 8px">
                 </td>
            <td style="width: 720px">
                <asp:Button ID="BtnChange" runat="server" Text="Change" Width="150px" 
                    onclick="BtnChange_Click" CssClass="Mybutton" Height="25px" />
            </td>
            <td style="width: 4px">
                 </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="width: 127px; text-align: right">
                 </td>
            <td style="width: 8px">
                 </td>
            <td style="width: 720px">
                 </td>
            <td style="width: 4px">
                 </td>
            <td>
                 </td>
        </tr>
    </table>
</asp:Content>

