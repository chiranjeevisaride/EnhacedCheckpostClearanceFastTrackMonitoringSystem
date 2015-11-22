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
		String sql = "SELECT * FROM NATIONAL_PERMIT WHERE ID=?";
		PreparedStatement stmt12 = con.prepareStatement(sql);
		stmt12.setString(1, request.getParameter("FITNESSID"));		
		ResultSet rs = stmt12.executeQuery();
		if(rs.next()) {
			request.setAttribute("PRINT_MATTER", rs.getString("PRINT_MATTER"));
			request.setAttribute("STATUS", rs.getString("STATUS"));
			request.setAttribute("NOC_CLEAR", rs.getString("NOC_CLEAR"));
			request.setAttribute("VALID_FROM", rs.getString("VALID_FROM"));
			request.setAttribute("VALID_TO", rs.getString("VALID_TO"));
			request.setAttribute("FITNESS_CLEAR", rs.getString("FITNESS_CLEAR"));
			request.setAttribute("CARRY_WEIGHT", rs.getString("CARRY_WEIGHT"));
			request.setAttribute("REJECT_DESC", rs.getString("REJECT_DESC"));
			request.setAttribute("REJECT_STATUS", rs.getString("REJECT_STATUS"));
		}
		request.getRequestDispatcher("customerViewVehiclePermit.jsp").forward(request,response);
		rs.close();
		stmt12.close();
		OracleDriver.closeConnection(con);
	} catch(Exception e) {
		System.out.println(e);
	}
%>