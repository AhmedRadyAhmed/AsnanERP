<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CloseYear.aspx.cs" Inherits="CloseYear" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="height: 477px">
    <table class="style1">
        <tr>
            <td>
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
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right">
                Year</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:TextBox ID="yr" runat="server" CssClass="textbox" onkeypress="return isNumberKey(event)" 
                    Height="22px" Width="131px" AutoPostBack="True" 
                    ontextchanged="yr_TextChanged"></asp:TextBox>
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                                                      ControlToValidate="yr" Display="Dynamic" ErrorMessage="Employee Code" 
                                                      ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                                               

                                                   

                     </td>
        </tr>
        <tr>
            <td style="width: 213px; text-align: right;">
                &nbsp;</td>
            <td style="color: #FF0000; width: 10px;">
                &nbsp;</td>
            <td style="text-align: left">
                &nbsp;</td>
        </tr>

        <tr>
            <td style="text-align: right">
                </td>
            <td>
                &nbsp;</td>
            <td>
            <asp:Button ID="BtnRep" runat="server" Text="Close/Unclose" class="button" 
                 Height="26px" onclick="BtnLogin_Click" Width="135px" CssClass="Mybutton" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </div>
</asp:Content>

