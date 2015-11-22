
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>RECEIPT </title>
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

<font type="arial" align="center" color="blue" font size="5"><b>RECEIPT<b></font></center>
<form name="RECEIPT" action="RECEIPT.jsp" type="post"/>




<%

		String RegNo=request.getParameter("RegNo");
		String offence1=request.getParameter("OFFENCE1");
		String offence2=request.getParameter("OFFENCE2");
		String offence3=request.getParameter("OFFENCE3");
		String offence4=request.getParameter("OFFENCE4");
		String offence5=request.getParameter("OFFENCE5");
		String offence6=request.getParameter("OFFENCE6");
		String NAME=request.getParameter("name");
		String entered_date=request.getParameter("ENTERED_DATE");
		
		
        int Penalty=0;		
		
		if 
		  ( offence1 != null && offence1.equals("1"))
		   {
		     
			 Penalty+=300;
		   }
         
		  if (offence2 != null && offence2.equals("2"))
		   {
		     
			 Penalty+=300;
			 
		   }
		   if (offence3 != null && offence3.equals("3"))
		   {
		     
			 Penalty+=300;
			
		   }
		   if (offence4 != null && offence4.equals("4"))
		   {
		     
			 Penalty+=300;
			 
		   }
		   if (offence5 != null && offence5.equals("5"))
		   {
		    
			 Penalty+=300;
			 
		   }
		   if (offence6 != null && offence6.equals("6"))
		   {
		     
			 Penalty+=300;
			
		   }
      
		 
	
	
%>

</td>
</tr>

<tr>
<td>
REGISTRATION NUMBER
</td>
<td>
<input type=text name="RegNo" value='<%out.println(RegNo);%>' size=10>
</td>
</tr>

<tr>
<td>
ENTERED BY
</td>
<td>
<input type=text name="name" value='<%out.println(NAME);%>' size=10>
</td>
</tr>



<tr>
<td>
OFFENCE CODE 1: NO PROPER REG
</td>
<td>
<input type=description name="OFFENCE1" value='<%out.println(offence1);%>' size=10>
</td>
</tr>



<tr>
<td>
OFFENCE CODE 2: NO PROPER LICENSE
</td>
<td>
<input type=description name="OFFENCE2" value='<%out.println(offence2);%>' size=10>
</td>
</tr>

<tr>
<td>
OFFENCE CODE 3: NO PROPER FITNESS
</td>
<td>
<input type=description name="OFFENCE3" value='<%out.println(offence3);%>' size=10>
</td>
</tr>

<tr>
<td>
OFFENCE CODE 4: NO PROPER NOC 
</td>
<td>
<input type=description name="OFFENCE4" value='<%out.println(offence4);%>' size=10>
</td>
</tr>

<tr>
<td>
OFFENCE CODE 5: NO PROPER PERMIT
</td>
<td>
<input type=description name="OFFENCE5" value='<%out.println(offence5);%>' size=10>
</td>
</tr>

<tr>
<td>
OFFENCE CODE 6: DOCUMENT NOT HOLDING
</td>
<td>
<input type=description name="OFFENCE6" value='<%out.println(offence6);%>' size=10>
</td>
</tr>

<tr>
<td>
ENTERED DATE
</td>
<td>
<input type=text name="ENTERED_DATE" value='<%out.println(entered_date);%>' size=10>
</td>
</tr>

<tr>
<td>
<input type="submit" value="Total"/>
</td>
</tr>



<tr>
<td>
TOTAL
</td>
<td>
<input type=description name="Total" value='<%out.println(Penalty);%>'size=10>
</td>
</tr>

<tr> 
<td colspan=3 align="center">
<font size="3"> <a href="javascript:window.print()"> PRINT RECEIPT</a>
</td>
</tr> 

</table>
<tr>
<jsp:include page="tabinc.jsp" />
</tr>
</form>

</body>
</html>





























































































































































































