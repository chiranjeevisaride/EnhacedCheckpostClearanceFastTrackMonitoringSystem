<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%
	try {
	Connection con = OracleDriver.getConnection();
	String sql = "SELECT COUNT(*) FROM SLOT WHERE REG_ID='"+request.getParameter("REG_ID")+"' AND FLAG=0";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	PreparedStatement pstmt = null;
	if(rs.next() && rs.getInt(1)==0) {
		pstmt = con.prepareStatement("INSERT INTO SLOT(SLOT_DATE, SLOT_TIME,REG_ID,EMP_ID,CREATED_ON) VALUES(?,?,?,?,?)");
		pstmt.setString(1,request.getParameter("DD")+"/"+request.getParameter("MM")+"/"+request.getParameter("YYYY"));
		pstmt.setString(2,request.getParameter("HH")+":"+request.getParameter("MMM"));
		pstmt.setString(3,request.getParameter("REG_ID"));
		pstmt.setString(4,session.getAttribute("ID")+"");
		pstmt.setTimestamp(5,new Timestamp(System.currentTimeMillis()));
		pstmt.executeUpdate();
		request.setAttribute("response", "Vehicle Slot Book Successfully.");
			request.getRequestDispatcher("managerIndex.jsp").forward(request,response);
	} else {
		request.setAttribute("response", "Slot Already Booked.");
			request.getRequestDispatcher("managerIndex.jsp").forward(request,response);
	}
	rs.close();
	stmt.close();
	OracleDriver.closeConnection(con);
		}catch(Exception e) {
			System.out.println(e);
		}
%>