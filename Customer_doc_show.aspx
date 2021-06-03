<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Customer_doc_show.aspx.cs" Inherits="Customer_doc_show" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 38px; text-align: center">
        <table cellspacing="1" dir="rtl" style="width: 100%; background-color: #ffffff">
            <tr>
                <td style="text-align: right">
                      <asp:Label ID="lblerror" runat="server" 
        style="color: #666666; font-size: large; font-weight: 700" Text="Label"></asp:Label></td>
                <td style="text-align: left">
                      <asp:Button ID="BtExportExcel" runat="server" CssClass="Mybutton" Height="30px" 
                          onclick="BtExportExcel_Click" Text="Export to Excel" />
    
                <asp:Button ID="backButton" runat="server" Height="30px" 
                    OnClientClick="JavaScript:window.history.back(1);return false;" text="Back" 
                    Width="100px" CssClass="Mybutton" onclick="backButton_Click" />
                </td>
            </tr>
        </table>
  
    </div>
 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Myconnection %>" 
            
           

        SelectCommand=" SELECT Serial, CustomerId, CustomerName, CustomerDocType, docname, DocDesc,CONVERT(VARCHAR, [DocDate], 1) as DocDate , CONVERT(VARCHAR, [DocExpire], 1) as DocExpire, MyFil_name FROM V_Customer_Documents" 
        ProviderName="System.Data.SqlClient">
        </asp:SqlDataSource>
 <div  style="border: 1px solid #C0C0C0; height:478px; overflow:auto">

        <asp:GridView ID="Grid" runat="server"  Width="100%" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            AllowSorting="True"  CssClass="bordered" BackColor="White" 
            onrowdatabound="Grid_RowDataBound" onselectedindexchanged="Grid_SelectedIndexChanged" 
                  >

      

            <Columns>


                <asp:BoundField DataField="Serial" 
                    SortExpression="Serial" />
                <asp:BoundField DataField="CustomerId" HeaderText="CustomerId" 
                    SortExpression="CustomerId"/>
                <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" 
                    SortExpression="CustomerName" >
                
                </asp:BoundField>
                
                 <asp:BoundField DataField="CustomerDocType" HeaderText="CustomerDocType" 
                    SortExpression="CustomerDocType" >
                
                </asp:BoundField>
                
                <asp:BoundField DataField="docname" HeaderText="docname" 
                    SortExpression="docname" />
                <asp:BoundField DataField="DocDesc" HeaderText="DocDesc" 
                    SortExpression="DocDesc" />
                <asp:BoundField DataField="DocDate" HeaderText="DocDate" 
                    SortExpression="DocDate" ReadOnly="True" />
                <asp:BoundField DataField="DocExpire" HeaderText="DocExpire" 
                    SortExpression="DocExpire" ReadOnly="True" >
                </asp:BoundField>
                <asp:BoundField DataField="MyFil_name" HeaderText="MyFil_name" 
                    SortExpression="MyFil_name" />
                   <%--  <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:ImageButton ID="BtnEdit" runat="server" 
                            ImageUrl="~/images/edit-icon.png" 
                              NavigateUrl='<%# Eval("Serial", "~/Flowup.aspx?Serial={0}") %>' 
                            Width="16px" />
                    </ItemTemplate>
                </asp:TemplateField>--%>

                  <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperReply" runat="server" 
                                    NavigateUrl='<%# Eval("Serial", "~/Customer_doc.aspx?Serial_doc={0}") %>' 
                                        Text='Edit' ForeColor="#000066"></asp:HyperLink>
                            </ItemTemplate>
           </asp:TemplateField>

                <asp:TemplateField ShowHeader="False" HeaderText="Del">
                    <ItemTemplate>
                    <span onclick="return confirm('Are you Sure you Want to Delete this Record?')">
                        <asp:ImageButton ID="BtnDeleteGrid" runat="server" Height="16px" 
                            ImageUrl="~/images/deleteicon.jpg" onclick="BtnDeleteGrid_Click" 
                            style="width: 16px" />
                            </span>
                        
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
            <HeaderStyle ForeColor="Black" />
            <PagerSettings Visible="False" />
            <PagerStyle Width="200px" Wrap="True" />
        </asp:GridView>

           
    </div>
</asp:Content>
