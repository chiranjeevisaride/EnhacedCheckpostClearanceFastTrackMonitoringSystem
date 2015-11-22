<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%
	try {
	Connection con = OracleDriver.getConnection();
	String sql = "SELECT COUNT(*) FROM DRIVING_SLOT WHERE DRIVE_ID='"+request.getParameter("DRIVE_ID")+"' AND STATUS='OPEN'";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	PreparedStatement pstmt = null;
	if(rs.next() && rs.getInt(1)==0) {
		pstmt = con.prepareStatement("INSERT INTO DRIVING_SLOT(SLOT_DATE, SLOT_TIME,DRIVE_ID,EMP_ID,CREATED_ON,STATUS) VALUES(?,?,?,?,?,'OPEN')");
		pstmt.setString(1,request.getParameter("DD")+"/"+request.getParameter("MM")+"/"+request.getParameter("YYYY"));
		pstmt.setString(2,request.getParameter("HH")+":"+request.getParameter("MMM"));
		pstmt.setString(3,request.getParameter("DRIVE_ID"));
		pstmt.setString(4,session.getAttribute("ID")+"");
		pstmt.setTimestamp(5,new Timestamp(System.currentTimeMillis()));
		pstmt.executeUpdate();
		request.setAttribute("response", "Driving License Slot Book Successfully.");
			request.getRequestDispatcher("managerIndex.jsp").forward(request,response);
	} else {
			request.setAttribute("response", "Driving License Slot Already Booked.");
			request.getRequestDispatcher("managerIndex.jsp").forward(request,response);
	}
	rs.close();
	stmt.close();
	OracleDriver.closeConnection(con);
		}catch(Exception e) {
			System.out.println(e);
		}
%>