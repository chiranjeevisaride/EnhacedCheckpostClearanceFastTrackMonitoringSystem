<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%><html>
<%!
Connection con;
Driver dr;
%>
<head><center>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>FITNESS VALIDATION</title>
</head>																										
<head><title>FITNESS VALIDATION</title></head>
<table align="center">
<body bgcolor="lightpink">
<center>
<font type="arial" color="blue" font size="15">FITNESS VALIDATION</font></center>
<form method="POST" name="FITNESS VALIDATION" action="fitvalidation.jsp" type="post"/>

<%

		 dr=new oracle.jdbc.driver.OracleDriver();
		DriverManager.registerDriver(dr);
		 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","system","welcome");
		String sql = "SELECT REG_NO,NAME,ADDR,DOB,ENGIN_NO,FITNESS_ISSUE_DATE,REG_YEAR from fitvalidation where REG_NO=?";
		String REG_NO1=request.getParameter("RegNo");
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, REG_NO1);
		ResultSet rs = ps.executeQuery();
		String RegNo = "";
		String name = "";
		String addr = "";
		String DOB = "";
		String engin_no="";
		String fitness_issue_date="";
		String regyear="";
			
		
		while (rs.next()) 
				{
				RegNo = rs.getString(1);
			    name= rs.getString(2);
				addr= rs.getString(3);
				DOB=rs.getString(4);
				engin_no=rs.getString(5);
				fitness_issue_date=rs.getString(6);
				regyear=rs.getString(7);
			  
		}
		rs.close();
	con.close();
	
%>



<tr>

RegNo:
<td></td>

<input type=text name="RegNo"size=10>

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
if(RegNo.equals(""))
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
<input type=text name="RegNo" value='<%out.println(RegNo);%>' size=30>
</td>
</tr>

<tr>
<td>
Name:
</td>
<td>
<input type=text name="NAME" value='<%out.println(name);%>' size=30>
</td>
</tr>



<tr>
<td>
Address:
</td>
<td>
<input type=description name="address" value='<%out.println(addr);%>' size=30>
</td>
</tr>

<tr>
<td>
DOB:
</td>
<td>
<input type=text name="DOB" value='<%out.println(DOB);%>' size=20>
</td>
</tr>

<tr>
<td>
EnginNo:
</td>
<td>
<input type=text name="engin_no" value='<%out.println(engin_no);%>' size=30>
</td>
</tr

<tr>
<td>
Break working:
</td>
<td>
<select name="Break working">
<option>Yes</option>
<option>No</option>
</select>
</td>
</tr>


<tr>
<td>
Engine Well Working:
</td>
<td>
<select name="Engine Well Working">
<option>Yes</option>
<option>No</option>
</select>
</td>
</tr>

<tr>
<td>
Pollution Free:
</td>
<td>
<select name="Pollution Free">
<option>Yes</option>
<option>No</option>
</select>
</td>
</tr>



<tr>
<td>
Reg Year:
</td>
<td>
<input type=pwd name="Reg Year" value='<%out.println(regyear);%>' size=20>
</td>
</tr>
</br>



<tr>
<td>
Fitness Issued date:
</td>
<td>
<input type=text name="Fitness Issued date" value='<%out.println(fitness_issue_date);%>' size=20>
</td>
</tr>

<tr>
<td>
Expiry date:
</td>
<td>
<input type=text name="Expiry date" size=20>
</td>
</tr>



</table>
</form>
</body>
</html>





























































































































































































