<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>HOME PAGE</title>
<link href="styles.css" rel="stylesheet" type="text/css" />
<script language="JavaScript">
 function openFineWindow(regNo) {
 popupWin = window.open("fines.jsp?ID="+regNo);
 }
 </script>
</head>
<%
  if(session.getAttribute("ID")==null || session.getAttribute("USERID")==null) {
  	request.setAttribute("response", "Please Login.");
  	request.getRequestDispatcher("index.jsp").forward(request,response);
  }

	try {
		Connection con = OracleDriver.getConnection();
		String sql = "SELECT REG_VEHICLE.*, (SELECT NAME FROM DIST WHERE REG_VEHICLE.DISTID=DIST.DISTID) AS DISTNAME,  (SELECT NAME FROM MANDAL WHERE MANDAL.MANDALID=REG_VEHICLE.MANDALID) AS MANDALNAME, (SELECT CODE FROM MANDAL WHERE MANDAL.MANDALID=REG_VEHICLE.MANDALID) AS MANDALNAME  FROM REG_VEHICLE WHERE ID="+request.getParameter("ID");
		System.out.println(sql);
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		Statement stmt1 = con.createStatement();
		ResultSet rs1 = stmt1.executeQuery("SELECT SLOT.*, (SELECT ADDRESS FROM MANDAL WHERE MANDAL.MANDALID=(SELECT MANDALID FROM EMPLOYEE WHERE ID=SLOT.EMP_ID)) AS ADDRESS FROM SLOT WHERE FLAG=0 AND REG_ID="+request.getParameter("ID"));
		Statement stmt2 = con.createStatement();
		ResultSet rs2 = stmt2.executeQuery("SELECT * FROM REG_VEHICLE_VALID WHERE REG_ID="+request.getParameter("ID"));
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
	<table  border="1" align=center>
		<tr>
			<td width="1033" bgcolor="#0033CC">
				<div align="center">
					<font color="white"><strong class="test2">ENHANCED CHECK-POST CLEARANCE AND FAST TRACK MONITORING SYSTEM </strong></font>
				</div>
			</td>
		</tr>
	</table>
	<div id="headpanel">
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
		if(rs.next()) {
 %>
<table align="center" STYLE="border:3px solid blue" border="1">
<tr>
<td colspan="3" align="center">
<font type="arial" color="blue" font size="4">
<b>VEHICLE REGISTRATION PAGE</b></font><br/>
<img src="main.jpg" width="400" height="175">
</td>
</tr>
<tr>
<td colspan="3">
<table  align="center" cellpadding="0" cellspacing="3" border="0">
<tr>
<td align="left">REGISTRATION NO.</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("REG_NO")!=null && !rs.getString("REG_NO").equals("0"))?rs.getString("REG_NO")+"&nbsp;&nbsp;&nbsp;<a href='javascript:openFineWindow("+rs.getString("ID")+");'>View Fines</a>":"Registration Not Completed."%></td>
</tr>
<tr>
<td align="left">OWNER NAME</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("OWNER_NAME")!=null)?rs.getString("OWNER_NAME"):""%></td>
</tr>
<tr>
<td align="left">VEHICLE ENGINE NO.</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("ENG_NO")!=null)?rs.getString("ENG_NO"):""%></td>
</tr>
<tr>
<td align="left">VEHICLE CHASIS NO.</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("CHASIS_NO")!=null)?rs.getString("CHASIS_NO"):""%> </td>
</tr>
<tr>
<td align="left">VEHICLE BODY TYPE</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("BODY")!=null)?rs.getString("BODY"):""%> </td>
</tr>
<tr>
<td align="left">VEHICLE BRAND</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("BRAND")!=null)?rs.getString("BRAND"):""%> </td>
</tr>
<tr>
<td align="left">VEHICLE NAME</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("BIKE_NAME")!=null)?rs.getString("BIKE_NAME"):""%> </td>
</tr>
<tr>
<td align="left">VEHICLE CC</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("CC")!=null)?rs.getString("CC"):""%> </td>
</tr>
<tr>
<td align="left">SEAT CAPACITY</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("NOOFSEATS")!=null)?rs.getString("NOOFSEATS"):""%> </td>
</tr>
<tr>
<td align="left">VEHICLE COLOR</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("COLOR")!=null)?rs.getString("COLOR"):""%> </td>
</tr>
<tr>
<td align="left">MANUFATURE MONTH</td>
<td width="2">&nbsp;</td>
<td width="10">
<%=rs.getString("MANU_MONTH")%>
</td>
</tr>
<tr>
<td align="left">MANUFATURE YEAR</td>
<td width="2">&nbsp;</td>
<td width="10">
<%=rs.getString("MANU_YEAR")%>
</td>
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
<td align="left">DISTICT</td>
<td width="2">&nbsp;</td>
<td width="10">
<%=rs.getString("DISTNAME")!=null?rs.getString("DISTNAME"):""%>
</td>
</tr>
<tr>
<td align="left">MANDAL</td>
<td width="2">&nbsp;</td>
<td width="10">
<%=rs.getString("MANDALNAME")!=null?rs.getString("MANDALNAME"):""%>
</td>
</tr>
<tr>
<td align="left">OWNER ADDRESS</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs.getString("ADDRESS")!=null)?rs.getString("ADDRESS"):""%></td>
</tr>
<%if(rs1.next()) { %>
<tr>
<td align="left">SLOT DATE</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs1.getString("SLOT_DATE")!=null)?rs1.getString("SLOT_DATE"):""%></td>
</tr>
<tr>
<td align="left">SLOT TIME</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs1.getString("SLOT_TIME")!=null)?rs1.getString("SLOT_TIME"):""%></td>
</tr>
<tr>
<td align="left">RTA ADDRESS</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs1.getString("ADDRESS")!=null)?rs1.getString("ADDRESS"):""%></td>
</tr>
<%} else if(rs.getString("REG_NO").equals("0")) {%>
<tr>
<td align="left">SLOT DETAILS</td>
<td width="2">&nbsp;</td>
<td width="10">Slot Not Booked</td>
</tr>
<%} %>
<%if(rs2.next()) { %>
<tr>
<td align="left">VALID FROM DATE</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs2.getString("VALID_FROM")!=null)?rs2.getString("VALID_FROM"):""%></td>
</tr>
<tr>
<td align="left">VALID TO DATE</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs2.getString("VALID_TO")!=null)?rs2.getString("VALID_TO"):""%></td>
</tr>
<tr>
<td align="left">REGISTER ON</td>
<td width="2">&nbsp;</td>
<td width="10"><%=(rs2.getString("CREATED_ON")!=null)?rs2.getString("CREATED_ON"):""%></td>
</tr>
<tr>
<td colspan="3">
<img src="<%=(rs2.getString("PHOTO_PATH")!=null)?"photos/"+rs2.getString("PHOTO_PATH"):""%>" WIDTH="250" HEIGHT="250"/>
</td>
</tr>
<%}%>
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
} else {
%>
<center>Vehicle Registration Not Found.&nbsp;<font size="3"><a href="customerIndex.jsp">Back</a></font></center>
<%
}
	rs.close();
	stmt.close();
	rs1.close();
	stmt1.close();
	rs2.close();
	stmt2.close();
	con.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
 %>
</body>
</html>
