
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%!
Connection con;
Driver dr;
%>

<jsp:include page="imgsrc.jsp" />
<html>
<html>
<head><center>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>CREATING NEW USER</title>
</head>																										
<head><title>CREATING NEW USER</title></head>
<table align="center">
<body bgcolor="lightpink">
<center>
<br>
<font type="arial" color="blue" font size="5"><b>CREATING NEW USER<b></font></center>
<form name="CREATING NEW USER" action="CREATE NEW USER.jsp" type="post"/>
<b>


<%
       // SUSERID=request.getParameter("USERID");
        String USERID=request.getParameter("USERID");
		String USERNAME=request.getParameter("USERNAME");
		String PASSWORD=request.getParameter("PASSWORD");
		String CONFIRMPASSWORD=request.getParameter("CONFIRMPASS");
		String ROLE=request.getParameter("ROLE");
		out.println("New user id enterted is ="+USERID);
		
		if (USERID != null && USERID.equals(""))
		{
		out.println("Please enter a valid userid");
		}
		else if (USERID != null && USERID.equals(USERID))
		{
		out.println("User already exists" );
		}
		else if (USERNAME != null && USERNAME.equals(""))
		{
		out.println("Please enter a valid user name");
		}
		else if (PASSWORD != null && PASSWORD.equals(""))
		{
		out.println("Please enter a valid password");
		}
		else if (CONFIRMPASSWORD != null && CONFIRMPASSWORD.equals(""))
		{
		out.println("Please enter a valid confirm password");
		}
		else if (ROLE != null && ROLE.equals(""))
		{
		out.println("Please enter a valid role");
		}		
		else if (USERID != null && USERNAME != null && PASSWORD != null && CONFIRMPASSWORD != null && ROLE != null)
		{
		dr=new oracle.jdbc.driver.OracleDriver();
		DriverManager.registerDriver(dr);
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","system","welcome");
		String sql = "insert into empauthorization  values(?,?,?,?,?)";
	
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(2, USERNAME);
		ps.setString(1, USERID);
		ps.setString(3, PASSWORD);
		ps.setString(4, CONFIRMPASSWORD);
		ps.setString(5, ROLE);
						
	    ps.executeQuery();		 
		con.close();
	 }


%>

USER ID
</td>
<td>
<input type=text name="USERID" value='<%out.println(USERID);%>' size=20>
</td>
</tr>

<tr>
<td>
USER NAME
</td>
<td>
<input type=text name="USERNAME" value='<%out.println(USERNAME);%>' size=20>
</td>
</tr>

<tr>
<td>
PASSWORD
</td>
<td>
<input type=password name="PASSWORD" value='<%out.println(PASSWORD);%>' size=20>
</td>
</tr>
</br>

<tr>
<td>
CONFIRM PASS
</td>
<td>
<input type=password name="CONFIRMPASS" value='<%out.println(CONFIRMPASSWORD);%>' size=20>
</td>
</tr>

<tr>
<td>
ROLE
</td>
<td>
<select name="ROLE">

<option <%if (ROLE != null && ROLE.equals("MANAGER")) out.println("selected"); %> >MANAGER</option>
<option <%if (ROLE != null && ROLE.equals("ADMIN")) out.println("selected"); %>>ADMIN</option>
<option <%if (ROLE != null && ROLE.equals("CLERK")) out.println("selected"); %>>CLERK</option>
</select>

</td>
</tr>

<tr>
<td>
</td>
<td>

<br>
<input type="submit"  value="create" align="right"/>
</td>

<td>
<br>
<input type="submit" value="CANCEL"/>


</td>
</tr>

<td><br><br>
<font size="5"><a href="login.jsp">Login</a> 
</td>
</tr>

</table>
</form>
</body>
</html>