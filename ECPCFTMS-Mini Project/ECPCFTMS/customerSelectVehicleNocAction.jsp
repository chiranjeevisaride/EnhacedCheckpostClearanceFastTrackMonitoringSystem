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
		 sql = "SELECT COUNT(*) FROM APPLYNOC WHERE STATUS='OPEN' AND REG_ID=?";
		PreparedStatement stmt13 = con.prepareStatement(sql);
		stmt13.setString(1, request.getParameter("ID"));		
		ResultSet rs3 = stmt13.executeQuery();
		PreparedStatement stmt = null;
		PreparedStatement stmt1 = null;
		if(rs.next() && rs.getInt(1)!=0) {
			request.setAttribute("response", "NOC Application Is Rejected Due To Vehicle Not Registered.");
			request.getRequestDispatcher("customerSelectVehicleNoc.jsp").forward(request,response);
		} if(rs3.next() && rs3.getInt(1)!=0) {
			request.setAttribute("response", "NOC Application Is Already Applied.");
			request.getRequestDispatcher("customerSelectVehicleNoc.jsp").forward(request,response);
		} else {
		sql = "INSERT INTO APPLYNOC(REG_ID,CUST_ID) VALUES(?,?)";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, request.getParameter("ID"));
			stmt.setString(2, (String)session.getAttribute("ID"));		
			stmt.executeUpdate();
			request.setAttribute("response", "NOC Application Is Accepted.");
			request.getRequestDispatcher("customerSelectVehicleNoc.jsp").forward(request,response);
		}
		/*
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
		 }*/
			stmt.close();
		//stmt1.close();
		rs.close();
		stmt12.close();
		OracleDriver.closeConnection(con);
	} catch(Exception e) {
		System.out.println(e);
	}
%>