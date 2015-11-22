<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%

  if(session.getAttribute("ID")==null || session.getAttribute("USERID")==null) {
  	request.setAttribute("response", "Please Login.");
  	request.getRequestDispatcher("index.jsp").forward(request,response);
  }
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>HOME PAGE</title>
<link href="styles.css" rel="stylesheet" type="text/css" />
<SCRIPT LANGUAGE="JavaScript">

function openindex(matter)
      {
newWindow = window.open('','newWin','toolbar=yes,location=yes,scrollbars=yes,status=yes,width=630,height=400')
newWindow.document.write("<HTML>< HEAD>< TITLE>New Page From the Ozone!</TITLE>< /HEAD>< BODY bgcolor='#FFFFFF' text='#000000' background='../Images/RoughGrey.gif'>< DIV ALIGN='center' /BODY< /HTML> ")
newWindow.document.close
     }
</SCRIPT>
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
					<font color="white"><strong class="test2">ENHANCED CHECK-POST CLEARANCE AND FAST TRACK MONITORING SYSTEM</strong></font>
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
<form name="customer" action="customerViewFitnessAction.jsp" method="POST"/>
<table align="center" border="0">
<tr>
<td colspan="3" align="center"><%=(request.getAttribute("response")!=null)?"* "+request.getAttribute("response"):""%></td>
</tr>
</table>
<table align="center" STYLE="border:3px solid blue" border="1">
<tr>
<td colspan="3" align="center">
<font type="arial" color="blue" font size="4">
<b>VIEW FITNESS PAGE</b></font><br/>
<img src="main.jpg" width="400" height="175">
</td>
</tr>
<tr>
<td colspan="3">
<table  align="center" cellpadding="0" cellspacing="3" border="0">
<%
	try {
if(request.getAttribute("STATUS")==null) {

		Connection con = OracleDriver.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT REG_VEHICLE.*, (SELECT MAX(ID) FROM APPLYFITNESS WHERE STATUS!='OPEN'  AND REG_ID=REG_VEHICLE.ID) AS FITNESSID FROM REG_VEHICLE WHERE cust_id="+session.getAttribute("ID"));
%>
<tr>
<td align="left">VEHICLE NAME</td>
<td width="2">&nbsp;</td>
<td width="10">
<SELECT name="FITNESSID">
<OPTION VALUE="0">---SELECT---</OPTION>
<%while(rs.next()) { %>
<OPTION value="<%=rs.getInt("FITNESSID")%>"><%=rs.getString("ENG_NO")+"-"+rs.getString("CHASIS_NO")+"-"+rs.getString("BIKE_NAME")%></OPTION>
<%} %>
</SELECT>
</td>
</tr>
<tr>
<td colspan="3" align="center">
<input type="submit" value="VIEW FITNESS">
</td>
</tr>
<%} else if(request.getAttribute("STATUS").equals("ACCEPT")) { %>
<tr>
<td colspan="3"><%=request.getAttribute("PRINT_MATTER")%></td>
</tr>
<%} else { %>
<tr>
<td colspan="3">
Reject due to the following reason:</br>
Vehicle Registration Status  : <%=request.getAttribute("REG_VALID")%></br>
Vehicle Pollution Status     : <%=request.getAttribute("POLUTION_VALID")%></br>
Vehicle Break Status         : <%=request.getAttribute("BREAKS_VALID")%></br>
Vehicle Condition Status     : <%=request.getAttribute("CONDITION_VALID")%></br>
Vehicle Condition Reason     : <%=request.getAttribute("COND_REJECT_DETAILS")%></br>
</td>
</tr>
<%} %>
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
	} 
	
	catch(Exception e) {
		System.out.println(e);
	}
 %>
</body>
</html>
