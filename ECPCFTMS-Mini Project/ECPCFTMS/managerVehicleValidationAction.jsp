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
		       	physicalPhotoPath = ht.get("ID")+item.getName();
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
	Statement stmtEngine = con.createStatement();
	ResultSet rsEngine = stmtEngine.executeQuery("SELECT COUNT(*) FROM REG_VEHICLE WHERE (ENG_NO='"+ht.get("ENG_NO")+"' OR CHASIS_NO='"+ht.get("CHASIS_NO")+"') AND ID!="+ht.get("ID"));
	Statement stmtReg = con.createStatement();
	ResultSet rsReg = stmtEngine.executeQuery("SELECT COUNT(*) FROM REG_VEHICLE WHERE REG_NO='"+ht.get("REG_NO")+"' AND ID!="+ht.get("ID"));
	boolean rtoFlag = true;
	boolean engineFlag = true;
	boolean regFlag = true;
	if(rs.next() && rs.getInt(1)==1) {
		rtoFlag = true;
	} else {
		rtoFlag = false;
		request.setAttribute("response", "Do not have permissions to register other RTA location.");
		request.getRequestDispatcher("managerVehicleValidation.jsp").forward(request,response);	
	}
	if(rtoFlag && (rsEngine.next() && rsEngine.getInt(1)!=0)) {
		engineFlag = false;
		request.setAttribute("response", "Engine No or Chasis No alredy exists for other vehicle.");
		request.getRequestDispatcher("managerVehicleValidation.jsp").forward(request,response);	
	}
	if(rtoFlag && regFlag && (rsReg.next() && rsReg.getInt(1)!=0)) {
		regFlag = false;
		request.setAttribute("response", "Registraion alredy exists for other vehicle.");
		request.getRequestDispatcher("managerVehicleValidation.jsp").forward(request,response);	
	}
	PreparedStatement pstmt = null;
	PreparedStatement pstmt1 = null;
	PreparedStatement pstmt2 = null;
	if(rtoFlag && engineFlag && regFlag) {
		System.out.println("Getting Here");
		pstmt = con.prepareStatement("UPDATE REG_VEHICLE SET OWNER_NAME=?,ADDRESS=?,ENG_NO=?,CHASIS_NO=?,BODY=?,COLOR=?,BRAND=?,CC=?,NOOFSEATS=?,BIKE_NAME=?,DISTID=?,MANDALID=?,STATE=?,COUNTRY=?,MANU_MONTH=?,MANU_YEAR=?,REG_NO=? WHERE ID=?");
		pstmt.setString(1,ht.get("OWNER_NAME"));
		pstmt.setString(2,ht.get("ADDRESS"));
		pstmt.setString(3,ht.get("ENG_NO"));
		pstmt.setString(4,ht.get("CHASIS_NO"));
		pstmt.setString(5,ht.get("BODY"));
		pstmt.setString(6,ht.get("COLOR"));
		pstmt.setString(7,ht.get("BRAND"));
		pstmt.setString(8,ht.get("CC"));
		pstmt.setString(9,ht.get("NOOFSEATS"));
		pstmt.setString(10,ht.get("BIKE_NAME"));
		pstmt.setString(11,ht.get("DISTID"));
		pstmt.setString(12,ht.get("MANDALID"));
		pstmt.setString(13,ht.get("STATE"));
		pstmt.setString(14,ht.get("COUNTRY"));
		//pstmt.setTimestamp(15,new Timestamp(System.currentTimeMillis()));
		pstmt.setString(15,ht.get("MANU_MONTH"));
		pstmt.setString(16,ht.get("MANU_YEAR"));
		pstmt.setString(17, ht.get("REG_NO"));
		pstmt.setString(18,(String)ht.get("ID"));
		pstmt.executeUpdate();
		pstmt.close();
		pstmt1 = con.prepareStatement("INSERT INTO REG_VEHICLE_VALID(VALID_FROM,VALID_TO,REG_ID,STATUS,EMP_ID,PHOTO_PATH,CREATED_ON) VALUES(?,?,?,?,?,?,?)");
		pstmt1.setString(1,ht.get("FROMDD")+"/"+ht.get("FROMMM")+"/"+ht.get("FROMYYYY"));
		pstmt1.setString(2,ht.get("TODD")+"/"+ht.get("TOMM")+"/"+ht.get("TOYYYY"));
		pstmt1.setString(3,ht.get("ID"));
		pstmt1.setNull(4,java.sql.Types.NULL);
		pstmt1.setString(5,(String)session.getAttribute("ID"));
		pstmt1.setString(6,physicalPhotoPath);
		pstmt1.setTimestamp(7,new Timestamp(System.currentTimeMillis()));
		pstmt1.executeUpdate();
		pstmt1.close();
		pstmt2 = con.prepareStatement("UPDATE SLOT SET FLAG=1 WHERE REG_ID=? AND FLAG=0");
		pstmt2.setString(1,ht.get("ID"));
		pstmt2.executeUpdate();		
		pstmt2.close();
		request.setAttribute("response", "Vehicle Registration Successfully.");
		request.getRequestDispatcher("managerIndex.jsp").forward(request,response);
	}
	rs.close();
	stmt.close();
	stmtEngine.close();
	rsEngine.close();
	stmtReg.close();
	rsReg.close();
	OracleDriver.closeConnection(con);
		}catch(Exception e) {
			e.printStackTrace();
		}
%>