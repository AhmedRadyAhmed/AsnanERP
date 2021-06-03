<%@ Page Title="Employees" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Emp.aspx.cs" Inherits="Emp" EnableEventValidation="false" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

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

    <div style="height: 474px">
    <div style="height: 120px">
     
       <div style="height: 5px"></div>

   

      <asp:Panel ID="Panel1" runat="server" 
            BackImageUrl="~/images/bgContent.gif" Height="104px">
                <div style="height: 34px">
            <asp:Button ID="BtnFirst" runat="server" CausesValidation="False" 
                Font-Bold="True" Height="25px" onclick="BtnFirst_Click" TabIndex="21" 
                Text="&lt;&lt;" Width="37px" CssClass="Mybutton" BackColor="#C8E0F2" />
            <asp:Button ID="BtnPrev" runat="server" CausesValidation="False" 
                Font-Bold="True" Height="25px" onclick="BtnPrev_Click" TabIndex="22" Text="&lt;" 
                Width="37px" CssClass="Mybutton" BackColor="#C8E0F2" />
            <asp:Button ID="BtnNext" runat="server" CausesValidation="False" 
                Font-Bold="True" Height="25px" onclick="BtnNext_Click" TabIndex="23" 
                Text="&gt;" Width="37px" CssClass="Mybutton" BackColor="#C8E0F2" />
            <asp:Button ID="Btnlast" runat="server" CausesValidation="False" 
                Font-Bold="True" Height="25px" onclick="Btnlast_Click" TabIndex="24" 
                Text="&gt;&gt;" Width="37px" CssClass="Mybutton" BackColor="#C8E0F2" />
            <asp:Button ID="BtnNew" runat="server" CausesValidation="False" Height="25px" 
                onclick="BtnNew_Click" TabIndex="16" Text="New" Width="70px" 
                CssClass="Mybutton" BackColor="#C8E0F2" />
            <asp:Button ID="BtnSave" runat="server" Height="25px" onclick="BtnSave_Click" 
                TabIndex="17" Text="Save" Width="70px" CssClass="Mybutton" 
                onclientclick="Page_ClientValidate();Loading(true);" BackColor="#C8E0F2" />

                <asp:Button ID="BtnShowReport" runat="server" Height="25px" 
                TabIndex="17" Text="Report" Width="70px" CssClass="Mybutton" 
                onclick="BtnShowReport_Click" BackColor="#C8E0F2"
                 />

            <asp:Button ID="BtnSearchEmp" runat="server" CausesValidation="False" 
                Height="25px" onclick="BtnSearchEmp_Click" TabIndex="19" Text="Search" 
                Width="70px" CssClass="Mybutton" BackColor="#C8E0F2" />
            <asp:Button ID="BtnUpdate" runat="server" Height="25px" 
                 TabIndex="20" Text="Update" Width="70px" 
                CssClass="Mybutton" onclick="BtnUpdate_Click" BackColor="#C8E0F2" />
             </div>
    <div style=" height: 68px; background-repeat: no-repeat; background-color: #F2F9FF; color: #000000; font-size: small; font-weight: 400; font-family: sans-serif;">
        <table cellpadding="0" cellspacing="0"  width="100%" dir="ltr" style="background-image: url('images/bgContent.gif')" 
            >
            <tr>
                <td colspan="11" style="height: 8px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                     </td>
                <td>
                     </td>
                <td>
                    Employee Id : <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="EmpCode" Display="Dynamic" ErrorMessage="Employee Code" 
                        ForeColor="#CC0000">*</asp:RequiredFieldValidator></td>
                <td>
                    <asp:CheckBox ID="ISBlock" runat="server" Font-Bold="True" Text="Block  User" />
                </td>
                <td>
                     </td>
                <td>
                    English Name :<asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                        runat="server" ControlToValidate="Empname_en" Display="Dynamic" 
                        ErrorMessage="Employee Code" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                </td>
                <td style="width: 218px">
                    Arabic Name :<asp:RequiredFieldValidator ID="RequiredFieldValidator6" 
                        runat="server" ControlToValidate="Empname_Ar" Display="Dynamic" 
                        ErrorMessage="Employee Code" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                </td>
                <td colspan="2">
                    Branch :<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="BranchId" Display="Dynamic" ErrorMessage="Employee Code" 
                        ForeColor="#CC0000" InitialValue="0">*</asp:RequiredFieldValidator>
                </td>
                <td style="width: 12px">
                     </td>
                <td>
                     </td>
            </tr>
            <tr>
                <td>
                     </td>
                <td>
                     </td>
                <td>
                    <asp:TextBox ID="EmpCode" runat="server" CssClass="textbox" 
                        Width="125px" onkeypress="return isNumberKey(event)" 
                        ontextchanged="EmpCode_TextChanged" AutoPostBack="True"  ></asp:TextBox>
                </td>
                <td>
                    <asp:CheckBox ID="IsSysUser" runat="server" Font-Bold="True" 
                        Text="System User" />
                </td>
                <td>
                                     </td>
                <td>
                    <asp:TextBox ID="Empname_en" runat="server" CssClass="textbox" 
                        Width="220px"></asp:TextBox>
                </td>
                <td style="width: 218px">
                                    <asp:TextBox ID="Empname_Ar" runat="server" CssClass="textbox" 
                                        Width="220px"></asp:TextBox>
                </td>
                <td>
                    <asp:DropDownList ID="BranchId" runat="server" CssClass="textbox" 
                        Width="105px">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:CheckBox runat="server" Text="Active" ID="Active"></asp:CheckBox>
                </td>
                <td style="width: 12px">
                     &nbsp;</td>
                <td>
                     </td>
            </tr>
            </table>
        </div>
   
    </asp:Panel>
    
    </div>


