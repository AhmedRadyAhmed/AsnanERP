<%@ Page Title ="Asnan System" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Asnan Login</title>
   
     <link id="Link1" runat="server" rel="shortcut icon" href="~/images/Logo.jpg" type="image/x-icon"/>
<link id="Link2" runat="server" rel="icon" href="~/images/Logo.jpg" type="image/ico" /> 
    <style type="text/css">
           
.art-main
{
   background: #298DC7 url('images/page.png') bottom left repeat-x fixed;
   background: url('images/pageglare.png') no-repeat, url('images/page.png') bottom left repeat-x, #298DC7;
   background-attachment: fixed;
   margin:0 auto;
   font-size: 13px;
   font-family: 'Droid Sans', Arial, 'Arial Unicode MS', Helvetica, Sans-Serif;
   font-weight: normal;
   font-style: normal;
   position: fixed;
   width: 100%;
   min-height: 100%;
   left: 0;
   top: 0;
   cursor:default;
   overflow:hidden;
}
body {
	  background-color: #1A668E;
	font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
	font-weight:400;
	text-align: left;
	text-decoration: none;
	height: 500px;
}

#wrapper {
	/* Center wrapper perfectly */
	width: 461px;
	height: 294px;
	margin: 70px auto;
}

.gradient {
	/* Center Positioning */
	width: 630px;
	height: 596px;
	position: fixed;
	left: 48%;
	top: 50%;
	margin-left: -400px;
	margin-top: -400px;
	z-index: -2;
	
	/* Fallback */ 
	
	background-repeat: no-repeat; 
	
	/* CSS3 Gradient */
	
}

/*******************
LOGIN FORM
*******************/

.login-form {
	width: 459px;
	margin: 0 auto;
	position: relative;
	
	background: #f3f3f3;
	border: 1px solid #fff;
	border-radius: 5px;
	
	box-shadow: 0 1px 3px rgba(0,0,0,0.5);
	-moz-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
	-webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
            top: 0px;
            left: 0px;
            height: 282px;
        }

.textbox {
    border: 1px solid #c4c4c4;
  
    padding: 3px 3px 3px 3px;
    padding 
    border-radius: 4px;
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
    box-shadow: 0px 0px 8px #d9d9d9;
    -moz-box-shadow: 0px 0px 8px #d9d9d9;
    -webkit-box-shadow: 0px 0px 8px #d9d9d9; height:21;
}

.textbox:focus
{
    outline: none;
    border: 1px solid #7bc1f7;
    box-shadow: 0px 0px 8px #7bc1f7;
    background: #FFFFCC;
    -moz-box-shadow: 0px 0px 8px #7bc1f7;
    -webkit-box-shadow: 0px 0px 8px #7bc1f7;
}
        
        .header
        {
            height: 49px;
            background-color: #D4DEDF;
        }
        .style2
        {
            height: 29px;
        }
        .style3
        {
            border-color: #C4C4C4;
            border-width: 1px;
            height: 24px;
        }
        .style4
        {
            height: 29px;
            text-align: center;
            color: #144563;
            font-size: large;
            font-weight: 700;
            font-family: Arial;
        }
        .style5
        {
            border-color: #C4C4C4;
            border-width: 1px;
            height: 24px;
            width: 98px;
            text-align: right;
        }
        .style6
        {
            border-color: #C4C4C4;
            border-width: 1px;
            width: 98px;
            text-align: right;
        }
        .style7
        {
            border-color: #C4C4C4;
            border-width: 1px;
        }
        .style8
        {
            height: 29px;
            width: 11px;
        }
        .style9
        {
            border-color: #C4C4C4;
            border-width: 1px;
            height: 24px;
            width: 11px;
        }
        .style10
        {
            border-color: #C4C4C4;
            border-width: 1px;
            width: 11px;
        }
    </style>
</head>
<body >
   
    <p>
        -+</p>
    <p style="direction: ltr">
        &nbsp;</p>
   
  <div class="art-main">
    
  
   
<div id="wrapper">

	<form id="Form1" name="login-form" class="login-form" runat="server">
	
          <div style="height: 275px; background-color: #FFFFFF">
        <table style="height: 151px; width: 100%; background-image: url('images/bgContent.gif'); background-color: #FFFFFF; background-repeat: repeat-x;" 
          cellpadding="0" cellspacing="0">
        
        <tr>
        <td class="style4" colspan="3">
               </td>
        </tr>


        <tr>
        <td class="style4" colspan="3">
              Login Form</td>
        </tr>


        <tr>
        <td class="style4">
               </td>
        <td class="style8">
               </td>
        <td class="style2">
              <asp:Label ID="LblLogin" runat="server" ForeColor="Red" 
                  style="font-weight: 700" Visible="False">Invalid Username or Password</asp:Label>
            </td>
        </tr>


        <tr>
        <td class="style5"> 
            Company</td> 
        <td class="style9"> 
             </td> 
        <td class="style3"> 
            <asp:DropDownList ID="DCompid" runat="server" Width="284px" CssClass="textbox" 
                AutoPostBack="True" onselectedindexchanged="DCompid_SelectedIndexChanged" 
                Height="25px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="DCompid" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000" InitialValue="0">*</asp:RequiredFieldValidator>
            </td> 
        </tr>


        <tr>
        <td class="style5"> 
            Branch</td> 
        <td class="style9"> 
             </td> 
        <td class="style3"> 
            <asp:DropDownList ID="DBranchid" runat="server" Width="284px" 
                CssClass="textbox" Height="25px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="DBranchid" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000" InitialValue="0">*</asp:RequiredFieldValidator>
            </td> 
        </tr>


        <tr>
        <td class="style5"> 
            user</td> 
        <td class="style9"> 
             </td> 
        <td class="style3"> 
            <asp:TextBox ID="EmpCode" runat="server" class="input username" 
                placeholder="Username" Width="275px" CssClass="textbox" Height="22px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="EmpCode" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000">*</asp:RequiredFieldValidator></td> 
        </tr>

         <tr>
        <td class="style6"> 
            Password</td>
        <td class="style10"> 
             </td>
        <td class="style7"> 
          <asp:TextBox ID="UPassword"  runat="server"  class="input username" 
                placeholder="Password" Width="275px" TextMode="Password" 
                CssClass="textbox" Height="22px"></asp:TextBox> 
                        
       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                  ControlToValidate="UPassword" ErrorMessage="RequiredFieldValidator" 
                  ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                        
       </td>
        </tr>

         <tr>
        <td class="style6"> 
             </td>
        <td class="style10"> 
             </td>
        <td class="style7"> 
             </td>
        </tr>

                

         <tr>
        <td class="style6"> 
             &nbsp;</td>
        <td class="style10"> 
             &nbsp;</td>
        <td class="style7"> 
             &nbsp;</td>
        </tr>

                

         <tr>
        <td class="style6"> 
             &nbsp;</td>
        <td class="style10"> 
             </td>
        <td class="style7"> 
            <asp:Button ID="BtnLogin" runat="server" Text="Login" class="button" 
                 Height="35px" onclick="BtnLogin_Click" Width="140px" CssClass="textbox" />
	 <asp:Button ID="BtnForgot" runat="server" Text="Forgot Password" class="register" 
                 CausesValidation="False" PostBackUrl="~/SendPassword.aspx" Height="35px" 
                Width="140px" CssClass="textbox" />
	
       </td>
        </tr>

                

         <tr>
       <td >  </td>
        <td >  </td>
         <td >  </td>
        </tr>

                

        </table>
           
		
	</div>
		
	
	</form>

    </div>
      <div class="gradient"></div>
  </div>  
</body>
</html>
