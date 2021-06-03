<%@ Page Title="Cash Payment" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CashPayment.aspx.cs" Inherits="CashPayment" %>



<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 26px; text-align: center; color: #FFFFFF; font-weight: 700; background-color: #1B638D;">
        <asp:Label ID="Lbl_title" runat="server" Font-Size="Large">Cash Payment </asp:Label>
    </div>
    
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
  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
   <ContentTemplate>

<asp:Panel ID="Panel1" runat="server"   Height="143px"  >
   
        <div style="height: 10px"></div>
        <div style="height: 32px">
            &nbsp&nbsp<asp:Button ID="BtnFirst" runat="server" CausesValidation="False" 
                Font-Bold="True" Height="26px" onclick="BtnFirst_Click" TabIndex="21" 
                Text="&lt;&lt;" Width="37px" CssClass="Mybutton" BackColor="#C8E0F2" />
            <asp:Button ID="BtnPrev" runat="server" CausesValidation="False" 
                Font-Bold="True" Height="26px" onclick="BtnPrev_Click" TabIndex="22" Text="&lt;" 
                Width="37px" CssClass="Mybutton" BackColor="#C8E0F2" />
            <asp:Button ID="BtnNext" runat="server" CausesValidation="False" 
                Font-Bold="True" Height="26px" onclick="BtnNext_Click" TabIndex="23" 
                Text="&gt;" Width="37px" CssClass="Mybutton" BackColor="#C8E0F2" />
            <asp:Button ID="Btnlast" runat="server" CausesValidation="False" 
                Font-Bold="True" Height="26px" onclick="Btnlast_Click" TabIndex="24" 
                Text="&gt;&gt;" Width="37px" CssClass="Mybutton" BackColor="#C8E0F2" />
            <asp:Button ID="BtnNew" runat="server" CausesValidation="False" Height="26px" 
                onclick="BtnNew_Click" TabIndex="16" Text="New" Width="70px" 
                CssClass="Mybutton" BackColor="#C8E0F2" />
            <asp:Button ID="BtnSave" runat="server" Height="26px" onclick="BtnSave_Click" 
                TabIndex="17" Text="Save" Width="70px" CssClass="Mybutton" 
                BackColor="#C8E0F2" />
                 
                 <asp:Button ID="BtnPrint" runat="server" Height="26px" 
                TabIndex="17" Text="Print" Width="70px" CssClass="Mybutton" 
                onclick="BtnPrint_Click" BackColor="#C8E0F2" />

                <asp:Button ID="BtnShowReport" runat="server" Height="26px" 
                TabIndex="17" Text="Report" Width="70px" CssClass="Mybutton" 
                onclick="BtnShowReport_Click" BackColor="#C8E0F2"
                 />

            <asp:TextBox ID="CashMasId" runat="server" CssClass="textbox" Height="22px" 
                Width="150px" TabIndex="18" AutoPostBack="True" 
                ontextchanged="VoucherNum_TextChanged" ></asp:TextBox>
            <asp:Button ID="BtnSearch" runat="server" CausesValidation="False" 
                Height="26px" onclick="BtnSearch_Click" TabIndex="19" Text="Search" 
                Width="70px" CssClass="Mybutton" BackColor="#C8E0F2" />
            <asp:Button ID="BtnUpdate" runat="server" Height="26px" 
                onclick="BtnUpdate_Click" TabIndex="20" Text="Update" Width="70px" 
                CssClass="Mybutton" onclientclick="Page_ClientValidate();Loading(true);" 
                BackColor="#C8E0F2" Visible="False" />
        </div>
                     <div style="height: 144px" >

                       <div >
                                      <table cellpadding="1" cellspacing="1" class="style10" dir="ltr" width="100%">
                                <tr>
                                    <td style="width: 109px; text-align: right;">
                                        Cash Acc No</td>
                                    <td style="width: 5px">
                                         </td>
                                    <td style="margin-left: 320px">
                                        
                                        <asp:TextBox ID="CAccCode" runat="server" autocomplete="off" 
                                            AutoPostBack="True" CssClass="textbox" MaxLength="50" 
                                            onkeypress="return isNumberKey(event)" ontextchanged="CAccCode_TextChanged" 
                                            TabIndex="100" Width="150px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                            ControlToValidate="CAccCode" Display="Dynamic" ErrorMessage="Employee Code" 
                                            ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                                        
                                    </td>
                                    <td style="margin-left: 320px; text-align: right;">
                                        Date</td>
                                    <td style="margin-left: 320px">
                                    </td>
                                    <td style="margin-left: 320px">
                                        <asp:TextBox ID="VrDate" runat="server" CssClass="textbox" MaxLength="50" 
                                            TabIndex="1" Width="150px"></asp:TextBox>
                                        <asp:CalendarExtender ID="VrDate_CalendarExtender" runat="server" 
                                            Enabled="True" TargetControlID="VrDate">
                                        </asp:CalendarExtender>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                            ControlToValidate="VrDate" Display="Dynamic" ErrorMessage="Employee Code" 
                                            ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                          <tr>
                                              <td style="width: 109px; text-align: right;">
                                                  <asp:TextBox ID="CompId" runat="server" AutoPostBack="True" CssClass="textbox" 
                                                      Height="22px" ReadOnly="True" TabIndex="18" Visible="False" Width="10px"></asp:TextBox>
                                                  <asp:TextBox ID="DocTypeId" runat="server" AutoPostBack="True" 
                                                      CssClass="textbox" Height="22px" ReadOnly="True" TabIndex="18" Visible="False" 
                                                      Width="10px"></asp:TextBox>
                                                  <asp:TextBox ID="BranchId" runat="server" AutoPostBack="True" 
                                                      CssClass="textbox" Height="22px" ReadOnly="True" TabIndex="18" Visible="False" 
                                                      Width="10px"></asp:TextBox>
                                                  Acc Name</td>
                                              <td style="width: 5px">
                                                   </td>
                                              <td>
                                                  <asp:Label ID="CAccName" runat="server" BorderColor="#F2F2F2" 
                                                      BorderStyle="Solid" BorderWidth="1px" Height="22px" Width="423px"></asp:Label>
                                              </td>
                                              <td style="text-align: right">
                                                  Ref No</td>
                                              <td>
                                                   </td>
                                              <td>
                                                 
                                                  <asp:TextBox ID="Ref_no" runat="server" autocomplete="off" 
                                                      CssClass="textbox" MaxLength="50" 
                                                      
                                                      TabIndex="100" Width="150px"></asp:TextBox>
                                                  <asp:AutoCompleteExtender ID="Ref_no_AutoCompleteExtender" runat="server" 
                                                      CompletionInterval="1000" CompletionSetCount="1" EnableCaching="true" 
                                                      MinimumPrefixLength="1" ServiceMethod="Getaccountnumber" 
                                                      TargetControlID="Ref_no">
                                                  </asp:AutoCompleteExtender>
                                                 
                                              </td>
                                          </tr>
                                          <tr>
                                              <td style="width: 109px; text-align: right;">
                                                  Description</td>
                                              <td style="width: 5px">
                                                   </td>
                                              <td colspan="4">
                                                  <asp:TextBox ID="VrDesc" runat="server" CssClass="textbox" 
                                                      MaxLength="100" TabIndex="2" Width="738px"></asp:TextBox>
                                              </td>
                                          </tr>
                                 </table>
                                 </div>

                             </div>
     </asp:Panel> 

   
   
     <div>
        
        

     <table style="background-color: #DAF8EA; background-image: url('images/bgContent.gif');">
     
         <tr>
             <td width="1%" style="height: 22px">
                 </td>
             <td style="height: 22px"98%">
                 Account No. <span style="color: #FF0000; font-weight: bold">*</span></td>
             <td style="width: -130%; height: 22px;" width="98%">
                 Amount <span style="color: #FF0000; font-weight: bold">*</span></td>
             <td style="width: -39%; height: 22px;" width="98%">
                 Description <span style="color: #FF0000; font-weight: bold">*</span></td>
             <td style="width: 12%; height: 22px;" width="98%">
                 </td>
         </tr>
         <tr>
             <td width="1%">
                  </td>
             <td >
                 <asp:TextBox ID="AccCode" runat="server" autocomplete="off" 
                     CssClass="textbox" MaxLength="50" TabIndex="100" 
                     Width="150px" AutoPostBack="True" ontextchanged="AccCode_TextChanged" 
                     onkeypress="return isNumberKey(event)" ></asp:TextBox>
                      
             </td>
             <td >
                 <asp:TextBox ID="Amount" runat="server" CssClass="textbox"  
                     autocomplete="off" 
                     MaxLength="50" TabIndex="101" Width="100px" 
                     onkeypress="return isNumberKey(event)"></asp:TextBox>
             </td>
             <td >
                 <asp:TextBox ID="JDesc" runat="server" CssClass="textbox" autocomplete="off" 
                     MaxLength="50" TabIndex="103" Width="560px" AutoPostBack="True" 
                     ontextchanged="JDesc_TextChanged" Wrap="False"></asp:TextBox>
             </td>
             <td >
                 <asp:Button ID="BtnAdd" runat="server" Font-Bold="True" onclick="BtnAdd_Click" 
                     TabIndex="105" Text="+" ValidationGroup="G2" Width="50px" 
                     CssClass="textbox" />
                 <asp:TextBox ID="txtRowindex" runat="server" Visible="False" Width="2px"></asp:TextBox>
             </td>
         </tr>
         <tr>
             <td width="1%">
                  </td>
             <td colspan="3">
                 <asp:Label ID="AccName" runat="server" Height="22px" Width="400px"></asp:Label>
             </td>
             <td >
                  </td>
         </tr>
