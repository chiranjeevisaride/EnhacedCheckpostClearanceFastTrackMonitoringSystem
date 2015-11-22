<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%
	try {
	Connection con = OracleDriver.getConnection();
	String sql = "SELECT * FROM CUSTOMER WHERE USERID='"+request.getParameter("USERID")+"' and PASSWORD='"+request.getParameter("PASSWORD")+"'";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	if(rs.next()) {
		session.setAttribute("ID", rs.getString("CUST_ID"));
		session.setAttribute("USERID", rs.getString("USERID"));
		request.getRequestDispatcher("customerIndex.jsp").forward(request,response);
	} else {
		request.setAttribute("response", "USERID OR PASSWORD is invalid.");
		request.getRequestDispatcher("index.jsp").forward(request,response);
	}
	rs.close();
	stmt.close();
	OracleDriver.closeConnection(con);
		}catch(Exception e) {
			System.out.println(e);
		}
%>