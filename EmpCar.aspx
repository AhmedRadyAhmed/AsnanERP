<%@ Page Title="Employee Car" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="EmpCar.aspx.cs" Inherits="EmpCar" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="background-color: #F2F9FF; height: 628px;">

    
     
    <table align="left" cellpadding="2" style="width: 100%; " 
            cellspacing="2">
        <tr>
            <td style="width: 140px; text-align: right;">
                &nbsp;</td>
            <td style="font-family: Tahoma; color: #FF0000; width: 9px;">
                &nbsp;</td>
            <td style="text-align: left">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                Employee Id</td>
            <td style="font-family: Tahoma; color: #FF0000; width: 9px;">
                *</td>
            <td style="text-align: left">
                <asp:TextBox ID="EmpCode" runat="server" Height="22px" Width="300px" 
                    CssClass="textbox" AutoPostBack="True" ontextchanged="EmpCode_TextChanged" onkeypress="return isNumberKey(event)"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ControlToValidate="EmpCode" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                Employee Name</td>
            <td style="font-family: Tahoma; color: #FF0000; width: 9px;">
                *</td>
            <td style="text-align: left">
                <asp:DropDownList ID="EmpName" runat="server" Height="25px" 
                    Width="304px" 
                   
                    CssClass="textbox" AutoPostBack="True" 
                    onselectedindexchanged="EmpName_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="EmpName" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000" InitialValue="0">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                Car Id</td>
            <td style="font-family: Tahoma; color: #FF0000; width: 9px;">
                *</td>
            <td style="text-align: left">
                <asp:TextBox ID="Carid" runat="server" Height="22px" Width="300px" 
                    CssClass="textbox" AutoPostBack="True" ontextchanged="LohaId_TextChanged" 
                    onkeypress="return isNumberKey(event)"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="Carid" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                Car&nbsp; </td>
            <td style="font-family: Tahoma; color: #FF0000; width: 9px;">
                *</td>
            <td style="text-align: left">
                <asp:DropDownList ID="Carinfo" runat="server" Height="25px" Width="304px" onselectedindexchanged="Carinfo_SelectedIndexChanged" 
                    CssClass="textbox" AutoPostBack="True">
                </asp:DropDownList>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="Carinfo" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000" InitialValue="0">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                &nbsp;Recieve Date</td>
            <td style="color: #FF0000; width: 9px;">
                *</td>
            <td style="text-align: left">
                <asp:TextBox ID="RecvDate" runat="server" Height="22px" Width="300px" 
                    CssClass="textbox"></asp:TextBox>
                <asp:CalendarExtender ID="RecvDate_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="RecvDate">
                </asp:CalendarExtender>
<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="RecvDate" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator16" runat="server" 
                    ControlToValidate="RecvDate" ErrorMessage="Invalid Date Format" ForeColor="Red" 
                    MaximumValue="1/1/2050" MinimumValue="1/1/1940" Type="Date"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                Kilometer</td>
            <td style="color: #FF0000; width: 9px;">
                *</td>
            <td style="text-align: left">
                <asp:TextBox ID="KilometerFrom" runat="server" Height="22px" Width="300px" 
                    CssClass="textbox" onkeypress="return isNumberKey(event)"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="KilometerFrom" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                To Date</td>
            <td style="color: #FF0000; width: 9px;">
                &nbsp;</td>
            <td style="text-align: left">

                <asp:TextBox ID="Todate" runat="server" Height="22px" Width="300px" 
                    CssClass="textbox"></asp:TextBox>
                <asp:CalendarExtender ID="Todate_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="Todate">
                </asp:CalendarExtender>
             
                <asp:RangeValidator ID="RangeValidator18" runat="server" 
                    ControlToValidate="Todate" ErrorMessage="Invalid Date Format" ForeColor="Red" 
                    MaximumValue="1/1/2050" MinimumValue="1/1/1940" Type="Date"></asp:RangeValidator>
             
            </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                Kilometer</td>
            <td style="color: #FF0000; width: 9px;">
                &nbsp;</td>
            <td style="text-align: left">
                <asp:TextBox ID="Kilometerto" runat="server" Height="22px" Width="300px" 
                    CssClass="textbox" onkeypress="return isNumberKey(event)"></asp:TextBox>
            </td>
        </tr>
        <tr> 
            <td style="width: 140px; text-align: right;">
                Notes</td>
            <td style="color: #FF0000; width: 9px;">
                &nbsp;</td>
            <td style="text-align: left">
                <asp:TextBox ID="Notes" runat="server" CssClass="textbox" Height="22px" 
                    Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                &nbsp;</td>
            <td style="color: #FF0000; width: 9px;">
                &nbsp;</td>
            <td style="text-align: left">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                &nbsp;</td>
            <td style="color: #FF0000; width: 9px;">
                &nbsp;</td>
            <td style="text-align: left">
                <asp:Button ID="BtnSave" runat="server" Height="30px" onclick="BtnSave_Click" Text="Save" 
                    Width="100px" CssClass="Mybutton" 
                    onclientclick="Page_ClientValidate();Loading(true);" />
                    <asp:Button ID="BtnUpdate" runat="server" Height="30px" 
                    onclick="BtnUpdate_Click" Text="update" 
                    Width="100px" Visible="False" CssClass="Mybutton" 
                    onclientclick="Page_ClientValidate();Loading(true);" />
                <asp:Button ID="BtnSearch" runat="server" CausesValidation="False" Height="30px" 
                    onclick="BtnSearch_Click" Text="Search" Width="100px" 
                    CssClass="Mybutton" />
                <asp:Button ID="BtnNew" runat="server" CausesValidation="False" Height="30px" 
                    onclick="BtnNew_Click" Text="New" Width="100px" CssClass="Mybutton" />
                <asp:TextBox ID="RecId" runat="server" Height="17px" Visible="False" 
                    Width="48px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                &nbsp;</td>
            <td style="color: #FF0000; width: 9px;">
                &nbsp;</td>
            <td style="text-align: left">
                &nbsp;</td>
        </tr>
        </table>
  <div>
   <asp:Button ID="Btn_msg" runat="server" Text="Button" Style="display: none" />
    <asp:ModalPopupExtender ID="Msg_Modal" runat="server" 
        DynamicServicePath="" Enabled="True" 
        TargetControlID="Btn_msg"
         PopupControlID="Pnl" 
            BackgroundCssClass="ModalBack_msg" 
            OkControlID="BtnOk"
          
            CancelControlID="BtnCancel" 
           
        >
    </asp:ModalPopupExtender>
    <asp:Panel ID="Pnl" runat="server"  Width="293px" Height ="148px" 
        style="border: 1px solid #FFAAAA; background-color: #FFFFCC" >
         
    <div style="text-align: right; border: 1px solid #A4A4A4; background-color: #D4D0C8">
        <asp:Button ID="BtnCancel" runat="server" Text="x" />
        </div>
        <table cellpadding="0" cellspacing="0" dir="ltr" style="width: 100%">
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="width: 18px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="width: 165px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td colspan="5" style="font-family: Tahoma">
                    <asp:Label ID="lblmsg" runat="server" 
                        style=" font-family: Tahoma" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="width: 18px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="width: 165px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="width: 18px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="width: 165px">
                    <asp:Button ID="BtnOk" runat="server" Text="Ok" Width="60px" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="width: 18px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="width: 165px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
       
    </asp:Panel>
  
  </div>
   
    </div>
</asp:Content>

