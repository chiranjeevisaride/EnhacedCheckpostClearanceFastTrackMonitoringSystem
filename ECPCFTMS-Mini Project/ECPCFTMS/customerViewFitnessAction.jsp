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
		String sql = "SELECT * FROM APPLYFITNESS WHERE ID=?";
		PreparedStatement stmt12 = con.prepareStatement(sql);
		stmt12.setString(1, request.getParameter("FITNESSID"));		
		ResultSet rs = stmt12.executeQuery();
		if(rs.next()) {
			request.setAttribute("PRINT_MATTER", rs.getString("PRINT_MATTER"));
			request.setAttribute("STATUS", rs.getString("STATUS"));
			request.setAttribute("REG_VALID", rs.getString("REG_VALID"));
			request.setAttribute("BREAKS_VALID", rs.getString("BREAKS_VALID"));
			request.setAttribute("CONDITION_VALID", rs.getString("CONDITION_VALID"));
			request.setAttribute("POLUTION_VALID", rs.getString("POLUTION_VALID"));
			request.setAttribute("COND_REJECT_DETAILS", rs.getString("COND_REJECT_DETAILS"));
		}
		request.getRequestDispatcher("customerViewFitness.jsp").forward(request,response);
		rs.close();
		stmt12.close();
		OracleDriver.closeConnection(con);
	} catch(Exception e) {
		System.out.println(e);
	}
%>