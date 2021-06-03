<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%">
        <tr>
            <td style="width: 44px">
                 </td>
            <td style="width: 136px">
                 </td>
            <td>
                 </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="width: 44px">
                 </td>
            <td style="width: 136px">
                Current Password</td>
            <td>
                <asp:TextBox ID="Currenpassword" runat="server" Height="25px" TextMode="Password" 
                    Width="300px" CssClass="textbox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="Currenpassword" ErrorMessage="RequiredFieldValidator" 
                            ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    
            </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="width: 44px; height: 32px;">
                </td>
            <td style="width: 136px; height: 32px;">
                New Password</td>
            <td style="height: 32px">
                        <asp:TextBox ID="uPassword" runat="server" Height="25px" 
                                Width="300px" TextMode="Password" CssClass="textbox"></asp:TextBox>
                        <asp:PasswordStrength ID="uPassword_PasswordStrength" runat="server" 
                            Enabled="True" RequiresUpperAndLowerCaseCharacters="True" 
                            StrengthIndicatorType="BarIndicator" TargetControlID="uPassword" 
                            MinimumLowerCaseCharacters="1" MinimumNumericCharacters="1" MinimumUpperCaseCharacters="1" 
                            PreferredPasswordLength="8" HelpHandlePosition="RightSide" 
                            HelpStatusLabelID="LblPassword" 
                            TextStrengthDescriptions="Very Poor,Weak,Average;Strong;Excelent">
                        </asp:PasswordStrength>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="uPassword" ErrorMessage="RequiredFieldValidator" 
                            ForeColor="#CC0000" Display="Dynamic">*</asp:RequiredFieldValidator>
                    
                        <asp:Label ID="LblPassword" runat="server" ForeColor="#CC0000"></asp:Label>
                    
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="uPassword" Display="Dynamic" ErrorMessage="Error" 
                            ValidationExpression="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"></asp:RegularExpressionValidator>
                    
                        </td>
            <td style="height: 32px">
                </td>
        </tr>
        <tr>
            <td style="width: 44px">
                 </td>
            <td style="width: 136px">
                Confirm</td>
            <td>
                        <asp:TextBox ID="ConfirmuPassword" runat="server" Height="25px" 
                    Width="300px" TextMode="Password" CssClass="textbox"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="ConfirmuPassword" ErrorMessage="RequiredFieldValidator" 
                            ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" 
                            ControlToCompare="uPassword" ControlToValidate="ConfirmuPassword" 
                            Display="Dynamic" ErrorMessage="CompareValidator" 
                    ForeColor="#CC0000">Unmatched Passwords</asp:CompareValidator>
                    </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="height: 23px; width: 44px">
            </td>
            <td style="height: 23px; width: 136px">
            </td>
            <td style="height: 23px">
            </td>
            <td style="height: 23px">
            </td>
        </tr>
        <tr>
            <td style="width: 44px">
                 </td>
            <td style="width: 136px">
                 </td>
            <td>
                <asp:Button ID="BtnSave" runat="server" Height="29px" onclick="BtnSave_Click" 
                    Text="Ok" Width="118px" CssClass="Mybutton" />
              
              <asp:Label ID="lblerror" runat="server" ForeColor="Red" 
                  style="font-weight: 700" Visible="False"></asp:Label>
            </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="width: 44px">
                 </td>
            <td style="width: 136px">
                 </td>
            <td>
                 </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="width: 44px">
                 </td>
            <td style="width: 136px">
                 </td>
            <td>
                 </td>
            <td>
                 </td>
        </tr>
    </table>
</asp:Content>

