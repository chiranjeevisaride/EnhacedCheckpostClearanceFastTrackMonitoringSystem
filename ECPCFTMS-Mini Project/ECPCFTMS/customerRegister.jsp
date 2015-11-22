<html>
<head>
<script LANGUAGE="Javascript" SRC="images/validate.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>HOME PAGE</title>
<link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div>
	<TABLE CELLSPACING="0" CELLPADDING="0" ALIGN="CENTER">
		<TR>
			<TD><IMG SRC="images/logo.gif" />
			</TD>
		</TR>
	</TABLE>
	<p></p>
	<table align=center>
		<tr>
			<td width="880" bgcolor="#0033CC">
				<div align="center">
					<font color="white"><strong class="test2">ENHANCED CHECK-POST CLEARANCE AND FAST TRACK MONITORING SYSTEM </strong></font>
				</div>
			</td>
		</tr>
	</table>
	<div id="headpanel" style="margin-left:250">
		<div id="menu">
			<ul>
				<li><a href="home.jsp">Home</a></li>
				<li><div class="gap"></div></li>
				<li><a href="about.jsp">About Us</a></li>
				<li><div class="gap"></div></li>
				<li><a href="contact.jsp">Contact Us</a></li>
				<%
				  if(session.getAttribute("ID")!=null && session.getAttribute("USERID")!=null) {
				 %>
				<li><div class="gap"></div></li>
				<li><a href="customerIndex.jsp">Customer</a></li>
				<%} else  if(session.getAttribute("ID")!=null && session.getAttribute("MANAGERID")!=null) { %>
				<li><div class="gap"></div></li>
				<li><a href="managerIndex.jsp">Manager</a></li>
				<%} else  if(session.getAttribute("ID")!=null && session.getAttribute("ADMINID")!=null) { %>
				<li><div class="gap"></div></li>
				<li><a href="adminIndex.jsp">Admin</a></li>
				<%} else {%>
				<li><div class="gap"></div></li>
				<li><a href="customerIndex.jsp">Customer</a></li>
				<li><div class="gap"></div></li>
				<li><a href="adminIndex.jsp">Admin</a></li>
				<li><div class="gap"></div></li>
				<li><a href="managerIndex.jsp">Manager</a></li>
				<%} %>
				</ul>
		</div>
	</div>
</div>
<br/><br/><br/>
<div>
<form name="customer" action="customerRegisterAction.jsp" method="POST" onsubmit="return validate();"/>
<table align="center" border="0">
<tr>
<td colspan="3" align="center"><%=(request.getAttribute("response")!=null)?"* "+request.getAttribute("response"):""%></td>
</tr>
</table>
<table align="center" STYLE="border:3px solid blue" border="1">
<tr>
<td colspan="3" align="center">
<font type="arial" color="blue" font size="4">
<b>CUSTOMER REGISTER PAGE</b></font><br/>
<img src="main.jpg" width="400" height="175">
</td>
</tr>
<tr>
<td colspan="3">
<table width="30" align="center" cellpadding="0" cellspacing="3" border="0" >
<tr>
<td align="left">NAME</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=text name="NAME" value="<%=(request.getAttribute("NAME")!=null)?request.getAttribute("NAME"):""%>" maxlength="100" size=25></td>
</tr>
<tr>
<td align="left">USERID</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=text name="USERID" value="<%=(request.getAttribute("USERID")!=null)?request.getAttribute("USERID"):""%>" maxlength="100" size=25></td>
</tr>
<tr>
<td align="left">PASSWORD</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=password maxlength="100" name="PASSWORD" size=25></td>
</tr>
<tr>
<td align="left">RE-PASSWORD</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=password maxlength="100" name="REPASSWORD" size=25></td>
</tr>
<tr>
<td align="left">MOBILE</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=text name="MOBILE" value="<%=(request.getAttribute("MOBILE")!=null)?request.getAttribute("MOBILE"):""%>" maxlength="12" size=25></td>
</tr>
<tr>
<td align="left">PHONE</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=text name="PHONE" value="<%=(request.getAttribute("PHONE")!=null)?request.getAttribute("PHONE"):""%>" maxlength="12" size=25></td>
</tr>
<tr>
<td align="left">EMAIL</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=text name="EMAIL" value="<%=(request.getAttribute("EMAIL")!=null)?request.getAttribute("EMAIL"):""%>" maxlength="100" size=25></td>
</tr>
<tr>
<td align="left">ADDRESS</td>
<td width="2">&nbsp;</td>
<td width="10"><textarea rows="5" cols="25" name="ADDRESS"><%=(request.getAttribute("ADDRESS")!=null)?request.getAttribute("ADDRESS"):""%></textarea></td>
</tr>
<tr>
<tr>
<td colspan="3" align="center">
<input type="submit" value="REGISTER">
</td>
</tr>
<tr><td colspan="3">&nbsp;</td></tr>
<tr>
<td colspan="3">
<font size="3"><a href="index.jsp">Already Registered Login</a></font>
</td>
</tr>
</table>
</td>
</tr>
</table>
</div>
</form>
</body>
</html>
