<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%
	try {
			session.removeAttribute("ID");
			session.removeAttribute("ADMINID");
		} catch(Exception e) {
			System.out.println(e);
		}
		request.getRequestDispatcher("adminHome.jsp").forward(request,response);
%>