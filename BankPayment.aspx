<%@ Page Title="Bank Payment" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BankPayment.aspx.cs" Inherits="BankPayment" %>




<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">



        $('body').on('keydown', 'input, select, textarea', function (e) {
            var self = $(this)
      , form = self.parents('form:eq(0)')
      , focusable
      , next
      ;
            if (e.keyCode == 13) {
                focusable = form.find('input,a,select,button,textarea').filter(':visible');
                next = focusable.eq(focusable.index(this) + 1);
                if (next.length) {
                    next.focus();
                } else {
                    form.submit();
                }
                return false;
            }
        });
</script>


<table cellpadding="0" cellspacing="0" dir="ltr" style="width: 100%">
 <tr>
  <td width="1%">
    </td>
  <td width="98%">
   <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
    Height="485px" Width="100%" CssClass="fancy fancy-green">
    <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="Bank Payment">
     <HeaderTemplate>Bank Payment</HeaderTemplate>
     
        
     <ContentTemplate><asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate><asp:Panel ID="Panel1" runat="server"   Height="143px"  ><div style="height: 32px">&#160;&#160;<asp:Button ID="BtnFirst" runat="server" CausesValidation="False" 
                Font-Bold="True" Height="26px" onclick="BtnFirst_Click" TabIndex="21" 
                Text="&lt;&lt;" Width="37px" CssClass="Mybutton" BackColor="#C8E0F2" /><asp:Button ID="BtnPrev" runat="server" CausesValidation="False" 
                Font-Bold="True" Height="26px" onclick="BtnPrev_Click" TabIndex="22" Text="&lt;" 
                Width="37px" CssClass="Mybutton" BackColor="#C8E0F2" /><asp:Button ID="BtnNext" runat="server" CausesValidation="False" 
                Font-Bold="True" Height="26px" onclick="BtnNext_Click" TabIndex="23" 
                Text="&gt;" Width="37px" CssClass="Mybutton" BackColor="#C8E0F2" /><asp:Button ID="Btnlast" runat="server" CausesValidation="False" 
                Font-Bold="True" Height="26px" onclick="Btnlast_Click" TabIndex="24" 
                Text="&gt;&gt;" Width="37px" CssClass="Mybutton" BackColor="#C8E0F2" /><asp:Button ID="BtnNew" runat="server" CausesValidation="False" Height="26px" 
                onclick="BtnNew_Click" TabIndex="16" Text="New" Width="70px" 
                CssClass="Mybutton" BackColor="#C8E0F2" /><asp:Button ID="BtnSave" runat="server" Height="26px" onclick="BtnSave_Click" 
                TabIndex="17" Text="Save" Width="70px" CssClass="Mybutton" 
                BackColor="#C8E0F2" Visible="False" /><asp:Button ID="BtnPrint" runat="server" Height="26px" 
                TabIndex="17" Text="Print" Width="70px" CssClass="Mybutton" 
                onclick="BtnPrint_Click" BackColor="#C8E0F2" /><asp:Button ID="BtnShowReport" runat="server" Height="26px" 
                TabIndex="17" Text="Report" Width="70px" CssClass="Mybutton" 
                onclick="BtnShowReport_Click" BackColor="#C8E0F2"
                 /><asp:TextBox ID="BankMasId" runat="server" CssClass="textbox" Height="22px" 
                Width="150px" TabIndex="18" AutoPostBack="True" 
             ontextchanged="BankMasId_TextChanged" ></asp:TextBox><asp:Button ID="BtnSearch" runat="server" CausesValidation="False" 
                Height="26px" onclick="BtnSearch_Click" TabIndex="19" Text="Search" 
                Width="70px" CssClass="Mybutton" BackColor="#C8E0F2" /><asp:Button ID="BtnUpdate" runat="server" Height="26px" 
                onclick="BtnUpdate_Click" TabIndex="20" Text="Update" Width="70px" 
                CssClass="Mybutton" 
                BackColor="#C8E0F2" Visible="False" /><asp:Label ID="Lblopt" runat="server" Visible="False">0</asp:Label></div><div style="height: 186px" ><div ><table cellpadding="1" cellspacing="1" class="style10" dir="ltr" width="100%"><tr><td style="width: 109px; text-align: right;">Bank Account No :</td><td style="width: 5px"></td><td style="margin-left: 320px"><asp:TextBox 
                 ID="CAccCode" runat="server" autocomplete="off" AutoPostBack="True" 
                 CssClass="textbox" MaxLength="50" onkeypress="return isNumberKey(event)" 
                 ontextchanged="CAccCode_TextChanged" TabIndex="100" Width="150px"></asp:TextBox><asp:ImageButton 
                 ID="Btn1" runat="server" Height="18px" ImageUrl="~/images/lookfor.png" 
                 onclick="BtnGridSelect0_Click" ValidationGroup="G2" Width="25px" /><asp:RequiredFieldValidator 
                 ID="RequiredFieldValidator12" runat="server" ControlToValidate="CAccCode" 
                 Display="Dynamic" ErrorMessage="Employee Code" ForeColor="#CC0000">*</asp:RequiredFieldValidator><asp:Label 
                 ID="CAccName" runat="server" Height="22px" Width="292px"></asp:Label></td><td style="margin-left: 320px; text-align: right;">Date</td><td style="margin-left: 320px"></td><td style="margin-left: 320px"><asp:TextBox ID="VrDate" runat="server" CssClass="textbox" MaxLength="50" 
                                            TabIndex="1" Width="150px"></asp:TextBox><asp:CalendarExtender ID="VrDate_CalendarExtender" runat="server" 
                                            Enabled="True" TargetControlID="VrDate"></asp:CalendarExtender><asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                            ControlToValidate="VrDate" Display="Dynamic" ErrorMessage="Employee Code" 
                                            ForeColor="#CC0000">*</asp:RequiredFieldValidator></td></tr><tr><td style="width: 109px; text-align: right;"><asp:TextBox 
                     ID="CompId" runat="server" AutoPostBack="True" CssClass="textbox" Height="22px" 
                     ReadOnly="True" TabIndex="18" Visible="False" Width="10px"></asp:TextBox><asp:TextBox 
                     ID="DocTypeId" runat="server" AutoPostBack="True" CssClass="textbox" 
                     Height="22px" ReadOnly="True" TabIndex="18" Visible="False" Width="10px"></asp:TextBox><asp:TextBox 
                     ID="BranchId" runat="server" AutoPostBack="True" CssClass="textbox" 
                     Height="22px" ReadOnly="True" TabIndex="18" Visible="False" Width="10px"></asp:TextBox>Beneficiary</td><td 
                     style="width: 5px"></td><td><asp:TextBox ID="Benif" runat="server" 
                         AutoPostBack="True" CssClass="textbox" MaxLength="100" TabIndex="3" 
                         Width="387px"></asp:TextBox><asp:RequiredFieldValidator 
                         ID="RequiredFieldValidator13" runat="server" ControlToValidate="Benif" 
                         Display="Dynamic" ErrorMessage="Employee Code" ForeColor="#CC0000">*</asp:RequiredFieldValidator></td><td 
                     style="text-align: right">Ref No</td><td></td><td><asp:TextBox ID="Ref_no" 
                     runat="server" autocomplete="off" CssClass="textbox" MaxLength="50" 
                      TabIndex="100" Width="150px"></asp:TextBox><asp:AutoCompleteExtender 
                     ID="Ref_no_AutoCompleteExtender" runat="server" CompletionInterval="1000" 
                     CompletionSetCount="1" EnableCaching="true" MinimumPrefixLength="1" 
                     ServiceMethod="Getaccountnumber" TargetControlID="Ref_no"></asp:AutoCompleteExtender></td></tr><tr><td style="width: 109px; text-align: right;">Description</td><td 
                     style="width: 5px"></td><td colspan="4"><asp:TextBox ID="VrDesc" runat="server" 
                         CssClass="textbox" MaxLength="100" TabIndex="2" Width="738px"></asp:TextBox></td></tr></table></div></div></asp:Panel><div><table 
                 style="background-color: #DAF8EA; background-image: url('http://localhost:52254/Final_web%20243/images/bgContent.gif');"><tr><td 
                     style="height: 22px" width="1%"></td><td 98%"="" 
                     style="height: 22px; width: 72px;">Account No. <span 
                         style="color: #FF0000; font-weight: bold">*</span></td><td 98%"="" 
                     style="height: 22px; width: 72px;">&#160;</td><td 
                     style="width: -130%; height: 22px;" width="98%">Amount <span 
                         style="color: #FF0000; font-weight: bold">*</span></td><td 
                     style="width: -73%; height: 22px;" width="98%">Cheque No<span 
                         style="color: #FF0000; font-weight: bold"> </span></td><td 
                     style="width: -73%; height: 22px;" width="98%">Cheque Date</td><td 
                     style="width: -39%; height: 22px;" width="98%">Description <span 
                         style="color: #FF0000; font-weight: bold">*</span></td><td 
                     style="width: 12%; height: 22px;" width="98%"></td></tr><tr><td width="1%"></td><td 
                     class="style3" style="width: 72px"><asp:TextBox ID="AccCode" runat="server" 
                     autocomplete="off" AutoPostBack="True" CssClass="textbox" MaxLength="50" 
                     onkeypress="return isNumberKey(event)" ontextchanged="AccCode_TextChanged" 
                     TabIndex="100" Width="100px"></asp:TextBox></td><td class="style3" 
                     style="width: 72px"><asp:ImageButton ID="Btn2" runat="server" Height="18px" 
                         ImageUrl="~/images/lookfor.png" onclick="Btn2_Click" ValidationGroup="G2" 
                         Width="25px" /></td><td><asp:TextBox ID="Amount" runat="server" 
                         autocomplete="off" CssClass="textbox" MaxLength="50" 
                         onkeypress="return isNumberKey(event)" TabIndex="101" Width="100px"></asp:TextBox></td><td><asp:TextBox 
                         ID="CheqNo" runat="server" autocomplete="off" CssClass="textbox" MaxLength="50" 
                         onkeypress="return isNumberKey(event)" TabIndex="102" Width="100px"></asp:TextBox></td><td><asp:TextBox 
                         ID="CheqDate" runat="server" autocomplete="off" CssClass="textbox" 
                         MaxLength="50" onkeypress="return isNumberKey(event)" TabIndex="102" 
                         Width="100px"></asp:TextBox><asp:CalendarExtender 
                         ID="CheqDate_CalendarExtender" runat="server" Enabled="True" 
                         TargetControlID="CheqDate"></asp:CalendarExtender></td><td><asp:TextBox 
                         ID="JDesc" runat="server" autocomplete="off" AutoPostBack="True" 
                         CssClass="textbox" MaxLength="50" ontextchanged="JDesc_TextChanged" 
                         TabIndex="103" Width="350px" Wrap="False"></asp:TextBox></td><td><asp:Button 
                         ID="BtnAdd" runat="server" CssClass="textbox" Font-Bold="True" 
                         onclick="BtnAdd_Click" TabIndex="105" Text="+" ValidationGroup="G2" 
                         Width="40px" /><asp:TextBox ID="txtRowindex" runat="server" Visible="False" 
                         Width="2px"></asp:TextBox></td></tr><tr><td width="1%"></td><td 
                     colspan="5"><asp:Label ID="AccName" runat="server" Height="22px" 
                     Width="400px"></asp:Label></td><td></td><td></td></tr></table></div><div 
             style="border: 1px solid #C0C0C0; height:219px; overflow:auto"><asp:GridView 
             ID="Grid" runat="server" AllowSorting="True" BackColor="White" 
             CssClass="bordered" onrowcreated="Grid_RowCreated" 
             onrowdeleting="Grid_RowDeleting" 
             onselectedindexchanged="Grid_SelectedIndexChanged" onsorting="Grid_Sorting" 
             Width="100%"><Columns><asp:TemplateField HeaderText="Del"><ItemTemplate><asp:ImageButton 
                     ID="BtnGridDel" runat="server" Height="16px" ImageUrl="~/images/deleteicon.jpg" 
                     onclick="BtnGridDel_Click" ValidationGroup="G2" Width="16px" /></ItemTemplate><ItemStyle 
                     Width="20px" /></asp:TemplateField><asp:TemplateField HeaderText="Sel"><ItemTemplate><asp:ImageButton 
                         ID="BtnGridSelect" runat="server" Height="16px" 
                         ImageUrl="~/images/select_icon.jpg" onclick="BtnGridSelect_Click" 
                         ValidationGroup="G2" /></ItemTemplate><ItemStyle Width="20px" /></asp:TemplateField></Columns></asp:GridView></div><div class="under_footer"><table class="style1"><tr><td 
                 style="width: 53px">Count :</td><td><asp:TextBox ID="NoCount" runat="server" 
                     BackColor="#FFFFCC" CssClass="textbox" MaxLength="50" ReadOnly="True" 
                     TabIndex="-1" Width="125px"></asp:TextBox></td><td 
                 style="width: 734px; text-align: right">Total Debit :</td><td style="text-align: right"><asp:TextBox ID="TotAmount" runat="server" CssClass="textbox" Enabled="False" 
                       Height="22px" ReadOnly="True" Width="131px" BackColor="#FFFFCC"></asp:TextBox></td><td></td></tr></table></div></ContentTemplate></asp:UpdatePanel></ContentTemplate>
     
    </asp:TabPanel>
    
    
    <asp:TabPanel ID="TabPanel4" runat="server" HeaderText="Search">
     
     <ContentTemplate><asp:Panel ID="Panel2" runat="server" 
             Height="419px"><div 
             style="text-align: left; height: 75px;"><table cellspacing="1" dir="ltr" style="width: 100%; "><tr><td></td><td class="style3" style="width: 151px"></td><td></td><td></td></tr><tr><td></td><td class="style3" style="width: 151px; text-align: right">Code\Name :</td><td 
                     style="margin-left: 80px"><asp:TextBox ID="txtSearch" runat="server" 
                     CssClass="textbox" Height="22px" 
                      MaxLength="50" Width="300px" AutoPostBack="True" 
                     ontextchanged="txtSearch_TextChanged"></asp:TextBox>&#160;&#160;&#160;&#160;&#160;&#160;&#160; <asp:Label ID="Lblcount" runat="server" BorderStyle="None" BorderWidth="1px" 
                              Height="22px" style="font-size: large" Width="125px"></asp:Label></td><td></td></tr><tr><td>&#160;</td><td 
                     class="style3" style="width: 151px; text-align: right">&#160;</td><td 
                     style="margin-left: 80px">&#160;</td><td>&#160;</td></tr></table></div><div style=" height:394px; overflow:auto"><asp:GridView ID="GridView1" runat="server" CssClass="bordered" Width="100%" 
                       BackColor="White"><Columns><asp:TemplateField HeaderText="Select"><ItemTemplate><asp:Button ID="Btn_Select" runat="server" CausesValidation="False" 
                     onclick="Btn_Select_Click" Text="Select" /></ItemTemplate></asp:TemplateField></Columns></asp:GridView></div></asp:Panel></ContentTemplate>
     
        
    </asp:TabPanel>
   </asp:TabContainer>
  </td>
  <td width="1%">
    </td>
 </tr>
</table>

     
</asp:Content>



