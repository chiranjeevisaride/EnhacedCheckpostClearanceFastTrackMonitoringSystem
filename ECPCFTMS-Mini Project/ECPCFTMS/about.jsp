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
				<li><a href="adminIndex.jsp">Clerk</a></li>
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
</p><div align="center"><center>

<table bgcolor="#FFCCCC" border="0" width="839">

		
</table>

</center></div><div align="center"><center>

<table border="0" width="827" bgcolor="#F4DDD7">
<tr><td width="682" align="justify">
<font face="Arial" size="3" color="#000080">
<p>Our Commitment :</p>
 
<p>The Transport Department stands fully committed to fully computerized citizen friendly services. This has been made possible by an extensive network of computers linking all the RTO and Unit Offices spread across the state. The department stands fully committed to the Citizens Charter and strives to achieve the deadlines for services set by the charter. We continue to ensure that the department is constantly refined in the administration of its processes and procedures to reduce time delays and achieve the stated mission of being a responsive and transparent department.</p>

<p>Some of the initiatives that have effected sweeping changes are the any service any counter, adherence of the operations to the citizens charter schedules; simplification of the procedures; enabling online slot booking for scheduling a driving test; a user friendly website with all the information needed for any novice including all the web-fill able forms; computerised test for learner's licence and online booking for services in advance are some of the initiatives that have made the department not only responsive but also provide services in a transparent manner. The department maintains a central database and provides services to the police and other departments upon request.</p>

<p>Each office is equipped with an efficient help desk to answer all the queries of customers and the relevant forms. Most offices are equipped with the token system where disposals at the counters are done in an efficient manner. To make services reliable and less time consuming, the department has introduced the system of despatch of all statutory documents by speed post. Waiting the whole day at the transport office is now a thing of the past!</p>
 

<p>The Department is administered by the Transport Commissioner who is the Head of the Transport Department and is assisted by an Additional Commissioner and four Joint Commissioners, 3 Regional Transport Officers, 1 Regional Transport officer as State Representative before State Transport Appellate Tribunal and 1 Accounts Officer in the Head Office. At the field level the Transport Commissioner is assisted by Deputy Transport Commissioner's of Transport who provide the overall supervision and coordination of all transport offices at the district level.</p>
</font>
</td></tr>		
</table>
</center></div>
</body>
</html>
