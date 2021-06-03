<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AccRep.aspx.cs" Inherits="AccRep" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 477px; width:700px; float: left">
    <table class="style1">
        <tr>
            <td style="text-align: right; width: 143px;">
                 &nbsp;</td>
            <td>
                 </td>
            <td colspan="2">
                <asp:TextBox ID="Acc_statusid" runat="server" CssClass="textbox" 
                    Height="22px" Width="131px" AutoPostBack="True" 
                    ontextchanged="Acc_statusid_TextChanged" Visible="False"></asp:TextBox>
                <asp:TextBox ID="Acc_Satatus" runat="server" CssClass="textbox" 
                    Height="22px" Width="300px" AutoPostBack="True" 
                    ontextchanged="Acc_Satatus_TextChanged" Visible="False"></asp:TextBox>

                    <asp:AutoCompleteExtender 
                    ID="Acc_Satatus_AutoCompleteExtender" runat="server" CompletionInterval="1000" 
                    CompletionSetCount="2" EnableCaching="true" MinimumPrefixLength="1" 
                    ServiceMethod="GetstatusNumber" TargetControlID="Acc_Satatus">
                    
                    </asp:AutoCompleteExtender>
                 </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 143px;">
                 </td>
            <td>
                 </td>
            <td colspan="2">
                <asp:RadioButton ID="R1" runat="server" GroupName="g1" 
                    Text="Statement" CssClass="bold" style="font-family: Tahoma" 
                    Font-Bold="False" 
                     Checked="True" AutoPostBack="True" oncheckedchanged="R2_CheckedChanged" />
                 </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 143px;">
                 &nbsp;</td>
            <td>
                 &nbsp;</td>
            <td style="width: 72px">
                <asp:RadioButton ID="R2" runat="server" GroupName="g1" 
                    Text="All" CssClass="bold" style="font-family: Tahoma" 
                    Font-Bold="False" AutoPostBack="True" oncheckedchanged="R2_CheckedChanged" 
                   />
                 </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right; width: 143px;">
                 &nbsp;</td>
            <td>
                 &nbsp;</td>
            <td colspan="2">
                <asp:TextBox ID="Categ_id" runat="server" CssClass="textbox" 
                    Height="22px" Width="131px" AutoPostBack="True" 
                    ontextchanged="Categ_id_TextChanged" Visible="False"></asp:TextBox>
                <asp:TextBox ID="CategName" runat="server" CssClass="textbox" 
                    Height="22px" Width="300px" AutoPostBack="True" 
                    ontextchanged="CategName_TextChanged" Visible="False"></asp:TextBox>

                    <asp:AutoCompleteExtender 
                    ID="CategName_AutoCompleteExtender" runat="server" CompletionInterval="1000" 
                    CompletionSetCount="2" EnableCaching="true" MinimumPrefixLength="1" 
                    ServiceMethod="GetCategnumber" TargetControlID="CategName">
                    
                    </asp:AutoCompleteExtender>
                 </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 143px;">
                 &nbsp;</td>
            <td>
                 &nbsp;</td>
            <td colspan="2">
                <asp:RadioButton ID="R3" runat="server" GroupName="g1" 
                    Text="all2" CssClass="bold" style="font-family: Tahoma" 
                    Font-Bold="False" AutoPostBack="True" oncheckedchanged="R2_CheckedChanged" 
                     />
                 </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 143px;">
                 &nbsp;</td>
            <td>
                 &nbsp;</td>
            <td colspan="2">
                 &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right; width: 143px;">
                 Level</td>
            <td>
                 </td>
            <td colspan="2">
         <asp:DropDownList ID="AccLevelId" runat="server" Width="135px" CssClass="textbox" 
                 Height="28px">
         </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 143px;">
                Acc Number :</td>
            <td>
                 </td>
            <td colspan="2">
                <asp:TextBox ID="AccCode" runat="server" CssClass="textbox" 
                    Height="22px" Width="131px" AutoPostBack="True" 
                    ontextchanged="AccCode_TextChanged"></asp:TextBox>
                <asp:TextBox ID="AccNm" runat="server" CssClass="textbox" 
                    Height="22px" Width="300px" AutoPostBack="True" 
                    ontextchanged="AccNm_TextChanged"></asp:TextBox>

                    <asp:AutoCompleteExtender 
                    ID="AutoCompleteExtender1" runat="server" CompletionInterval="1000" 
                    CompletionSetCount="2" EnableCaching="true" MinimumPrefixLength="1" 
                    ServiceMethod="Getaccountnumber" TargetControlID="AccNm">
                    
                    </asp:AutoCompleteExtender>
                     </td>
        </tr>
        <tr>
            <td style="width: 143px; text-align: right;">
                Date From :</td>
            <td style="color: #FF0000; width: 10px;">
                 </td>
            <td style="text-align: left" colspan="2">
                <asp:TextBox ID="DateFrom" runat="server" CssClass="textbox" 
                    Height="22px" Width="131px"></asp:TextBox>

                <asp:CalendarExtender ID="DateFrom_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="DateFrom">
                </asp:CalendarExtender>

                <asp:RangeValidator ID="RangeValidator16" runat="server" 
                    ControlToValidate="DateFrom" ErrorMessage="Invalid Date Format" 
                    ForeColor="Red" MaximumValue="1/1/2050" MinimumValue="1/1/1940" 
                    Type="Date" Display="Dynamic"></asp:RangeValidator>
           
                </td>
        </tr>

        <tr>
            <td style="text-align: right; width: 143px;">
                To :</td>
            <td>
                 </td>
            <td colspan="2">
                <asp:TextBox ID="DateTo" runat="server" CssClass="textbox" 
                    Height="22px" Width="131px"></asp:TextBox>
                <asp:CalendarExtender ID="DateTo_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="DateTo">
                </asp:CalendarExtender>
                <asp:RangeValidator ID="RangeValidator26" runat="server" 
                    ControlToValidate="DateTo" ErrorMessage="Invalid Date Format" 
                    ForeColor="Red" MaximumValue="1/1/2050" MinimumValue="1/1/1940" 
                    Type="Date" Display="Dynamic"></asp:RangeValidator>
                <asp:CompareValidator ID="CompareValidator3" runat="server" 
                    ControlToCompare="DateFrom" ControlToValidate="DateTo" Display="Dynamic" 
                    ErrorMessage="Date must be Greater Than Date from or Equal" 
                    Operator="GreaterThanEqual" style="color: #F80000" Type="Date"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 143px;">
                 </td>
            <td>
                 </td>
            <td colspan="2">
                 </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 143px;">
                 </td>
            <td>
                 </td>
            <td colspan="2">
            <asp:Button ID="Btn_ok" runat="server" Text="OK" class="button" 
                 Height="26px" onclick="Btn_ok_Click" Width="135px" CssClass="Mybutton" />
	        </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 143px;">
                 </td>
            <td>
                 </td>
            <td colspan="2">
                 </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 143px;">
                 </td>
            <td>
                 </td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right; width: 143px;">
                 </td>
            <td>
                 </td>
            <td colspan="2">
                 </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 143px;">
                 &nbsp;</td>
            <td>
                 &nbsp;</td>
            <td colspan="2">
                <asp:CheckBox ID="WithPending" runat="server" Text="With Pending" 
                    Visible="False" />
                 </td>
        </tr>
    </table>
    </div>

    <div style="float: right; width: 200px; height: 456px;">
 <div>&nbsp;&nbsp;
     <asp:CheckBox ID="CheckBoxAll" runat="server" AutoPostBack="True" 
         oncheckedchanged="CheckBoxAll_CheckedChanged1" Text="All" />
        </div>
<asp:Panel ID="checkBoxPanel" runat="server"  
        CssClass="scrollingControlContainer scrollingCheckBoxList" Height="430px" 
         BorderColor="#E0DDD8" BorderStyle="Solid" BorderWidth="1px" 
        BackColor="White" Visible="False">
        
     
    <table style="width: 100%">
        

    
        

        <tr>
            

  
            

            <td>
                

                

              </td>
            

   
            

            <td>
                
  
                
<asp:CheckBoxList ID="List_Sts" runat="server">
                    

                    

                </asp:CheckBoxList>
                

      
                

               </td>
            


        </tr>
        

   

    </table>
               
              
 
               
              
    
              
            </asp:Panel>
  


  
  </div>
</asp:Content>

