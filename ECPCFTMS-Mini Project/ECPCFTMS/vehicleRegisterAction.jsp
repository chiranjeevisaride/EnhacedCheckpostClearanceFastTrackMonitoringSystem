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
	String sql = "SELECT COUNT(*) FROM REG_VEHICLE WHERE ENG_NO='"+request.getParameter("ENG_NO")+"' AND CHASIS_NO='"+request.getParameter("CHASIS_NO")+"'";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	PreparedStatement pstmt = null;
	if(rs.next() && rs.getInt(1)==0) {
		pstmt = con.prepareStatement("INSERT INTO REG_VEHICLE(OWNER_NAME,ADDRESS,ENG_NO,CHASIS_NO,BODY,COLOR,BRAND,CC,NOOFSEATS,BIKE_NAME,DISTID,MANDALID,STATE,COUNTRY,CREATED_ON,MANU_MONTH,MANU_YEAR,CUST_ID) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		pstmt.setString(1,request.getParameter("OWNER_NAME"));
		pstmt.setString(2,request.getParameter("ADDRESS"));
		pstmt.setString(3,request.getParameter("ENG_NO"));
		pstmt.setString(4,request.getParameter("CHASIS_NO"));
		pstmt.setString(5,request.getParameter("BODY"));
		pstmt.setString(6,request.getParameter("COLOR"));
		pstmt.setString(7,request.getParameter("BRAND"));
		pstmt.setString(8,request.getParameter("CC"));
		pstmt.setString(9,request.getParameter("NOOFSEATS"));
		pstmt.setString(10,request.getParameter("BIKE_NAME"));
		pstmt.setString(11,request.getParameter("DISTID"));
		pstmt.setString(12,request.getParameter("MANDALID"));
		pstmt.setString(13,request.getParameter("STATE"));
		pstmt.setString(14,request.getParameter("COUNTRY"));
		pstmt.setTimestamp(15,new Timestamp(System.currentTimeMillis()));
		pstmt.setString(16,request.getParameter("MANU_MONTH"));
		pstmt.setString(17,request.getParameter("MANU_YEAR"));
		pstmt.setString(18,(String)session.getAttribute("ID"));
		pstmt.executeUpdate();
		request.setAttribute("response", "Vehicle Registration Successfully.");
		request.getRequestDispatcher("customerIndex.jsp").forward(request,response);
	} else {
		request.setAttribute("response", "Vehicle Engine No. or Chasis No. already Exists.");
		request.setAttribute("OWNER_NAME",request.getParameter("OWNER_NAME"));
		request.setAttribute("ADDRESS",request.getParameter("ADDRESS"));
		request.setAttribute("ENG_NO",request.getParameter("ENG_NO"));
		request.setAttribute("CHASIS_NO",request.getParameter("CHASIS_NO"));
		request.setAttribute("BODY",request.getParameter("BODY"));
		request.setAttribute("COLOR",request.getParameter("COLOR"));
		request.setAttribute("BRAND",request.getParameter("BRAND"));
		request.setAttribute("CC",request.getParameter("CC"));
		request.setAttribute("NOOFSEATS",request.getParameter("NOOFSEATS"));
		request.setAttribute("BIKE_NAME",request.getParameter("BIKE_NAME"));
		request.setAttribute("DATEOFMANU",request.getParameter("DATEOFMANU"));
		request.setAttribute("DISTID",request.getParameter("DISTID"));
		request.setAttribute("MANDALID",request.getParameter("MANDALID"));
		request.setAttribute("STATE",request.getParameter("STATE"));
		request.setAttribute("COUNTRY",request.getParameter("COUNTRY"));
		request.setAttribute("MANU_MONTH",request.getParameter("MANU_MONTH"));
		request.setAttribute("MANU_YEAR",request.getParameter("MANU_YEAR"));
		request.getRequestDispatcher("applyVehicleRegister.jsp").forward(request,response);
	}
	rs.close();
	stmt.close();
	OracleDriver.closeConnection(con);
		}catch(Exception e) {
			System.out.println(e);
		}
%>