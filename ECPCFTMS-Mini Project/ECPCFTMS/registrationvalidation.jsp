<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>REGISTRATION VALIDATION</title>
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

<font type="arial" color="blue" font size="5"><b>REGISTRATION VALIDATION</b></font>
<form name="REGISTRATION VALIDATION" action="registrationvalidation.jsp" type="post"/>


<%

		 dr=new oracle.jdbc.driver.OracleDriver();
		DriverManager.registerDriver(dr);
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","checkpost","checkpost");
		String sql = "SELECT REG_NO, NAME,AGE,ADDR,CLASS_OF_VEHICLE,TYPE_OF_BODY,REG_DATE,COLOR,TYPE_VEHICLE,CHASIS_NO,ENGIN_NO,NATIONALITY from regvalidation where REG_NO =? ";
		String REG_NO1=request.getParameter("REG_NO");
		System.out.println(REG_NO1);
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
</td>
</tr>
<tr>

<td colspan=3 align="center">REGISTRATION NUMBER

<input type=text name="REG_NO"   value='<%out.println(REG_NO);%>' size=20>
</td>

</tr>

<tr>
<td colspan=3 align="center">

<input type="submit" value="submit"/>

<input type="submit" value="CANCEL"/>

</td>
</tr>
<tr>
<td colspan=3 align="center">
<DIV style="border:1px solid red;background-color:#ffeeee">
<%
if(REG_NO.equals(""))
	{
		out.println("Please enter a  Valid Registration Number");
	}
%> 
</DIV>
</td>
</tr>


<tr>
<td rowspan="12">
<img src="rc.jpg">


</td>
<td>
REGISTRATION NUMBER
</td>
<td>
<input type=text name="REG_NO1" value='<%out.println(REG_NO);%>' size=20>
</td>
</tr>

<tr>
<td>
NAME
</td>
<td>
<input type=text name="NAME" value='<%out.println(NAME);%>' size=20>
</td>
</tr>

<tr>
<td>
AGE
</td>
<td>
<input type=text name="AGE" value='<%out.println(AGE);%>' size=20>
</td>
</tr>




<tr>
<td>
ADDRESS
</td>
<td>
<input type=description name="ADDR" value='<%out.println(ADDR);%>' size=20>
</td>
</tr>

<tr>
<td>
CLASS OF VEHICLE
</td>
<td>
<input type=description name="CLASS_OF_VEHICLE" value='<%out.println(CLASS_OF_VEHICLE);%>' size=20>
</td>
</tr>

<tr>
<td>
TYPE OF BODY
</td>
<td>
<input type=description name="TYPE_OF_BODY" value='<%out.println(TYPE_OF_BODY);%>' size=20>
</td>
</tr>

<tr>
<td>
REG DATE
</td>
<td>
<input type=text name="REG_DATE" value='<%out.println(REG_DATE);%>' size=20>
</td>
</tr>

<tr>
<td>
COLOUR
</td>
<td>
<input type=text name="COLOR" value='<%out.println(COLOR);%>' size=20>
</td>
</tr>

<tr>
<td>
TYPE OF VEHICLE
</td>
<td>
<input type=text name="TYPE_VEHICLE" value='<%out.println(TYPE_VEHICLE);%>' size=20>
</td>
</tr>




<tr>
<td>
CHASIS NUMBER
</td>
<td>
<input type=text name="CHASIS_NO" value='<%out.println(CHASIS_NO);%>' size=20>
</td>
</tr>

<tr>
<td>
ENGINE NO
</td>
<td>
<input type=text name="ENGIN_NO" value='<%out.println(ENGIN_NO);%>' size=20>
</td>
</tr>



<tr>
<td>
NATIONALITY
</td>
<td>
<input type=text name="NATIONALITY" value='<%out.println(NATIONALITY);%>' size=20>
</tr>

</table>
<BR/><BR/>
<jsp:include page="tabinc.jsp" />
</center>
</form>

</body>
</html>