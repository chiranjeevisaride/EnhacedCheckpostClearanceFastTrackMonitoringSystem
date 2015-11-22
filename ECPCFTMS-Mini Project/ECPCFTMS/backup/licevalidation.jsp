<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%><html>
<%!
Connection con;
Driver dr;
%>
<head><center>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>LICENSE VALIDATION</title>
</head>																										
<head><title>LICENSE VALIDATION</title></head>
<table align="center">
<body bgcolor="lightpink">
<center>
<font type="arial" color="blue" font size="15">LICENSE VALIDATION</font></center>
<form method="POST" name="LICENSE VALIDATION" action="licevalidation.jsp" type="post"/>
<%

		 dr=new oracle.jdbc.driver.OracleDriver();
		DriverManager.registerDriver(dr);
		 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","system","welcome");
		String sql = "SELECT LICENSE_ID,NAME,son_wife_daughter_of,ADDR,DOB,blood_group,valid_from,valid_upto,Type_of_vehicle from licevalidation where license_id=?";
		String LICENSE_ID1=request.getParameter("LICENSE_ID");
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, LICENSE_ID1);
		ResultSet rs = ps.executeQuery();
		String LICENSE_ID= "";
		String NAME= "";
		String son_wife_daughter_of ="";
		String ADDR="";
		String DOB="";
		String blood_group="";
		String valid_from="";
		String valid_upto="";
		String type_of_vehicle="";
		while (rs.next()) 
				{
				LICENSE_ID= rs.getString(1);
			    NAME= rs.getString(2);
				son_wife_daughter_of= rs.getString(3);
			    ADDR= rs.getString(4);
				DOB = rs.getString(5);
			    blood_group= rs.getString(6);
				valid_from= rs.getString(7);
				valid_upto = rs.getString(8);
			    type_of_vehicle= rs.getString(9);
				
		}
		rs.close();
	con.close();
	
%>


<tr>

LICENSE NUMBER
<td></td>

<input type=text name="LICENSE_ID" value='<%out.println(LICENSE_ID);%>' size=10>

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
if(LICENSE_ID.equals(""))
	{
		out.println("Please enter a  Valid LICENSE Number");
	}
%> 
</DIV>

<tr>
<td>
Name:
</td>
<td>
<input type=text name="NAME" value='<%out.println(NAME);%>' size=30>
</td>
</tr>





<tr>
<td>
son_wife_daughter_of:
</td>
<td>
<input type=text name="son_wife_daughter_of" value='<%out.println(son_wife_daughter_of);%>' size=30>
</td>
</tr>

<tr>
<td>
Addr:
</td>
<td>
<input type=description name="addr" value='<%out.println(ADDR);%>' size=30>
</td>
</tr>

<tr>
<td>
DOB:
</td>
<td>
<input type=text name="DOB" value='<%out.println(DOB);%>'size=30>
</td>
</tr>


<tr>
<td>
blood_group:
</td>
<td>
<input type=text name="blood_group" value='<%out.println(blood_group);%>'size=30>
</td>
</tr>

<tr>
<td>
Valid_From:
</td>
<td>
<input type=pwd name="valid_from" value='<%out.println(valid_from);%>' size=30>
</td>
</tr>
</br>



<tr>
<td>
Valid_Upto:
</td>
<td>
<input type=text name="valid_upto" value='<%out.println(valid_upto);%>' size=30>
</td>
</tr>




</table>
</form>
</body>
</html>




























































































































































































