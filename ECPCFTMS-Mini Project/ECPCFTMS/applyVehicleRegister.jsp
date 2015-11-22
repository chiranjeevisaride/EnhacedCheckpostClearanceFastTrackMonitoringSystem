<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%

  if(session.getAttribute("ID")==null || session.getAttribute("USERID")==null) {
  	request.setAttribute("response", "Please Login.");
  	request.getRequestDispatcher("index.jsp").forward(request,response);
  }
		request.setAttribute("OWNER_NAME",request.getParameter("OWNER_NAME"));
		request.setAttribute("ADDRESS",request.getParameter("ADDRESS"));
		request.setAttribute("ENG_NO",request.getParameter("ENG_NO"));
		request.setAttribute("CHASIS_NO",request.getParameter("CHASIS_NO"));
		request.setAttribute("BODY",request.getParameter("BODY"));
		request.setAttribute("COLOR",request.getParameter("COLOR"));
		request.setAttribute("BRAND",request.getParameter("BRAND"));
		request.setAttribute("CC",request.getParameter("CC"));
		request.setAttribute("NOOFSEATS",request.getParameter("NOOFSEATS"));
		request.setAttribute("BIKE_NAME",request.getParameter("BIKE_NAME"));
		request.setAttribute("DATEOFMANU",request.getParameter("DATEOFMANU"));
		request.setAttribute("DISTID",request.getParameter("DISTID"));
		request.setAttribute("MANDALID",request.getParameter("MANDALID"));
		request.setAttribute("STATE",request.getParameter("STATE"));
		request.setAttribute("COUNTRY",request.getParameter("COUNTRY"));
		request.setAttribute("MANU_MONTH",request.getParameter("MANU_MONTH"));
		request.setAttribute("MANU_YEAR",request.getParameter("MANU_YEAR"));
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>HOME PAGE</title>
<link href="styles.css" rel="stylesheet" type="text/css" />
<script language="JavaScript">
function submitForMandal() {
	document.customer.action='applyVehicleRegister.jsp';
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
<form name="customer" action="vehicleRegisterAction.jsp" method="POST"/>
<table align="center" border="0">
<tr>
<td colspan="3" align="center"><%=(request.getAttribute("response")!=null)?"* "+request.getAttribute("response"):""%></td>
</tr>
</table>
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
<td align="left">OWNER NAME</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=text name="OWNER_NAME" value="<%=(request.getAttribute("OWNER_NAME")!=null)?request.getAttribute("OWNER_NAME"):""%>" maxlength="100" size=25></td>
</tr>
<tr>
<td align="left">VEHICLE ENGINE NO.</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=text name="ENG_NO" value="<%=(request.getAttribute("ENG_NO")!=null)?request.getAttribute("ENG_NO"):""%>" maxlength="100" size=25></td>
</tr>
<tr>
<td align="left">VEHICLE CHASIS NO.</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=TEXT maxlength="100" name="CHASIS_NO" value="<%=(request.getAttribute("CHASIS_NO")!=null)?request.getAttribute("CHASIS_NO"):""%>" size=25></td>
</tr>
<tr>
<td align="left">VEHICLE BODY TYPE</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=TEXT maxlength="100" name="BODY" value="<%=(request.getAttribute("BODY")!=null)?request.getAttribute("BODY"):""%>" size=25></td>
</tr>
<tr>
<td align="left">VEHICLE BRAND</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=TEXT maxlength="100" name="BRAND" value="<%=(request.getAttribute("BRAND")!=null)?request.getAttribute("BRAND"):""%>" size=25></td>
</tr>
<tr>
<td align="left">VEHICLE NAME</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=TEXT maxlength="100" name="BIKE_NAME" value="<%=(request.getAttribute("BIKE_NAME")!=null)?request.getAttribute("BIKE_NAME"):""%>" size=25></td>
</tr>
<tr>
<td align="left">VEHICLE CC</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=TEXT maxlength="100" name="CC" value="<%=(request.getAttribute("CC")!=null)?request.getAttribute("CC"):""%>" size=25></td>
</tr>
<tr>
<td align="left">SEAT CAPACITY</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=TEXT maxlength="100" name="NOOFSEATS" value="<%=(request.getAttribute("NOOFSEATS")!=null)?request.getAttribute("NOOFSEATS"):""%>" size=25></td>
</tr>
<tr>
<td align="left">VEHICLE COLOR</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=TEXT maxlength="100" name="COLOR" value="<%=(request.getAttribute("COLOR")!=null)?request.getAttribute("COLOR"):""%>" size=25></td>
</tr>
<tr>
<td align="left">MANUFATURE MONTH</td>
<td width="2">&nbsp;</td>
<td width="10">
<SELECT name="MANU_MONTH">
<OPTION value="0">---SELECT---</OPTION>
<%for(int i=1;i<=12;i++) { %>
<OPTION <%=(request.getAttribute("MANU_MONTH")!=null && ((String)request.getAttribute("MANU_MONTH")).equalsIgnoreCase(i+""))?" SELECTED ":"" %>value="<%=i%>"><%=i%></OPTION>
<%} %>
</SELECT>
</td>
</tr>
<tr>
<td align="left">MANUFATURE YEAR</td>
<td width="2">&nbsp;</td>
<td width="10">
<SELECT name="MANU_YEAR">
<OPTION VALUE="0">---SELECT---</OPTION>
<%for(int i=1980;i<=2014;i++) { %>
<OPTION <%=(request.getAttribute("MANU_YEAR")!=null && ((String)request.getAttribute("MANU_YEAR")).equalsIgnoreCase(i+""))?" SELECTED ":"" %> value="<%=i%>"><%=i%></OPTION>
<%} %>
</SELECT>
</td>
</tr>
<tr>
<td align="left">COUNTRY</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=text name="COUNTRY" value="<%=(request.getAttribute("COUNTRY")!=null)?request.getAttribute("COUNTRY"):""%>" maxlength="100" size=25></td>
</tr>
<tr>
<td align="left">STATE</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=text name="STATE" value="<%=(request.getAttribute("STATE")!=null)?request.getAttribute("STATE"):""%>" maxlength="100" size=25></td>
</tr>
<%
	try {
		Connection con = OracleDriver.getConnection();
		String sql = "SELECT * FROM DIST";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		Statement stmtMandal = con.createStatement();
		String disticID = request.getParameter("DISTID");
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
<td align="left">OWNER ADDRESS</td>
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
<font size="3"><a href="customerIndex.jsp">Back</a></font>
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
