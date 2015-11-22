<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%
	try {
			session.removeAttribute("ID");
			session.removeAttribute("MANAGERID");
		} catch(Exception e) {
			System.out.println(e);
		}
		request.getRequestDispatcher("managerHome.jsp").forward(request,response);
%>