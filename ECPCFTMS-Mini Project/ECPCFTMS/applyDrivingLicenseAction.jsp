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
	String sql = "SELECT COUNT(*) FROM DRIVING_LICENSE WHERE CUST_ID="+(String)session.getAttribute("ID");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	PreparedStatement pstmt = null;
	if(rs.next() && rs.getInt(1)==0) {
		pstmt = con.prepareStatement("INSERT INTO DRIVING_LICENSE(NAME,ADDRESS,COUNTRY,STATE,DISTID,MANDALID,CREATED_ON,CUST_ID) VALUES(?,?,?,?,?,?,?,?)");
		pstmt.setString(1,request.getParameter("NAME"));
		pstmt.setString(2,request.getParameter("ADDRESS"));
		pstmt.setString(3,request.getParameter("COUNTRY"));
		pstmt.setString(4,request.getParameter("STATE"));		
		pstmt.setString(5,request.getParameter("DISTID"));
		pstmt.setString(6,request.getParameter("MANDALID"));
		pstmt.setTimestamp(7,new Timestamp(System.currentTimeMillis()));
		pstmt.setString(8,(String)session.getAttribute("ID"));
		pstmt.executeUpdate();
		request.setAttribute("response", "Driving License Successfully Applied.");
		request.getRequestDispatcher("customerIndex.jsp").forward(request,response);
	} else {
		request.setAttribute("response", "Driving License Already Exists.");
		request.setAttribute("NAME",request.getParameter("NAME"));
		request.setAttribute("DOB",request.getParameter("DOB"));
		request.setAttribute("DISTID",request.getParameter("DISTID"));
		request.setAttribute("MANDALID",request.getParameter("MANDALID"));
		request.setAttribute("STATE",request.getParameter("STATE"));
		request.setAttribute("COUNTRY",request.getParameter("COUNTRY"));
		request.setAttribute("ADDRESS",request.getParameter("ADDRESS"));
		request.getRequestDispatcher("applyDrivingLicense.jsp").forward(request,response);
	}
	rs.close();
	stmt.close();
	OracleDriver.closeConnection(con);
		}catch(Exception e) {
			System.out.println(e);
		}
%>