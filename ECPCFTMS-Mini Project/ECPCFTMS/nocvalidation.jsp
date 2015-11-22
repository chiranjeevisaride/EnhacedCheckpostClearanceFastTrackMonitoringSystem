<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>NOC VALIDATION</title>
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
<table align="center"  STYLE="border:3px solid blue">
<tr>
<td colspan=3  BORDER=1 align="center">

<font type="arial" color="blue" font size="5"><b>NOC VALIDATION<b></font></center>
<form method="POST" name="NOC VALIDATION" action="nocvalidation.jsp" type="post"/>

<%

		 dr=new oracle.jdbc.driver.OracleDriver();
		DriverManager.registerDriver(dr);
		 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","checkpost","checkpost");
		String sql = "SELECT REG_NO,NAME,ADDR,CLASS_OF_VEHICLE,ENGIN_NO,CHASIS_NO,ANY_THEFT_CASE,tax_pending,issued_date from nocvalidation where reg_no=?";
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
		String tax_pending="";
		String issue_date="";
		
		
		
		
				
		while (rs.next()) 
				{
				REG_NO = rs.getString(1);
			    NAME= rs.getString(2);
				ADDR = rs.getString(3);
				CLASS_OF_VEHICLE= rs.getString(4);
		        ENGIN_NO= rs.getString(5);
		        CHASIS_NO= rs.getString(6);
		        ANY_THEFT_CASE= rs.getString(7);
				tax_pending=rs.getString(8);
				issue_date=rs.getString(9);
				
				
				
				
				
				
				
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
<img src="truck1.jpg">



</td>
<td>
<tr>
<td>
NAME
</td>
<td>
<input type=text name="NAME" value='<%out.println(NAME);%>'size=30>
</td>
</tr>



<tr>
<td>
ADDRESS
</td>
<td>
<input type=description name="ADDR" value='<%out.println(ADDR);%>'size=30>
</td>
</tr>



<tr>
<td>
CLASS OF VEHICLE
</td>
<td>
<input type=text name="CLASS_OF_VEHICLE" value='<%out.println(CLASS_OF_VEHICLE);%>' size=30>
</td>
</tr>
</br>

<tr>
<td>
ENGINE NUMER
</td>
<td>
<input type=text name="ENGIN_NO" value='<%out.println(ENGIN_NO);%>'size=30>
</td>
</tr>

<tr>
<td>
CHASIS NUMBER
</td>
<td>
<input type=text name="CHASIS_NO" value='<%out.println(CHASIS_NO);%>' size=30>
</td>
</tr>



<tr>
<td>
ANY THEFT CASE
</td>
<td>
<input type=text name="ANY_THEFT_CASE" value='<%out.println(ANY_THEFT_CASE);%>' size=5>
</td>
</tr>

<tr>
<td>
TAX PENDING
</td>
<td>
<input type=text name="TAX_PENDING" value='<%out.println(tax_pending);%>' size=5>
</td>
</tr>

<tr>
<td>
ISSUED DATE
</td>
<td>
<input type=text name="ISSUE_DATE" value='<%out.println(issue_date);%>' size=30>
</td>
</tr>




</table>
</form>
</body>
</html>
<tr>
<jsp:include page="tabinc.jsp" />
</tr>




























































































































































































