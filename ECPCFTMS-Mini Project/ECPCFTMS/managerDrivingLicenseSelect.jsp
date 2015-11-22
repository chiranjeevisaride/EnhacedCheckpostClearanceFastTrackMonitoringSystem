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
<script language="JavaScript">
</script>
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
<form name="customer" action="managerDrivingLicenseIssue.jsp" method="POST"/>
<INPUT TYPE="HIDDEN" NAME="PAGE" VALUE="SELECT"/>
<table align="center" border="0">
<tr>
<td colspan="3" align="center"><%=(request.getAttribute("response")!=null)?"* "+request.getAttribute("response"):""%></td>
</tr>
</table>
<table align="center" STYLE="border:3px solid blue" border="1">
<tr>
<td colspan="3" align="center">
<font type="arial" color="blue" font size="4">
<b>DRIVING LICENSE ISSUE PAGE</b></font><br/>
<img src="main.jpg" width="400" height="175">
</td>
</tr>
<tr>
<td colspan="3">
<table  align="center" cellpadding="0" cellspacing="3" border="0">
<%
	try {
		Connection con = OracleDriver.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT DRIVING_LICENSE.*,(SELECT USERID FROM CUSTOMER WHERE CUSTOMER.CUST_ID=DRIVING_LICENSE.CUST_ID) AS USER_ID FROM DRIVING_LICENSE WHERE DISTID=(SELECT DISTID FROM EMPLOYEE WHERE ID="+session.getAttribute("ID")+") AND MANDALID=(SELECT MANDALID FROM EMPLOYEE WHERE ID="+session.getAttribute("ID")+") AND DLID='0' AND DRIVING_LICENSE.ID IN (SELECT DRIVE_ID FROM DRIVING_SLOT WHERE STATUS='OPEN')");
%>
<tr>
<td align="left">NAME/USER ID</td>
<td width="2">&nbsp;</td>
<td width="10">
<SELECT name="ID">
<OPTION VALUE="0">---SELECT---</OPTION>
<%while(rs.next()) { %>
<OPTION value="<%=rs.getInt("ID")%>"><%=rs.getString("NAME")+"-"+rs.getString("USER_ID")%></OPTION>
<%} %>
</SELECT>
</td>
</tr>
<tr>
<td colspan="3" align="center">
<input type="submit" value="REGISTER">
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
<%
	} catch(Exception e) {
		System.out.println(e);
	}
 %>
</body>
</html>
