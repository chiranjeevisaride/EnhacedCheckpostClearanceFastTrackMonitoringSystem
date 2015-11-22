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
	<table align="center">
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
<br/><br/><br/></p>

<table width="827" bgcolor="#F4DDD7" align="center">
<tr><td width="682" align="justify">
<font face="Arial" size="3" color="#000080">
<p>Checkposts</p>
 
<p>Interated Check Posts</p>

<p>5 Integrated Check Posts have been established at State Borders. Departments like commercial taxes, excise, transport, forests, civil supplies etc., have their staff to check vehicles. These Check-posts have been established in order to provide checking facility to transport operators at one point at State Border and to avoid unnecessary delay and harassment. These Check-posts are under the administrative control of Commercial Taxes Department. They are at the following places .</P>
</font>
<table style="color:#000080" align="center" width="500" border=1 bgcolor="#F4DDD7">
<tr align="center" ><td>1</td><td>ICP, Purushothapuram (Srikakulam dt.)</td></tr>
<tr align="center"><td>2</td><td>ICP, Naraharipet (Chittoor dt.)</td></tr>
<tr align="center"><td>3</td><td>ICP, B V Palem ( Nellore dt.)</td></tr>
<tr align="center"><td>4</td><td>ICP, Salura (Nizamabad dt.)</td></tr>
<tr align="center"><td>5</td><td>ICP, Adilabad (Adilabad dt.)</td></tr>
</table>
</td>
</tr>

<tr><td width="682" align="justify">
<font face="Arial" size="3" color="#000080">
<p>Others Checkpost</P>
 
<p>There are 8 check posts at the state boarder in addition to 5 integrated check posts. Besides, there are 4 internal check posts to regulate the plying of vehicles. They are located at the following places.</P>

</font>
<table style="color:#000080" align="center" width="500" border=1 bgcolor="#F4DDD7">
<tr align="center" ><td>1</td><td>Tetagunta</td><td>East Godavari</td></tr>
<tr align="center" ><td>2</td><td>Kothuru	</td><td>Krishna</td></tr>
<tr align="center" ><td>3</td><td>Renigunta	</td><td>Chittoor</td></tr>
<tr align="center" ><td>4</td><td>Palamaner</td><td>Chittoor	</td></tr>
<tr align="center" ><td>5</td><td>Penukonda	</td><td>Anathapur</td></tr>
<tr align="center" ><td>6</td><td>Shapur	</td><td>Ranga Reddy</td></tr>
<tr align="center" ><td>7</td><td>Zaheerabad	</td><td>Medak</td></tr>
<tr align="center" ><td>8</td><td>Madnoor	</td><td>Nizamabad</td></tr>
<tr align="center" ><td>9</td><td>Kamareddy	</td><td>Nizamabad</td></tr>
<tr align="center" ><td>10</td><td>Bhainsa	</td><td>Adilabad</td></tr>
<tr align="center" ><td>11</td><td>Wankidi	</td><td>Adilabad</td></tr>
<tr align="center" ><td>12</td><td>Palvancha	</td><td>Khammam</td></tr>



</table>
</td>
</tr>


</table>
</body>
</html>