<table cellpadding="0" cellspacing="0" dir="ltr" style="width: 100%">
    <tr>
        <td width="1%">
             </td>
        <td width="98%">
            <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                Height="361px" Width="100%" CssClass="fancy fancy-green">
                <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="Main Data">

                    <HeaderTemplate>
                        Main Data
                    </HeaderTemplate>

                    <ContentTemplate>

                    
                        
                        

                    
                        
                        
                        
                       

                    
                        
                        <table width="100%" style="height: 315px">
                            

                            
                            
                            

                           
                            

                            <tr>

                                

                               

                                <td style="text-align: left">

                                    

                                  

                                   <div style="float: left; width: 420px">
                                   
                                   

                                   
                                   
                                       
                                   
                                       
                                   
                                       

                                   
                                       
                                   
                                       
                                      
                                   
                                   

                                   
                                   
                                       <table class="style1" cellpadding="0" cellspacing="2">
                                           

                                           
                                           
                                           

                                          
                                           

                                           <tr>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td style="text-align: left;" colspan="3">
                                                   

                                                   
                                                   
                                                   

                                                  
                                                   

                                                   <asp:CheckBox ID="IsFollowSysUser" runat="server" Text="Is Follow Sys User" />
                                                   &nbsp;<asp:CheckBox ID="IsFollowedUser" runat="server" Text="Is Followed User" />
                                                   &nbsp;
                                                   <asp:CheckBox ID="IsAdminFollowup" runat="server" Text="Is Admin Followup" />
                                               </td>
                                               

                                               
                                               
                                               

                                              
                                               

                                           </tr>
                                           

                                           
                                           
                                           

                                          
                                           

                                           <tr>
                                               <td style="width: 100px; text-align: right;">
                                                   Phone</td>
                                               <td style="width: 7px">
                                               </td>
                                               <td>
                                                   <asp:TextBox ID="Phone" runat="server" CssClass="textbox" 
                                                       onkeypress="return isNumberKey(event)" Width="200px"></asp:TextBox>
                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                       ControlToValidate="Phone" Display="Dynamic" ErrorMessage="Phone Number" 
                                                       ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                                               </td>
                                           </tr>
                                           

                                           
                                           
                                           

                                          
                                           

                                           <tr>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td style="width: 100px; text-align: right;">
                                                   

                                                   
                                                   
                                                   

                                                  
                                                   

                                                   Gender</td>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td style="width: 7px">
                                                   
                                                  
                                                    </td>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td>
                                                   

                                                   
                                                   
                                                   

                                                  
                                                   

                                                   <asp:DropDownList ID="GenderId" runat="server" CssClass="textbox" 
                                                       Width="204px">
                                                       

                                                       
                                                       
                                                       

                                                  
                                                       

                                                   </asp:DropDownList>
                                                   

                                                   
                                                   
                                                   

                                                  
                                                   

                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                                       ControlToValidate="GenderId" Display="Dynamic" ErrorMessage="Email" 
                                                       ForeColor="#CC0000" InitialValue="0">*</asp:RequiredFieldValidator>
                                                   

                                                   
                                                   
                                                   

                                              
                                                   

                                               </td>
                                               

                                               
                                               
                                               

                                          
                                               

                                           </tr>
                                           

                                           
                                           
                                           

                                          
                                           

                                           <tr>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td style="width: 100px; text-align: right;">
                                                   

                                                   
                                                   
                                                   

                                                  
                                                   

                                                   Nationality</td>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td style="width: 7px">
                                                   
                                                  
                                                    </td>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td>
                                                   
                                                   
                                                   
                                                   
                                                  
                                                   
                                                   <asp:DropDownList ID="NationId" runat="server" CssClass="textbox" 
                                                       Width="204px">
                                                       

                                                       
                                                       
                                                       

                                                  
                                                       

                                                   </asp:DropDownList>
                                                   

                                                   
                                                   
                                                   

                                                  
                                                   

                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                                       ControlToValidate="NationId" Display="Dynamic" ErrorMessage="Email" 
                                                       ForeColor="#CC0000" InitialValue="0">*</asp:RequiredFieldValidator>
                                                   

                                                   
                                                   
                                                   

                                              
                                                   

                                               </td>

                                               

                                          

                                           </tr>
                                           

                                           
                                           
                                           

                                          
                                           

                                           <tr>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td style="width: 100px; text-align: right;">
                                                   

                                                   
                                                   
                                                   

                                                  
                                                   

                                                   Religion</td>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td style="width: 7px">
                                                   
                                                  
                                                    </td>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td>
                                                   

                                                   
                                                   
                                                   

                                                  
                                                   

                                                   <asp:DropDownList ID="ReligionId" runat="server" CssClass="textbox" 
                                                       Width="204px">
                                                       

                                                       
                                                       
                                                       

                                                  
                                                       

                                                   </asp:DropDownList>
                                                   

                                                   
                                                   
                                                   

                                                  
                                                   

                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                                                       ControlToValidate="ReligionId" Display="Dynamic" ErrorMessage="Email" 
                                                       ForeColor="#CC0000" InitialValue="0">*</asp:RequiredFieldValidator>
                                                   

                                                   
                                                   
                                                   

                                              
                                                   

                                               </td>
                                               

                                               
                                               
                                               

                                          
                                               

                                           </tr>
                                           

                                           
                                           
                                           

                                          
                                           

                                           <tr>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td style="width: 100px; text-align: right;">
                                                   

                                                   
                                                   
                                                   

                                                  
                                                   

                                                   social State</td>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td style="width: 7px">
                                                   
                                                  
                                                    </td>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td>
                                                   

                                                   
                                                   
                                                   

                                                  
                                                   

                                                   <asp:DropDownList ID="SocialStateId" runat="server" CssClass="textbox" 
                                                       Width="204px">
                                                       

                                                       
                                                       
                                                       

                                                  
                                                       

                                                   </asp:DropDownList>
                                                   

                                                   
                                                   
                                                   

                                                  
                                                   

                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                                                       ControlToValidate="SocialStateId" Display="Dynamic" ErrorMessage="Email" 
                                                       ForeColor="#CC0000" InitialValue="0">*</asp:RequiredFieldValidator>
                                                   

                                                   
                                                   
                                                   

                                              
                                                   

                                               </td>
                                               

                                               
                                               
                                               

                                          
                                               

                                           </tr>
                                           

                                           
                                           
                                           

                                          
                                           

                                           <tr>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td style="width: 100px; text-align: right;">
                                                   

                                                   
                                                   
                                                   

                                                  
                                                   

                                                   Birth Date</td>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td style="width: 7px">
                                                   
                                                  
                                                    </td>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td>
                                                   

                                                   
                                                   
                                                   

                                                  
                                                   

                                                   <asp:TextBox ID="BirthDate" runat="server" CssClass="textbox" 
                                                       Width="200px"></asp:TextBox>
                                                   

                                                   
                                                   
                                                   

                                                  
                                                   

                                                   <asp:CalendarExtender ID="BirthDate_CalendarExtender" runat="server" 
                                                       Enabled="True" Format="dd/MM/yyyy" TargetControlID="BirthDate">
                                                       

                                                       
                                                       
                                                       

                                                  
                                                       

                                                   </asp:CalendarExtender>
                                                   

                                                   
                                                   
                                                   

                                                  
                                                   

                                                   <asp:RangeValidator ID="RangeValidator26" runat="server" 
                                                       ControlToValidate="BirthDate" ErrorMessage="Invalid Date" ForeColor="Red" 
                                                       MaximumValue="1/1/2050" MinimumValue="1/1/1940" Type="Date" 
                                                       SetFocusOnError="True"></asp:RangeValidator>
                                                   

                                                   
                                                   
                                                   

                                              
                                                   

                                               </td>
                                               

                                               
                                               
                                               

                                          
                                               

                                           </tr>

                                           

                                          

                                           <tr>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td style="width: 100px; text-align: right;">
                                                   

                                                   
                                                   
                                                   

                                                  
                                                   

                                                   P Box</td>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td style="width: 7px">
                                                   
                                                  
                                                    </td>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td>
                                                   

                                                   
                                                   
                                                   

                                                  
                                                   

                                                   <asp:TextBox ID="Baridramz" runat="server" CssClass="textbox" 
                                                       Width="200px" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                   

                                                   
                                                   
                                                   

                                              
                                                   

                                               </td>
                                               

                                               
                                               
                                               

                                          
                                               

                                           </tr>
                                           

                                           
                                           
                                           

                                          
                                           

                                           <tr>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td style="width: 100px; text-align: right;">
                                                   

                                                   
                                                   
                                                   

                                                  
                                                   

                                                   Relative Name</td>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td style="width: 7px">
                                                   
                                                  
                                                    </td>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td>

                                                   

                                                  

                                                   <asp:TextBox ID="PersonRelative" runat="server" CssClass="textbox" 
                                                       Width="200px"></asp:TextBox>
                                                   

                                                   
                                                   
                                                   

                                              
                                                   

                                               </td>
                                               

                                               
                                               
                                               

                                          
                                               

                                           </tr>
                                           

                                           
                                           
                                           

                                          
                                           

                                           <tr>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td style="width: 100px; text-align: right;">
                                                   

                                                   
                                                   
                                                   

                                                  
                                                   

                                                   Relative Phone</td>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td style="width: 7px">
                                                   
                                                  
                                                    </td>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td>
                                                   

                                                   
                                                   
                                                   

                                                  
                                                   

                                                   <asp:TextBox ID="PersonTel" runat="server" CssClass="textbox" 
                                                       Width="200px" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                   

                                                   
                                                   
                                                   

                                              
                                                   

                                               </td>
                                               

                                               
                                               
                                               

                                          
                                               

                                           </tr>
                                           

                                           
                                           
                                           

                                          
                                           

                                           <tr>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td style="width: 100px; text-align: right;">
                                                   

                                                   
                                                   
                                                   

                                                  
                                                   

                                                   Address(inside)</td>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td style="width: 7px">
                                                   
                                                  
                                                    </td>
                                               

                                               
                                               
                                               

                                              
                                               

                                               <td>
                                                   

                                                   
                                                   
                                                   

                                                  
                                                   

                                                   <asp:TextBox ID="Addressinside" runat="server" CssClass="textbox" 
                                                       Width="250px"></asp:TextBox>
                                                   
                                              
                                               </td>
                                               

                                               
                                               
                                               

                                          
                                               

                                           </tr>
                                           

                                           
                                           
                                           

                                          
                                           

                                           <tr>
                                               
                                              
                                               <td style="width: 100px; text-align: right;">
                                                   
                                                  
                                                   Adress(outside)</td>
                                               
                                              
                                               <td style="width: 7px">
                                                   
                                                  
                                                    </td>
                                               
                                              
                                               <td>
                                                   
                                                  
                                                   <asp:TextBox ID="addressoutside" runat="server" CssClass="textbox" 
                                                       Width="250px"></asp:TextBox>
                                                   
                                              
                                               </td>
                                               
                                          
                                           </tr>
                                           

                                           
                                           
                                           

                                      
                                           

                                       </table>
                                   
                                   
                                       

                                   
                                   
                                       
                                   
                                       
                                   
                                       
                                       
                                       

                                   
                                       
                                   
                                       
                                  
                                   
                                   
                                       

                                   
                                   
                                   </div>
                                   
                                    

                                   
                                    
                                   
                                    
                                    
                                    

                                   
                                    
                                  
                                   
                                    

                                   
                                   <div style="float: right; width: 370px; height: 315px;">
                                       
                                  
                                       
                                  
                                       
                                   
                                       
                                   
                                  
                                   
                                    <asp:TextBox ID="MyFil_name" runat="server" BackColor="#FFFFCC" 
                                                       CssClass="textbox" Height="22px" ReadOnly="True" Width="150px" 
                                           Visible="False"></asp:TextBox>
                                                 

                                                         
                                                 
                                       

                                                        
                                                 

                                                         <asp:Image ID="ImgEmp" runat="server" Height="96%" Width="100%" 
                                                             BorderStyle="Solid" ImageUrl="~/Emp_Photo/No_Image.jpg" 
                                           BorderColor="Silver" BorderWidth="1px" />
                                              
                                   
                                       
                                              
                                       
                                   
                                       
                                  
                                              
                                   
                                   </div>
                                   
                                    

                                   
                                    
                                   
                                    
                                    
                                    

                                   
                                    
                                  
                                   
                                    

                                   
                                   </td>
                                

                                
                                
                                

                           
                                

                            </tr>
                            

                            
                            
                            

                       
                            

                        </table>
                        
                        
                        
                        
                    
                        
                    </ContentTemplate>

                    
                </asp:TabPanel>
                <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="Identification Data">
                    <ContentTemplate>
                         
                         <div style="float: left; width: 420px">
                                   
                                   
                                       

                                   
                                   
                                      
                                   
                                   
                                       

                                   
                                   
                                       
   
                                   
                                   
                                       

                                   
                                   
                                      
                                   
                                   
                                       

                                   
                                   
                                       <table style="width: 100%">
                                           
       
                                           <tr>
                                               
           
                                               <td style="text-align: right; width: 100px">
                                                   
               
                                                   E mail</td>
                                               
           
                                               <td>
                                                   
           
                                               </td>
                                               
           
                                               <td>
                                                   
               
                                                  <asp:TextBox ID="Email" runat="server" CssClass="textbox" 
                                                       Width="200px"></asp:TextBox>
                                                   
               
                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                       ControlToValidate="Email" Display="Dynamic" ErrorMessage="Email" 
                                                       ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                                                   
               
                                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                                       ControlToValidate="Email" Display="Dynamic" ForeColor="#CC0000" 
                                                       ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Invalid E-mail</asp:RegularExpressionValidator>
                                                   
           
                                               </td>
                                               
       
                                           </tr>
                                           
       
                                           <tr>
                                               
           
                                               <td style="text-align: right; width: 100px">
                                                   
               
                                                   Department</td>
                                               
           
                                               <td>
                                                   
               
                                                    </td>
                                               
           
                                               <td>
                                                   
               
                                                   <asp:DropDownList ID="DepartmentId" runat="server" CssClass="textbox" 
                                                       Width="204px">
                                                       
               
                                                   </asp:DropDownList>
                                                   
               
                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                                                       ControlToValidate="DepartmentId" Display="Dynamic" ErrorMessage="Email" 
                                                       ForeColor="#CC0000" InitialValue="0">*</asp:RequiredFieldValidator>
                                                   
           
                                               </td>
                                               
       
                                           </tr>
                                           
       
                                           <tr>
                                               
           
                                               <td style="text-align: right; width: 100px">
                                                   
               
                                                   Company</td>
                                               
           
                                               <td>
                                                   
               
                                                    </td>
                                               
           
                                               <td>
                                                   
               
                                                   <asp:DropDownList ID="KafilId" runat="server" CssClass="textbox" 
                                                       Width="204px">
                                                       
               
                                                   </asp:DropDownList>
                                                   
               
                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                       ControlToValidate="KafilId" Display="Dynamic" ErrorMessage="Email" 
                                                       ForeColor="#CC0000" InitialValue="0">*</asp:RequiredFieldValidator>
                                                   
           
                                               </td>
                                               
       
                                           </tr>
                                           
       
                                           <tr>
                                               
           
                                               <td style="text-align: right; width: 100px">
                                                   
               
                                                   Visa Job</td>
                                               
           
                                               <td>
                                                   
               
                                                    </td>
                                               
           
                                               <td>
                                                   
               
                                                   <asp:DropDownList ID="VisaJobId" runat="server" CssClass="textbox" 
                                                       Width="204px">
                                                       
               
                                                   </asp:DropDownList>
                                                   
               
                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                                                       ControlToValidate="VisaJobId" Display="Dynamic" ErrorMessage="Email" 
                                                       ForeColor="#CC0000" InitialValue="0">*</asp:RequiredFieldValidator>
                                                   
           
                                               </td>
                                               
       
                                           </tr>
                                           
       
                                           <tr>
                                               
           
                                               <td style="text-align: right; width: 100px">
                                                   
               
                                                    Current Job</td>
                                               
           
                                               <td>
                                                   
               
                                                    </td>
                                               
           
                                               <td>
                                                   
               
                                                   <asp:DropDownList ID="JobId" runat="server" CssClass="textbox" 
                                                       Width="204px">
                                                       
               
                                                   </asp:DropDownList>
                                                   
               
                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                                                       ControlToValidate="JobId" Display="Dynamic" ErrorMessage="Email" 
                                                       ForeColor="#CC0000" InitialValue="0">*</asp:RequiredFieldValidator>
                                                   
           
                                               </td>
                                               
       
                                           </tr>
                                           
       
                                           <tr>
                                               
           
                                               <td style="text-align: right; width: 100px">
                                                   
               
                                                    Report to</td>
                                               
           
                                               <td>
                                                   
               
                                                    </td>
                                               
           
                                               <td>
                                                   
               
                                                    <asp:TextBox ID="Report_to" runat="server" CssClass="textbox" 
                                                        onkeypress="return isNumberKey(event)" Width="200px"></asp:TextBox>
                                                   
               
                                                    </td>
                                               
       
                                           </tr>
                                           
       
                                           <tr>
                                               <td style="text-align: right; width: 100px">
                                                   &nbsp;</td>
                                               <td>
                                                   &nbsp;</td>
                                               <td>
                                                   &nbsp;</td>
                                           </tr>
                                           
       
                                           <tr>
                                               
           
                                               <td style="text-align: right; width: 100px">
                                                   
               
                                                    Has Driving</td>
                                               
           
                                               <td>
                                                   
               
                                                    </td>
                                               
           
                                               <td>
                                                   
               
                                                    <asp:CheckBox ID="isdriving" runat="server" style="font-weight: 700" 
                                                        Text="Driving Licence" />
                                                   
               
                                                    </td>
                                               
       
                                           </tr>
                                           
       
                                           <tr>
                                               
           
                                               <td style="text-align: right; width: 100px">
                                                   
               
                                                   Hiring Date</td>
                                               
           
                                               <td>
                                                   
               
                                                    </td>
                                               
           
                                               <td>
                                                   
               
                                                   <asp:TextBox ID="HireDate" runat="server" CssClass="textbox" 
                                                       Width="200px"></asp:TextBox>
                                                   
               
                                                   <asp:CalendarExtender ID="HireDate_CalendarExtender" runat="server" Enabled="True" 
                                                       TargetControlID="HireDate">
                                                       
               
                                                   </asp:CalendarExtender>
                                                   
               
                                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                                       ControlToValidate="HireDate" Display="Dynamic" ErrorMessage="Email" 
                                                       ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                                                   
               
                                                   <asp:RangeValidator ID="RangeValidator2" runat="server" 
                                                       ControlToValidate="HireDate" ErrorMessage="Invalid Date" ForeColor="Red" 
                                                       MaximumValue="1/1/2050" MinimumValue="1/1/1940" Type="Date"></asp:RangeValidator>
                                                   
           
                                               </td>
                                               
       
                                           </tr>
                                           
       
                                           <tr>
                                               
           
                                               <td style="text-align: right; width: 100px">
                                                   
               
                                                   End Work Date</td>
                                               
           
                                               <td>
                                                   
               
                                                    </td>
                                               
           
                                               <td>
                                                   
               
                                                   <asp:TextBox ID="LeaveworkDate" runat="server" CssClass="textbox" 
                                                       Width="200px"></asp:TextBox>
                                                   
               
                                                   <asp:CalendarExtender ID="LeaveworkDate_CalendarExtender" runat="server" Enabled="True" 
                                                       TargetControlID="LeaveworkDate">
                                                       
               
                                                   </asp:CalendarExtender>
                                                   
               
                                                   <asp:RangeValidator ID="RangeValidator29" runat="server" 
                                                       ControlToValidate="LeaveworkDate" ErrorMessage="Invalid Date" ForeColor="Red" 
                                                       MaximumValue="1/1/2050" MinimumValue="1/1/1940" Type="Date"></asp:RangeValidator>
                                                   
           
                                               </td>
                                               
       
                                           </tr>
                                           
       
                                           <tr>
                                               
           
                                               <td style="text-align: right; width: 100px">
                                                   
               
                                                   Reasons</td>
                                               
           
                                               <td>
                                                   
               
                                                    </td>
                                               
           
                                               <td>
                                                   
               
                                                   <asp:TextBox ID="Reason_LeaveWork" runat="server" CssClass="textbox" 
                                                       Height="84px" MaxLength="200" TextMode="MultiLine" Width="281px"></asp:TextBox>
                                                   
           
                                               </td>
                                               
       
                                           </tr>
                                           
   
                                       </table>
                                   
                                   
                                       

                                   
                                   
                                      
                                   
                                   
                                       

                                   
                                   
                                       
                                   </div>
                         
                         <div style="float: right; width: 420px">
                                   
                                   
                                       

                                   
                                   
                                       
   
                                   
                                   
                                       

                                   
                                   
                                       <table class="style1" cellpadding="0" cellspacing="2">


                                           



                                           
       


                                           



                                           <tr>
                                               
           
                                               <td style="text-align: right; width: 118px; background-color: #EBEBEB;">
                                                   
               
                                                   Expire Date</td>
                                               
           
                                               <td style="width: 7px; text-align: right;">
                                                   
               
                                                    </td>
                                               
           
                                               <td>
                                                   
               
                                                   <asp:TextBox ID="DriveExpireDate" runat="server" CssClass="textbox" 
                                                       Width="200px"></asp:TextBox>
                                                   
               
                                                   <asp:CalendarExtender ID="DriveExpireDate_CalendarExtender" runat="server" 
                                                       Enabled="True" TargetControlID="DriveExpireDate">
                                                       
               
                                                   </asp:CalendarExtender>
                                                   
               
                                                   <asp:RangeValidator ID="RangeValidator7" runat="server" 
                                                       ControlToValidate="DriveExpireDate" ErrorMessage="Invalid Date" ForeColor="Red" 
                                                       MaximumValue="1/1/2050" MinimumValue="1/1/1940" Type="Date"></asp:RangeValidator>
                                                   
           
                                               </td>
                                               
       
                                           </tr>
                                           

                                           
       
                                           

                                           <tr>
                                               
           
                                               <td style="width: 118px; text-align: right; background-color: #D2D2D2;">
                                                   
               
                                                   Enter Number</td>
                                               
           
                                               <td style="width: 7px; text-align: right">
                                                   
               
                                                    </td>
                                               
           
                                               <td>
                                                   
               
                                                   <asp:TextBox ID="EnterNumber" runat="server" CssClass="textbox" 
                                                       onkeypress="return isNumberKey(event)" Width="200px"></asp:TextBox>
                                                   
           
                                               </td>
                                               
       
                                           </tr>
                                           
       
                            <tr>
                                
           
                                <td style="text-align: right; background-color: #D2D2D2; width: 118px;">
                                    
               
                                    Enter Date</td>
                                
           
                                <td style="text-align: right; width: 7px">
                                    
               
                                     </td>
                                
           
                                <td >
                                    
               
                                    <asp:TextBox ID="EnterDate" runat="server" 
                                         Width="200px" CssClass="textbox"></asp:TextBox>
                                    
               
                                    <asp:CalendarExtender ID="EnterDate_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="EnterDate">
                                        
               
                                    </asp:CalendarExtender>
                                    
               
                                    <asp:RangeValidator ID="RangeValidator21" runat="server" 
                                        ControlToValidate="EnterDate" ErrorMessage="Invalid Date" ForeColor="Red" 
                                        MaximumValue="1/1/2050" MinimumValue="1/1/1940" Type="Date"></asp:RangeValidator>
                                    
           
                                </td>
                                
       
                            </tr>
                                           
       
                            <tr>
                                
           
                                <td style="width: 118px; text-align: right; background-color: #D2D2D2;">
                                    
               
                                    Enter Place</td>
                                
           
                                <td style="width: 7px; text-align: right">
                                    
               
                                     </td>
                                
           
                                <td>
                                    
               
                                    <asp:TextBox ID="EnterPlace" runat="server" 
                                         Width="200px" CssClass="textbox"></asp:TextBox>
                                    
           
                                </td>
                                
       
                            </tr>
                                           
       
                            <tr>
                                
           
                                <td style="text-align: right; " colspan="3">
                                    
               
                                     </td>
                                
           
                            </tr>
                                           
       
                                           <tr>
                                               <td colspan="3" style="text-align: right; ">
                                                   &nbsp;</td>
                                           </tr>
                                           
       
                                           <tr>
                                               
           
                                               <td style="text-align: right; background-color: #EBEBEB; width: 118px;">
                                                   
               
                                                   Passport Id</td>
                                               
           
                                               <td style="text-align: right; width: 7px">
                                                   
               
                                                    </td>
                                               
           
                                               <td>
                                                   
               
                                                   <asp:TextBox ID="PassportId" runat="server" CssClass="textbox" 
                                                       Width="200px"></asp:TextBox>
                                                   
           
                                               </td>
                                               
       
                                           </tr>
                                           
       
                            <tr>
                                
           
                                <td style="width: 118px; text-align: right; background-color: #EBEBEB;">
                                    
               
                                    Passport Date</td>
                                
           
                                <td style="width: 7px; text-align: right">
                                    
               
                                     </td>
                                
           
                                <td style="margin-left: 80px">
                                    
               
                                    <asp:TextBox ID="PassportDate" runat="server" 
                                         Width="200px" CssClass="textbox"></asp:TextBox>
                                    
               
                                    <asp:CalendarExtender ID="PassportDate_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="PassportDate">
                                        
               
                                    </asp:CalendarExtender>
                                    
               
                                    <asp:RangeValidator ID="RangeValidator22" runat="server" 
                                        ControlToValidate="PassportDate" ErrorMessage="Invalid Date" ForeColor="Red" 
                                        MaximumValue="1/1/2050" MinimumValue="1/1/1940" Type="Date"></asp:RangeValidator>
                                    
           
                                </td>
                                
       
                            </tr>
                                           
       
                            <tr>
                                
           
                                <td style="width: 118px; text-align: right; background-color: #EBEBEB;">
                                    
               
                                    P Expire Date</td>
                                
           
                                <td style="width: 7px; text-align: right">
                                    
               
                                     </td>
                                
           
                                <td style="margin-left: 80px">
                                    
               
                                    <asp:TextBox ID="PassportExpireDate" runat="server" Width="200px" 
                                        CssClass="textbox" Font-Bold="False"></asp:TextBox>
                                    
               
                                    <asp:CalendarExtender ID="PassportExpireDate_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="PassportExpireDate">
                                        
               
                                    </asp:CalendarExtender>
                                    
               
                                    <asp:RangeValidator ID="RangeValidator23" runat="server" 
                                        ControlToValidate="PassportExpireDate" ErrorMessage="Invalid Date" 
                                        ForeColor="Red" MaximumValue="1/1/2050" MinimumValue="1/1/1940" Type="Date"></asp:RangeValidator>
                                    
           
                                </td>
                                
       
                            </tr>
                                           
       
                            <tr>
                                
           
                                <td style="text-align: right; width: 118px;">
                                    
               
                                     </td>
                                
           
                                <td style="text-align: right; width: 7px">
                                    
               
                                     </td>
                                
           
                                <td margin-left: 80px">
                                    
                 </td>
                                
       
                            </tr>
                                           
       
                                           <tr>
                                               <td style="text-align: right; width: 118px;">
                                                   &nbsp;</td>
                                               <td style="text-align: right; width: 7px">
                                                   &nbsp;</td>
                                               <td 80px"="" margin-left:="">
                                                   &nbsp;</td>
                                           </tr>
                                           
       
                                           <tr>
                                               
           
                                               <td style="text-align: right; background-color: #D2D2D2; width: 118px;">
                                                   
               
                                                   Id</td>
                                               
           
                                               <td style="text-align: right; width: 7px">
                                                   
               
                                                    </td>
                                               
           
                                               <td 80px"="" margin-left:="">
                                                   
               
                                                   <asp:TextBox ID="HawiaId" runat="server" CssClass="textbox" 
                                                       onkeypress="return isNumberKey(event)" Width="200px"></asp:TextBox>
                                                   
           
                                               </td>
                                               
       
                                           </tr>
                                           
       
                            <tr>
                                
           
                                <td style="width: 118px; text-align: right; background-color: #D2D2D2;">
                                    
               
                                    Expire Date(hij)</td>
                                
           
                                <td style="width: 7px; text-align: right">
                                    
               
                                     </td>
                                
           
                                <td style="margin-left: 80px">
                                    
               
                                    <asp:TextBox ID="HawiaExpiredatehijri" runat="server" AutoPostBack="True" 
                                        CssClass="textbox" Font-Bold="False" 
                                        ontextchanged="HawiaExpiredatehijri_TextChanged" Width="200px"></asp:TextBox>
                                    
               
                                </td>
                                
       
                            </tr>
                                           

                                           
       
                                           <tr>
                                               
           
                                               <td style="width: 118px; text-align: right; background-color: #D2D2D2;">
                                                   
                                                   Expire Date(Ger)</td>
                                               
           
                                               <td style="width: 7px; text-align: right">
                                                   
                 </td>
                                               
           
                                               <td style="margin-left: 80px">
                                                   
               
                                                   <asp:TextBox ID="HawiaExpiredate" runat="server" CssClass="textbox" 
                                                       Font-Bold="False" Width="200px" AutoPostBack="True" 
                                                       ontextchanged="HawiaExpiredate_TextChanged"></asp:TextBox>
                                                   
               
                                                   <asp:CalendarExtender ID="HawiaExpiredate_CalendarExtender" runat="server" 
                                                       Enabled="True" TargetControlID="HawiaExpiredate">
                                                       
               
                                                   </asp:CalendarExtender>
                                                   
               
                                                   <asp:RangeValidator ID="RangeValidator24" runat="server" 
                                                       ControlToValidate="HawiaExpiredate" ErrorMessage="Invalid Date" ForeColor="Red" 
                                                       MaximumValue="1/1/2050" MinimumValue="1/1/1940" Type="Date"></asp:RangeValidator>
                                                   
           
                                               </td>
                                               
       
                                           </tr>
                                           
   
                                           

                                       </table>
                                   
                                   
                                       

                                   
                                   
                                       
                                   </div>
                         
                    </ContentTemplate>
                    
                </asp:TabPanel>
               
                <asp:TabPanel ID="TabPanel4" runat="server" HeaderText="Salary">
                 <ContentTemplate>
                         
                        
                         <div style="float: left; width: 420px">
                         
                             
                         
                             
                            
                         
                             <table style="width: 100%">
                                 
                                
                                 <tr>
                                     
                                    
                                     <td style="height: 22px; text-align: right;">
                                         
                                    
                                     </td>
                                     
                                    
                                     <td style="height: 22px; width: 10px">
                                         
                                    
                                     </td>
                                     
                                    
                                     <td style="height: 22px">
                                         
                                    
                                     </td>
                                     
                                
                                 </tr>
                                 
                                
                                 <tr>
                                     
                                    
                                     <td style="text-align: right">
                                         
                                        
                                         Has Time</td>
                                     
                                    
                                     <td style="width: 10px">
                                         
                                        
                                          </td>
                                     
                                    
                                     <td>
                                         
                                        
                                         <asp:CheckBox ID="HasTime" runat="server" AutoPostBack="True" 
                                             oncheckedchanged="HasTime_CheckedChanged" Text="Has Specific Time" />
                                         
                                    
                                     </td>
                                     
                                
                                 </tr>
                                 
                                
                                 <tr>
                                     
                                    
                                     <td style="text-align: right">
                                         
                                        
                                         Shift</td>
                                     
                                    
                                     <td style="width: 10px">
                                         
                                        
                                          </td>
                                     
                                    
                                     <td>
                                         
                                        
                                         <asp:DropDownList ID="ShiftId" runat="server" CssClass="textbox" Height="28px" 
                                             Width="204px">
                                             
                                        
                                         </asp:DropDownList>
                                         
                                    
                                     </td>
                                     
                                
                                 </tr>
                                 
                                
                                 <tr>
                                     
                                    
                                     <td style="text-align: right">
                                         
                                        
                                         Basic Salary</td>
                                     
                                    
                                     <td style="width: 10px">
                                         
                                        
                                          </td>
                                     
                                    
                                     <td>
                                         
                                        
                                         <asp:TextBox ID="BSalary" runat="server" CssClass="textbox" Height="22px" 
                                             onkeypress="return isNumberKey(event)" Width="200px" ></asp:TextBox>
                                         
                                    
                                     </td>
                                     
                                
                                 </tr>
                                 
                                
                                 <tr>
                                     
                                    
                                     <td style="text-align: right">
                                         
                                        
                                         Transport</td>
                                     
                                    
                                     <td style="width: 10px">
                                         
                                        
                                          </td>
                                     
                                    
                                     <td>
                                         
                                        
                                         <asp:TextBox ID="TransSalary" runat="server" CssClass="textbox" Height="22px" 
                                             onkeypress="return isNumberKey(event)" Width="200px"></asp:TextBox>
                                         
                                    
                                     </td>
                                     
                                
                                 </tr>
                                 
                                
                                 <tr>
                                     
                                    
                                     <td style="text-align: right">
                                         
                                        
                                          Calls  </td>
                                     
                                    
                                     <td style="width: 10px">
                                         
                                        
                                          </td>
                                     
                                    
                                     <td>
                                         
                                        
                                         <asp:TextBox ID="CommunSalary" runat="server" CssClass="textbox" Height="22px" 
                                             onkeypress="return isNumberKey(event)" Width="200px"></asp:TextBox>
                                         
                                    
                                     </td>
                                     
                                
                                 </tr>
                                 
                                
                                 <tr>
                                     
                                    
                                     <td style="text-align: right">
                                         
                                        
                                         Accommodation </td>
                                     
                                    
                                     <td style="width: 10px">
                                         
                                        
                                          </td>
                                     
                                    
                                     <td>
                                         
                                        
                                         <asp:TextBox ID="HouseSalary" runat="server" CssClass="textbox" Height="22px" 
                                             onkeypress="return isNumberKey(event)" Width="200px"></asp:TextBox>
                                         
                                    
                                     </td>
                                     
                                
                                 </tr>
                                 
                                
                                 <tr>
                                     
                                    
                                     <td style="text-align: right">
                                         
                                        
                                         Comm</td>
                                     
                                    
                                     <td style="width: 10px">
                                         
                                        
                                          </td>
                                     
                                    
                                     <td>
                                         
                                        
                                         <asp:TextBox ID="CommSalary" runat="server" CssClass="textbox" Height="22px" 
                                             onkeypress="return isNumberKey(event)" Width="200px"></asp:TextBox>
                                         
                                    
                                     </td>
                                     
                                
                                 </tr>
                                 
                            
                                 <tr>
                                     <td style="text-align: right">
                                         Other</td>
                                     <td style="width: 10px">
                                         &nbsp;</td>
                                     <td>
                                         <asp:TextBox ID="OtherSalary" runat="server" CssClass="textbox" Height="22px" 
                                             onkeypress="return isNumberKey(event)" Width="200px"></asp:TextBox>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td style="text-align: right">
                                         &nbsp;</td>
                                     <td style="width: 10px">
                                         &nbsp;</td>
                                     <td>
                                       
                                     </td>
                                 </tr>
                                 
                            
                                 <tr>
                                     <td style="text-align: right">
                                         Total :</td>
                                     <td style="width: 10px">
                                         &nbsp;</td>
                                     <td>
                                         <asp:TextBox ID="TotSal" runat="server" CssClass="textbox" Height="22px" 
                                             onkeypress="return isNumberKey(event)" Width="200px"></asp:TextBox>
                                     </td>
                                 </tr>
                                 
                            
                             </table>
                         
                             
                         
                             
                        
                         
                         </div>
                         
                
                </ContentTemplate>
                    
                </asp:TabPanel>

                
            </asp:TabContainer>
        </td>
        <td style="width: 1%">
             </td>
    </tr>
</table>
</div>
  
 
  
</asp:Content>

