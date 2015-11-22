<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

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
<td colspan="3" align="center">
<font type="arial" color="blue" font size="4">
<b>VEHICLE FINES PAGE</b></font><br/>
<img src="main.jpg" width="800" height="5">
</td>
</tr>
<tr>
<td colspan="3">
<table width="30" align="center" cellpadding="1" cellspacing="0" border="1">
<tr>
<td align="center"><b>PENALITY DATE</b></td>
<td align="center"><b>PENALITY TIME</b></td>
<td align="center"><b>FINE AMOUNT</b></td>
<td align="center"><b>PAID AMOUNT</b></td>
<td align="center"><b>NOC CLEAR</b></td>
<td align="center"><b>FITNESS CLEAR</b></td>
<td align="center"><b>REGISTRATION CLEAR</b></td>
<td align="center"><b>PERMIT CLEAR</b></td>
<td align="center"><b>OTHER CLEAR</b></td>
<td align="center"><b>OTHER DESCRIPTION</b></td>
</tr>
<%
	try {
		Connection con = OracleDriver.getConnection();
		String sql = "SELECT * FROM PENALITY WHERE REG_NO=?";
		PreparedStatement stmt12 = con.prepareStatement(sql);
		stmt12.setString(1,request.getParameter("ID"));
		ResultSet rs = stmt12.executeQuery();
		while(rs.next()) {		
	%>
<tr>
<td align="center"><%=rs.getString("PENALITY_DATE")%></td>
<td align="center"><%=rs.getString("PENALITY_TIME")%></td>
<td align="center"><%=rs.getString("FINE_AMT")%></td>
<td align="center"><%=rs.getString("PAID_AMT")%></td>
<td align="center"><%=rs.getString("NOC")%></td>
<td align="center"><%=rs.getString("FITNESS")%></td>
<td align="center"><%=rs.getString("REG")%></td>
<td align="center"><%=rs.getString("PERMIT")%></td>
<td align="center"><%=rs.getString("OTHER")%></td>
<td align="center"><%=rs.getString("OTHER_DESC")%></td>
</tr>

<%
}
		} catch(Exception e) {}
	 %>
</table>
</td>
</tr>
</table>
</div>
</form>
</body>
</html>
