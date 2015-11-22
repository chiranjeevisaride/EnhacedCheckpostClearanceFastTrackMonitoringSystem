<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%

  if(session.getAttribute("ID")==null || session.getAttribute("MANAGERID")==null) {
  	request.setAttribute("response", "Please Login.");
  	request.getRequestDispatcher("index.jsp").forward(request,response);
  }
 %>
 <html>
<head>

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
	<table  align=center>
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
<form name="customer" action="managerBookSlotAction.jsp" method="POST" onSubmit="return validateDate();"/>
<INPUT TYPE="HIDDEN" NAME="REG_ID" VALUE="<%=request.getParameter("ID")%>"/> 
<table align="center" border="0">
<tr>
<td colspan="3" align="center"><%=(request.getAttribute("response")!=null)?"* "+request.getAttribute("response"):""%></td>
</tr>
</table>
<table align="center" STYLE="border:3px solid blue" border="1">
<tr>
<td colspan="3" align="center">
<font type="arial" color="blue" font size="4">
<b>MANAGER BOOK SLOT PAGE</b></font><br/>
<img src="main.jpg" width="400" height="175">
</td>
</tr>
<tr>
<td colspan="3">
<table  align="center" cellpadding="0" cellspacing="3" border="0">
<tr>
<td align="left">SLOT DAY/MONTH/YEAR</td>
<td width="2">&nbsp;</td>
<td width="180">
<SELECT name="DD">
<OPTION value="0">DD</OPTION>
<%for(int i=1;i<=31;i++) { %>
<OPTION value="<%=i%>"><%=i%></OPTION>
<%} %>
</SELECT>
<SELECT name="MM">
<OPTION value="0">MM</OPTION>
<OPTION value="JAN">1</OPTION>
<OPTION value="FEB">2</OPTION>
<OPTION value="MAR">3</OPTION>
<OPTION value="APR">4</OPTION>
<OPTION value="MAY">5</OPTION>
<OPTION value="JUNE">6</OPTION>
<OPTION value="JULY">7</OPTION>
<OPTION value="AUG">8</OPTION>
<OPTION value="SEP">9</OPTION>
<OPTION value="OCT">10</OPTION>
<OPTION value="NOV">11</OPTION>
<OPTION value="DEC">12</OPTION>
</SELECT>
<SELECT name="YYYY">
<OPTION VALUE="0">YYYY</OPTION>
<%for(int i=2014;i<=2015;i++) { %>
<OPTION value="<%=i%>"><%=i%></OPTION>
<%} %>
</SELECT>

</td>
</tr>
<tr>
<td align="left">SLOT HOUR:MINUTES</td>
<td width="2">&nbsp;</td>
<td >
<SELECT name="HH">
<OPTION VALUE="0">HH</OPTION>
<%for(int i=1;i<=24;i++) { %>
<OPTION value="<%=i%>"><%=i%></OPTION>
<%} %>
</SELECT>
<SELECT name="MMM">
<OPTION VALUE="0">MM</OPTION>
<%for(int i=1;i<=59;i++) { %>
<OPTION value="<%=i%>"><%=i%></OPTION>
<%} %>
</SELECT>
</td>
</tr>
<tr>
<td colspan="3" align="center">
<input type="submit" value="REGISTER SLOT">
</td>
</tr>
<tr><td colspan="3">&nbsp;</td></tr>
<tr>
<td colspan="3">
<font size="3"><a href="managerIndex.jsp">Back</a></font>
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
