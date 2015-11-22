<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>CREATING NEW USER</title>
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

<font type="arial" color="blue" font size="5"><b>CREATING NEW USER<b></font></center>
<form name="CREATING NEW USER" action="CREATE NEW USER.jsp" type="post"/>



<%

        
	
        dr=new oracle.jdbc.driver.OracleDriver();
		DriverManager.registerDriver(dr);
		con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","checkpost","checkpost");
		String sql1 = "SELECT user_id from empauthorization where user_id =? ";
		
		String USERID=request.getParameter("USERID");
		String USERNAME=request.getParameter("USERNAME");
		String PASSWORD=request.getParameter("PASSWORD");
		String CONFIRMPASSWORD=request.getParameter("CONFIRMPASS");
		String ROLE=request.getParameter("ROLE");
		PreparedStatement ps1 = con1.prepareStatement(sql1);
				
		ps1.setString(1, USERID);
		ResultSet rs1 = ps1.executeQuery();	
		String USER_ID1="";
		while (rs1.next()) 
				{
				USER_ID1=rs1.getString(1);
				}
				rs1.close();
				con1.close();
				
		if (USERID != null && USERID.equals(USER_ID1))
		{
		out.println("User Exists Already, please Enter Different userid");
		}
		else if (USERID != null && USERID.equals(""))
		{
		out.println("Please enter a valid userid");
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
		else if (CONFIRMPASSWORD != null && !CONFIRMPASSWORD.equals(PASSWORD))
		{
		out.println("Confirm password should be equal to password");
		}
		else if (ROLE != null && ROLE.equals(""))
		{
		out.println("Please enter a valid role");
		}		
		else if (USERID != null && USERNAME != null && PASSWORD != null && CONFIRMPASSWORD != null && ROLE != null)
		{
		dr=new oracle.jdbc.driver.OracleDriver();
		DriverManager.registerDriver(dr);
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","checkpost","checkpost");

		String sql = "insert into empauthorization  values(?,?,?,?,?)";
	
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(2, USERNAME);
		ps.setString(1, USERID);
		ps.setString(3, PASSWORD);
		ps.setString(4, CONFIRMPASSWORD);
		ps.setString(5, ROLE);
						
	    ps.executeQuery();		
        out.println("User Created Successfully");		
		con.close();
	 }


%>
</td>

</tr>
<td rowspan="9">
<img src="create.jpg">
<br>

</td>
<tr>
<td>
USER ID
</td>
<td>
<input type=text name="USERID" value='<%out.println(USERID);%>' size=30>
</td>
</tr>

<tr>
<td>
USER NAME
</td>
<td>
<input type=text name="USERNAME" value='<%out.println(USERNAME);%>' size=30>
</td>
</tr>

<tr>
<td>
PASSWORD
</td>
<td>
<input type=password name="PASSWORD" value='<%out.println(PASSWORD);%>' size=30>
</td>
</tr>
</br>

<tr>
<td>
CONFIRM PASSWORD
</td>
<td>
<input type=password name="CONFIRMPASS" value='<%out.println(CONFIRMPASSWORD);%>' size=30>
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




<TABLE ALIGN=CENTER WIDTH="100"
<tr>
<td>
<input type="submit" value="create"/>
</td>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;
<td>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;
<input type="submit" value="CANCEL"/>
</td>
</tr>
</table>
<tr>
<td colspan=3 align="center"><br><br>
<font size="5"><a href="login.jsp">Login</a> 
</td>
</tr>

</table>
</form>
</body>
</html>