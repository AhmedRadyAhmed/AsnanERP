<%@ Page Title="Cars" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Cars.aspx.cs" Inherits="Cars" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="background-color: #F2F9FF; height: 461px;">
    <table align="left" cellpadding="2" style="width: 100%; " 
            cellspacing="2">
        <tr>
            <td style="width: 140px; text-align: right;">
                 </td>
            <td style="font-family: Tahoma; color: #FF0000; width: 9px;">
                 </td>
            <td style="text-align: left">
                 </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                Car Id</td>
            <td style="color: #FF0000; width: 9px;">
                *</td>
            <td style="text-align: left">
               <asp:TextBox 
                    ID="m" runat="server" CssClass="textbox" Height="22px" 
                        Width="300px" onkeypress="return isNumberKey(event)" 
                    ontextchanged="CarId_TextChanged"  ></asp:TextBox>
                  
                </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                Branch</td>
            <td style="color: #FF0000; width: 9px;">
                *</td>
            <td style="text-align: left">
                    <asp:DropDownList ID="BranchId" runat="server" CssClass="textbox" Height="28px" 
                        Width="304px">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="BranchId" Display="Dynamic" ErrorMessage="Employee Code" 
                        ForeColor="#CC0000" InitialValue="0">*</asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                Loha Id</td>
            <td style="color: #FF0000; width: 9px;">
                *</td>
            <td style="text-align: left">
                <asp:TextBox ID="LohaId" runat="server" Height="22px" Width="300px" 
                    CssClass="textbox" ontextchanged="LohaId_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="LohaId" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                Car  type</td>
            <td style="font-family: Tahoma; color: #FF0000; width: 9px;">
                *</td>
            <td style="text-align: left">
                <asp:DropDownList ID="CartypeId" runat="server" Height="25px" Width="304px" onselectedindexchanged="CompId_SelectedIndexChanged" 
                    CssClass="textbox">
                </asp:DropDownList>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="CartypeId" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000" InitialValue="0">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                Sub type</td>
            <td style="color: #FF0000; width: 9px;">
                *</td>
            <td style="text-align: left">
                <asp:DropDownList ID="CarSubTypeId" runat="server" Height="25px" 
                    Width="304px" 
                   
                    CssClass="textbox">
                </asp:DropDownList>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="CarSubTypeId" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000" InitialValue="0">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                Model</td>
            <td style="color: #FF0000; width: 9px;">
                *</td>
            <td style="text-align: left">
               <asp:TextBox 
                    ID="Manif_Year" runat="server" CssClass="textbox" Height="22px" 
                        Width="300px" onkeypress="return isNumberKey(event)"  ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="Manif_Year" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                 Purchase
                Date</td>
            <td style="color: #FF0000; width: 9px;">
                *</td>
            <td style="text-align: left">
                <asp:TextBox ID="PurchaseDate" runat="server" Height="22px" Width="300px" 
                    CssClass="textbox"></asp:TextBox>
                <asp:CalendarExtender ID="PurchaseDate_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="PurchaseDate">
                </asp:CalendarExtender>
<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="PurchaseDate" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator16" runat="server" 
                    ControlToValidate="PurchaseDate" ErrorMessage="Invalid Date Format" ForeColor="Red" 
                    MaximumValue="1/1/2050" MinimumValue="1/1/1940" Type="Date"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                Ins
                Expire Date</td>
            <td style="color: #FF0000; width: 9px;">
                *</td>
            <td style="text-align: left">
                <asp:TextBox ID="InsuranceExpireDate" runat="server" Height="22px" Width="300px" 
                    CssClass="textbox"></asp:TextBox>
                <asp:CalendarExtender ID="InsuranceExpireDate_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="InsuranceExpireDate">
                </asp:CalendarExtender>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="InsuranceExpireDate" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator17" runat="server" 
                    ControlToValidate="InsuranceExpireDate" ErrorMessage="Invalid Date Format" 
                    ForeColor="Red" MaximumValue="1/1/2050" MinimumValue="1/1/1940" 
                    Type="Date"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                Estmara Expire Date</td>
            <td style="color: #FF0000; width: 9px;">
                *</td>
            <td style="text-align: left">

                <asp:TextBox ID="EstmaraExpireDate" runat="server" Height="22px" Width="300px" 
                    CssClass="textbox"></asp:TextBox>
                <asp:CalendarExtender ID="EstmaraExpireDate_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="EstmaraExpireDate">
                </asp:CalendarExtender>
             
<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="EstmaraExpireDate" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator18" runat="server" 
                    ControlToValidate="EstmaraExpireDate" ErrorMessage="Invalid Date Format" ForeColor="Red" 
                    MaximumValue="1/1/2050" MinimumValue="1/1/1940" Type="Date"></asp:RangeValidator>
             
            </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                Notes</td>
            <td style="color: #FF0000; width: 9px;">
                 </td>
            <td style="text-align: left">
                <asp:TextBox ID="Notes" runat="server" CssClass="textbox" Height="22px" 
                    Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                 </td>
            <td style="color: #FF0000; width: 9px;">
                 </td>
            <td style="text-align: left">
                 </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                 </td>
            <td style="color: #FF0000; width: 9px;">
                 </td>
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
                 </td>
            <td style="color: #FF0000; width: 9px;">
                 </td>
            <td style="text-align: left">
                 </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                 </td>
            <td style="color: #FF0000; width: 9px;">
                 </td>
            <td style="text-align: left">
                 </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                 </td>
            <td style="color: #FF0000; width: 9px;">
                 </td>
            <td style="text-align: left">
                 </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                 </td>
            <td style="color: #FF0000; width: 9px;">
                 </td>
            <td style="text-align: left">
                 </td>
        </tr>
        </table>

      

  
    </div>
</asp:Content>

