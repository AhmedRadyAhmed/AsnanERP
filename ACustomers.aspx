<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ACustomers.aspx.cs" Inherits="ACustomers" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


   


    <div style="border: 1px solid #FFFFFF; height: 490px; background-color: #F2F9FF;">

      
       
    
                    <div style="height: 26px; background-color: #E1E1E1;">
                         <asp:Button ID="BtnFirst" runat="server" BackColor="#C8E0F2" 
                            CausesValidation="False" CssClass="Mybutton" Font-Bold="True" Height="25px" 
                            onclick="BtnFirst_Click" TabIndex="21" Text="&lt;&lt;" Width="37px" />
                        <asp:Button ID="BtnPrev" runat="server" BackColor="#C8E0F2" 
                            CausesValidation="False" CssClass="Mybutton" Font-Bold="True" Height="25px" 
                            onclick="BtnPrev_Click" TabIndex="22" Text="&lt;" Width="37px" />
                        <asp:Button ID="BtnNext" runat="server" BackColor="#C8E0F2" 
                            CausesValidation="False" CssClass="Mybutton" Font-Bold="True" Height="25px" 
                            onclick="BtnNext_Click" TabIndex="23" Text="&gt;" Width="37px" />
                        <asp:Button ID="Btnlast" runat="server" BackColor="#C8E0F2" 
                            CausesValidation="False" CssClass="Mybutton" Font-Bold="True" Height="25px" 
                            onclick="Btnlast_Click" TabIndex="24" Text="&gt;&gt;" Width="37px" />
                        <asp:Button ID="BtnNew" runat="server" BackColor="#C8E0F2" 
                            CausesValidation="False" CssClass="Mybutton" Height="25px" 
                            onclick="BtnNew_Click" TabIndex="16" Text="New" Width="70px" />
                        <asp:Button ID="BtnSave" runat="server" BackColor="#C8E0F2" CssClass="Mybutton" 
                            Height="25px" onclick="BtnSave_Click" 
                            onclientclick="Page_ClientValidate();Loading(true);" TabIndex="17" Text="Save" 
                            Width="70px" Visible="False" />
                        <asp:Button ID="BtnShowReport" runat="server" BackColor="#C8E0F2" 
                            CssClass="Mybutton" Height="25px" onclick="BtnShowReport_Click" TabIndex="17" 
                            Text="Report" Width="70px" />
                        <asp:Button ID="BtnSearchEmp" runat="server" BackColor="#C8E0F2" 
                            CausesValidation="False" CssClass="Mybutton" Height="25px" 
                            onclick="BtnSearchEmp_Click" TabIndex="19" Text="Search" Width="70px" />
                                <asp:Button ID="BtnUpdate" runat="server" Height="26px" 
                onclick="BtnUpdate_Click" TabIndex="20" Text="Update" Width="70px" 
                CssClass="Mybutton" onclientclick="Page_ClientValidate();Loading(true);" 
                BackColor="#C8E0F2" Visible="False" />
                         </div>
                
   
      <asp:Panel ID="Panel1" runat="server">
    <div style="border: 1px solid #CFDBE6; height: 79px; background-repeat: no-repeat; background-color: #F2F9FF; color: #808080; font-size: small; font-weight: 400; font-family: sans-serif;">
        <table cellpadding="0" cellspacing="0" class="style10" dir="ltr" 
            style="background-image: url('images/bgContent.gif'); background-repeat: repeat-x;" width="100%" 
            >
            <tr>
                <td>
                     </td>
                <td>
                     &nbsp;</td>
                <td>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                     </td>
                <td>
                     &nbsp;</td>
                <td>
                </td>
                <td>
                    &nbsp;</td>
                <td style="width: 12px">
                    &nbsp;</td>
                <td colspan="2" style="width: 12px">
                </td>
                <td style="width: 12px">
                    &nbsp;</td>
                <td>
                     </td>
            </tr>
            <tr>
                <td>
                     </td>
                <td>
                    &nbsp;</td>
                <td>
                    Customer Id :</td>
                <td>
                    &nbsp;</td>
                <td>
                    Name :</td>
                <td>
                     &nbsp;</td>
                <td>
                    Limit</td>
                <td>
                    &nbsp;</td>
                <td>
                    Sales Man</td>
                <td>
                    &nbsp;</td>
                <td colspan="2">
                    &nbsp;</td>
                <td>
                     &nbsp;</td>
            </tr>
            <tr>
                <td>
                     </td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:TextBox ID="CustomerId" runat="server" AutoPostBack="True" 
                        CssClass="textbox" Height="22px" ontextchanged="CustomerId_TextChanged" 
                        Width="100px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                                    <asp:TextBox runat="server" Height="22px" Width="325px" 
                        ID="CustomerNameEn" CssClass="textbox" ReadOnly="True" BackColor="#FFFFCC"></asp:TextBox>


                </td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:TextBox ID="Crdtlmtt" runat="server" 
                        CssClass="textbox" Height="22px" ReadOnly="True" Width="100px" 
                        BackColor="#FFFFCC"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:TextBox ID="Smaniddd" runat="server" BackColor="#FFFFCC" 
                        CssClass="textbox" Height="22px" ReadOnly="True" Width="100px"></asp:TextBox>
                </td>
                <td colspan="3">
                    <asp:TextBox ID="SmanName" runat="server" BackColor="#FFFFCC" 
                        CssClass="textbox" Height="22px" ReadOnly="True" Width="220px"></asp:TextBox>
                </td>
                <td>
                     &nbsp;</td>
            </tr>
            <tr>
                <td>
                      </td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="CustomerId" Display="Dynamic" ErrorMessage="Employee Code" 
                        ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                     &nbsp;</td>
                <td>
                     &nbsp;</td>
                <td>
                </td>
                <td>
                    &nbsp;</td>
                <td style="width: 12px">
                    &nbsp;</td>
                <td colspan="2" style="width: 12px">
                </td>
                <td style="width: 12px">
                    &nbsp;</td>
                <td>
                     </td>
            </tr>
            </table>
        </div>
   
    </asp:Panel>