</table>
 
     </div>
           <div style="border: 1px solid #C0C0C0; height:250px; overflow:auto">
                     <asp:GridView ID="Grid" runat="server" CssClass="bordered" Width="100%" 
                onrowdeleting="Grid_RowDeleting" 
                AllowSorting="True" onselectedindexchanged="Grid_SelectedIndexChanged" 
                         BackColor="White" onsorting="Grid_Sorting">
               <Columns>
                   <asp:TemplateField HeaderText="Del">
                       <ItemTemplate>
                           <asp:ImageButton ID="BtnGridDel" runat="server" Height="16px" 
                               ImageUrl="~/images/deleteicon.jpg" onclick="BtnGridDel_Click" 
                               ValidationGroup="G2" Width="16px" />
                       </ItemTemplate>
                       <ItemStyle Width="20px" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Sel">
                       <ItemTemplate>
                           <asp:ImageButton ID="BtnGridSelect" runat="server" Height="16px" 
                               ImageUrl="~/images/select_icon.jpg" onclick="BtnGridSelect_Click" 
                               ValidationGroup="G2" />
                       </ItemTemplate>
                       <ItemStyle Width="20px" />
                   </asp:TemplateField>
               </Columns>
        </asp:GridView>
    
            </div> 
   
   <div class="under_footer">
       <table class="style1">
           <tr>
               <td style="width: 53px">
                   Count :</td>
               <td>
                   <asp:TextBox ID="NoCount" runat="server" BackColor="#FFFFCC" CssClass="textbox" 
                       MaxLength="50" ReadOnly="True" TabIndex="-1" Width="125px"></asp:TextBox>
               </td>
               <td style="width: 734px; text-align: right">
                   Total Debit :</td>
               <td style="text-align: right">
                   <asp:TextBox ID="TotAmount" runat="server" CssClass="textbox" Enabled="False" 
                       Height="22px" ReadOnly="True" Width="131px" BackColor="#FFFFCC"></asp:TextBox>
               </td>
               <td>
                    </td>
           </tr>
       </table>
       </div>
          
   </ContentTemplate>
     </asp:UpdatePanel>
        
</asp:Content>



