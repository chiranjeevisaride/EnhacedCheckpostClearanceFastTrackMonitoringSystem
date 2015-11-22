<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>CHANGE PASSWORD</title>
</head>																										
<body bgcolor="lightpink">
<center>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%><html>
<%!
Connection con;
Driver dr;
%>

<jsp:include page="imgsrc.jsp" />
<table align="center" STYLE="border:3px solid blue">
<tr>
<td colspan=3  BORDER=1 align="center">

<font type="arial" color="blue" font size="5"><b>CHANGING PASSWORD<b></font>
<form name="CHANGING PASSWORD" action="CHANGE PASSWORD.jsp" type="post"/>

<%
		boolean firstLoad = true;  
		dr=new oracle.jdbc.driver.OracleDriver();
		DriverManager.registerDriver(dr);
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","checkpost","checkpost");
		String sql = "SELECT USER_ID, user_name,PASSWORD ,confirm_pass from empauthorization where USER_ID =? ";
		String USERID1=request.getParameter("USERID");
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, USERID1);
		ResultSet rs = ps.executeQuery();
		
		String USERNAME="";
		String USERID="";
		String PASSWORD="";
		String CONFIRMPASS="";
		String new_password=request.getParameter("new_password");
		String old_password=request.getParameter("old_password"); 
		
				while (rs.next()) 
				{
				USERID=rs.getString(1);
				USERNAME=rs.getString(2); 
                PASSWORD=rs.getString(3);
				CONFIRMPASS=rs.getString(4);               		
			   		
    }	
rs.close();
               // out.println(" Current Password ="+PASSWORD);
				// out.println(" Entered PAssword is ="+old_password); 
			
				if ( PASSWORD.equals(old_password))
				
                   {	
				   	   
				        String sql1="update empauthorization set password=? ,confirm_pass=? where user_id=? ";
						String USERID2=request.getParameter("USERID");
						String PASSWORD1=request.getParameter("PASSWORD");
						String newpass=request.getParameter("new_password");
						String confirmpass=request.getParameter("CONFIRM_PASS");
						if ( !newpass.equals(confirmpass))
						   {
						     out.println(" New password and Confirm password should be same" );
							 }
							 else
							 {
						PreparedStatement ps1 = con.prepareStatement(sql1);
		                ps1.setString(1,newpass);
						ps1.setString(2,confirmpass);
						ps1.setString(3,USERID2);
						ResultSet rs1 = ps1.executeQuery();
						out.println(" Password changed successfully" );
		                rs1.close();
						
						}
					  }                  				   
				  else
				   {
				   
				  // out.println("Current passwords is invalid ");
				   }
		
		con.close();
		
%>
</td>
</tr>
<td rowspan="6">
<img src="change_pwd.jpg"  width="200" height="150" >

</td

<tr>
<td>
USER ID
</td>
<td>
<input type=text name="USERID" value='<%out.println(USERID);%>' size=20>
</td>
</tr>

</br>
<td colspan=3 align="center">
<DIV style="border:1px solid red;background-color:#ffeeee">
<%
if(USERID.equals(""))
	{
		out.println("Please enter a  Valid USERID");
	}
%> 
</DIV>
</td>



<tr>
<td>
OLD PASSWORD
</td>
<td>
<input type="password" name="old_password" size=20>
</td>
</tr>
</br>


<tr>
<td>
NEW PASSWORD
</td>
<td>
<input type="password" name="new_password"  size=20>
</td>
</tr>
</br>

<tr>
<td>
CONFIRM PASSWORD
</td>
<td>
<input type="password" name="CONFIRM_PASS" size=20>
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

<td colspan=3 align="center"><br><br>
<font size="5"><a href="login.jsp">Login</a> 
</td>
</tr>

</table>
</form>
</body>
</html>














































































































