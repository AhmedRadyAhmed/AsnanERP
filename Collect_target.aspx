<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Collect_target.aspx.cs" Inherits="Default2" %>

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

<div style="height: 126px"></div>

   <div style="border: 1px solid #C0C0C0; height:418px; overflow:auto">
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                         ConnectionString="<%$ ConnectionStrings:DbAsnan_webConnectionString %>" 
                         SelectCommand="SELECT [CustomerId], [CustomerName_En], [Collecter_Name], [Empname_en], [Bal] FROM [V_Cust_sman_Bal_Gril_collect_id]  order by bal desc"></asp:SqlDataSource>
                     <asp:GridView ID="GridView1" runat="server" CssClass="bordered" 
                         AutoGenerateColumns="False" BackColor="White" DataSourceID="SqlDataSource1">
                         <Columns>
                             <asp:BoundField DataField="CustomerId" HeaderText="CustomerId" 
                                 SortExpression="CustomerId" />
                             <asp:BoundField DataField="CustomerName_En" HeaderText="CustomerName_En" 
                                 SortExpression="CustomerName_En" />
                             <asp:BoundField DataField="Collecter_Name" HeaderText="Collecter_Name" 
                                 SortExpression="Collecter_Name" />
                             <asp:BoundField DataField="Empname_en" HeaderText="Empname_en" 
                                 SortExpression="Empname_en" />
                             <asp:BoundField DataField="Bal" HeaderText="Bal" ReadOnly="True" 
                                 SortExpression="Bal" DataFormatString="{0:n}" />
                             <asp:TemplateField HeaderText="Target">
                                 <ItemTemplate>
                                     <asp:TextBox ID="Target" runat="server" autocomplete="off" CssClass="textbox" 
                                         MaxLength="50" onkeypress="return isNumberKey(event)" TabIndex="101" 
                                         Width="100px"></asp:TextBox>
                                 </ItemTemplate>
                             </asp:TemplateField>
                         </Columns>
                     </asp:GridView>
    
            </div> 
</asp:Content>

