<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>HOME PAGE</title>
<link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<%
  if(session.getAttribute("ID")==null || session.getAttribute("USERID")==null) {
  	request.setAttribute("response", "Please Login.");
  	request.getRequestDispatcher("index.jsp").forward(request,response);
  }

	try {
		Connection con = OracleDriver.getConnection();
		String sql = "SELECT * FROM DRIVING_LICENSE WHERE CUST_ID="+session.getAttribute("ID");
		System.out.println(sql);
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
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
<table align="center" border="0">
<tr>
<td colspan="3" align="center"><%=(request.getAttribute("response")!=null)?"* "+request.getAttribute("response"):""%></td>
</tr>
</table>
<%
		if(rs.next() && (rs.getString("REJECT_REASON")==null || rs.getString("REJECT_REASON").equals(""))) {
 %>
<table align="center" STYLE="border:3px solid blue" border="1">
<tr>
<td colspan="3" align="center">
<font type="arial" color="blue" font size="4">
<b>DRIVING LICENSE PAGE</b></font><br/>
<img src="main.jpg" width="400" height="175">
</td>
</tr>
<tr>
<td colspan="3">
<table  align="center" cellpadding="0" cellspacing="3" border="0">
<tr>
<td align="left">DL REGISTRATION NO.</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("DLID")!=null && !rs.getString("DLID").equals("0"))?rs.getString("DLID"):"Registration Not Completed."%></td>
</tr>
<tr>
<td align="left">NAME</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("NAME")!=null)?rs.getString("NAME"):""%></td>
</tr>
<tr>
<td align="left">DOB</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("DOB")!=null)?rs.getString("DOB"):""%></td>
</tr>
<tr>
<td align="left">BLOOD GRUOP</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("BLOOD_GROUP")!=null)?rs.getString("BLOOD_GROUP"):""%> </td>
</tr>
<tr>
<td align="left">LIC AUTHORITY</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("LIC_AUTHORITY")!=null)?rs.getString("LIC_AUTHORITY"):""%> </td>
</tr>
<tr>
<td align="left">AGE PROOF</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("PROOF_AGE")!=null)?rs.getString("PROOF_AGE"):""%> </td>
</tr>
<tr>
<td align="left">RESIDENTIAL PROOF</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("PROOF_RESIDENCE")!=null)?rs.getString("PROOF_RESIDENCE"):""%> </td>
</tr>
<tr>
<td align="left">PHYSICAL FITNESS</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("PHYSICAL_FITNESS")!=null)?rs.getString("PHYSICAL_FITNESS"):""%> </td>
</tr>
<tr>
<td align="left">MEDICAL CERTIFICATE</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("MEDICAL_CERT")!=null)?rs.getString("MEDICAL_CERT"):""%> </td>
</tr>
<tr>
<td align="left">COUNTRY</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("COUNTRY")!=null)?rs.getString("COUNTRY"):""%></td>
</tr>
<tr>
<td align="left">STATE</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("STATE")!=null)?rs.getString("STATE"):""%></td>
</tr>
<tr>
<td align="left">OWNER ADDRESS</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("ADDRESS")!=null)?rs.getString("ADDRESS"):""%></td>
</tr>
<tr>
<td align="left">VALID FROM DATE</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("VALID_FROM")!=null)?rs.getString("VALID_FROM"):""%></td>
</tr>
<tr>
<td align="left">VALID TO DATE</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("VALID_TO")!=null)?rs.getString("VALID_TO"):""%></td>
</tr>
<tr>
<td colspan="3">
<img src="<%=(rs.getString("PHOTO_PATH")!=null)?"photos/"+rs.getString("PHOTO_PATH"):""%>" WIDTH="250" HEIGHT="250"/>
</td>
</tr>
<tr>
<tr><td colspan="3">&nbsp;</td></tr>
<tr>
<td colspan="3">
<font size="3"><a href="customerIndex.jsp">Back</a></font>
</td>
</tr>
</table>
</td>
</tr>
</table>
</div>
<%
} else if(rs.getString("REJECT_REASON")==null || rs.getString("REJECT_REASON").equals("")) {
%>
<center>Driving License Registration Not Completed.&nbsp;<font size="3"><a href="customerIndex.jsp">Back</a></font></center>
<%
} else if(rs.getString("REJECT_REASON")!=null) {
%>
<center>Driving License Rejected due to the following reason <%=rs.getString("REJECT_REASON")%>.&nbsp;<br>Click on the <b>Requset Again</b> link to wait for the again slot allocated to you by the RTA<font size="3">-<a href="customerDrivingLicenseRequest.jsp?ID=<%=rs.getString("ID")%>">Request Again</a></font>&nbsp;<br><font size="3"><a href="customerIndex.jsp">Back</a></font></center>
<%
}
	rs.close();
	stmt.close();
	con.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
 %>
</body>
</html>
