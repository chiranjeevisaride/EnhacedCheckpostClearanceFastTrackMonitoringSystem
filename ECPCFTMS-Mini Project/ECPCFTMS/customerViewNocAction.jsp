<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%
  if(session.getAttribute("ID")==null || session.getAttribute("USERID")==null) {
  	request.setAttribute("response", "Please Login.");
  	request.getRequestDispatcher("index.jsp").forward(request,response);
  }
	try {
		Connection con = OracleDriver.getConnection();
		String sql = "SELECT * FROM APPLYNOC WHERE ID=?";
		PreparedStatement stmt12 = con.prepareStatement(sql);
		stmt12.setString(1, request.getParameter("NOCID"));		
		ResultSet rs = stmt12.executeQuery();
		if(rs.next()) {
			request.setAttribute("PRINT_MATTER", rs.getString("PRINT_MATTER"));
			request.setAttribute("STATUS", rs.getString("STATUS"));
			request.setAttribute("REG_VALID", rs.getString("REG_VALID"));
			request.setAttribute("TAX_PAID", rs.getString("TAX_PAID"));
			request.setAttribute("ANY_CASE", rs.getString("ANY_CASE"));
			request.setAttribute("CASE_DETAILS", rs.getString("CASE_DETAILS"));
		}
		request.getRequestDispatcher("customerViewNoc.jsp").forward(request,response);
		rs.close();
		stmt12.close();
		OracleDriver.closeConnection(con);
	} catch(Exception e) {
		System.out.println(e);
	}
%>