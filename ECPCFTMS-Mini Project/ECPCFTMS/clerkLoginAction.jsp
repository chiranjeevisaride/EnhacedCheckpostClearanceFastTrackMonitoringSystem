<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%
	try {
	Connection con = OracleDriver.getConnection();
	String sql = "SELECT * FROM EMPLOYEE WHERE USERID='"+request.getParameter("USERID")+"' and PASSWORD='"+request.getParameter("PASSWORD")+"' AND ROLE='CLERK'";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	if(rs.next()) {
		session.setAttribute("ID", rs.getString("ID"));
		session.setAttribute("CLERKID", rs.getString("USERID"));
		request.getRequestDispatcher("clerkIndex.jsp").forward(request,response);
	} else {
		request.setAttribute("response", "USERID OR PASSWORD is invalid.");
		request.getRequestDispatcher("clerkHome.jsp").forward(request,response);
	}
	rs.close();
	stmt.close();
	OracleDriver.closeConnection(con);
		}catch(Exception e) {
			System.out.println(e);
		}
%>