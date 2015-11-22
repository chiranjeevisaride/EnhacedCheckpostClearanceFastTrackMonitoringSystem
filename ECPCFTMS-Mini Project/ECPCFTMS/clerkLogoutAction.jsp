<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%
	try {
			session.removeAttribute("ID");
			session.removeAttribute("CLERKID");
		} catch(Exception e) {
			System.out.println(e);
		}
		request.getRequestDispatcher("clerkHome.jsp").forward(request,response);
%>