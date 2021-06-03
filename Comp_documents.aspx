<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Comp_documents.aspx.cs" Inherits="Comp_documents" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 414px; border: 1px solid #CFDBE6; background-color: #F2F9FF;">
    <div style="height: 18px"></div>
    <div style="float: left; width: 650px">
    <table align="left" cellpadding="2" style="width: 100%; " 
            cellspacing="2">
        <tr>
            <td style="width: 140px; text-align: right;">
                Company</td>
            <td style="font-family: Tahoma; color: #FF0000; width: 9px;">
                *</td>
            <td style="text-align: left">
                <asp:DropDownList ID="CompId" runat="server" Height="25px" Width="304px" 
                    AutoPostBack="True" onselectedindexchanged="CompId_SelectedIndexChanged" 
                    CssClass="textbox">
                </asp:DropDownList>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="CompId" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000" InitialValue="0">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                Type</td>
            <td style="color: #FF0000; width: 9px;">
                *</td>
            <td style="text-align: left">
                <asp:DropDownList ID="Comp_DocumentTypeId" runat="server" Height="25px" 
                    Width="304px" 
                    onselectedindexchanged="Comp_DocumentTypeId_SelectedIndexChanged" 
                    AutoPostBack="True" CssClass="textbox">
                </asp:DropDownList>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="Comp_DocumentTypeId" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000" InitialValue="0">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                 Sub Company</td>
            <td style="color: #FF0000; width: 9px;">
                 </td>
            <td style="text-align: left">
                <asp:DropDownList ID="SubCompId" runat="server" Height="25px" 
                    Width="304px" Enabled="False" CssClass="textbox">
                </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="SubCompId" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000" InitialValue="0">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                Name</td>
            <td style="color: #FF0000; width: 9px;">
                *</td>
            <td style="text-align: left">
                <asp:TextBox ID="docname" runat="server" Height="22px" Width="300px" 
                    CssClass="textbox"></asp:TextBox>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="docname" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                Date</td>
            <td style="color: #FF0000; width: 9px;">
                *</td>
            <td style="text-align: left">
                <asp:TextBox ID="DocDate" runat="server" Height="22px" Width="300px" 
                    CssClass="textbox"></asp:TextBox>
                <asp:CalendarExtender ID="DocDate_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="DocDate">
                </asp:CalendarExtender>
<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="DocDate" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator16" runat="server" 
                    ControlToValidate="DocDate" ErrorMessage="Invalid Date Format" ForeColor="Red" 
                    MaximumValue="1/1/2050" MinimumValue="1/1/1940" Type="Date"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                Expire Date</td>
            <td style="color: #FF0000; width: 9px;">
                *</td>
            <td style="text-align: left">
                <asp:TextBox ID="DocExpire" runat="server" Height="22px" Width="300px" 
                    CssClass="textbox"></asp:TextBox>
                <asp:CalendarExtender ID="DocExpire_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="DocExpire">
                </asp:CalendarExtender>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="DocExpire" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator17" runat="server" 
                    ControlToValidate="DocExpire" ErrorMessage="Invalid Date Format" 
                    ForeColor="Red" MaximumValue="1/1/2050" MinimumValue="1/1/1940" Type="Date"></asp:RangeValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="DocDate" ControlToValidate="DocExpire" Display="Dynamic" 
                    ErrorMessage="Expire Date must be Greater than Document Date" ForeColor="Red" 
                    Operator="GreaterThan" Type="Date"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                File ( Pdf   Only)</td>
            <td style="color: #FF0000; width: 9px;">
                *</td>
            <td style="text-align: left">
                <asp:FileUpload ID="Fileupload1" runat="server" />

                <br />
             
                <asp:TextBox ID="MyFil_name" runat="server" Height="22px" ReadOnly="True" 
                    Width="300px" Visible="False" BackColor="#FFFFCC" CssClass="textbox"></asp:TextBox>
             
            </td>
        </tr>
        <tr>
            <td style="width: 140px; text-align: right;">
                Notes</td>
            <td style="color: #FF0000; width: 9px;">
                 </td>
            <td style="text-align: left">
                <asp:TextBox ID="DocDesc" runat="server" CssClass="textbox" Height="22px" 
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
                    Width="100px" CssClass="textbox" 
                    onclientclick="Page_ClientValidate();Loading(true);" />
                    <asp:Button ID="BtnUpdate" runat="server" Height="30px" 
                    onclick="BtnUpdate_Click" Text="update" 
                    Width="100px" Visible="False" CssClass="textbox" 
                    onclientclick="Page_ClientValidate();Loading(true);" />
                <asp:Button ID="BtnNew" runat="server" CausesValidation="False" Height="30px" 
                    onclick="BtnNew_Click" Text="New" Width="100px" CssClass="textbox" />
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
                <asp:Label ID="LblerrorFile" runat="server" ForeColor="Red" 
                    style="font-weight: 400" Visible="False"></asp:Label>
            </td>
        </tr>
        </table>

        </div>

        <div style="float: right; width: 225px">
        <asp:DropDownList ID="CompId_Search" runat="server" Height="25px" Width="220px" 
                    AutoPostBack="True" 
                onselectedindexchanged="CompId_Search_SelectedIndexChanged" 
                CssClass="textbox">
                </asp:DropDownList>
        <asp:ListBox ID="LstFiles" runat="server" Width="220px" Height="305px" AutoPostBack="True" 
                onselectedindexchanged="LstFiles_SelectedIndexChanged" CssClass="textbox"></asp:ListBox>
        </div>
</div> 

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
                     </td>
                <td>
                     </td>
                <td style="width: 18px">
                     </td>
                <td>
                     </td>
                <td style="width: 165px">
                     </td>
                <td>
                     </td>
            </tr>
            <tr>
                <td>
                     </td>
                <td colspan="5" style="font-family: Tahoma">
                    <asp:Label ID="lblmsg" runat="server" 
                        style=" font-family: Tahoma" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                     </td>
                <td>
                     </td>
                <td style="width: 18px">
                     </td>
                <td>
                     </td>
                <td style="width: 165px">
                     </td>
                <td>
                     </td>
            </tr>
            <tr>
                <td>
                     </td>
                <td>
                     </td>
                <td style="width: 18px">
                     </td>
                <td>
                     </td>
                <td style="width: 165px">
                    <asp:Button ID="BtnOk" runat="server" Text="Ok" Width="60px" />
                </td>
                <td>
                     </td>
            </tr>
            <tr>
                <td>
                     </td>
                <td>
                     </td>
                <td style="width: 18px">
                     </td>
                <td>
                     </td>
                <td style="width: 165px">
                     </td>
                <td>
                     </td>
            </tr>
        </table>
       
    </asp:Panel>
  
  </div>

    
</asp:Content>

