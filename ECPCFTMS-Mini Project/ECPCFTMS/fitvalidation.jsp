<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>FITNESS VALIDATION</title>
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

<font type="arial" color="blue" font size="5"><b>FITNESS VALIDATION<b></font></center>
<form method="POST" name="FITNESS VALIDATION" action="fitvalidation.jsp" type="post"/>


<%

		dr=new oracle.jdbc.driver.OracleDriver();
		DriverManager.registerDriver(dr);
	    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","checkpost","checkpost");
		String sql = "SELECT REG_NO,NAME,ADDR,DOB,ENGIN_NO,FITNESS_ISSUE_DATE,REG_YEAR,fitness_expiry ,break_working,pollution_free from fitvalidation where REG_NO=?";
		String REG_NO1=request.getParameter("RegNo");
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, REG_NO1);
		ResultSet rs = ps.executeQuery();
		String RegNo = "";
		String name = "";
		String addr = "";
		String DOB= "";
		String engin_no="";
		String fitness_issue_date="";
		String regyear="";
		String fitnessexpiry="";
		String breakworking="";
		String pollutionfree="";
			
		
		while (rs.next()) 
				{
				RegNo = rs.getString(1);
			    name= rs.getString(2);
				addr= rs.getString(3);
				DOB=rs.getString(4);
				engin_no=rs.getString(5);
				fitness_issue_date=rs.getString(6);
				regyear=rs.getString(7);
				fitnessexpiry=rs.getString(8);
			    breakworking=rs.getString(9);
				pollutionfree=rs.getString(10);
		}
		rs.close();
	con.close();
	
%>

</td>
</tr>
<tr>

<td colspan=3 align="center">REGISTRATION NUMBER

<input type=text name="RegNo"   value='<%out.println(RegNo);%>' size=20>
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
if(RegNo.equals(""))
	{
		out.println("Please enter a  Valid Registration Number");
	}
%> 
</DIV>
</td>
</tr>


<td rowspan="12">
<img src="noc1.jpg">
<br>
<img src="noc2.jpg">
<tr>
<td>
REGISTRATION NUMBER
</td>
<td>
<input type=text name="RegNo" value='<%out.println(RegNo);%>' size=30>
</td>
</tr>

<tr>
<td>
NAME
</td>
<td>
<input type=text name="NAME" value='<%out.println(name);%>' size=30>
</td>
</tr>



<tr>
<td>
ADDRESS
</td>
<td>
<input type=description name="address" value='<%out.println(addr);%>' size=30>
</td>
</tr>

<tr>
<td>
DATE OF BIRTH
</td>
<td>
<input type=text name="DOB" value='<%out.println(DOB);%>' size=20>
</td>
</tr>

<tr>
<td>
ENGINE NUMBER
</td>
<td>
<input type=text name="engin_no" value='<%out.println(engin_no);%>' size=30>
</td>
</tr

<tr>
<td>
BREAK WORKING ?
</td>
<td>
<input type=text select name="Break working" value='<%out.println(breakworking);%>'  size=2>
</td>
</tr>



<tr>
<td>
POLLUTION FREE
</td>
<td>
<input type=text select name="Pollution Free" value='<%out.println(pollutionfree);%>' size = 2>
</td>
</tr>



<tr>
<td>
YEAR OF REGISTRATION
</td>
<td>
<input type=pwd name="Reg Year" value='<%out.println(regyear);%>' size=20>
</td>
</tr>
</br>



<tr>
<td>
FITNESS ISSUE DATE
</td>
<td>
<input type=text name="Fitness Issued date" value='<%out.println(fitness_issue_date);%>' size=20>
</td>
</tr>

<tr>
<td>
EXPIRY DATE
</td>
<td>
<input type=text name="Expiry date" value='<%out.println(fitnessexpiry);%>' size=20>
</td>
</tr>



</table>
</form>
</body>
</html>
<tr>
<jsp:include page="tabinc.jsp" />
</tr>
</td>
</tr>




























































































































































































