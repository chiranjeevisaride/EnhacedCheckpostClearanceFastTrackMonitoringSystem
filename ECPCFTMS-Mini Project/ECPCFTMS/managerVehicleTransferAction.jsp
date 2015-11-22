<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%
  if(session.getAttribute("ID")==null || session.getAttribute("MANAGERID")==null) {
  	request.setAttribute("response", "Please Login.");
  	request.getRequestDispatcher("managerIndex.jsp").forward(request,response);
  }
	try {
		Connection con = OracleDriver.getConnection();
		String sql = "SELECT COUNT(*) FROM REG_VEHICLE WHERE DISTID=? AND MANDALID=? AND ID=?";
		PreparedStatement stmt12 = con.prepareStatement(sql);
		stmt12.setString(1, request.getParameter("DISTID"));
		stmt12.setString(2, request.getParameter("MANDALID"));
		stmt12.setString(3, request.getParameter("ID"));		
		ResultSet rs = stmt12.executeQuery();
		PreparedStatement stmt = null;
		PreparedStatement stmt1 = null;
		if(rs.next() && rs.getInt(1)==0) {
			sql = "UPDATE REG_VEHICLE SET DISTID=?, MANDALID=? WHERE ID=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, request.getParameter("DISTID"));
			stmt.setString(2, request.getParameter("MANDALID"));
			stmt.setString(3, request.getParameter("ID"));		
			stmt.executeUpdate();
			sql = "UPDATE SLOT SET FLAG=2, STATUS=? WHERE REG_ID=?";
			stmt1 = con.prepareStatement(sql);
			stmt1.setString(1, request.getParameter("MESSAGE"));
			stmt1.setString(2, request.getParameter("ID"));		
			stmt1.executeUpdate();
			request.setAttribute("response", "Vehicle Transfer Successfully.");
			request.getRequestDispatcher("managerIndex.jsp").forward(request,response);
		} else {
			request.setAttribute("response", "Cannot Transfer To Same RTA.");
			request.getRequestDispatcher("managerVehicleTransfer.jsp").forward(request,response);
			  request.setAttribute("DISTID",request.getParameter("DISTID"));
			  request.setAttribute("MANDALID",request.getParameter("MANDALID"));
			  request.setAttribute("ID",request.getParameter("ID"));
			  request.setAttribute("MESSAGE",request.getParameter("MESSAGE"));  		
		 }
			stmt.close();
		stmt1.close();
		OracleDriver.closeConnection(con);
	} catch(Exception e) {
		System.out.println(e);
	}
%>