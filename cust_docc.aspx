<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="cust_docc.aspx.cs" Inherits="cust_doc" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
                    <asp:TextBox runat="server" Height="22px" Width="75px" ID="CustomerId" 
                        CssClass="textbox"></asp:TextBox> 
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
                    </div>
                    <div style="height: 89px">
                    
                    </div>
    <div>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                             ConnectionString="<%$ ConnectionStrings:Myconnection %>" 
            
            
                                 SelectCommand="SELECT [Serial], [CustomerDocTypeId], [CustomerId], [docname], [DocDesc], [DocDate], [DocExpire], [MyFil_name], [InsertBy], [InsertDate] FROM [Customer_Documents] WHERE ([CustomerId] = @CustomerId)" 
                                 ProviderName="System.Data.SqlClient"><SelectParameters><asp:ControlParameter ControlID="CustomerId" Name="CustomerId" 
                                         PropertyName="Text" Type="String" /></SelectParameters></asp:SqlDataSource>
                                         </div>
                                         <div style="height: 192px ; ">
                                         <asp:GridView ID="Grid_Cust_docs" runat="server" Width="100%" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" 
                                DataSourceID="SqlDataSource2" PageSize="6" 
                                CssClass="bordered" 
                                onselectedindexchanged="Grid_Cust_docs_SelectedIndexChanged" 
                                                 onrowdatabound="Grid_Cust_docs_RowDataBound"><Columns><asp:BoundField DataField="Serial" HeaderText="Serial" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="Serial" /><asp:BoundField DataField="CustomerDocTypeId" HeaderText="CustomerDocTypeId" 
                                        SortExpression="CustomerDocTypeId" Visible="False" /><asp:BoundField DataField="CustomerId" HeaderText="CustomerId" 
                                        SortExpression="CustomerId" Visible="False" /><asp:BoundField DataField="docname" HeaderText="docname" 
                                        SortExpression="docname" /><asp:BoundField DataField="DocDesc" HeaderText="DocDesc" 
                                        SortExpression="DocDesc" /><asp:BoundField DataField="DocDate" HeaderText="DocDate" 
                                        SortExpression="DocDate" />
                                                 <asp:BoundField DataField="DocExpire" HeaderText="DocExpire" 
                                        SortExpression="DocExpire" /><asp:BoundField DataField="MyFil_name" HeaderText="MyFil_name" 
                                        SortExpression="MyFil_name" />
                                                 <asp:BoundField DataField="InsertBy" HeaderText="InsertBy" 
                                        SortExpression="InsertBy" />
                                                 <asp:BoundField DataField="InsertDate" HeaderText="InsertDate" 
                                        SortExpression="InsertDate" /><asp:TemplateField HeaderText="Open"><ItemTemplate><asp:ImageButton ID="BtnPdf" runat="server" ImageUrl="~/images/Open-icon.png" 
                            onclick="BtnPdf_Click" Width="20px" Height="16px" 
                            CausesValidation="False" /></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Save"><ItemTemplate><asp:ImageButton ID="BtnSavePdf" runat="server" 
                            ImageUrl="~/images/saveicon.jpg" onclick="BtnSavePdf_Click" Width="16px" 
                            CausesValidation="False" /></ItemTemplate></asp:TemplateField><asp:TemplateField ShowHeader="False" HeaderText="Del"><ItemTemplate><span onclick="return confirm('Are you Sure you Want to Delete this Record?')"><asp:ImageButton ID="BtnDeleteGrid" runat="server" Height="16px" 
                            ImageUrl="~/images/deleteicon.jpg" onclick="BtnDeleteGrid_Click" 
                            CausesValidation="False" /></span></ItemTemplate></asp:TemplateField>
                                                 <asp:HyperLinkField />
                                             </Columns></asp:GridView></div>
</asp:Content>

