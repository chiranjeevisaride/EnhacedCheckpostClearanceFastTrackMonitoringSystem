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
		String sql = "SELECT COUNT(*) FROM REG_VEHICLE WHERE REG_NO='0' AND ID=?";
		PreparedStatement stmt12 = con.prepareStatement(sql);
		stmt12.setString(1, request.getParameter("ID"));		
		ResultSet rs = stmt12.executeQuery();
		 sql = "SELECT COUNT(*) FROM NATIONAL_PERMIT WHERE STATUS='OPEN' AND REG_ID=?";
		PreparedStatement stmt13 = con.prepareStatement(sql);
		stmt13.setString(1, request.getParameter("ID"));		
		ResultSet rs3 = stmt13.executeQuery();
		PreparedStatement stmt = null;
		PreparedStatement stmt1 = null;
		if(rs.next() && rs.getInt(1)!=0) {
			request.setAttribute("response", "Vehicle Permit Application Is Rejected Due To Vehicle Not Registered.");
			request.getRequestDispatcher("customerSelectVehicleNoc.jsp").forward(request,response);
		} if(rs3.next() && rs3.getInt(1)!=0) {
			request.setAttribute("response", "Vehicle Permit Application Is Already Applied.");
			request.getRequestDispatcher("customerSelectVehiclePermit.jsp").forward(request,response);
		} else {
		sql = "INSERT INTO NATIONAL_PERMIT(REG_ID,CUST_ID) VALUES(?,?)";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, request.getParameter("ID"));
			stmt.setString(2, (String)session.getAttribute("ID"));		
			stmt.executeUpdate();
			request.setAttribute("response", "Vehicle Permit Application Is Accepted.");
			request.getRequestDispatcher("customerSelectVehiclePermit.jsp").forward(request,response);
		}

			stmt.close();
		rs.close();
		stmt12.close();
		OracleDriver.closeConnection(con);
	} catch(Exception e) {
		System.out.println(e);
	}
%>