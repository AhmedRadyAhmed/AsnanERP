<%@ Page Title="Customer Contacts" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Customer_Contacts.aspx.cs" Inherits="Customer_Contacts" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
             
                         
                    <table cellpadding="0" cellspacing="0" dir="ltr"  
                        style="width: 100%; background-color: #F2F9FF; height: 182px;">

                    <tr><td> </td></tr>
                      <tr><td> 
                       
                      <div style="float: left; width: 440px">
                                      <table cellpadding="1" cellspacing="1" class="style10" dir="ltr">
                                <tr>
                                    <td style="width: 133px; text-align: right;">
                                        <asp:TextBox ID="Serial_cust_contact" runat="server" Visible="False" 
                                            Width="30px"></asp:TextBox>
                                        Customer Id :</td>
                                    <td>
                                         </td>
                                    <td>
                    <asp:TextBox runat="server" Height="22px" Width="140px" ID="CustomerId" CssClass="textbox" 
                                           ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="CustomerId" Display="Dynamic" ErrorMessage="Employee Code" 
                                            ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                                            <asp:RangeValidator runat="server" MinimumValue="0" Type="Double" 
                                            ForeColor="#CC0000" ControlToValidate="CustomerId" ErrorMessage="Numbers Only" 
                                            Display="Dynamic" ID="RangeValidator1"></asp:RangeValidator>
                    <asp:Button runat="server" Text="Search" Height="26px" 
                        Width="60px" ID="BtnSearch" CausesValidation="False" 
                        onclick="BtnSearch_Click" CssClass="Mybutton"></asp:Button>
                                       
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 133px; text-align: right;">
                                        Customer  Name :</td>
                                    <td>
                                         </td>
                                    <td>
                                        <asp:DropDownList ID="LstCustomername" runat="server" Width="205px" 
                                            CssClass="textbox" AutoPostBack="True" Height="22px" 
                                            onselectedindexchanged="LstCustomername_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 133px; text-align: right;">
                                        Employee Name :</td>
                                    <td>
                                         </td>
                                    <td>
                                        <asp:TextBox ID="Cust_Empname" runat="server" Height="22px" Width="200px" 
                                            CssClass="textbox"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                            ControlToValidate="Cust_Empname" Display="Dynamic" ErrorMessage="Employee Code" 
                                            ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 133px; text-align: right;">
                                        Notes:</td>
                                    <td>
                                         </td>
                                    <td>
                        <asp:TextBox ID="Cust_EmpNote" runat="server" Height="22px" Width="200px" 
                                            CssClass="textbox"></asp:TextBox>
                            
                                    </td>
                                </tr>
                                 </table>
                             </div>

                              <div style="float: right; width: 440px">
                                      <table cellpadding="1" cellspacing="1" class="style10" dir="ltr" width="100%">
                                <tr>
                                    <td style="width: 133px; text-align: right;">
                                        Position </td>
                                    <td>
                                         </td>
                                    <td>
                                        <asp:TextBox ID="Cust_EmpPosition" runat="server" Height="22px" Width="200px" 
                                            CssClass="textbox"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                            ControlToValidate="Cust_EmpPosition" Display="Dynamic" 
                                            ErrorMessage="Employee Code" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 133px; text-align: right;">
                                        E-mail:</td>
                                    <td>
                                         </td>
                                    <td>
                                        <asp:TextBox ID="Cust_EmpEmail" runat="server" Height="22px" Width="200px" 
                                            CssClass="textbox"></asp:TextBox>
                                        <asp:RegularExpressionValidator runat="server" 
                                            ValidationExpression="\w+([-+.&#39;]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                            ForeColor="#CC0000" ControlToValidate="Cust_EmpEmail" 
                                            ErrorMessage="RegularExpressionValidator" Display="Dynamic" 
                                            ID="RegularExpressionValidator2">Invalid E-mail</asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 133px; text-align: right;">
                                       
                                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Myconnection %>" 
            
            
                                 SelectCommand="SELECT [Serial], [Cust_Empname], [Cust_EmpPosition], [Cust_EmpEmail], [Cust_EmpTel], [Cust_EmpNote] FROM [Customer_contacts] WHERE ([CustomerId] = @CustomerId)" 
                                 ProviderName="System.Data.SqlClient">
                                 <SelectParameters>
                                     <asp:ControlParameter ControlID="CustomerId" Name="CustomerId" 
                                         PropertyName="Text" Type="String" />
                                 </SelectParameters>
        </asp:SqlDataSource>
                                        Tel:</td>
                                    <td>
                                         </td>
                                    <td>
                                        <asp:TextBox ID="Cust_EmpTel" runat="server" Height="22px" Width="200px" 
                                            CssClass="textbox"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                            ControlToValidate="Cust_EmpTel" Display="Dynamic" ErrorMessage="Employee Code" 
                                            ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                                        <asp:RangeValidator runat="server" MinimumValue="0" Type="Double" 
                                            ForeColor="#CC0000" ControlToValidate="Cust_EmpTel" ErrorMessage="Numbers Only" 
                                            Display="Dynamic" ID="RangeValidator8"></asp:RangeValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 133px; text-align: right;">
                                       
                                          </td>
                                    <td>
                                         </td>
                                    <td>
                                        <asp:Button ID="BtnCust_ContactSave" runat="server" Text="Save" 
                                            onclick="BtnCust_ContactSave_Click" Width="67px" CssClass="Mybutton" 
                                            Height="26px" onclientclick="Page_ClientValidate();Loading(true);" />
                                             <asp:Button ID="Btn_new_cust_emp" runat="server" Text="New" 
                                            CausesValidation="False" onclick="Btn_new_cust_emp_Click" Width="67px" 
                                            CssClass="Mybutton" Height="26px" 
                                             />

                                              <span onclick="return confirm('Are you Sure you Want to Delete this Record?')">
                                                    <asp:Button ID="Btn_del_cust_emp" runat="server" Text="Delete" 
                                            onclick="Btn_del_cust_emp_Click" Width="67px" 
                                                    CssClass="Mybutton" Height="26px" 
                                            onclientclick="Page_ClientValidate();Loading(true);"  />
                                             </span></td>
                                </tr>
                                 </table>
                             </div></td></tr>
                        
                              
                            <tr><td>  
                            
                            </td></tr>
           
                           
           
                            <tr><td>  
                         <div class="MyGrid_Div">
                       
                    <table cellpadding="0" cellspacing="0" dir="ltr" 
            style="width: 100%;background-color: #F2F9FF; height: 77px;  ">
    <tr>
        <td width="1%">
           </td>
        <td width="98%">
                     
                            <asp:GridView ID="Grid" runat="server" Width="100%" 
                                AllowSorting="True" AutoGenerateColumns="False" 
                                DataKeyNames="Serial" DataSourceID="SqlDataSource1" 
                                onselectedindexchanged="Grid_SelectedIndexChanged" CssClass="bordered" 
                                PageSize="2">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                                CommandName="Select" ImageUrl="~/images/select_icon.jpg" Width="20px" 
                                                Height="16px" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Serial" HeaderText="Serial" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="Serial" />
                                    <asp:BoundField DataField="Cust_Empname" HeaderText="Cust_Empname" 
                                        SortExpression="Cust_Empname" />
                                    <asp:BoundField DataField="Cust_EmpPosition" HeaderText="Cust_EmpPosition" 
                                        SortExpression="Cust_EmpPosition" />
                                    <asp:BoundField DataField="Cust_EmpEmail" HeaderText="Cust_EmpEmail" 
                                        SortExpression="Cust_EmpEmail" />
                                    <asp:BoundField DataField="Cust_EmpTel" HeaderText="Cust_EmpTel" 
                                        SortExpression="Cust_EmpTel" />
                                    <asp:BoundField DataField="Cust_EmpNote" HeaderText="Cust_EmpNote" 
                                        SortExpression="Cust_EmpNote" />
                                   
                                </Columns>
                            </asp:GridView>
                      </td>
        <td width="1%">
             </td>
    </tr>
    
</table>
  
                     </div>          
                                                    
</td></tr>
           
                           
           
                            <tr><td>  
                            
                                 </td></tr>
           
                           
           
           </table>
                           
                         
                    
                       
                       

                  

  
</asp:Content>

