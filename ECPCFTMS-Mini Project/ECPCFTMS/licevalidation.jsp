<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>LICENSE VALIDATION</title>
</head>																										
<body bgcolor="lightpink">
<center>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%Connection con;
Driver dr;
%>

<jsp:include page="imgsrc.jsp" />
<TABLE ALIGN=CENTER  STYLE="border:3px solid blue"
<tr>


<td colspan=3  BORDER=1 align="center">
<font type="arial" color="blue" font size="5"><b>LICENSE VALIDATION<b></font></center>
<form method="POST" name="LICENSE VALIDATION" action="licevalidation.jsp" type="post"/>
<%

		 dr=new oracle.jdbc.driver.OracleDriver();
		DriverManager.registerDriver(dr);
		 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","checkpost","checkpost");
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

<td colspan=3 align="center">LICENSE NUMBER

<input type=text name="LICENSE_ID" value='<%out.println(LICENSE_ID);%>' size=20>
</td>
</tr>


<tr>
<td colspan=3 align="center">

<input type="submit" value="submit"/>

<input type="submit" value="CANCEL"/>

</tr>
</td>



<tr>
<td colspan=3 align="center">
<DIV style="border:1px solid red;background-color:#ffeeee">
<%
if(LICENSE_ID.equals(""))
	{
		out.println("Please enter a  Valid LICENSE Number");
	}
%> 
</DIV>
</td>
</tr>



<tr>
<td rowspan="9">
<img src="lic.jpg">

</td>
<td>
<tr>
<td>
NAME
</td>
<td>
<input type=text name="NAME" value='<%out.println(NAME);%>' size=30>
</td>
</tr>





<tr>
<td>
SON WIFE DAUGHTER OF
</td>
<td>
<input type=text name="son_wife_daughter_of" value='<%out.println(son_wife_daughter_of);%>' size=30>
</td>
</tr>

<tr>
<td>
ADDRESS
</td>
<td>
<input type=description name="addr" value='<%out.println(ADDR);%>' size=30>
</td>
</tr>

<tr>
<td>
DATE OF BIRTH
</td>
<td>
<input type=text name="DOB" value='<%out.println(DOB);%>'size=30>
</td>
</tr>


<tr>
<td>
BLOOD GROUP
</td>
<td>
<input type=text name="blood_group" value='<%out.println(blood_group);%>'size=30>
</td>
</tr>

<tr>
<td>
VALID FROM
</td>
<td>
<input type=pwd name="valid_from" value='<%out.println(valid_from);%>' size=30>
</td>
</tr>




<tr>
<td>
VALID UPTO
</td>
<td>
<input type=text name="valid_upto" value='<%out.println(valid_upto);%>' size=30>
</td>
</tr>


<tr>
<td>
TYPE OF VEHICLE
</td>
<td>
<input type=text name="TYPE_OF_VEHICLE" value='<%out.println(type_of_vehicle);%>' size=30>
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


























































































































































































