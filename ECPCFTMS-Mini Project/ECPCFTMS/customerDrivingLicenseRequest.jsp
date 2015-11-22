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
		String sql = "UPDATE DRIVING_LICENSE SET REJECT_REASON=? WHERE ID=?";
		PreparedStatement stmt12 = con.prepareStatement(sql);
		stmt12.setNull(1, java.sql.Types.NULL);		
		stmt12.setString(2, request.getParameter("ID"));	
		stmt12.executeUpdate();	
			request.setAttribute("response", "Successfully Applied For Driving License Slot");
			request.getRequestDispatcher("customerIndex.jsp").forward(request,response);
	stmt12.close();
		OracleDriver.closeConnection(con);
	} catch(Exception e) {
		System.out.println(e);
	}
%>