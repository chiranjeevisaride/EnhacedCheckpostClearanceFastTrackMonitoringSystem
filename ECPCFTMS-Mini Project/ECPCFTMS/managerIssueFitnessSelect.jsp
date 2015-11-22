<%@page import="java.util.Calendar"%>
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
  if(session.getAttribute("ID")==null || session.getAttribute("MANAGERID")==null) {
  	request.setAttribute("response", "Please Login.");
  	request.getRequestDispatcher("managerHome.jsp").forward(request,response);
  }

	try {
		Connection con = OracleDriver.getConnection();
		String sql = "SELECT REG_VEHICLE.*, (SELECT NAME FROM DIST WHERE REG_VEHICLE.DISTID=DIST.DISTID) AS DISTNAME,  (SELECT NAME FROM MANDAL WHERE MANDAL.MANDALID=REG_VEHICLE.MANDALID) AS MANDALNAME, (SELECT CODE FROM MANDAL WHERE MANDAL.MANDALID=REG_VEHICLE.MANDALID) AS MANDALNAME  FROM REG_VEHICLE WHERE ID="+request.getParameter("ID");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		Statement stmt2 = con.createStatement();
		ResultSet rs2 = stmt2.executeQuery("SELECT * FROM REG_VEHICLE_VALID WHERE REG_ID="+request.getParameter("ID"));
%>
<body>
<form name="manager" method="post" action="managerIssueFitnessSelectAction.jsp">
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
		if(rs.next()) {
 %>
 <INPUT TYPE="HIDDEN" NAME="ID" VALUE="<%=(rs.getString("ID")!=null)?rs.getString("ID"):""%>"/>
<INPUT TYPE="HIDDEN" NAME="NAME" VALUE="<%=(rs.getString("OWNER_NAME")!=null)?rs.getString("OWNER_NAME"):""%>"/>
<INPUT TYPE="HIDDEN" NAME="REG_NO" VALUE="<%=rs.getString("REG_NO")!=null?rs.getString("REG_NO"):""%>"/>
<INPUT TYPE="HIDDEN" NAME="ENG_NO" VALUE="<%=(rs.getString("ENG_NO")!=null)?rs.getString("ENG_NO"):""%>"/>
<INPUT TYPE="HIDDEN" NAME="CHASIS_NO" VALUE="<%=(rs.getString("CHASIS_NO")!=null)?rs.getString("CHASIS_NO"):""%>"/>
<table align="center" STYLE="border:3px solid blue" border="1">
<tr>
<td colspan="3" align="center">
<font type="arial" color="blue" font size="4">
<b>MANAGER ISSUE FITNESS PAGE</b></font><br/>
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
<td align="left">REGISTRATION VALID</td>
<td width="2">&nbsp;</td>
<td width="10">
 <INPUT TYPE="RADIO" NAME="VALID" VALUE="YES"/>Yes
 <INPUT TYPE="RADIO" NAME="VALID" VALUE="NO"/>No (Manual Verify)
 </td>
</tr>
<tr>
<td align="left">BREAKS VALID</td>
<td width="2">&nbsp;</td>
<td width="10">
 <INPUT TYPE="RADIO" NAME="BREAKS_VALID" VALUE="YES"/>Yes
 <INPUT TYPE="RADIO" NAME="BREAKS_VALID" VALUE="NO"/>No (Manual Verify)
 </td>
</tr>
<tr>
<td align="left">POLLUTION VALID</td>
<td width="2">&nbsp;</td>
<td width="10">
 <INPUT TYPE="RADIO" NAME="POLUTION_VALID" VALUE="YES"/>Yes
 <INPUT TYPE="RADIO" NAME="POLUTION_VALID" VALUE="NO"/>No (Manual Verify)
 </td>
</tr>
<tr>
<td align="left">CONDITION VALID</td>
<td width="2">&nbsp;</td>
<td width="10">
 <INPUT TYPE="RADIO" NAME="CONDITION_VALID" VALUE="YES"/>Yes
 <INPUT TYPE="RADIO" NAME="CONDITION_VALID" VALUE="NO"/>No (Manual Verify)
 </td>
</tr>
<tr>
<td align="left">CONDITION REASON</td>
<td width="2">&nbsp;</td>
<td width="10"><textarea rows="5" cols="25" name="COND_REJECT_DETAILS"></textarea></td>
</tr>
<tr>
<td align="left">VALID FROM DD/MM/YYYY</td>
<td width="2">&nbsp;</td>
<td width="180">
<SELECT name="FROMDD">
<OPTION value="0">DD</OPTION>
<%for(int i=1;i<=31;i++) { %>
<OPTION value="<%=i%>" <%=(request.getAttribute("FROMDD")!=null && ((String)request.getAttribute("FROMDD")).equalsIgnoreCase(i+""))?" SELECTED ":"" %>><%=i%></OPTION>
<%} %>
</SELECT>
<SELECT name="FROMMM">
<OPTION value="0">MM</OPTION>
<OPTION value="JAN" <%=(request.getAttribute("FROMMM")!=null && ((String)request.getAttribute("FROMMM")).equalsIgnoreCase("JAN"))?" SELECTED ":"" %>>1</OPTION>
<OPTION value="FEB" <%=(request.getAttribute("FROMMM")!=null && ((String)request.getAttribute("FROMMM")).equalsIgnoreCase("FEB"))?" SELECTED ":"" %>>2</OPTION>
<OPTION value="MAR" <%=(request.getAttribute("FROMMM")!=null && ((String)request.getAttribute("FROMMM")).equalsIgnoreCase("MAR"))?" SELECTED ":"" %>>3</OPTION>
<OPTION value="APR" <%=(request.getAttribute("FROMMM")!=null && ((String)request.getAttribute("FROMMM")).equalsIgnoreCase("APR"))?" SELECTED ":"" %>>4</OPTION>
<OPTION value="MAY" <%=(request.getAttribute("FROMMM")!=null && ((String)request.getAttribute("FROMMM")).equalsIgnoreCase("MAY"))?" SELECTED ":"" %>>5</OPTION>
<OPTION value="JUN" <%=(request.getAttribute("FROMMM")!=null && ((String)request.getAttribute("FROMMM")).equalsIgnoreCase("JUN"))?" SELECTED ":"" %>>6</OPTION>
<OPTION value="JUL" <%=(request.getAttribute("FROMMM")!=null && ((String)request.getAttribute("FROMMM")).equalsIgnoreCase("JUL"))?" SELECTED ":"" %>>7</OPTION>
<OPTION value="AUG" <%=(request.getAttribute("FROMMM")!=null && ((String)request.getAttribute("FROMMM")).equalsIgnoreCase("AUG"))?" SELECTED ":"" %>>8</OPTION>
<OPTION value="SEP" <%=(request.getAttribute("FROMMM")!=null && ((String)request.getAttribute("FROMMM")).equalsIgnoreCase("SEP"))?" SELECTED ":"" %>>9</OPTION>
<OPTION value="OCT" <%=(request.getAttribute("FROMMM")!=null && ((String)request.getAttribute("FROMMM")).equalsIgnoreCase("OCT"))?" SELECTED ":"" %>>10</OPTION>
<OPTION value="NOV" <%=(request.getAttribute("FROMMM")!=null && ((String)request.getAttribute("FROMMM")).equalsIgnoreCase("NOV"))?" SELECTED ":"" %>>11</OPTION>
<OPTION value="DEC" <%=(request.getAttribute("FROMMM")!=null && ((String)request.getAttribute("FROMMM")).equalsIgnoreCase("DEC"))?" SELECTED ":"" %>>12</OPTION>
</SELECT>
<SELECT name="FROMYYYY">
<OPTION VALUE="0">YYYY</OPTION>
<%
Calendar cal = Calendar.getInstance();
int year = cal.get(Calendar.YEAR);
for(int i=year;i<=year;i++) { %>
<OPTION value="<%=i%>" <%=(request.getAttribute("FROMYYYY")!=null && ((String)request.getAttribute("FROMYYYY")).equalsIgnoreCase(i+""))?" SELECTED ":"" %>><%=i%></OPTION>
<%} %>
</SELECT>
</td>
</tr>
<tr>
<td align="left">VALID TO DD/MM/YYYY</td>
<td width="2">&nbsp;</td>
<td width="180">
<SELECT name="TODD">
<OPTION value="0">DD</OPTION>
<%for(int i=1;i<=31;i++) { %>
<OPTION value="<%=i%>" <%=(request.getAttribute("TODD")!=null && ((String)request.getAttribute("TODD")).equalsIgnoreCase(i+""))?" SELECTED ":"" %>><%=i%></OPTION>
<%} %>
</SELECT>
<SELECT name="TOMM">
<OPTION value="JAN" <%=(request.getAttribute("TOMM")!=null && ((String)request.getAttribute("TOMM")).equalsIgnoreCase("JAN"))?" SELECTED ":"" %>>1</OPTION>
<OPTION value="FEB" <%=(request.getAttribute("TOMM")!=null && ((String)request.getAttribute("TOMM")).equalsIgnoreCase("FEB"))?" SELECTED ":"" %>>2</OPTION>
<OPTION value="MAR" <%=(request.getAttribute("TOMM")!=null && ((String)request.getAttribute("TOMM")).equalsIgnoreCase("MAR"))?" SELECTED ":"" %>>3</OPTION>
<OPTION value="APR" <%=(request.getAttribute("TOMM")!=null && ((String)request.getAttribute("TOMM")).equalsIgnoreCase("APR"))?" SELECTED ":"" %>>4</OPTION>
<OPTION value="MAY" <%=(request.getAttribute("TOMM")!=null && ((String)request.getAttribute("TOMM")).equalsIgnoreCase("MAY"))?" SELECTED ":"" %>>5</OPTION>
<OPTION value="JUN" <%=(request.getAttribute("TOMM")!=null && ((String)request.getAttribute("TOMM")).equalsIgnoreCase("JUN"))?" SELECTED ":"" %>>6</OPTION>
<OPTION value="JUL" <%=(request.getAttribute("TOMM")!=null && ((String)request.getAttribute("TOMM")).equalsIgnoreCase("JUL"))?" SELECTED ":"" %>>7</OPTION>
<OPTION value="AUG" <%=(request.getAttribute("TOMM")!=null && ((String)request.getAttribute("TOMM")).equalsIgnoreCase("AUG"))?" SELECTED ":"" %>>8</OPTION>
<OPTION value="SEP" <%=(request.getAttribute("TOMM")!=null && ((String)request.getAttribute("TOMM")).equalsIgnoreCase("SEP"))?" SELECTED ":"" %>>9</OPTION>
<OPTION value="OCT" <%=(request.getAttribute("TOMM")!=null && ((String)request.getAttribute("TOMM")).equalsIgnoreCase("OCT"))?" SELECTED ":"" %>>10</OPTION>
<OPTION value="NOV" <%=(request.getAttribute("TOMM")!=null && ((String)request.getAttribute("TOMM")).equalsIgnoreCase("NOV"))?" SELECTED ":"" %>>11</OPTION>
<OPTION value="DEC" <%=(request.getAttribute("TOMM")!=null && ((String)request.getAttribute("TOMM")).equalsIgnoreCase("DEC"))?" SELECTED ":"" %>>12</OPTION>
</SELECT>
<SELECT name="TOYYYY">
<OPTION VALUE="0">YYYY</OPTION>
<%
for(int i=year;i<=year+1;i++) { %>
<OPTION value="<%=i%>" <%=(request.getAttribute("TOYYYY")!=null && ((String)request.getAttribute("TOYYYY")).equalsIgnoreCase(i+""))?" SELECTED ":"" %>><%=i%></OPTION>
<%} %>
</SELECT>
</td>
</tr>
<tr>
<td colspan="3" align="center">
<input type="submit" value="ISSUE FITNESS">
</td>
</tr>

<tr><td colspan="3">&nbsp;</td></tr>
<tr>
<td colspan="3">
<font size="3"><a href="managerIssueFitness.jsp">Back</a></font>
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
<center>Vehicle Registration Not Found.&nbsp;<font size="3"><a href="managerIndex.jsp">Back</a></font></center>
<%
}
	rs.close();
	stmt.close();
	rs2.close();
	stmt2.close();
	con.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
 %>
 </form>
</body>
</html>
