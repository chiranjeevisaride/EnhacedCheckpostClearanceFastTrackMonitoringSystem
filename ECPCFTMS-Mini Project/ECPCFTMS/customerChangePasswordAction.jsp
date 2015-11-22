<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%
	try {
	Connection con = OracleDriver.getConnection();
	String sql = "SELECT * FROM CUSTOMER WHERE CUST_ID='"+session.getAttribute("ID")+"' and PASSWORD='"+request.getParameter("OLDPASSWORD")+"'";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	if(rs.next()) {
	 	sql = "UPDATE CUSTOMER SET PASSWORD='"+request.getParameter("PASSWORD")+"' WHERE CUST_ID='"+session.getAttribute("ID")+"' and PASSWORD='"+request.getParameter("OLDPASSWORD")+"'";
		Statement stmt1 = con.createStatement();
		stmt1.executeUpdate(sql);
		request.setAttribute("response", "Successfully changed the password.");
		request.getRequestDispatcher("customerIndex.jsp").forward(request,response);
	} else {
		request.setAttribute("response", "Please enter correct password.");
		request.getRequestDispatcher("customerChangePassword.jsp").forward(request,response);
	}
	rs.close();
	stmt.close();
	OracleDriver.closeConnection(con);
		}catch(Exception e) {
			System.out.println(e);
		}
%>