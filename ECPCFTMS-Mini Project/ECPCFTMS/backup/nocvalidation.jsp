<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%><html>
<%!
Connection con;
Driver dr;
%>
<head><center>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>NOC VALIDATION</title>
</head>																										
<head><title>NOC VALIDATION</title></head>
<table align="center">
<body bgcolor="lightpink">
<center>
<font type="arial" color="blue" font size="15">NOC VALIDATION</font></center>
<form method="POST" name="NOC VALIDATION" action="nocvalidation.jsp" type="post"/>
<%

		 dr=new oracle.jdbc.driver.OracleDriver();
		DriverManager.registerDriver(dr);
		 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","system","welcome");
		String sql = "SELECT REG_NO,NAME,ADDR,CLASS_OF_VEHICLE,ENGIN_NO,CHASIS_NO,ANY_THEFT_CASE from nocvalidation where reg_no=?";
		String REG_NO1=request.getParameter("REG_NO");
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, REG_NO1);
		ResultSet rs = ps.executeQuery();
		String REG_NO ="";
		String NAME ="";
	  	String ADDR ="";
		String CLASS_OF_VEHICLE="";
		String ENGIN_NO="";
		String CHASIS_NO="";
		String ANY_THEFT_CASE="";
		
		
		
		
				
		while (rs.next()) 
				{
				REG_NO = rs.getString(1);
			    NAME= rs.getString(2);
				ADDR = rs.getString(3);
				CLASS_OF_VEHICLE= rs.getString(4);
		        ENGIN_NO= rs.getString(5);
		        CHASIS_NO= rs.getString(6);
		        ANY_THEFT_CASE= rs.getString(7);
				
				
				
				
				
				
			   	}
				rs.close();
	con.close();
	
%>


<tr>

RegNo:
<td></td>

<input type=text name="REG_NO" value='<%out.println(REG_NO);%>'size=10>

</tr>
</br>

<tr>
<td></td>
<td>
</td>

<input type="submit" value="submit"/>

<input type="submit" value="CANCEL"/>
</tr>

<br>
</br>

<DIV style="border:1px solid red;background-color:#ffeeee">
<%
if(REG_NO.equals(""))
	{
		out.println("Please enter a  Valid Registration Number");
	}
%> 
</DIV>

<tr>
<td>
Name:
</td>
<td>
<input type=text name="NAME" value='<%out.println(NAME);%>'size=30>
</td>
</tr>



<tr>
<td>
Address:
</td>
<td>
<input type=description name="ADDR" value='<%out.println(ADDR);%>'size=30>
</td>
</tr>



<tr>
<td>
Class of Veh:
</td>
<td>
<input type=text name="CLASS_OF_VEHICLE" value='<%out.println(CLASS_OF_VEHICLE);%>' size=30>
</td>
</tr>
</br>

<tr>
<td>
EnginNo:
</td>
<td>
<input type=text name="ENGIN_NO" value='<%out.println(ENGIN_NO);%>'size=30>
</td>
</tr>

<tr>
<td>
Chasis No:
</td>
<td>
<input type=text name="CHASIS_NO" value='<%out.println(CHASIS_NO);%>' size=30>
</td>
</tr>



<tr>
<td>
Any Theft Case:
</td>
<td>
<select name="ANY_THEFT_CASE" value='<%out.println(ANY_THEFT_CASE);%>'>
<option>Yes</option>
<option>No</option>
</select>
</td>
</tr>






</table>
</form>
</body>
</html>




























































































































































































