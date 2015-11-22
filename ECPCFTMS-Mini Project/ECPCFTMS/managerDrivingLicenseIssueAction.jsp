<%@page import="com.checkpost.OracleDriver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.util.*"%>
<%

  if(session.getAttribute("ID")==null || session.getAttribute("MANAGERID")==null) {
  	request.setAttribute("response", "Please Login.");
  	request.getRequestDispatcher("managerIndex.jsp").forward(request,response);
  }

	try {
	 Hashtable<String,String> ht=new Hashtable<String,String>();
  boolean isMultipart = ServletFileUpload.isMultipartContent(request);
  DiskFileItemFactory factory = new DiskFileItemFactory();
  //factory.setSizeThreshold(yourMaxMemorySize);
  String repository = session.getServletContext().getRealPath("/");
  repository = repository+"photos";
  factory.setRepository(new File(repository));
  ServletFileUpload upload = new ServletFileUpload(factory);
  //upload.setSizeMax(yourMaxRequestSize);
  String physicalPhotoPath = "";
  List  items = null;
  if(isMultipart) {
  	 items = upload.parseRequest(request);
  	 Iterator iter = items.iterator();
	while (iter.hasNext()) {
	    FileItem item = (FileItem) iter.next();
	    if (item.isFormField() && item.isFormField()) {
		    ht.put(item.getFieldName(), item.getString());
	    } else {
	    	try {
		        String fieldName = item.getFieldName();
			    String fileName = item.getName();
			    String contentType = item.getContentType();
			    boolean isInMemory = item.isInMemory();
			    long sizeInBytes = item.getSize();
		       	File file = new File(repository,item.getName());
		       	item.write(file);
		       	physicalPhotoPath = "DL"+ht.get("ID")+item.getName();
		       	file.renameTo(new File(repository+"\\"+physicalPhotoPath));
			} catch(Exception ee){}
	    }
	}
		  	request.setAttribute("HT", ht);
  }
	Connection con = OracleDriver.getConnection();
	String sql = "SELECT COUNT(*) FROM EMPLOYEE WHERE ID="+session.getAttribute("ID")+" AND DISTID="+ht.get("DISTID")+" AND MANDALID="+ht.get("MANDALID");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	Statement stmtReg = con.createStatement();
	ResultSet rsReg = stmtReg.executeQuery("SELECT COUNT(*) FROM DRIVING_LICENSE WHERE DLID='"+ht.get("REG_NO")+"' AND ID!="+ht.get("ID"));
	boolean rtoFlag = true;
	boolean regFlag = true;
	if(rs.next() && rs.getInt(1)==1) {
		rtoFlag = true;
	} else {
		rtoFlag = false;
		request.setAttribute("response", "Do not have permissions to register other RTA location.");
		request.getRequestDispatcher("managerDrivingLicenseIssue.jsp").forward(request,response);	
	}
	if(rtoFlag && regFlag && (rsReg.next() && rsReg.getInt(1)!=0)) {
		regFlag = false;
		request.setAttribute("response", "DLID Registraion alredy exists for other customer.");
		request.getRequestDispatcher("managerDrivingLicenseIssue.jsp").forward(request,response);	
	}
	PreparedStatement pstmt = null;
	PreparedStatement pstmt1 = null;
	PreparedStatement pstmt2 = null;
	if(rtoFlag && regFlag) {
		if(ht.get("STATUS").equals("ACCEPT")) {
			pstmt = con.prepareStatement("UPDATE DRIVING_LICENSE SET REJECT_REASON='', STATUS='CLOSE', NAME=?,ADDRESS=?,DOB=?,VALID_FROM=?, VALID_TO=?,DISTID=?,MANDALID=?,STATE=?,COUNTRY=?,BLOOD_GROUP=?, LIC_AUTHORITY=?, MEDICAL_CERT=?, PHYSICAL_FITNESS=?, PROOF_AGE=?, PROOF_RESIDENCE=?, PHOTO_PATH=?, EMP_ID=?, DLID=? WHERE ID=?");
			pstmt.setString(1,ht.get("NAME"));
			pstmt.setString(2,ht.get("ADDRESS"));
			pstmt.setString(3,ht.get("DOBDD")+"/"+ht.get("DOBMM")+"/"+ht.get("DOBYYYY"));
			pstmt.setString(4,ht.get("FROMDD")+"/"+ht.get("FROMMM")+"/"+ht.get("FROMYYYY"));
			pstmt.setString(5,ht.get("TODD")+"/"+ht.get("TOMM")+"/"+ht.get("TOYYYY"));
			pstmt.setString(6,ht.get("DISTID"));
			pstmt.setString(7,ht.get("MANDALID"));
			pstmt.setString(8,ht.get("STATE"));
			pstmt.setString(9,ht.get("COUNTRY"));
			pstmt.setString(10,ht.get("BLOODGROUP"));
			pstmt.setString(11,ht.get("LIC_AUTHORITY"));
			pstmt.setString(12,ht.get("MEDICAL_CERT"));
			pstmt.setString(13,ht.get("PHYSICAL_FITNESS"));
			pstmt.setString(14,ht.get("PROOF_AGE"));
			pstmt.setString(15,ht.get("PROOF_RESIDENCE"));
			pstmt.setString(16,physicalPhotoPath);
			pstmt.setString(17,(String)session.getAttribute("ID"));
			pstmt.setString(18,ht.get("DLID"));
			pstmt.setString(19,ht.get("ID"));
			pstmt.executeUpdate();
			pstmt.close();
			pstmt2 = con.prepareStatement("UPDATE DRIVING_SLOT SET STATUS='ACCEPT' WHERE DRIVE_ID=? AND STATUS='OPEN'");
			pstmt2.setString(1,ht.get("ID"));
			pstmt2.executeUpdate();		
			pstmt2.close();
			request.setAttribute("response", "Driving License Registration Successfully.");
		} else {
			pstmt = con.prepareStatement("UPDATE DRIVING_LICENSE SET REJECT_REASON=? WHERE ID=?");
			pstmt.setString(1,ht.get("REJECT_REASON"));
			pstmt.setString(2,ht.get("ID"));
			pstmt.executeUpdate();
			pstmt.close();
			pstmt2 = con.prepareStatement("UPDATE DRIVING_SLOT SET STATUS='REJECT' WHERE DRIVE_ID=? AND STATUS='OPEN'");
			pstmt2.setString(1,ht.get("ID"));
			pstmt2.executeUpdate();		
			pstmt2.close();
			request.setAttribute("response", "Driving License Rejected Successfully.");
		}
		request.getRequestDispatcher("managerIndex.jsp").forward(request,response);
	}
	rs.close();
	stmt.close();
	stmtReg.close();
	rsReg.close();
	OracleDriver.closeConnection(con);
		}catch(Exception e) {
			e.printStackTrace();
		}
%>