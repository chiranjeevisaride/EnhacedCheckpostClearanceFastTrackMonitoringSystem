<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%
	try {
	session.removeAttribute("ID");
	session.removeAttribute("USERID");
		}catch(Exception e) {
			System.out.println(e);
		}
		request.getRequestDispatcher("index.jsp").forward(request,response);
%>