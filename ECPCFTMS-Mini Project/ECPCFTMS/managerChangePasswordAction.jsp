<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%
	try {
	Connection con = OracleDriver.getConnection();
	String sql = "SELECT * FROM EMPLOYEE WHERE ID='"+session.getAttribute("ID")+"' and PASSWORD='"+request.getParameter("OLDPASSWORD")+"'";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	if(rs.next()) {
	 	sql = "UPDATE EMPLOYEE SET PASSWORD='"+request.getParameter("PASSWORD")+"' WHERE ID='"+session.getAttribute("ID")+"' and PASSWORD='"+request.getParameter("OLDPASSWORD")+"'";
		Statement stmt1 = con.createStatement();
		stmt1.executeUpdate(sql);
		request.setAttribute("response", "Successfully changed the password.");
		request.getRequestDispatcher("managerIndex.jsp").forward(request,response);
	} else {
		request.setAttribute("response", "Please enter correct password.");
		request.getRequestDispatcher("managerChangePassword.jsp").forward(request,response);
	}
	rs.close();
	stmt.close();
	OracleDriver.closeConnection(con);
		}catch(Exception e) {
			System.out.println(e);
		}
%>