<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>HOME PAGE</title>
<link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div>
	<TABLE CELLSPACING="0" CELLPADDING="0" ALIGN="CENTER">
		<TR>
			<TD><IMG SRC="images/logo.gif" />
			</TD>
		</TR>
	</TABLE>
	<p></p>
	<table align=center>
		<tr>
			<td width="880" bgcolor="#0033CC">
				<div align="center">
					<font color="white"><strong class="test2">ENHANCED CHECK-POST CLEARANCE AND FAST TRACK MONITORING SYSTEM </strong></font>
				</div>
			</td>
		</tr>
	</table>
	<div id="headpanel" align="center" style="margin-left:250">
	
		<div id="menu">
			<ul>
				<li><a href="home.jsp">Home</a></li>
				<li><div class="gap"></div></li>
				<li><a href="about.jsp">About Us</a></li>
				<li><div class="gap"></div></li>
				<li><a href="contact.jsp">Contact Us</a></li>
				<%
				  if(session.getAttribute("ID")!=null && session.getAttribute("USERID")!=null) {
				 %>
				<li><div class="gap"></div></li>
				<li><a href="customerIndex.jsp">Customer</a></li>
				<%} else  if(session.getAttribute("ID")!=null && session.getAttribute("MANAGERID")!=null) { %>
				<li><div class="gap"></div></li>
				<li><a href="managerIndex.jsp">Manager</a></li>
				<%} else  if(session.getAttribute("ID")!=null && session.getAttribute("ADMINID")!=null) { %>
				<li><div class="gap"></div></li>
				<li><a href="adminIndex.jsp">Admin</a></li>
				<%} else  if(session.getAttribute("ID")!=null && session.getAttribute("CLERKID")!=null) { %>
				<li><div class="gap"></div></li>
				<li><a href="clerkIndex.jsp">Clerk</a></li>
				<%} else {%>
				<li><div class="gap"></div></li>
				<li><a href="customerIndex.jsp">Customer</a></li>
				<li><div class="gap"></div></li>
				<li><a href="adminIndex.jsp">Admin</a></li>
				<li><div class="gap"></div></li>
				<li><a href="managerIndex.jsp">Manager</a></li>
				<li><div class="gap"></div></li>
				<li><a href="clerkIndex.jsp">Clerk</a></li>
				<%} %>
				</ul>
		</div>
	</div>
</div>
<br/><br/><br/>
<div align="center">

<center>


<table border="0" width="827" bgcolor="#F4DDD7" height="434">

		
<tr><td width="712" align="justify" height="273">
<p align="left"><font face="Arial" size="3" color="#000080"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The Transport Department functions under the provisions of section 213 of the Motor Vehicle Act, 1988. The Transport Department is primarily established for enforcement of the provisions of the Motor Vehicle Act, 1988, Andhra Pradesh Motor Vehicles Taxation Act, 1963 and the rules framed there under. Of various types of transport facilities available road transport plays a unique role as the best mode of transport for relatively short distances connecting the rural areas with towns and cities for which other modes of transport are not readily suited. In this regard, the Transport Department of Andhra Pradesh assists other organizations in the development of transport facilities and endeavors to provide an efficient, adequate and economic transport service for the movement of passengers and goods by road.<br /><br/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In discharging statutory functions, the department has shaped up as one of the major revenue earning departments to the Government in the shape of taxes on motor vehicles.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The Transport Department is headed by the Transport Commissioner. He is assisted by 1 Additional Transport Commissioner, 4 Joint Transport Commissioners, 3 Regional Transport Officers, 1 Regional Transport officer as State Representative before State Transport Appellate Tribunal and 1 Accounts Officer in the Head Office. In the field, he is assisted by 1 Joint Transport Commissioner in charge of Hyderabad, 14 Deputy Transport Commissioners, 45 Regional Transport Officers including 1 Secretary, STAT in the cadre of R.T.O, 2 Assistant Accounts Officers, 206 Motor Vehicles Inspectors and 218 - Assistant Motor Vehicle Inspectors besides other ministerial staff.
</p><br/>

<p align="left"><font face="Arial" size="3" color="#000080">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The Transport Department functions under the provisions of section 213 of the Motor Vehicle Act, 1988. The Transport Department is primarily established for enforcement of the provisions of the Motor Vehicle Act, 1988, Andhra Pradesh Motor Vehicles Taxation Act, 1963 and the rules framed there under. The major functions of the Transport Department are the Enforcement of the Motor Vehicles Act and Rules, Collection of taxes and fees and issuance of Driving Licences and Certificate of Fitness to Transport Vehicles; Registration of Motor Vehicles and granting regular and temporary permits to vehicles. The department also carries out road safety work by conducting awareness campaigns, pollution check of vehicles and enforce measures such booking speeding vehicles through laser guns and interceptor vehicles and detect drunken drivers through breath analysers.<br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The Transport Department is regulated by the Government of Andhra Pradesh in terms of policy formulation and its implementation.  The Department is administered by the Transport Commissioner who is the Head of the Transport Department.
</font></p>
</center></td></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr>
<table width=835>
<tr>
<th colspan=3 style="background:#F4DDD7;color:#000080">Transport Department</th>
</tr>
<tr align="center" style="background:#F4DDD7;color:#000080">
<td>Shri. Botcha Satyanarayana</td><td>Hon'ble Minister for Transport</td><td>040-23455976 , 
040-23450828
</td>
</tr>
<tr align="center" style="background:#F4DDD7;color:#000080">
<td>Smt  D. Lakshmi Parthasarathy, I.A.S.,</td><td>Principal Secretary, Govt (Transport)</td><td>040-23453237 (O) 
040-23454547 (F)
</td>
</tr>
<tr align="center" style="background:#F4DDD7;color:#000080">
<td>Shri. G.Anantha Ramu, I.A.S.,</td><td>Transport Commissioner</td><td>040-23321283 (O) 
040-23321300 (F)
</td>
</tr>


</table>
</tr>
	
</table>
</div>
&nbsp;

</body>
</html>
