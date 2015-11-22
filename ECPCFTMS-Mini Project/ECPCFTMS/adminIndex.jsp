<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>HOME PAGE</title>
<link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<%
  if(session.getAttribute("ID")==null || session.getAttribute("ADMINID")==null) {
  	request.setAttribute("response", "Please Login.");
  	request.getRequestDispatcher("adminHome.jsp").forward(request,response);
  }
 %>
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
				<%} else  if(session.getAttribute("ID")!=null && session.getAttribute("CLERKID")!=null) { %>
				<li><div class="gap"></div></li>
				<li><a href="clerkIndex.jsp">Clerk</a></li>
				<%} else {%>
				<li><div class="gap"></div></li>
				<li><a href="customerIndex.jsp">Customer</a></li>
				<li><div class="gap"></div></li>
				<li><a href="adminIndex.jsp">Admin</a></li>
				<li><div class="gap"></div></li>
				<li><a href="managerIndex.jsp">Manager</a></li>
				<li><div class="gap"></div></li>
				<li><a href="clerkIndex.jsp">Clerk</a></li>
				<%} %>
				</ul>
		</div>
	</div>
</div>
<br/><br/><br/>
<div>
<table align="center" border="0">
<tr>
<td colspan="3" align="center"><%=(request.getAttribute("response")!=null)?"* "+request.getAttribute("response"):""%></td>
</tr>
</table>
<form name="customer" action="customerLoginAction.jsp" method="post"/>
<table align="center" STYLE="border:3px solid blue" border="1">
<tr>
<td align="center">
<font type="arial" color="blue" font size="4">
<b>ADMIN CHECKPOST PAGE</b></font><br/>
<img src="rtocheck.jpg" width="300" height="300" >
</td>
<td valign="top">
<table align="center" cellpadding="0" cellspacing="3" border="0">
<tr>
<td align="left"><a href="createEmployee.jsp">CREATE&nbsp;EMPLOYEE</a></td>
</tr>
<tr><td >&nbsp;</td></tr>
<tr>
<td align="left"><a href="createClerk.jsp">CREATE&nbsp;CLERK</a></td>
</tr>
<tr><td >&nbsp;</td></tr>
<tr>
<td align="left"><a href="adminChangePassword.jsp">CHANGE&nbsp;PASSWORD</a></td>
</tr>
<tr><td >&nbsp;</td></tr>
<tr>
<td align="left"><a href="adminLogoutAction.jsp">LOGOUT</a></td>
</tr>
</table>
</td>
</tr>
</table>
</div>
</form>
</body>
</html>
