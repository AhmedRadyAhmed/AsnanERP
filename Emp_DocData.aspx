<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Emp_DocData.aspx.cs" Inherits="Emp_DocData" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Employee Data</title>
   
     <link id="Link1" runat="server" rel="shortcut icon" href="~/images/Logo.jpg" type="image/x-icon"/>
     <link id="Link2" runat="server" rel="icon" href="~/images/Logo.jpg" type="image/ico" />  
     <link href="~/Styles/SiteData.css" rel="stylesheet" type="text/css" /> 
     <script src="jquery-latest.min.js" type="text/javascript"></script>
    <style type="text/css">
        .style1
        {
            width: 698px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">

    
      <div class="Header">
       <table cellspacing="1"  width ="100%" dir="rtl">
           <tr>
               <td>
                      <asp:Label ID="lblerror" runat="server" 
        style="color: #FFFFFF; font-size: large; font-weight: 700" ForeColor="White"></asp:Label>
    
                </td>
               <td style="color: #FFFFFF">
                      <asp:Label ID="LblCount" runat="server" 
        style="color: #FFFFFF; font-size: large; font-weight: 700" ForeColor="White"></asp:Label>
    
                </td>
               <td class="style1">
                    &nbsp;&nbsp;&nbsp;&nbsp;  
                    <asp:Button ID="BtExportExcel" runat="server" Height="30px" 
                          Text="Export to Excel" Width="170px" onclick="BtExportExcel_Click" />
    
                </td>
           </tr>
       </table>
          
    </div>
  
  <div class="content">
   <asp:Panel ID="Panel1" 
          style="float: left; " 
          runat="server" BorderColor="White" Height="90%">
       

       &nbsp;  &nbsp;  
       <asp:CheckBox ID="Chk_all" runat="server" AutoPostBack="True" Checked="True" 
           Font-Bold="True" oncheckedchanged="Chk_all_CheckedChanged" Text="All" /> 
       &nbsp; 
       <asp:Button ID="BtnRef" runat="server" Text="Refresh" Width="100px" 
           onclick="BtnRef_Click" />
 
<asp:Panel ID="checkBoxPanel" runat="server"   
        CssClass="scrollingControlContainer scrollingCheckBoxList" Height="98%" 
         BorderColor="#E0DDD8" BorderStyle="Solid" BorderWidth="1px" 
        BackColor="White">
        
         
    <table style="width: 100%">
        
        <tr>
           
            <td>
                
              </td>
            
            <td>
             
<asp:CheckBoxList ID="ListCols" runat="server" 
                    >
                    
                </asp:CheckBoxList>
                

               </td>
            
        </tr>
        
    </table>
              </asp:Panel>
  
  </asp:Panel> 
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Myconnection %>" 
            
           
           
        SelectCommand=" SELECT serial, EmpCode, Empname_en, EmpDocType, DocDesc, CONVERT(VARCHAR, [DocDate], 1) as DocDate, CONVERT(VARCHAR, [DocExpire], 1) as DocExpire, MyFil_name FROM V_Emp_Documents" 
        ProviderName="System.Data.SqlClient">
        </asp:SqlDataSource>
  <div  style="border: 1px solid #C0C0C0; height:94%; overflow:auto">

        <asp:GridView ID="Grid" runat="server"  Width="100%" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            AllowSorting="True"  CssClass="bordered" BackColor="White" 
            onrowdatabound="Grid_RowDataBound" onselectedindexchanged="Grid_SelectedIndexChanged" 
                  >

      

            <Columns>


                <asp:BoundField DataField="EmpCode" 
                    SortExpression="EmpCode" HeaderText="EmpCode" />
                <asp:BoundField DataField="Empname_en" HeaderText="Empname_en" 
                    SortExpression="Empname_en"/>
                <asp:BoundField DataField="EmpDocType" HeaderText="EmpDocType" 
                    SortExpression="EmpDocType" >
                
                </asp:BoundField>
                
                 <asp:BoundField DataField="DocDesc" HeaderText="DocDesc" 
                    SortExpression="DocDesc" >
                
                </asp:BoundField>
                
                <asp:BoundField DataField="DocDate" HeaderText="DocDate" 
                    SortExpression="DocDate" ReadOnly="True" />
                <asp:BoundField DataField="DocExpire" HeaderText="DocExpire" 
                    SortExpression="DocExpire" ReadOnly="True" />
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
                                    NavigateUrl='<%# Eval("Serial", "~/Emp_Doc.aspx?Serial_doc={0}") %>' 
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
    </div>
 
    </form>
</body>
</html>
