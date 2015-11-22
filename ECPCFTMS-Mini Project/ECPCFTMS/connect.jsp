<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%!
Connection con;
Driver dr;
%>
<%
		 dr=new oracle.jdbc.driver.OracleDriver();
		DriverManager.registerDriver(dr);
		 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","checkpost","checkpost");
		 out.println(con);
%>

