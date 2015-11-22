<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%!
Connection con;
Driver dr;
%>
<%
		boolean firstLoad = true;  
		dr=new oracle.jdbc.driver.OracleDriver();
		DriverManager.registerDriver(dr);
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","checkpost","checkpost");
		String sql = "SELECT USER_ID, PASSWORD from empauthorization where USER_ID =? ";
		String USERNAME=request.getParameter("USERNAME");
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, USERNAME);
		ResultSet rs = ps.executeQuery();
		
		rs.close();
		con.close();
%>

<html>
<head><center>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>CHANGE PASSWORD</title>
</head>																										
<head><title>CHANGE PASSWORD</title></head>
<table align="center">
<body bgcolor="lightpink">
<center>
<font type="arial" color="blue" font size="15">CHANGE PASSWORD</font></center>
<form name="CHANGING PASSWORD" action="CHANGE PASSWORD.jsp" type="post"/>



<tr>
<td>
USER ID:
</td>
<td>
<input type=text name="USER ID" size=10>
</td>
</tr>

</br>

<tr>
<td>
USER Name:
</td>
<td>
<input type=text name="USER NAME" size=30>
</td>
</tr>

<tr>
<td>
Old Password:
</td>
<td>
<input type=pwd name="old password" size=20>
</td>
</tr>
</br>

<tr>
<td>
New Password:
</td>
<td>
<input type=pwd name="new password" size=20>
</td>
</tr>
</br>

<tr>
<td>
CONFIRM PASS:
</td>
<td>
<input type=text name="CONFIRM PASS" size=20>
</td>
</tr>



<tr>
<td>
</td>
<td>
<input type="submit" value="SUBMIT"/>
</td>
<td>
<input type="submit" value="CANCEL"/>
</td>
</tr>

<td><br><br>
<font size="2"><a href="login.jsp">Login</a> 
</td>
</tr>

</table>
</form>
</body>
</html>














































































































