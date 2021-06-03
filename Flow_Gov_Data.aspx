<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Flow_Gov_Data.aspx.cs" Inherits="Flow_Gov_Data" EnableEventValidation="false"  MaintainScrollPositionOnPostback="true" %>


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
            width: 806px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">

    
      <div class="Header">
        <div style="height: 38px; text-align: center">
        <table cellspacing="1" dir="rtl" style="width: 100%">
            <tr>
                <td style="text-align: right">
                      &nbsp;</td>
                <td style="text-align: right">
                      <asp:Label ID="lblerror" runat="server" 
        style="color: #FFFFFF; font-size: large; font-weight: 700"></asp:Label></td>
                <td style="text-align: left" class="style1">
                      <asp:Button ID="Button1" runat="server" CssClass="textbox" Height="30px" 
                          onclick="BtExportExcel_Click" Text="Export to Excel" Width="170px" />
    
                </td>
            </tr>
        </table>
  
    </div>
  </div>
  <div class="content">
 <asp:Panel ID="Panel1" 
          style="float: left; " 
          runat="server" BorderColor="White" Height="90%">
       

       &nbsp;&nbsp;&nbsp;<asp:Button ID="BtnRef" runat="server" Text="Refresh" Width="150px" 
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
            
            
        SelectCommand="SELECT serial ,[Fdate], [Comment],[mkman], [CustomerId], [Customername], [GovFollowType],MyFil_name FROM [VGovFLTB]" 
        ProviderName="System.Data.SqlClient">
        </asp:SqlDataSource>
  
   <div  style="border: 1px solid #C0C0C0; height:94%; overflow:auto">
        <asp:GridView ID="Grid" runat="server"  Width="100%" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            AllowSorting="True"  CssClass="bordered" 
            onrowdatabound="Grid_RowDataBound" BackColor="White"  
                  >

      

            <Columns>


                <asp:BoundField DataField="serial" 
                    SortExpression="serial" HeaderText="serial" />
                <asp:BoundField DataField="Fdate" HeaderText="Fdate" 
                    SortExpression="Fdate" >
                </asp:BoundField>
                 <asp:BoundField DataField="Comment" HeaderText="Comment" 
                    SortExpression="Comment" >

                </asp:BoundField>

               
                
                 <asp:BoundField DataField="CustomerId" HeaderText="CustomerId" 
                    SortExpression="CustomerId" >
                
                </asp:BoundField>
                
                <asp:BoundField DataField="Customername" HeaderText="Customername" 
                    SortExpression="Customername" >
                </asp:BoundField>
                 <asp:BoundField DataField="mkman" HeaderText="mkman" 
                    SortExpression="mkman" >
                
                </asp:BoundField>
                <asp:BoundField DataField="GovFollowType" HeaderText="GovFollowType" 
                    SortExpression="GovFollowType" >
                </asp:BoundField>
                   <%--  <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:ImageButton ID="BtnEdit" runat="server" 
                            ImageUrl="~/images/edit-icon.png" 
                              NavigateUrl='<%# Eval("Serial", "~/Flowup.aspx?Serial={0}") %>' 
                            Width="16px" />
                    </ItemTemplate>
                </asp:TemplateField>--%>

 

               

                <asp:BoundField DataField="MyFil_name" HeaderText="MyFil_name" 
                    SortExpression="MyFil_name" >

                </asp:BoundField>

            </Columns>
            <PagerSettings Visible="False" />
            <PagerStyle Width="200px" Wrap="True" />
        </asp:GridView>

           
    </div>
  </div>
    </form>
</body>
</html>
