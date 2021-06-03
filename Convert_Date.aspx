<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Convert_Date.aspx.cs" Inherits="Convert_Date" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td style="text-align: right">
                 </td>
            <td>
                 </td>
            <td>
                 </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="text-align: right">
                 </td>
            <td>
                 </td>
            <td>
                 </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="text-align: right">
                 </td>
            <td>
                 </td>
            <td style="font-weight: 700">
                Hijri Date(dd/mm/yyyy)<br />
                Geg Date(mm/dd/yyyy)</td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="text-align: right">
                 </td>
            <td>
                 </td>
            <td>
                 </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="text-align: right">
                Date From </td>
            <td>
                 </td>
            <td>
               <asp:TextBox 
                    ID="Hijridate" runat="server" CssClass="textbox" Height="22px" 
                        Width="300px"  ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="Hijridate" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000">*</asp:RequiredFieldValidator>
           
                <asp:RangeValidator ID="RangeValidator16" runat="server" 
                    ControlToValidate="Hijridate" ErrorMessage="Invalid Date Format" ForeColor="Red" 
                    MaximumValue="1/1/2100" MinimumValue="1/1/1300" Type="Date"></asp:RangeValidator>
            </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="text-align: right">
                 </td>
            <td>
                 </td>
            <td>
                <asp:Button ID="BtnConvert" runat="server" Height="30px" 
                    onclick="BtnConvert_Click" Text="Convert From Hijri To Greg" 
                    Width="300px" CssClass="textbox" 
                     />
                    </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="text-align: right">
                 </td>
            <td>
                 </td>
            <td>
                <asp:Button ID="BtnConvert0" runat="server" Height="30px" 
                    onclick="BtnConvert0_Click1" Text="Convert From Greg To Hijri" 
                    Width="300px" CssClass="textbox" 
                     />
                    </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="text-align: right">
                Date To</td>
            <td>
                 </td>
            <td>
               <asp:TextBox 
                    ID="GegDate" runat="server" CssClass="textbox" Height="22px" 
                        Width="300px" onkeypress="return isNumberKey(event)"  ></asp:TextBox>
                </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="text-align: right">
                 </td>
            <td>
                 </td>
            <td>
                 </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="height: 23px; text-align: right">
            </td>
            <td style="height: 23px">
                 </td>
            <td style="height: 23px">
            </td>
            <td style="height: 23px">
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                 </td>
            <td>
                 </td>
            <td>
                 </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="text-align: right">
                 </td>
            <td>
                 </td>
            <td>
                 </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="text-align: right">
                 </td>
            <td>
                 </td>
            <td>
                 </td>
            <td>
                 </td>
        </tr>
    </table>
</asp:Content>

