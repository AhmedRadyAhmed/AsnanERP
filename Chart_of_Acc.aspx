<%@ Page Title="Chart Of Accounts" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Chart_of_Acc.aspx.cs" Inherits="Chart_of_Acc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   

      
       <div style="border: 1px solid #CFDBE6; float: left; width: 450px; height: 560px; overflow: scroll; background-color: #FFFFFF; color: #333333;">


    <asp:TreeView ID="TrAcc" runat="server" Width="377px" ImageSet="Simple" style="color: #666666" 
                           onselectednodechanged="TrAcc_SelectedNodeChanged" 
                           ShowLines="True">
        <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
        <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" 
            HorizontalPadding="0px" NodeSpacing="0px" VerticalPadding="0px" />
        <ParentNodeStyle Font-Bold="False" />
        <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" 
            HorizontalPadding="0px" VerticalPadding="0px" />
    </asp:TreeView>


</div>
   <div style="float: right; height :560; width: 440px">

                   
                    <table class="style1">
                        <tr>
                            <td rowspan="4" style="width: 79px">
                                Parent Account</td>
                            <td>
                                 </td>
                            <td>

                                 </td>
                        </tr>
                        <tr>
                            <td>
                                 </td>
                            <td>

                                 </td>
                        </tr>
                        <tr>
                            <td>
                                 </td>
                            <td>

                    <asp:TextBox ID="PAccCode" runat="server" BackColor="#FFFFCC" ReadOnly="True" Width="150px"></asp:TextBox>
  
                    <asp:TextBox ID="PAccNameA_Ar" runat="server" BackColor="#FFFFCC" ReadOnly="True" 
                                    Width="300px"></asp:TextBox>
  
                            </td>
                        </tr>
                        <tr>
                            <td>
                                 </td>
                            <td>
  
                    <asp:TextBox ID="PAccName_en" runat="server" BackColor="#FFFFCC" ReadOnly="True" 
                                    Width="300px"></asp:TextBox>
  


                            </td>
                        </tr>
                        <tr>
                            <td style="width: 79px">
                                 </td>
                            <td>
                                 </td>
                            <td>
                                 </td>
                        </tr>
                        <tr>
                            <td style="width: 79px">
                                 </td>
                            <td>
                                 </td>
                            <td>
                                 </td>
                        </tr>
                        <tr>
                            <td style="width: 79px">
                                Sub Acc. No</td>
                            <td>
                                 </td>
                            <td>
                                        <asp:TextBox ID="SubAccountid" runat="server" CssClass="textbox" Height="22px" 
                                            MaxLength="50" Width="150px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                            ControlToValidate="SubAccountid" Display="Dynamic" ErrorMessage="Employee Code" 
                                            ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                                            <asp:RangeValidator runat="server" MinimumValue="0" Type="Integer" 
                                            ForeColor="#CC0000" ControlToValidate="SubAccountid" ErrorMessage="Numbers Only" 
                                            Display="Dynamic" ID="RangeValidator1" MaximumValue="999999999"></asp:RangeValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 79px">
                                En Name</td>
                            <td>
                                 </td>
                            <td>
                                                  <asp:TextBox ID="AccName_en" runat="server" 
                                    CssClass="textbox" Height="22px" 
                                                      MaxLength="50" Width="300px"></asp:TextBox>
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                                      ControlToValidate="AccName_en" Display="Dynamic" ErrorMessage="Employee Code" 
                                                      ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                                              </td>
                        </tr>
                        <tr>
                            <td style="width: 79px">
                                Ar Name</td>
                            <td>
                                 </td>
                            <td>
                        <asp:TextBox ID="AccName_ar" runat="server" Height="22px" Width="300px" 
                                            CssClass="textbox" MaxLength="50"></asp:TextBox>
                            
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                            ControlToValidate="AccName_ar" Display="Dynamic" ErrorMessage="Employee Code" 
                                            ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                            
                                    </td>
                        </tr>
                        <tr>
                            <td style="width: 79px">
                                 </td>
                            <td>
                                 </td>
                            <td>
                                 </td>
                        </tr>
                        <tr>
                            <td style="width: 79px">
                                 </td>
                            <td>
                                 </td>
                            <td>
                                        <asp:Button ID="BtnSave" runat="server" Text="Save" 
                                            onclick="BtnSave_Click" Width="100px" CssClass="Mybutton" 
                                            Height="26px" 
                                    onclientclick="Page_ClientValidate();Loading(true);" />
                                             <asp:Button ID="Btn_new_cust_emp" runat="server" Text="New" 
                                            CausesValidation="False" onclick="Btn_new_cust_emp_Click" Width="100px" 
                                            CssClass="Mybutton" Height="26px" 
                                             />

                                              </td>
                        </tr>
                    </table>
  


</div>
</asp:Content>

