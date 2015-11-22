<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%
  if(session.getAttribute("ID")==null || session.getAttribute("MANAGERID")==null) {
  	request.setAttribute("response", "Please Login.");
  	request.getRequestDispatcher("managerIndex.jsp").forward(request,response);
  }
	try {
		Connection con = OracleDriver.getConnection();
		String sql = "UPDATE APPLYFITNESS SET STATUS=?,REG_VALID=?, BREAKS_VALID=?,POLUTION_VALID=?, CONDITION_VALID=?, COND_REJECT_DETAILS=?, EMP_ID=?, VALID_FROM=?, VALID_TO=?, PRINT_MATTER=? WHERE REG_ID=? AND STATUS='OPEN'";
		PreparedStatement stmt12 = con.prepareStatement(sql);
		if("YES".equals(request.getParameter("VALID")) && "YES".equals(request.getParameter("BREAKS_VALID")) && "YES".equals(request.getParameter("POLUTION_VALID")) && "YES".equals(request.getParameter("CONDITION_VALID"))) {
			stmt12.setString(1, "ACCEPT");
		} else {
			stmt12.setString(1, "REJECT");
		}
		StringBuffer sb = new StringBuffer();
		sb.append("<HTML><BODY><TABLE WIDTH='800' border='1' cellpadding='5' cellspacing='1'><TR><TD><CENTER><H3>PART-III-OFFICE ENDORSEMENT</H3></CENTER><CENTER><H2>(Grant/Refusal of ' Vehicle Fitness Certificate' under subsection (3) of Section 48 of M.V.Act 1988)</H2></CENTER><P>1. Vehicle Fitness Certificate in respect of the vehicle, the detailed particulars where of recorded over above is hereby granted under Sec. 48(3)of M.V.Act 1988 (Valid for use at the Registering Authority on whom it is issued).</P><P>2. Vehicle Fitness Certificate in respect of the Motor Vehicle, the detailed particularswhereof recorded over above is hereby refused under Sec.48(3) of M.V.Act,1988 for the reasons recorded as under:</P><P>To.</BR></BR>&nbsp;&nbsp;&nbsp;Sri/Smt./Kumari. ");
		sb.append(request.getParameter("NAME"));
		sb.append(" and Registration Number of the Vehicle is ");
		sb.append(request.getParameter("REG_NO"));
		sb.append(", Engine Number is ");
		sb.append(request.getParameter("ENG_NO"));
		sb.append(" and Chassis Number is ");
		sb.append(request.getParameter("CHASIS_NO"));
		sb.append(" issue of Vehicle Fitness Certificate valid during the period from ");
		sb.append(request.getParameter("FROMDD")+"/"+request.getParameter("FROMMM")+"/"+request.getParameter("FROMYYYY"));
		sb.append(" to ");
		sb.append(request.getParameter("TODD")+"/"+request.getParameter("TOMM")+"/"+request.getParameter("TOYYYY"));
		sb.append(".</BR></BR>Date: ");
		Calendar currentDate = Calendar.getInstance();
 		SimpleDateFormat formatter= new SimpleDateFormat("dd/MMM/yyyy");
  		String dateNow = formatter.format(currentDate.getTime());
		sb.append(dateNow);
		sb.append("<BR><CENTER><H4>This is computer generated copy does not required signature.</H4></CENTER></P></TD></TR></TABLE></BODY></HTML>");	
		stmt12.setString(2, request.getParameter("VALID"));
		stmt12.setString(3, request.getParameter("BREAKS_VALID"));
		stmt12.setString(4, request.getParameter("POLUTION_VALID"));
		stmt12.setString(5, request.getParameter("CONDITION_VALID"));
		stmt12.setString(6, request.getParameter("COND_REJECT_DETAILS"));	
		stmt12.setString(7, (String)session.getAttribute("ID"));	
		if("YES".equals(request.getParameter("VALID")) && "YES".equals(request.getParameter("BREAKS_VALID")) && "YES".equals(request.getParameter("POLUTION_VALID")) && "YES".equals(request.getParameter("CONDITION_VALID"))) {
			stmt12.setString(8, request.getParameter("FROMDD")+"/"+request.getParameter("FROMMM")+"/"+request.getParameter("FROMYYYY"));
			stmt12.setString(9, request.getParameter("TODD")+"/"+request.getParameter("TOMM")+"/"+request.getParameter("TOYYYY"));
			stmt12.setString(10, sb.toString());	
		} else {
			stmt12.setNull(8, java.sql.Types.NULL);
			stmt12.setNull(9, java.sql.Types.NULL);
			stmt12.setNull(10, java.sql.Types.NULL);	
		}
		
		
		stmt12.setString(11, request.getParameter("ID"));	
		stmt12.executeUpdate();
		stmt12.close();
		OracleDriver.closeConnection(con);
			request.setAttribute("response", "FITNESS issue successfully.");
			request.getRequestDispatcher("managerIndex.jsp").forward(request,response);
	} catch(Exception e) {
		e.printStackTrace();
	}
%>