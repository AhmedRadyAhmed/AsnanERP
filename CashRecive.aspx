<%@ Page Title="Cash Receipts" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CashRecive.aspx.cs" Inherits="CashRecive" %>



<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table cellpadding="0" cellspacing="0" dir="ltr" style="width: 100%">
 <tr>
  <td width="1%">
    </td>
  <td width="98%">
   <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
    Height="482px" Width="100%" CssClass="fancy fancy-green">
    <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="Cash Receive">
     
     
        
        
     
     
        
    <HeaderTemplate>Cash Receive</HeaderTemplate>
        
        
<ContentTemplate><div style="height: 333px; background-color: #F2F9FF;"><script type="text/javascript">



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
</script><asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate><asp:Panel 
                 ID="Panel1" runat="server"   Height="135px"  ><div style="height: 25px">&#160;&#160;<asp:Button ID="BtnFirst" runat="server" CausesValidation="False" 
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
                 /><asp:TextBox ID="CashMasId" runat="server" CssClass="textbox" Height="22px" 
                Width="150px" TabIndex="18" AutoPostBack="True" 
                ontextchanged="VoucherNum_TextChanged" ></asp:TextBox><asp:Button ID="BtnSearch" runat="server" CausesValidation="False" 
                Height="26px" onclick="BtnSearch_Click" TabIndex="19" Text="Search" 
                Width="70px" CssClass="Mybutton" BackColor="#C8E0F2" /><asp:Button ID="BtnUpdate" runat="server" Height="26px" 
                onclick="BtnUpdate_Click" TabIndex="20" Text="Update" Width="70px" 
                CssClass="Mybutton" onclientclick="Page_ClientValidate();Loading(true);" 
                BackColor="#C8E0F2" Visible="False" /><asp:TextBox ID="BranchId" runat="server" 
                     AutoPostBack="True" CssClass="textbox" Height="22px" ReadOnly="True" 
                     TabIndex="18" Visible="False" Width="10px"></asp:TextBox><asp:TextBox 
                     ID="DocTypeId" runat="server" AutoPostBack="True" CssClass="textbox" 
                     Height="22px" ReadOnly="True" TabIndex="18" Visible="False" Width="10px"></asp:TextBox><asp:TextBox 
                     ID="CompId" runat="server" AutoPostBack="True" CssClass="textbox" Height="22px" 
                     ReadOnly="True" TabIndex="18" Visible="False" Width="10px"></asp:TextBox><asp:Label ID="Lblopt" runat="server" Visible="False">0</asp:Label></div><div style="height: 11px" ></div><div style="height: 144px" ><div ><table cellpadding="1" cellspacing="1" class="style10" dir="ltr" width="100%"><tr><td style="width: 109px; text-align: right;">Cash Acc No</td><td style="width: 5px"></td><td style="margin-left: 320px"><asp:TextBox ID="CAccCode" runat="server" 
                        autocomplete="off" AutoPostBack="True" CssClass="textbox" MaxLength="50" 
                        onkeypress="return isNumberKey(event)" ontextchanged="CAccCode_TextChanged" 
                        TabIndex="100" Width="150px"></asp:TextBox><asp:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" 
                        CompletionInterval="1000" CompletionSetCount="2" EnableCaching="true" 
                        MinimumPrefixLength="1" ServiceMethod="Getaccountnumber" 
                        TargetControlID="CAccCode"></asp:AutoCompleteExtender><asp:ImageButton ID="Btn1" runat="server" Height="18px" 
                        ImageUrl="~/images/lookfor.png" onclick="BtnGridSelect0_Click" 
                        ValidationGroup="G2" Width="25px" /><asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator12" runat="server" ControlToValidate="CAccCode" 
                        Display="Dynamic" ErrorMessage="Employee Code" ForeColor="#CC0000">*</asp:RequiredFieldValidator><asp:Label 
                        ID="CAccName" runat="server" Height="22px" Width="292px"></asp:Label></td><td style="margin-left: 320px; text-align: right; width: 102px;">Date</td><td style="margin-left: 320px"></td><td style="margin-left: 320px"><asp:TextBox ID="VrDate" runat="server" CssClass="textbox" MaxLength="50" 
                                            TabIndex="1" Width="150px"></asp:TextBox><asp:CalendarExtender ID="VrDate_CalendarExtender" runat="server" 
                                            Enabled="True" TargetControlID="VrDate"></asp:CalendarExtender><asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                            ControlToValidate="VrDate" Display="Dynamic" ErrorMessage="Employee Code" 
                                            ForeColor="#CC0000">*</asp:RequiredFieldValidator></td></tr><tr><td style="width: 109px; text-align: right;">Smanid</td><td style="width: 5px">&#160;</td><td><asp:TextBox ID="SmanId" runat="server" AutoPostBack="True" CssClass="textbox" 
                        MaxLength="50" onkeypress="return isNumberKey(event)" 
                        ontextchanged="SmanId_TextChanged" TabIndex="3" Width="150px"></asp:TextBox><asp:ImageButton 
                        ID="Btn2" runat="server" Height="18px" ImageUrl="~/images/lookfor.png" 
                        onclick="Btn2_Click" ValidationGroup="G2" Width="25px" /><asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator13" runat="server" ControlToValidate="SmanId" 
                        Display="Dynamic" ErrorMessage="Employee Code" ForeColor="#CC0000">*</asp:RequiredFieldValidator><asp:Label ID="SmanName" runat="server" Width="292px"></asp:Label></td><td style="text-align: right; width: 102px;">Ref No :</td><td></td><td><asp:TextBox ID="Ref_no" runat="server" autocomplete="off" 
                    CssClass="textbox" MaxLength="50" onkeypress="return isNumberKey(event)" 
                    TabIndex="100" Width="150px"></asp:TextBox><asp:AutoCompleteExtender 
                    ID="Ref_no_AutoCompleteExtender" runat="server" CompletionInterval="1000" 
                    CompletionSetCount="1" EnableCaching="true" MinimumPrefixLength="1" 
                    ServiceMethod="Getaccountnumber" TargetControlID="Ref_no"></asp:AutoCompleteExtender></td></tr><tr><td style="width: 109px; text-align: right;">type/Desc</td><td style="width: 5px"></td><td colspan="4"><asp:DropDownList ID="CustTypeId" runat="server" CssClass="textbox" 
                        DataValueField="1" Width="100px"></asp:DropDownList><asp:TextBox 
                        ID="VrDesc" runat="server" CssClass="textbox" MaxLength="100" 
                        ontextchanged="VrDesc_TextChanged" TabIndex="2" Width="600px"></asp:TextBox></td></tr></table></div></div></asp:Panel><div><table 
                    style="background-color: #DAF8EA; background-image: url('images/bgContent.gif');"><tr><td style="height: 22px" width="1%"></td><td 98%"="" colspan="2" style="height: 22px">Account No. <span style="color: #FF0000; font-weight: bold">*</span></td><td style="height: 22px;">Amount <span style="color: #FF0000; font-weight: bold">*</span></td><td style="height: 22px;">Description <span style="color: #FF0000; font-weight: bold">*</span></td><td style=" height: 22px;">&#160;</td></tr><tr><td></td><td><asp:TextBox ID="AccCode" runat="server" autocomplete="off" AutoPostBack="True" 
                            CssClass="textbox" MaxLength="50" onkeypress="return isNumberKey(event)" 
                            ontextchanged="AccCode_TextChanged" TabIndex="100" Width="120px"></asp:TextBox></td><td><asp:ImageButton 
                            ID="Btn3" runat="server" Height="18px" ImageUrl="~/images/lookfor.png" 
                            onclick="BtnGridSelect1_Click" ValidationGroup="G2" Width="25px" /></td><td><asp:TextBox 
                            ID="Amount" runat="server" autocomplete="off" CssClass="textbox" MaxLength="50" 
                            onkeypress="return isNumberKey(event)" TabIndex="101"></asp:TextBox></td><td><asp:TextBox ID="JDesc" runat="server" autocomplete="off" AutoPostBack="True" 
                            CssClass="textbox" MaxLength="70" ontextchanged="JDesc_TextChanged" 
                            TabIndex="103" Width="500px" Wrap="False"></asp:TextBox></td><td><asp:Button ID="BtnAdd" runat="server" CssClass="textbox" Font-Bold="True" 
                            onclick="BtnAdd_Click" TabIndex="105" Text="+" ValidationGroup="G2" 
                            Width="50px" /><asp:TextBox ID="txtRowindex" runat="server" Visible="False" 
                            Width="2px"></asp:TextBox></td></tr><tr><td width="1%"></td><td colspan="4"><asp:Label ID="AccName" runat="server" Height="22px" Width="400px"></asp:Label></td><td></td></tr></table></div><div 
                style="border: 1px solid #C0C0C0; height:233px; overflow:auto"><asp:GridView ID="Grid" runat="server" AllowSorting="True" BackColor="White" 
                CssClass="bordered" onrowcreated="Grid_RowCreated" 
                onrowdeleting="Grid_RowDeleting" 
                onselectedindexchanged="Grid_SelectedIndexChanged" onsorting="Grid_Sorting" 
                Width="100%"><Columns><asp:TemplateField HeaderText="Del"><ItemTemplate><asp:ImageButton ID="BtnGridDel" runat="server" Height="16px" 
                                ImageUrl="~/images/deleteicon.jpg" onclick="BtnGridDel_Click" 
                                ValidationGroup="G2" Width="16px" /></ItemTemplate><ItemStyle Width="20px" /></asp:TemplateField><asp:TemplateField HeaderText="Sel"><ItemTemplate><asp:ImageButton ID="BtnGridSelect" runat="server" Height="16px" 
                                ImageUrl="~/images/select_icon.jpg" onclick="BtnGridSelect_Click" 
                                ValidationGroup="G2" /></ItemTemplate><ItemStyle Width="20px" /></asp:TemplateField></Columns></asp:GridView></div><div class="under_footer"><table class="style1"><tr><td></td><td >Count :<asp:TextBox ID="NoCount" runat="server" BackColor="#C8E0F2" 
                            BorderStyle="None" MaxLength="50" ReadOnly="True" TabIndex="-1" Width="50px"></asp:TextBox></td><td style="text-align: right">&#160;</td><td style=" text-align: right">Updated By:<asp:TextBox ID="InsertByy" 
                            runat="server" BackColor="#C8E0F2" BorderStyle="None" MaxLength="50" 
                            ReadOnly="True" style="text-align: center" TabIndex="-1" Width="75px"></asp:TextBox>: <asp:TextBox ID="InsertDatee" runat="server" BackColor="#C8E0F2" 
                            BorderStyle="None" CssClass="textbox" MaxLength="50" ReadOnly="True" 
                            TabIndex="-1" Width="140px"></asp:TextBox></td><td style=" text-align: right">&#160;</td><td 
                        style="text-align: right"><asp:TextBox ID="UpdateByy" runat="server" 
                            BackColor="#C8E0F2" BorderStyle="None" CssClass="textbox" MaxLength="50" 
                            ReadOnly="True" TabIndex="-1" Width="75px"></asp:TextBox>: <asp:TextBox 
                            ID="UpdateDatee" runat="server" BackColor="#C8E0F2" BorderStyle="None" 
                            CssClass="textbox" MaxLength="50" ReadOnly="True" TabIndex="-1" Width="140px"></asp:TextBox></td><td style=" text-align: right">Insert By:Total :</td><td style="text-align: right"><asp:TextBox 
                        ID="TotAmount" runat="server" BackColor="#C8E0F2" BorderStyle="None" 
                        CssClass="textbox" Enabled="False" Height="22px" ReadOnly="True" Width="100px"></asp:TextBox></td><td></td></tr></table></div></ContentTemplate></asp:UpdatePanel></div></ContentTemplate>
       
        
</asp:TabPanel>
    
    
    <asp:TabPanel ID="TabPanel4" runat="server" HeaderText="Account Search">
     
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

