<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Fl_Show.aspx.cs" Inherits="Fl_Show" EnableEventValidation="false"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 38px; text-align: center">
        <table cellspacing="1" dir="rtl" style="width: 100%; background-color: #ffffff">
            <tr>
                <td style="text-align: right">
                      <asp:Label ID="lblerror" runat="server" 
        style="color: #666666; font-size: large; font-weight: 700" Text="Label"></asp:Label></td>
                <td style="text-align: left">
                      <asp:Button ID="BtExportExcel" runat="server" CssClass="textbox" Height="30px" 
                          onclick="BtExportExcel_Click" Text="Export to Excel" />
    
                <asp:Button ID="backButton" runat="server" Height="30px" 
                    OnClientClick="JavaScript:window.history.back(1);return false;" text="Back" 
                    Width="100px" CssClass="textbox" onclick="backButton_Click" />
                </td>
            </tr>
        </table>
  
    </div>
 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Myconnection %>" 
            
            
        SelectCommand="SELECT Serial, CONVERT(VARCHAR, [Fdate], 1) as Fdate,  CustomerId,Comment, CustomerName, CustValue, SanadId,mkman, sman, A_FollowType, A_FollowMethod FROM V_FlAll" 
        ProviderName="System.Data.SqlClient">
        </asp:SqlDataSource>
 <div  style="border: 1px solid #C0C0C0; height:478px; overflow:auto">

        <asp:GridView ID="Grid" runat="server"  Width="100%" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            AllowSorting="True"  CssClass="bordered" BackColor="White"  >

      

            <Columns>


                   <%--  <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:ImageButton ID="BtnEdit" runat="server" 
                            ImageUrl="~/images/edit-icon.png" 
                              NavigateUrl='<%# Eval("Serial", "~/Flowup.aspx?Serial={0}") %>' 
                            Width="16px" />
                    </ItemTemplate>
                </asp:TemplateField>--%>


                <asp:BoundField DataField="Serial" HeaderText="Serial" 
                    SortExpression="Serial" />
                <asp:BoundField DataField="Fdate" HeaderText="Fdate" 
                    SortExpression="Fdate"  DataFormatString="{0:MM/dd/yyyy}"/>
                <asp:BoundField DataField="CustomerId" HeaderText="CustomerId" 
                    SortExpression="CustomerId" />
                       <asp:BoundField DataField="Comment" HeaderText="Comment" 
                    SortExpression="Comment" >
                     <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="Customername" HeaderText="Customername" 
                    SortExpression="Customername" >
                <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="mkman" HeaderText="mkman" 
                    SortExpression="mkman" >
                
                 <ItemStyle Wrap="False" />
                </asp:BoundField>
                
                 <asp:BoundField DataField="sman" HeaderText="sman" 
                    SortExpression="sman" >
                
                <ItemStyle Wrap="False" />
                </asp:BoundField>
                
                <asp:BoundField DataField="A_FollowType" HeaderText="A_FollowType" 
                    SortExpression="A_FollowType" />
                <asp:BoundField DataField="A_FollowMethod" HeaderText="A_FollowMethod" 
                    SortExpression="A_FollowMethod" />
                <asp:BoundField DataField="CustValue" HeaderText="CustValue" 
                    SortExpression="CustValue" />
                <asp:BoundField DataField="SanadId" HeaderText="SanadId" 
                    SortExpression="SanadId" />

                  <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperReply" runat="server" 
                                    NavigateUrl='<%# Eval("Serial", "~/Flowup.aspx?Serial={0}") %>' 
                                        Text='Edit' ForeColor="#000066"></asp:HyperLink>
                            </ItemTemplate>
           </asp:TemplateField>

            </Columns>
            <HeaderStyle ForeColor="Black" />
            <PagerSettings Visible="False" />
            <PagerStyle Width="200px" Wrap="True" />
        </asp:GridView>

           
    </div>
</asp:Content>

