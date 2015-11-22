<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%><html>
<%!
Connection con;
Driver dr;

%>

<html>
<head><center>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>PERMIT VALIDATION</title>
<table align="center">
<body bgcolor="lightpink">
<div  style=display:none &nsbp&nsbp&nsbp&nsbp&nsbp;></div><jsp:include page="imgsrc.jsp" />
<TABLE ALIGN=CENTER WIDTH="100" STYLE="border:3px solid blue"
<tr>

<td colspan=3 align="center">

<font type="arial" color="blue" font size="5"><b>PERMIT VALIDATION<b></font>
<form name="PERMIT VALIDATION" action="Permitvalidation.jsp" type="post"/>

<%

		dr=new oracle.jdbc.driver.OracleDriver();
		DriverManager.registerDriver(dr);
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","checkpost","checkpost");
		String sql = "SELECT REG_NO, NAME,ADDR,vehicle_description,valid_from,valid_upto,allowed_weight from permitvalidation where REG_NO =? ";
		String REG_NO1=request.getParameter("RegNo");
		
		PreparedStatement ps = con.prepareStatement(sql);
				
		ps.setString(1, REG_NO1);
		ResultSet rs = ps.executeQuery();
		String REG_NO="";
		String NAME= "";
		String ADDR= "";
		String VEHICLE_DESCRIPTION= "";
		String VALID_FROM= "";
		String VALID_UPTO = "";
		String ALLOWED_WEIGHT= "";
	    
				while (rs.next()) 
				{
				REG_NO=rs.getString(1);
				NAME= rs.getString(2);
			    ADDR= rs.getString(3);
				VEHICLE_DESCRIPTION = rs.getString(4);
				VALID_FROM = rs.getString(5);
				VALID_UPTO = rs.getString(6);
				ALLOWED_WEIGHT= rs.getString(7);
						 
			   
		        }
	rs.close();
	con.close();
	
%>
</td>
</tr>


<tr>
<td colspan=3 align="center"> REGISTRATION NUMBER

<input type=text name="RegNo" align="centre" value='<%out.println(REG_NO);%>' size=20>
</td>
</tr>


<tr>

<td colspan=3 align="center">
<input type="submit" value="submit"/>

<input type="submit" value="CANCEL"/>
</br></b></br>
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
<td rowspan="9">
<img src="truck1.jpg">


</td>
<td>
<tr>
<td>
REGISTRATION NUMBER
</td>
<td>
<input type=text name="REG_NO" value='<%out.println(REG_NO);%>' size=20>
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
ADDRESS
</td>
<td>
<input type=description name="ADDR" value='<%out.println(ADDR);%>' size=20>
</td>
</tr>

<tr>
<td>
VEHICLE DESCRIPTION
</td>
<td>
<input type=text name="VEHICLE_DESCRIPTION" value='<%out.println(VEHICLE_DESCRIPTION);%>' size=20>
</td>
</tr>

<tr>
<td>
VLID FROM
</td>
<td>
<input type=pwd name="VALID_FROM" value='<%out.println(VALID_FROM);%>' size=20>
</td>
</tr>




<tr>
<td>
VALID UPTO
</td>
<td>
<input type=text name="VALID_UPTO" value='<%out.println(VALID_UPTO);%>' size=20>
</td>
</tr>

<tr>
<td>
ALLOWED WEIGHT
</td>
<td>
<input type=text name="ALLOWED_WEIGHT" value='<%out.println(ALLOWED_WEIGHT) ;%>' size=20>
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



























































































































































































