<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%
  if(session.getAttribute("ID")==null || session.getAttribute("CLERKID")==null) {
  	request.setAttribute("response", "Please Login.");
  	request.getRequestDispatcher("clerkIndex.jsp").forward(request,response);
  }
	try {
		Connection con = OracleDriver.getConnection();
		String sql = "INSERT INTO PENALITY(CLERK_ID, CREATED_ON, FINE_AMT, PAID_AMT, FITNESS, NOC, OTHER, OTHER_DESC, PERMIT, REG, REG_NO, PENALITY_DATE, PENALITY_TIME ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement stmt12 = con.prepareStatement(sql);
		stmt12.setString(1, (String)session.getAttribute("ID"));	
		stmt12.setTimestamp(2,new Timestamp(System.currentTimeMillis()));
		
		if("YES".equals(request.getParameter("NOC")) && "YES".equals(request.getParameter("FIT")) && "YES".equals(request.getParameter("PERMIT")) && "YES".equals(request.getParameter("REG")) && !"YES".equals(request.getParameter("OTHER"))) {
			stmt12.setString(3,"0");
			stmt12.setString(4,"0");
			stmt12.setString(5, request.getParameter("FIT"));	
			stmt12.setString(6, request.getParameter("NOC"));	
			stmt12.setString(7, request.getParameter("OTHER"));	
			stmt12.setString(8, request.getParameter("OTHER_DESC"));	
			stmt12.setString(9, request.getParameter("PERMIT"));	
			stmt12.setString(10, request.getParameter("REG"));	
		} else {
			stmt12.setString(3,request.getParameter("FINE_AMT"));
			stmt12.setString(4,request.getParameter("PAID_AMT"));
			stmt12.setString(5, request.getParameter("FIT"));	
			stmt12.setString(6, request.getParameter("NOC"));	
			stmt12.setString(7, request.getParameter("OTHER"));	
			stmt12.setString(8, request.getParameter("OTHER_DESC"));	
			stmt12.setString(9, request.getParameter("PERMIT"));	
			stmt12.setString(10, request.getParameter("REG"));	
		}
			stmt12.setString(11, request.getParameter("ID"));	
			stmt12.setString(12, request.getParameter("FROMDD")+"/"+request.getParameter("FROMMM")+"/"+request.getParameter("FROMYYYY"));
			stmt12.setString(13, request.getParameter("HH")+":"+request.getParameter("MMM"));
			stmt12.executeUpdate();
			stmt12.close();
			OracleDriver.closeConnection(con);
			request.setAttribute("response", "Vehicle Check Post Details Entered successfully.");
			request.getRequestDispatcher("clerkIndex.jsp").forward(request,response);
	} catch(Exception e) {
		e.printStackTrace();
	}
%>