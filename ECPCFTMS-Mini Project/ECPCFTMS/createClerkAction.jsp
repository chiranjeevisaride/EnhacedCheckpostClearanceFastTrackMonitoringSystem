<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%
	try {
	Connection con = OracleDriver.getConnection();
	String sql = "SELECT COUNT(*) FROM EMPLOYEE WHERE USERID='"+request.getParameter("USERID")+"'";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	PreparedStatement pstmt = null;
	if(rs.next() && rs.getInt(1)==0) {
		pstmt = con.prepareStatement("INSERT INTO EMPLOYEE(USERID, NAME,PASSWORD,DISTID,MANDALID,CREATED_ON,ROLE) VALUES(?,?,?,?,?,?,'CLERK')");
		pstmt.setString(1,request.getParameter("USERID"));
		pstmt.setString(2,request.getParameter("NAME"));
		pstmt.setString(3,request.getParameter("PASSWORD"));
		pstmt.setString(4,request.getParameter("DISTID"));
		pstmt.setString(5,request.getParameter("MANDALID"));
		pstmt.setTimestamp(6,new Timestamp(System.currentTimeMillis()));
		pstmt.executeUpdate();
		request.setAttribute("response", "Clerk Registration Successfully.");
			request.getRequestDispatcher("adminIndex.jsp").forward(request,response);
	} else {
		request.setAttribute("response", "Clerk Already Exists Please Enter New USERID.");
		request.setAttribute("USERID",request.getParameter("USERID"));
		request.setAttribute("NAME",request.getParameter("NAME"));
		request.setAttribute("DISTID",request.getParameter("DISTID"));
		request.setAttribute("MANDALID",request.getParameter("MANDALID"));
				request.setAttribute("PASSWORD",request.getParameter("PASSWORD"));
			request.getRequestDispatcher("createClerk.jsp").forward(request,response);
	}
	rs.close();
	stmt.close();
	OracleDriver.closeConnection(con);
		}catch(Exception e) {
			System.out.println(e);
		}
%>