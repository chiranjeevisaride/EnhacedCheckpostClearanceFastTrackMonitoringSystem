<%
	String logStat = (String)	session.getAttribute("loginstatus");
	
	if( logStat == null || logStat.equals("") || logStat.equals("false") )
		pageContext.forward("login.jsp");
%>

<TABLE ALIGN=CENTER WIDTH="300"><TR><TD><A HREF="CHECKPOSTADMINHOMEPAGE.jsp">HOME</A></TD><TD><A HREF="logout.jsp">LOGOUT</A></TD></TR>



