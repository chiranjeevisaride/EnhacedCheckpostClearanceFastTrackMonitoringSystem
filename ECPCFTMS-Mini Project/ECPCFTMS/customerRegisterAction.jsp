<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%
	try {
	Connection con = OracleDriver.getConnection();
	String sql = "SELECT COUNT(*) FROM CUSTOMER WHERE USERID='"+request.getParameter("USERID")+"'";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	PreparedStatement pstmt = null;
	if(rs.next() && rs.getInt(1)==0) {
		pstmt = con.prepareStatement("INSERT INTO CUSTOMER(USERID, NAME,PASSWORD,MOBILE,EMAIL,ADDRESS,PHONE,CREATEDON) VALUES(?,?,?,?,?,?,?,?)");
		pstmt.setString(1,request.getParameter("USERID"));
		pstmt.setString(2,request.getParameter("NAME"));
		pstmt.setString(3,request.getParameter("PASSWORD"));
		pstmt.setString(4,request.getParameter("MOBILE"));
		pstmt.setString(5,request.getParameter("EMAIL"));
		pstmt.setString(6,request.getParameter("ADDRESS"));
		pstmt.setString(7,request.getParameter("PHONE"));
		pstmt.setTimestamp(8,new Timestamp(System.currentTimeMillis()));
		pstmt.executeUpdate();
		request.setAttribute("response", "Customer Created Successfully.");
	} else {
		request.setAttribute("response", "Customer Already Exists Please Enter New USERID.");
		request.setAttribute("USERID",request.getParameter("USERID"));
		request.setAttribute("NAME",request.getParameter("NAME"));
		request.setAttribute("MOBILE",request.getParameter("MOBILE"));
		request.setAttribute("EMAIL",request.getParameter("EMAIL"));
		request.setAttribute("ADDRESS",request.getParameter("ADDRESS"));
		request.setAttribute("PHONE",request.getParameter("PHONE"));
	}
	rs.close();
	stmt.close();
	OracleDriver.closeConnection(con);
	request.getRequestDispatcher("customerRegister.jsp").forward(request,response);
		}catch(Exception e) {
			System.out.println(e);
		}
%>