<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="All_Log.aspx.cs" Inherits="All_Log" EnableEventValidation="false"  %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
   

    <asp:Panel ID="Panel1" runat="server" BackColor="#F7F7F7" 
        
        
        style="border: 1px solid #DDDDDD; background-color: #F8F8F8; color: #000066; font-family: Tahoma;">
<div>
<asp:button id="backButton" runat="server" text="Back" 
OnClientClick="JavaScript:window.history.back(1);return false;" Width="100px" 
    Height="30px" CssClass="Mybutton" ></asp:button>

     <asp:Button ID="Button1" runat="server" onclick="BtnExport_Click" 
                    Text="Excel" Width="100px" Height="30px" CssClass="Mybutton" />
        
                <asp:Label ID="LblCount" runat="server" 
                    style="font-weight: 400; font-family: Tahoma"></asp:Label>

    
    </div>
    </asp:Panel>



    

    <div style="height: 20px; text-align: center">

    <asp:Label ID="lblerror" runat="server" ForeColor="Red" 
                  style="font-weight: 700" Visible="False"></asp:Label>
    
</div>
    
   
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Myconnection %>" 
            
            SelectCommand="SELECT * from tblog ">
        </asp:SqlDataSource>
   

    <div class="MyGrid_Div" >
     <table cellpadding="0" cellspacing="0" dir="ltr" 
            style="width: 100%; background-color: #F2F9FF; height: 77px;">
    <tr>
        <td width="1%">
             </td>
        <td width="98%">

        <asp:GridView ID="Grid" runat="server"  Width="100%"  
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            AllowSorting="True" onrowdatabound="Grid_RowDataBound" CssClass="bordered" onselectedindexchanged="Grid_SelectedIndexChanged" 
           
            >

      

            <Columns>


                <asp:BoundField DataField="Serial" HeaderText="Serial" 
                    SortExpression="Serial" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="userid" HeaderText="userid" 
                    SortExpression="userid" />
                <asp:BoundField DataField="Username" HeaderText="Username" 
                    SortExpression="Username" />
                <asp:BoundField DataField="Cdate" HeaderText="Cdate" 
                    SortExpression="Cdate" DataFormatString="{0:MM/dd/yyyy}" />
                <asp:BoundField DataField="TranType" HeaderText="TranType" 
                    SortExpression="TranType" />
                <asp:BoundField DataField="TranDesc" HeaderText="TranDesc" 
                    SortExpression="TranDesc" />
                <asp:BoundField DataField="Tbname" HeaderText="Tbname" 
                    SortExpression="Tbname" />
                <asp:BoundField DataField="PageName" HeaderText="PageName" 
                    SortExpression="PageName" />
                <asp:BoundField DataField="RecordId" HeaderText="RecordId" 
                    SortExpression="RecordId" />
            </Columns>
            <PagerSettings Visible="False" />
            <PagerStyle Width="200px" Wrap="True" />
        </asp:GridView>
    </td>
        <td width="1%">
             </td>
    </tr>
    </table>
    </div>

    
</asp:Content>


