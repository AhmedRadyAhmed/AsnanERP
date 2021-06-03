<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Cust_Mn.aspx.cs" Inherits="Cust_Mn" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 153px">
   <div style="height: 158px" >
    <table class="style1">
        <tr>
            <td style="text-align: right; width: 108px;">
                 </td>
            <td>
                 </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 108px;">
                 &nbsp;</td>
            <td>
                 &nbsp;</td>
            <td>
         <asp:DropDownList ID="MType" runat="server" Width="135px" CssClass="textbox" 
                 Height="28px">
         </asp:DropDownList>
                 </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 108px;">
                 &nbsp;</td>
            <td>
                 &nbsp;</td>
            <td>
                 &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right; width: 108px;">
                Sales Man</td>
            <td>
                 </td>
            <td>
                <asp:TextBox ID="Smanid" runat="server" CssClass="textbox" 
                    Height="22px" Width="131px"></asp:TextBox>
                    </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 108px;">
                Customer Id :</td>
            <td>
                 </td>
            <td>
                <asp:TextBox ID="CustomerId" runat="server" CssClass="textbox" 
                    Height="22px" Width="131px"></asp:TextBox>
                     </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 108px;">
                 &nbsp;</td>
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
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 108px;">
                 </td>
            <td>
                 </td>
            <td>
                <asp:CheckBox ID="Active" runat="server" Text="Customers Active Only" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 108px;">
                 </td>
            <td>
                 </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 108px;">
                 &nbsp;</td>
            <td>
                 </td>
            <td>
                <asp:Button ID="BtnOk" runat="server" onclick="Button1_Click" Text="OK" 
                    Width="133px" CssClass="Mybutton" />
            </td>
        </tr>
        </table>
    </div>
    </div>
      </asp:Content>


