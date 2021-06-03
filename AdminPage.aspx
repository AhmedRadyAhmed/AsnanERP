<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="AdminPage.aspx.cs" Inherits="AdminPage" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">





    <div style="height: 510px">
    <div style="height: 15px; "></div>

      
<table cellpadding="0" cellspacing="0" dir="ltr" style="width: 100%">
    <tr>
        <td width="1%">
             </td>
        <td width="98%">

            <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                Height="484px" Width="100%" CssClass="fancy fancy-green">
                <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="User Permission">
           <ContentTemplate>
            <div style="height: 417px">
             <div>
                 <asp:Button ID="BtnSave" runat="server" Height="32px" 
                            onclick="BtnSave_Click" Text="Save" 
                            Width="100px" AccessKey="S" CssClass="Mybutton" /></div>
               <div style="float: left; width: 300px">
               
                   <asp:ListBox ID="lstEmp" runat="server" AutoPostBack="True" CssClass="textbox" 
                       Height="445px" OnSelectedIndexChanged="lstEmp_SelectedIndexChanged" 
                       Width="100%"></asp:ListBox>
               </div>
            
             <div style="float: right; width: 555px; height: 445px;">
               <div style="border: 1px solid #C0C0C0; height:444px; overflow:auto">
                 <asp:GridView ID="GridView1" runat="server" onrowcreated="GridView1_RowCreated" 
                       style="text-align: right" CssClass="bordered" Width="100%" 
                       BackColor="White" onrowdatabound="GridView1_RowDataBound" 
                       onselectedindexchanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:TemplateField HeaderText="Display">
                    <ItemTemplate>
                        <asp:CheckBox ID="ChkDisplay" runat="server" 
                            oncheckedchanged="ChkDisplay_CheckedChanged" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Insert">
                    <ItemTemplate>
                        <asp:CheckBox ID="ChkAdd" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Update">
                    <ItemTemplate>
                        <asp:CheckBox ID="ChkUpdate" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
             </div>
               </div>
            </div>

           </ContentTemplate>

                </asp:TabPanel>
                <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="Roles">
                    <ContentTemplate>
                       
                        <br />
                        
                        <br />
                        
                        <asp:TextBox ID="TextBox1" runat="server">10</asp:TextBox>
                        
                   
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        
                    </ContentTemplate>
                    
                </asp:TabPanel>
                <asp:TabPanel ID="TabPanel3" runat="server" HeaderText="System Settings">
                    <ContentTemplate>
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" 
                                        oncheckedchanged="CheckBox1_CheckedChanged" Text="This Year Only" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:TabPanel>
                <asp:TabPanel ID="TabPanel4" runat="server" HeaderText="Current Users">
                <ContentTemplate>
                     
                    <div style="height: 42px">

                        <asp:Button ID="BtnRefresh" runat="server" CssClass="textbox" Height="30px" 
                            onclick="BtnRefresh_Click" Text="Refresh" Width="175px" />
                        
                    </div>
   
              
    <div>
         

        <asp:GridView ID="Grid" runat="server">
        </asp:GridView>

                
              </div>
                 </ContentTemplate>
                    
                    
                </asp:TabPanel>
            </asp:TabContainer>
        </td>
        <td width="1%">
             </td>
    </tr>
</table>
      
</div>
</asp:Content>


