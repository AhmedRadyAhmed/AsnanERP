<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="EmpAttendReport.aspx.cs" Inherits="EmpAttendReport" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="height: 441px; text-align: left;">
   
   
      <table align="left" dir="ltr" cellpadding="2" style="width: 100%; " 
            cellspacing="2">
          <tr>
              <td style="text-align: right">
                  &nbsp;</td>
              <td style="width: 5px">
                  &nbsp;</td>
              <td>
              </td>
              <td>
                  &nbsp;</td>
              <td>
                  &nbsp;</td>
          </tr>
          <tr>
              <td style="text-align: right">
                  Employee Code</td>
              <td style="width: 5px">
              </td>
              <td>
                  <asp:TextBox ID="EmpCode" runat="server" CssClass="textbox" 
                      onkeypress="return isNumberKey(event)" Width="200px"></asp:TextBox>
              </td>
              <td>
              </td>
              <td>
              </td>
          </tr>
          <tr>
              <td style="text-align: right">
                  Branch</td>
              <td style="width: 5px">
                  &nbsp;</td>
              <td>
                  <asp:DropDownList ID="BranchId" runat="server" CssClass="textbox" Width="204px">
                  </asp:DropDownList>
              </td>
              <td>
                  &nbsp;</td>
              <td>
                  &nbsp;</td>
          </tr>
        <tr>
            <td style="height: 19px; text-align: right;">
                  Gender</td>
            <td style="height: 19px; width: 5px;">
                &nbsp;</td>
            <td style="height: 19px">
                <asp:DropDownList ID="GenderId" runat="server" CssClass="textbox" Width="204px">
                </asp:DropDownList>
            </td>
            <td style="height: 19px">
                </td>
            <td style="height: 19px">
                </td>
        </tr>
        <tr>
            <td style="height: 19px; text-align: right;">
                Nationality</td>
            <td style="height: 19px; width: 5px;">
                &nbsp;</td>
            <td style="height: 19px">
                <asp:DropDownList ID="NationId" runat="server" CssClass="textbox" 
                    Width="204px">
                </asp:DropDownList>
            </td>
            <td style="height: 19px">
                &nbsp;&nbsp;</td>
            <td style="height: 19px">
                &nbsp;&nbsp;</td>
        </tr>
          <tr>
              <td style="height: 19px; text-align: right;">
                  Departmen</td>
              <td style="height: 19px; width: 5px;">
                  &nbsp;</td>
              <td style="height: 19px">
                  <asp:DropDownList ID="DepartmentId" runat="server" CssClass="textbox" 
                      Width="204px">
                  </asp:DropDownList>
              </td>
              <td style="height: 19px">
                  &nbsp;</td>
              <td style="height: 19px">
                  &nbsp;</td>
          </tr>
          <tr>
              <td style="height: 19px; text-align: right;">
                  JobIdt</td>
              <td style="height: 19px; width: 5px;">
                  &nbsp;</td>
              <td style="height: 19px">
                  <asp:DropDownList ID="JobId" runat="server" CssClass="textbox" Width="204px">
                  </asp:DropDownList>
              </td>
              <td style="height: 19px">
                  &nbsp;</td>
              <td style="height: 19px">
                  &nbsp;</td>
          </tr>
          <tr>
              <td style="text-align: right">
                  shiftid</td>
              <td style="width: 5px">
                  &nbsp;</td>
              <td>
                  <asp:DropDownList ID="ShiftId" runat="server" CssClass="textbox" Width="204px">
                  </asp:DropDownList>
              </td>
              <td>
                  &nbsp;</td>
              <td>
                  &nbsp;</td>
          </tr>
        <tr>
            <td style="text-align: right">
                  From</td>
            <td style="width: 5px">
                &nbsp;</td>
            <td>
                  <asp:TextBox ID="AtDateFrom" runat="server"></asp:TextBox>
                  <asp:CalendarExtender ID="AtDateFrom_CalendarExtender" runat="server" 
                      Enabled="True" TargetControlID="AtDateFrom">
                  </asp:CalendarExtender>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right">
                To&nbsp;&nbsp;</td>
            <td style="width: 5px">
                &nbsp;</td>
            <td>
                <asp:TextBox ID="AtDateTo" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="AtDateTo_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="AtDateTo">
                </asp:CalendarExtender>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right">
                &nbsp;</td>
            <td style="width: 5px">
                &nbsp;</td>
            <td>
                <asp:Button ID="BtnOk" runat="server" onclick="Btn_OK_Click" Text="Ok" 
                    Height="30px" Width="150px" CssClass="Mybutton" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
          <tr>
              <td style="text-align: right">
                  &nbsp;</td>
              <td style="width: 5px">
                  &nbsp;</td>
              <td>
                  &nbsp;&nbsp;</td>
              <td>
                  </td>
              <td>
                  &nbsp;</td>
          </tr>
          <tr>
              <td style="text-align: right">
                  &nbsp;</td>
              <td style="width: 5px">
                  &nbsp;</td>
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
              <td style="width: 5px">
                  &nbsp;</td>
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