<table cellpadding="0" cellspacing="0" dir="ltr" 
            style="width: 100%; background-color: #F2F9FF; height: 401px;">
    <tr>
        <td width="1%">
             </td>
        <td width="98%">
            <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                Height="342px" Width="100%" CssClass="fancy fancy-green" 
                style="background-color: #F2F9FF" BackColor="#F2F9FF">
                <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="Main Data"><ContentTemplate><div style="height: 9px"></div>
                <div style="float: left; width: 440px">
                <table width="100%" style="background-color: #F2F9FF" cellpadding="1" cellspacing="1">

                    <tr>
                        <td style="width: 142px; text-align: right">
                            PO No</td>
                        <td style="width: 8px">
                             &nbsp;</td>
                        <td>
                            <asp:TextBox ID="PONo" runat="server" CssClass="textbox" Height="22px" 
                                Width="220px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 142px; text-align: right">
                            Branch</td>
                        <td style="width: 8px">
                        </td>
                        <td>
                            <asp:DropDownList ID="BranchId" runat="server" CssClass="textbox" Height="28px" 
                                Width="204px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="BranchId" Display="Dynamic" ErrorMessage="Employee Code" 
                                ForeColor="#CC0000" InitialValue="0">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 142px; text-align: right">
                            Group
                        </td>
                        <td style="width: 8px">
                             </td>
                        <td>
                            <asp:DropDownList ID="CustomerGroupId" runat="server" CssClass="textbox" 
                                Height="28px" style="margin-top: 0px" Width="204px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="CustomerGroupId" Display="Dynamic" 
                                ErrorMessage="Employee Code" ForeColor="#CC0000" InitialValue="0">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 142px; text-align: right">
                            Bussiness
                        </td>
                        <td style="width: 8px">
                             </td>
                        <td>
                            <asp:DropDownList ID="BussTypeId" runat="server" CssClass="textbox" 
                                Height="28px" Width="204px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="BussTypeId" Display="Dynamic" ErrorMessage="Employee Code" 
                                ForeColor="#CC0000" InitialValue="0">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 80px; text-align: right">
                            Date
                            </td>
                        <td style="width: 8px">
                             </td>
                        <td>
                            <asp:TextBox ID="Cust_date" runat="server" CssClass="textbox" Height="22px" 
                                Width="185px"></asp:TextBox>
                            <asp:CalendarExtender ID="Cust_date_CalendarExtender" runat="server" 
                                Enabled="True" TargetControlID="Cust_date">
                            </asp:CalendarExtender>
                            <asp:RangeValidator ID="RangeValidator7" runat="server" 
                                ControlToValidate="Cust_date" ErrorMessage="Invalid Date" ForeColor="Red" 
                                MaximumValue="1/1/2050" MinimumValue="1/1/1940" Type="Date"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr><td style="text-align: right" >Comm Register Id</td><td ></td><td >
                    <asp:TextBox ID="Comm_RegisterId" runat="server" Height="22px" Width="185px" 
                                        CssClass="textbox"></asp:TextBox></td></tr>
                                        <tr><td style="text-align: right" >Comm Register date</td><td >
                                        </td><td>
                                                <asp:TextBox ID="Comm_RegisterDate" runat="server" Height="22px" Width="185px" 
                                        CssClass="textbox"></asp:TextBox><asp:CalendarExtender ID="Comm_RegisterDate_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="Comm_RegisterDate"></asp:CalendarExtender> <asp:RangeValidator ID="RangeValidator1" runat="server" 
                                        ControlToValidate="Comm_RegisterDate" ErrorMessage="Invalid Date" 
                                        ForeColor="Red" MaximumValue="1/1/2050" MinimumValue="1/1/1940" Type="Date"></asp:RangeValidator></td></tr><tr><td class="style7" style="width: 142px; text-align: right">Comm Register Source</td><td class="style29" style="width: 8px"> </td><td class="style39">
                        <asp:TextBox ID="Comm_RegisterSource" runat="server" Height="22px" 
                                        Width="185px" CssClass="textbox"></asp:TextBox> </td></tr><tr><td class="style7" style="width: 142px; text-align: right">MOH Licence Date</td><td class="style29" style="width: 8px"> </td><td class="style17">
                        <asp:TextBox ID="Moh_LicenceDate" runat="server" Height="22px" Width="185px" 
                                        CssClass="textbox"></asp:TextBox><asp:CalendarExtender ID="Moh_LicenceDate_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="Moh_LicenceDate"></asp:CalendarExtender><asp:RangeValidator ID="RangeValidator6" runat="server" 
                                        ControlToValidate="Moh_LicenceDate" ErrorMessage="Invalid Date" ForeColor="Red" 
                                        MaximumValue="1/1/2050" MinimumValue="1/1/1940" Type="Date"></asp:RangeValidator></td></tr><tr><td class="style7" style="width: 142px; text-align: right">MOH Licence Id</td><td class="style29" style="width: 8px"> </td><td class="style17">
                        <asp:TextBox ID="Moh_LicenceId" runat="server" Height="22px" Width="185px" 
                                        CssClass="textbox"></asp:TextBox><asp:CalendarExtender ID="Moh_LicenceId_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="Moh_LicenceId"></asp:CalendarExtender></td></tr><tr><td class="style7" style="width: 142px; text-align: right">MOH Licence  Source</td><td class="style29" style="width: 8px"> </td><td class="style17">
                        <asp:TextBox ID="Moh_LicenceSource" runat="server" Height="22px" Width="185px" 
                                        CssClass="textbox"></asp:TextBox></td></tr><tr><td class="style7" style="width: 142px; text-align: right">
                         </td><td class="style29" style="width: 8px"> </td><td class="style39"> </td></tr></table></div><div style="float: right; width: 410px">
                        
                        <table width="100%" style="background-color: #F2F9FF" cellpadding="1" cellspacing="1">
                    <tr>
                        <td style="width: 80px; text-align: right">
                            &nbsp;</td>
                        <td style="width: 8px">
                             &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                            <tr>
                                <td style="width: 80px; text-align: right">
                                    City</td>
                                <td style="width: 8px">
                                </td>
                                <td>
                                    <asp:DropDownList ID="CityId" runat="server" CssClass="textbox" Height="28px" 
                                        Width="204px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                    <tr>
                        <td style="width: 80px; text-align: right">
                            Al hay</td>
                        <td style="width: 8px">
                             </td>
                        <td>
                            <asp:DropDownList ID="HyId" runat="server" CssClass="textbox" Height="28px" 
                                Width="204px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 80px; text-align: right">
                            Street</td>
                        <td style="width: 8px">
                             </td>
                        <td>
                            <asp:TextBox ID="Street" runat="server" CssClass="textbox" Height="22px" 
                                Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr><td style="width: 80px; text-align: right">Zip Code</td><td style="width: 8px"> </td><td><asp:TextBox ID="ZipCode" runat="server" Height="22px" Width="200px" 
                                        CssClass="textbox"></asp:TextBox></td></tr><tr><td class="style7" style="width: 80px; text-align: right">Fax</td><td class="style29" style="width: 8px"> </td><td class="style17"><asp:TextBox ID="Fax" runat="server" Height="22px" Width="200px" onkeypress="return isNumberKey(event)" 
                                        CssClass="textbox"></asp:TextBox><asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                                        Enabled="True" TargetControlID="Moh_LicenceId"></asp:CalendarExtender></td></tr><tr><td style="width: 80px; text-align: right">Tel1</td><td style="width: 8px"> </td><td><asp:TextBox ID="Tel1" runat="server" onkeypress="return isNumberKey(event)" Height="22px" Width="200px" 
                                        CssClass="textbox"></asp:TextBox></td></tr><tr><td style="width: 80px; text-align: right">Tel2</td><td style="width: 8px"> </td><td><asp:TextBox ID="Tel2" runat="server"  onkeypress="return isNumberKey(event)" Height="22px" Width="200px" 
                                        CssClass="textbox"></asp:TextBox> </td></tr><tr><td class="style7" style="width: 80px; text-align: right">Tel3</td><td class="style29" style="width: 8px"> </td><td class="style39"><asp:TextBox ID="Tel3" runat="server" Height="22px" 
                                        Width="200px" onkeypress="return isNumberKey(event)" CssClass="textbox"></asp:TextBox> </td></tr><tr><td style="width: 80px; text-align: right">Email1 </td><td style="width: 8px"> </td><td><asp:TextBox ID="Email1" runat="server" Height="22px" Width="200px" 
                                        CssClass="textbox"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                        ControlToValidate="Email1" Display="Dynamic" 
                                        ErrorMessage="RegularExpressionValidator" ForeColor="#CC0000" 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Invalid E-mail</asp:RegularExpressionValidator></td></tr><tr><td class="style7" style="width: 80px; text-align: right">Email 2</td><td class="style29" style="width: 8px"> </td><td class="style39"><asp:TextBox ID="Email2" runat="server" Height="22px" Width="200px" 
                                        CssClass="textbox"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                        ControlToValidate="Email2" Display="Dynamic" 
                                        ErrorMessage="RegularExpressionValidator" ForeColor="#CC0000" 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Invalid E-mail</asp:RegularExpressionValidator></td></tr><tr><td class="style7" style="width: 80px; text-align: right"> </td><td class="style29" style="width: 8px"> </td><td class="style39"> </td></tr></table></div><div></div></ContentTemplate></asp:TabPanel>
                <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="Owner & Signatures"><ContentTemplate><div></div><div style="height: 84px ; border: 1px solid #EAE8E3"><table cellpadding="1" cellspacing="1" class="style10" dir="ltr"><tr><td style="width: 18px"> </td><td>Owner Name :</td><td>Id:</td><td>Tel:</td><td> </td></tr><tr><td style="width: 18px"> </td><td><asp:TextBox ID="OwnerName" runat="server" Height="22px" Width="225px" 
                                            CssClass="textbox"></asp:TextBox></td><td><asp:TextBox ID="QwnerId" runat="server" Height="22px" Width="225px" 
                                            CssClass="textbox"></asp:TextBox></td><td><asp:TextBox ID="QwnerTel" runat="server" Height="22px" Width="225px" 
                                            CssClass="textbox"></asp:TextBox></td><td> </td></tr><tr><td style="width: 18px"> </td><td>
                     </td><td> </td><td> </td><td> </td></tr></table></div><div style="height: 6px"></div><div style=" width: 200px ;border: 1px solid #D4D0C8; height: 29px; text-align: center; font-weight: 700; font-family: Tahoma; background-color: #EAF5FF;">Representitives</div><div style="height: 113px ; border: 1px solid #EAE8E3"><table cellpadding="1" cellspacing="1" class="style10" dir="ltr"><tr><td style="width: 18px"> </td><td>Name :</td><td>Position :</td><td>Tel:</td><td> </td></tr><tr><td style="width: 18px">1</td><td><asp:TextBox ID="Delegate1name" runat="server" Height="22px" Width="225px" 
                                            CssClass="textbox"></asp:TextBox></td><td><asp:TextBox ID="Delegate1Position" runat="server" Height="22px" Width="225px" 
                                            CssClass="textbox"></asp:TextBox></td><td><asp:TextBox ID="Delegate1Tel" runat="server" Height="22px" Width="225px" 
                                            CssClass="textbox"></asp:TextBox></td><td> </td></tr><tr><td style="width: 18px">2</td><td><asp:TextBox ID="Delegate2name" runat="server" Height="22px" Width="225px" 
                                            CssClass="textbox"></asp:TextBox></td><td><asp:TextBox ID="Delegate2Position" runat="server" Height="22px" Width="225px" 
                                            CssClass="textbox"></asp:TextBox></td><td><asp:TextBox ID="Delegate2Tel" runat="server" Height="22px" Width="225px" 
                                            CssClass="textbox"></asp:TextBox></td><td> </td></tr><tr><td style="width: 18px"> </td><td> </td><td> </td><td> </td><td> </td></tr></table></div></ContentTemplate></asp:TabPanel>
                <asp:TabPanel ID="TabPanel3" runat="server" HeaderText="Financial"><ContentTemplate><div></div><table cellpadding="1" cellspacing="1" class="style10" dir="ltr"><tr><td style="width: 115px; text-align: right;"> </td><td style="width: 18px"> </td><td> </td></tr><tr><td style="width: 115px; text-align: right;">Sales man</td><td style="width: 18px"> </td><td><asp:TextBox ID="Smanid" runat="server" Height="22px" Width="225px" 
                                                 CssClass="textbox" AutoPostBack="True" ></asp:TextBox></td></tr><tr><td style="width: 115px; text-align: right;">Facilities Amount</td><td style="width: 18px"> </td><td><asp:TextBox ID="TshilatAmount" runat="server" CssClass="textbox" Height="22px" 
                                                 Width="225px"></asp:TextBox></td></tr><tr><td style="width: 115px; text-align: right;">Facilities  Days</td><td style="width: 18px"> </td><td><asp:TextBox ID="TshilatDays" runat="server" Height="22px" Width="225px" 
                                            CssClass="textbox"></asp:TextBox></td></tr><tr><td style="width: 115px; text-align: right;">Credit Days</td><td style="width: 18px"> </td><td><asp:TextBox ID="CrdtDays" runat="server" Height="22px" Width="225px" 
                                            CssClass="textbox"></asp:TextBox></td></tr><tr><td style="width: 115px; text-align: right;">Notes</td><td style="width: 18px"> </td><td><asp:TextBox ID="Notes" runat="server" Height="22px" Width="400px" 
                                                 CssClass="textbox"></asp:TextBox></td></tr></table></ContentTemplate></asp:TabPanel>
                 <asp:TabPanel ID="TabPanel5" runat="server" HeaderText="Contacts"><ContentTemplate><div></div><div><asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Myconnection %>" 
            
            
                                 SelectCommand="SELECT [Serial], [Cust_Empname], [Cust_EmpPosition], [Cust_EmpEmail], [Cust_EmpTel], [Cust_EmpNote], [CustomerId] FROM [Customer_contacts] WHERE ([CustomerId] = @CustomerId)" 
                                 ProviderName="System.Data.SqlClient"><SelectParameters><asp:ControlParameter ControlID="CustomerId" Name="CustomerId" 
                                         PropertyName="Text" Type="String" /></SelectParameters></asp:SqlDataSource></div><div style="height: 192px ; "><asp:GridView ID="Grid" runat="server" Width="100%" AllowPaging="True" 
                                AllowSorting="True" AutoGenerateColumns="False" 
                                DataKeyNames="Serial" DataSourceID="SqlDataSource1" PageSize="6" 
                                CssClass="bordered"><Columns><asp:BoundField DataField="Serial" HeaderText="Serial" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="Serial" /><asp:BoundField DataField="Cust_Empname" HeaderText="Name" 
                                        SortExpression="Cust_Empname" /><asp:BoundField DataField="Cust_EmpPosition" HeaderText="Position" 
                                        SortExpression="Cust_EmpPosition" /><asp:BoundField DataField="Cust_EmpEmail" HeaderText="E-mail" 
                                        SortExpression="Cust_EmpEmail" /><asp:BoundField DataField="Cust_EmpTel" HeaderText="Tel" 
                                        SortExpression="Cust_EmpTel" /><asp:BoundField DataField="Cust_EmpNote" HeaderText="Note" 
                                        SortExpression="Cust_EmpNote" /></Columns></asp:GridView></div></ContentTemplate></asp:TabPanel>

                                         <asp:TabPanel ID="TabPanel4" runat="server" HeaderText="Old Horizon Data">
                                         <ContentTemplate>
                                             <table style="width: 100%; ">
                                                 <tr>
                                                     <td style="width: 3px">
                                                     </td>
                                                     <td style="width: 104px; text-align: right">
                                                     </td>
                                                     <td style="text-align: right; width: 5px">
                                                     </td>
                                                     <td>
                                                          </td>
                                                 </tr>
                                                 <tr>
                                                     <td style="width: 3px">
                                                     </td>
                                                     <td style="width: 104px; text-align: right">
                                                         info1</td>
                                                     <td style="text-align: right; width: 5px">
                                                     </td>
                                                     <td>
                                                         <asp:TextBox ID="info1" runat="server" CssClass="textbox" Height="22px" 
                                                             Width="300px"></asp:TextBox>
                                                     </td>
                                                 </tr>
                                                 <tr>
                                                     <td style="width: 3px">
                                                     </td>
                                                     <td style="width: 104px; text-align: right">
                                                         info2</td>
                                                     <td style="text-align: right; width: 5px">
                                                     </td>
                                                     <td>
                                                         <asp:TextBox ID="info2" runat="server" CssClass="textbox" Height="22px" 
                                                             Width="300px"></asp:TextBox>
                                                     </td>
                                                 </tr>
                                                 <tr>
                                                     <td style="width: 3px">
                                                     </td>
                                                     <td style="width: 104px; text-align: right">
                                                         info 3</td>
                                                     <td style="text-align: right; width: 5px">
                                                     </td>
                                                     <td>
                                                         <asp:TextBox ID="info3" runat="server" CssClass="textbox" Height="22px" 
                                                             Width="300px"></asp:TextBox>
                                                     </td>
                                                 </tr>
                                                 <tr>
                                                     <td style="width: 3px">
                                                     </td>
                                                     <td style="width: 104px; text-align: right">
                                                         info 4</td>
                                                     <td style="text-align: right; width: 5px">
                                                     </td>
                                                     <td>
                                                         <asp:TextBox ID="info4" runat="server" CssClass="textbox" Height="22px" 
                                                             Width="300px"></asp:TextBox>
                                                     </td>
                                                 </tr>
                                                 <tr>
                                                     <td style="width: 3px">
                                                     </td>
                                                     <td style="width: 104px; text-align: right">
                                                         info 5</td>
                                                     <td style="text-align: right; width: 5px">
                                                     </td>
                                                     <td>
                                                         <asp:TextBox ID="info5" runat="server" CssClass="textbox" Height="22px" 
                                                             Width="300px"></asp:TextBox>
                                                     </td>
                                                 </tr>
                                                 <tr>
                                                     <td style="width: 3px">
                                                     </td>
                                                     <td style="width: 104px; text-align: right">
                                                         info 6</td>
                                                     <td style="text-align: right; width: 5px">
                                                     </td>
                                                     <td>
                                                         <asp:TextBox ID="info6" runat="server" CssClass="textbox" Height="22px" 
                                                             Width="300px"></asp:TextBox>
                                                     </td>
                                                 </tr>
                                                 <tr>
                                                     <td style="width: 3px">
                                                     </td>
                                                     <td style="width: 104px; text-align: right">
                                                         info 7</td>
                                                     <td style="text-align: right; width: 5px">
                                                     </td>
                                                     <td>
                                                         <asp:TextBox ID="info7" runat="server" CssClass="textbox" Height="22px" 
                                                             Width="300px"></asp:TextBox>
                                                     </td>
                                                 </tr>
                                                 <tr>
                                                     <td style="width: 3px">
                                                     </td>
                                                     <td style="width: 104px; text-align: right">
                                                         info 8</td>
                                                     <td style="text-align: right; width: 5px">
                                                     </td>
                                                     <td>
                                                         <asp:TextBox ID="info8" runat="server" CssClass="textbox" Height="22px" 
                                                             Width="300px"></asp:TextBox>
                                                     </td>
                                                 </tr>
                                                 <tr>
                                                     <td style="width: 3px">
                                                     </td>
                                                     <td style="width: 104px; text-align: right">
                                                          </td>
                                                     <td style="text-align: right; width: 5px">
                                                     </td>
                                                     <td>
                                                          </td>
                                                 </tr>
                                                 <tr>
                                                     <td style="width: 3px">
                                                     </td>
                                                     <td style="width: 104px; text-align: right">
                                                          </td>
                                                     <td style="text-align: right; width: 5px">
                                                     </td>
                                                     <td>
                                                          </td>
                                                 </tr>
                                                 <tr>
                                                     <td style="width: 3px">
                                                     </td>
                                                     <td style="width: 104px; text-align: right">
                                                     </td>
                                                     <td style="text-align: right; width: 5px">
                                                     </td>
                                                     <td>
                                                          </td>
                                                 </tr>
                                                 <tr>
                                                     <td style="width: 3px">
                                                     </td>
                                                     <td style="width: 104px; text-align: right">
                                                     </td>
                                                     <td style="text-align: right; width: 5px">
                                                     </td>
                                                     <td>
                                                     </td>
                                                 </tr>
                                             </table>
                                             </ContentTemplate>
                                         </asp:TabPanel>
               
            </asp:TabContainer>
        </td>
        <td width="1%">
             </td>
    </tr>
</table>

 
</div>
<div>
  </div>
</asp:Content>


