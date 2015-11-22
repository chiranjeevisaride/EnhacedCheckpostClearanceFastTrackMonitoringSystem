<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%

  if(session.getAttribute("ID")==null || session.getAttribute("MANAGERID")==null) {
  	request.setAttribute("response", "Please Login.");
  	request.getRequestDispatcher("index.jsp").forward(request,response);
  }
  request.setAttribute("DISTID",request.getParameter("DISTID"));
  request.setAttribute("MANDALID",request.getParameter("MANDALID"));
  request.setAttribute("ID",request.getParameter("ID"));
  request.setAttribute("MESSAGE",request.getParameter("MESSAGE"));  
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>HOME PAGE</title>
<link href="styles.css" rel="stylesheet" type="text/css" />
<script language="JavaScript">
function submitForMandal() {
	document.customer.action='managerVehicleTransfer.jsp';
	document.customer.submit();
}
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
<form name="customer" action="managerVehicleTransferAction.jsp" method="POST"/>
<table align="center" border="0">
<tr>
<td colspan="3" align="center"><%=(request.getAttribute("response")!=null)?"* "+request.getAttribute("response"):""%></td>
</tr>
</table>
<table align="center" STYLE="border:3px solid blue" border="1">
<tr>
<td colspan="3" align="center">
<font type="arial" color="blue" font size="4">
<b>VEHICLE TRANSFER PAGE</b></font><br/>
<img src="main.jpg" width="400" height="175">
</td>
</tr>
<tr>
<td colspan="3">
<table  align="center" cellpadding="0" cellspacing="3" border="0">
<%
	try {
		Connection con = OracleDriver.getConnection();
		Statement stmt1 = con.createStatement();
		ResultSet rs2 = stmt1.executeQuery("SELECT * FROM REG_VEHICLE WHERE DISTID=(SELECT DISTID FROM EMPLOYEE WHERE ID="+session.getAttribute("ID")+") AND MANDALID=(SELECT MANDALID FROM EMPLOYEE WHERE ID="+session.getAttribute("ID")+") AND REG_NO='0' AND REG_VEHICLE.ID IN (SELECT REG_ID FROM SLOT WHERE FLAG=0)");
%>
<tr>
<td align="left">VEHICLE NAME</td>
<td width="2">&nbsp;</td>
<td width="10">
<SELECT name="ID">
<OPTION VALUE="0">---SELECT---</OPTION>
<%while(rs2.next()) { %>
<OPTION <%=(request.getAttribute("ID")!=null && ((String)request.getAttribute("ID")).equalsIgnoreCase(rs2.getString("ID")))?" SELECTED ":"" %> value="<%=rs2.getInt("ID")%>"><%=rs2.getString("ENG_NO")+"-"+rs2.getString("CHASIS_NO")+"-"+rs2.getString("BIKE_NAME")%></OPTION>
<%} %>
</SELECT>
</td>
</tr>
<%
		String sql = "SELECT * FROM DIST";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		Statement stmtMandal = con.createStatement();
		String disticID = (String)request.getAttribute("DISTID");
		if(disticID==null) {
			disticID = "0";
		}
		ResultSet rs1 = stmtMandal.executeQuery("SELECT * FROM MANDAL WHERE DISTID="+disticID);
%>
<tr>
<td align="left">DISTICT</td>
<td width="2">&nbsp;</td>
<td width="10">
<SELECT name="DISTID" onchange="submitForMandal();">
<OPTION VALUE="0">---SELECT---</OPTION>
<%while(rs.next()) { %>
<OPTION <%=(request.getAttribute("DISTID")!=null && ((String)request.getAttribute("DISTID")).equalsIgnoreCase(rs.getString("DISTID")))?" SELECTED ":"" %> value="<%=rs.getInt("DISTID")%>"><%=rs.getString("NAME")%></OPTION>
<%} %>
</SELECT>
</td>
</tr>
<tr>
<td align="left">MANDAL</td>
<td width="2">&nbsp;</td>
<td width="10">
<SELECT name="MANDALID">
<OPTION VALUE="0">---SELECT---</OPTION>
<%while(rs1.next()) { %>
<OPTION <%=(request.getAttribute("MANDALID")!=null && ((String)request.getAttribute("MANDALID")).equalsIgnoreCase(rs1.getString("MANDALID")))?" SELECTED ":"" %> value="<%=rs1.getInt("MANDALID")%>"><%=rs1.getString("NAME")%>-<%=rs1.getString("CODE")%></OPTION>
<%} %>
</SELECT>
</td>
</tr>
<tr>
<td align="left">MESSAGE</td>
<td width="2">&nbsp;</td>
<td width="10"><textarea rows="5" cols="25" name="MESSAGE"><%=(request.getAttribute("MESSAGE")!=null)?request.getAttribute("MESSAGE"):""%></textarea></td>
</tr>
<tr>
<td colspan="3" align="center">
<input type="submit" value="TRANSFER">
</td>
</tr>
<tr><td colspan="3">&nbsp;</td></tr>
<tr>
<td colspan="3">
<font size="3"><a href="managerIndex.jsp">Back</a></font>
</td>
</tr>
</table>
<td>
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
