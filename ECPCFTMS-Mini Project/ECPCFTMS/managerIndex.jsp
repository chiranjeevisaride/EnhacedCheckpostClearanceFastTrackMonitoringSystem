<html>
<head>
<script LANGUAGE="Javascript" SRC="images/validatecreateEmoloyee.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>HOME PAGE</title>
<link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<%
  if(session.getAttribute("ID")==null || session.getAttribute("MANAGERID")==null) {
  	request.setAttribute("response", "Please Login.");
  	request.getRequestDispatcher("managerHome.jsp").forward(request,response);
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
	<table   align=center>
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
				<li><a href="adminIndex.jsp">Clerk</a></li>
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
<form name="customer" action="managerLoginAction.jsp" method="post"/>
<table align="center" STYLE="border:3px solid blue" border="1">
<tr>
<td align="center">
<font type="arial" color="blue" font size="4">
<b>MANAGER CHECKPOST PAGE</b></font><br/>
<img src="rtocheck.jpg" width="300" height="300" >
</td>
<td valign="top">
<table align="center" cellpadding="0" cellspacing="3" border="0">
<tr>
<td align="left"><a href="selectManagerVehicleRegister.jsp">BOOK&nbsp;VEHICLE&nbsp;SLOT</a></td>
</tr>
<tr><td >&nbsp;</td></tr>
<tr>
<td align="left"><a href="selectManagerVehicleValidation.jsp">VEHICLE&nbsp;REGISTRATION&nbsp;VALIDATION</a></td>
</tr>
<tr><td >&nbsp;</td></tr>
<tr>
<td align="left"><a href="managerVehicleTransfer.jsp">VEHICLE&nbsp;TRANSFER</a></td>
</tr>
<tr><td >&nbsp;</td></tr>
<tr>
<td align="left"><a href="managerIssueNoc.jsp">ISSUE&nbsp;NOC</a></td>
</tr>
<tr><td >&nbsp;</td></tr>
<tr>
<td align="left"><a href="managerIssueFitness.jsp">ISSUE&nbsp;FITNESS</a></td>
</tr>
<tr><td >&nbsp;</td></tr>
<tr>
<td align="left"><a href="managerDrivingLicenseBookSlot.jsp">BOOK&nbsp;DRIVING LICENSE&nbsp;SLOT</a></td>
</tr>
<tr><td >&nbsp;</td></tr>
<tr>
<td align="left"><a href="managerDrivingLicenseSelect.jsp">ISSUE&nbsp;DRIVING LICENSE</a></td>
</tr>
<tr><td >&nbsp;</td></tr>
<tr>
<td align="left"><a href="managerDrivingLicenseTransfer.jsp">DRIVING LICENSE&nbsp;TRANSFER</a></td>
</tr>
<tr><td >&nbsp;</td></tr>
<tr>
<td align="left"><a href="managerIssuePermit.jsp">ISSUE&nbsp;VEHICLE PERMIT</a></td>
</tr>
<tr><td >&nbsp;</td></tr>
<tr>
<td align="left"><a href="managerChangePassword.jsp">CHANGE&nbsp;PASSWORD</a></td>
</tr>
<tr><td >&nbsp;</td></tr>
<tr>
<td align="left"><a href="managerLogoutAction.jsp">LOGOUT</a></td>
</tr>
</table>
</td>
</tr>
</table>
</div>
</form>
</body>
</html>
