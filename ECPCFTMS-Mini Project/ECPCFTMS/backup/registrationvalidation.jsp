<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%><html>
<%!
Connection con;
Driver dr;
%>
<head><center>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>REGISTRATION VALIDATION</title>
</head>																										
<head><title>REGISTRATION VALIDATION</title></head>
<table align="center">
<body bgcolor="lightpink">
<center>
<font type="arial" color="blue" font size="5">REGISTRATION VALIDATION</font></center>
<form method="GET" name="REGISTRATION VALIDATION" action="registrationvalidation.jsp" type="GET"/>
<%

		 dr=new oracle.jdbc.driver.OracleDriver();
		DriverManager.registerDriver(dr);
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","system","welcome");
		String sql = "SELECT REG_NO, NAME,AGE,ADDR,CLASS_OF_VEHICLE,TYPE_OF_BODY,REG_DATE,COLOR,TYPE_VEHICLE,CHASIS_NO,ENGIN_NO,NATIONALITY from regvalidation where REG_NO =? ";
		String REG_NO1=request.getParameter("REG_NO");
		
		PreparedStatement ps = con.prepareStatement(sql);
				
		ps.setString(1, REG_NO1);
		ResultSet rs = ps.executeQuery();
		String REG_NO="";
		String NAME= "";
		String AGE= "";
		String ADDR= "";
		String CLASS_OF_VEHICLE= "";
		String TYPE_OF_BODY= "";
		String REG_DATE = "";
		String COLOR= "";
	    String TYPE_VEHICLE= "";
		String CHASIS_NO = "";
		String ENGIN_NO= "";
		String NATIONALITY= "";
				while (rs.next()) 
				{
				REG_NO=rs.getString(1);
				NAME= rs.getString(2);
			    AGE = rs.getString(3);
				ADDR= rs.getString(4);
				CLASS_OF_VEHICLE = rs.getString(5);
				TYPE_OF_BODY= rs.getString(6);
				REG_DATE = rs.getString(7);
				COLOR= rs.getString(8);
				TYPE_VEHICLE=rs.getString(9);
				CHASIS_NO= rs.getString(10);
				ENGIN_NO = rs.getString(11);
				NATIONALITY= rs.getString(12);
				 
			   
		        }
	rs.close();
	con.close();
	
%>


<tr>

RegNo:
<td></td>

<input type=text name="REG_NO" value='<%out.println(REG_NO);%>' size=10>

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
RegNo:
</td>
<td>
<input type=text name="REG_NO1" value='<%out.println(REG_NO);%>' size=20>
</td>
</tr>

<tr>
<td>
Name:
</td>
<td>
<input type=text name="NAME" value='<%out.println(NAME);%>' size=20>
</td>
</tr>

<tr>
<td>
Age:
</td>
<td>
<input type=text name="AGE" value='<%out.println(AGE);%>' size=20>
</td>
</tr>




<tr>
<td>
Address:
</td>
<td>
<input type=description name="ADDR" value='<%out.println(ADDR);%>' size=20>
</td>
</tr>

<tr>
<td>
Class of Veh:
</td>
<td>
<input type=description name="CLASS_OF_VEHICLE" value='<%out.println(CLASS_OF_VEHICLE);%>' size=20>
</td>
</tr>

<tr>
<td>
Type of Body:
</td>
<td>
<input type=description name="TYPE_OF_BODY" value='<%out.println(TYPE_OF_BODY);%>' size=20>
</td>
</tr>

<tr>
<td>
Reg Date:
</td>
<td>
<input type=text name="REG_DATE" value='<%out.println(REG_DATE);%>' size=20>
</td>
</tr>

<tr>
<td>
Color:
</td>
<td>
<input type=text name="COLOR" value='<%out.println(COLOR);%>' size=20>
</td>
</tr>

<tr>
<td>
Type of veh:
</td>
<td>
<input type=text name="TYPE_VEHICLE" value='<%out.println(TYPE_VEHICLE);%>' size=20>
</td>
</tr>




<tr>
<td>
Chasis no:
</td>
<td>
<input type=text name="CHASIS_NO" value='<%out.println(CHASIS_NO);%>' size=20>
</td>
</tr>

<tr>
<td>
EnginNo:
</td>
<td>
<input type=text name="ENGIN_NO" value='<%out.println(ENGIN_NO);%>' size=20>
</td>
</tr>



<tr>
<td>
Nationality:
</td>
<td>
<input type=text name="NATIONALITY" value='<%out.println(NATIONALITY);%>' size=20>
</td>
</tr>




</table>
</form>
</body>
</html>




























































































































































































