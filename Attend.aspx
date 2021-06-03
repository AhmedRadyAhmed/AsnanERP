<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Attend.aspx.cs" Inherits="Attend" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="height: 289px; text-align: left;">
  
      <table align="left" dir="ltr" cellpadding="2" style="width: 100%; " 
            cellspacing="2">
        <tr>
            <td>
                 </td>
            <td>
                 </td>
            <td>
                 </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td style="height: 19px">
                From</td>
            <td style="height: 19px">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="TextBox1">
                </asp:CalendarExtender>
            </td>
            <td style="height: 19px">
                </td>
            <td style="height: 19px">
                </td>
        </tr>
        <tr>
            <td>
                 </td>
            <td>
                 </td>
            <td>
                 </td>
            <td>
                 </td>
        </tr>
        <tr>
            <td>
                To</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="TextBox2">
                </asp:CalendarExtender>
            </td>
            <td>
                 </td>
            <td>
                 </td>
        </tr>
          <tr>
              <td>
                   </td>
              <td>
                   </td>
              <td>
                   </td>
              <td>
                   </td>
          </tr>
        <tr>
            <td>
                 </td>
            <td>
                <asp:Button ID="BtnOk" runat="server" onclick="Btn_OK_Click" Text="Ok" 
                    Height="30px" Width="150px" CssClass="Mybutton" />
            </td>
            <td>
                 </td>
            <td>
                 </td>
        </tr>
          <tr>
              <td>
                   </td>
              <td>
                   </td>
              <td>
                   </td>
              <td>
                   </td>
          </tr>
          <tr>
              <td>
                   </td>
              <td>
                   </td>
              <td>
                   </td>
              <td>
                   </td>
          </tr>
          <tr>
              <td>
                   </td>
              <td>
                   </td>
              <td>
                   </td>
              <td>
                   </td>
          </tr>
    </table>
    
    </div>

</asp:Content>

