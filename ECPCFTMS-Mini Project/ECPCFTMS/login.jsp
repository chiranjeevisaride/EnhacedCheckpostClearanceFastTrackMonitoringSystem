<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>LOGIN PAGE</title>
</head>																										
<body bgcolor="lightpink">
<center>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%!
Connection con;
Connection con1;
Driver dr;
%>

<jsp:include page="imgsrc.jsp" />
<table align="center" STYLE="border:3px solid blue">
<tr>
<td colspan=3  BORDER=1 align="center">

<font type="arial" color="blue" font size="5"><b>LOGIN PAGE<b></font></center>
<form name="CREATING NEW USER" action="login.jsp" type="post"/>

<DIV style="border:1px solid red;background-color:#ffeeee">

<%
		boolean firstLoad = true;  
		dr=new oracle.jdbc.driver.OracleDriver();
		DriverManager.registerDriver(dr);
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","checkpost","checkpost");
		String sql = "SELECT USER_ID, PASSWORD from empauthorization where USER_ID =? AND PASSWORD =?";
		String USERNAME=request.getParameter("USERNAME");
		String PASSWORD=request.getParameter("PASSWORD");
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, USERNAME);
		ps.setString(2, PASSWORD);
		ResultSet rs = ps.executeQuery();
		String userExists = "";
		
		while(rs.next()) 
		{
			userExists = rs.getString(1);
		}
		rs.close();
		con.close();
%>

<%
if( userExists.equals("") )
{
	if(USERNAME == null)
	{
	   //first time load do nothing.
	}
	else
	{ 
		out.println("Invalid username and password");
	}
}
else
{
	session.setAttribute("loginstatus","true");
	pageContext.forward("CHECKPOSTADMINHOMEPAGE.jsp");
}
	
%> 
</DIV>
<img src="main.jpg" width="400" height="175">

<table colspan="3" align="center">
<tr>
<td>USERID</td>
<td><input type=text name="USERNAME" size=15></td>
</tr>
<tr>
<td>PASSWORD:</td>
<td><input type=password name="PASSWORD" size=15></td>
</tr>




<td><input type="submit" value=LOGIN></td>
<td><input type="reset" value="CANCEL"></td></tr>
<tr>
<td><br><br>
<font size="2"><a href="CREATE NEW USER.jsp">CREATE NEW USER</a> 

&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;
</td><td><br><br>
<font size="2"><a href="CHANGE PASSWORD.jsp">CHANGE PASSWORD</a> 
</td>
</tr>
</form></center>
</td></tr></table>
</html>
