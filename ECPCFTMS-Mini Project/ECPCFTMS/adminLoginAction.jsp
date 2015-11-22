<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%
	try {
	Connection con = OracleDriver.getConnection();
	String sql = "SELECT * FROM EMPLOYEE WHERE USERID='"+request.getParameter("USERID")+"' and PASSWORD='"+request.getParameter("PASSWORD")+"' AND ROLE='Admin'";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	if(rs.next()) {
		session.setAttribute("ID", rs.getString("ID"));
		session.setAttribute("ADMINID", rs.getString("USERID"));
		request.getRequestDispatcher("adminIndex.jsp").forward(request,response);
	} else {
		request.setAttribute("response", "USERID OR PASSWORD is invalid.");
		request.getRequestDispatcher("adminHome.jsp").forward(request,response);
	}
	rs.close();
	stmt.close();
	OracleDriver.closeConnection(con);
		}catch(Exception e) {
			System.out.println(e);
		}
%>