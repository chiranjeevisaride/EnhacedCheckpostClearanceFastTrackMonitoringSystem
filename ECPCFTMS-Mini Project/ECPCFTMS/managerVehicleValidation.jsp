<%@page import="java.util.*"%>
<%@page import="com.checkpost.OracleDriver"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%
try {
  Hashtable<String,String> ht=new Hashtable<String,String>();
  boolean isMultipart = ServletFileUpload.isMultipartContent(request);
  DiskFileItemFactory factory = new DiskFileItemFactory();
  //factory.setSizeThreshold(yourMaxMemorySize);
  //factory.setRepository("");
  ServletFileUpload upload = new ServletFileUpload(factory);
  //upload.setSizeMax(yourMaxRequestSize);
  
  List  items = null;
  if(isMultipart) {
  	 items = upload.parseRequest(request);
  	 Iterator iter = items.iterator();
	while (iter.hasNext()) {
	    FileItem item = (FileItem) iter.next();
	    if (item.isFormField() && item.isFormField()) {
		    ht.put(item.getFieldName(), item.getString());
	    } else {
	       
	    }
	}
	System.out.println("is multipart:"+ht);
  } 
  if(ht.size()==0) {
  	ht = (Hashtable)request.getAttribute("HT");
  	System.out.println("ht="+request.getAttribute("HT"));
  }
  if(session.getAttribute("ID")==null || session.getAttribute("MANAGERID")==null) {
  	request.setAttribute("response", "Please Login.");
  	request.getRequestDispatcher("index.jsp").forward(request,response);
  }
  	if(request.getParameter("PAGE")==null) {  		
  		request.setAttribute("ID", ht.get("ID"));
		request.setAttribute("OWNER_NAME",ht.get("OWNER_NAME"));
		request.setAttribute("ADDRESS",ht.get("ADDRESS"));
		request.setAttribute("ENG_NO",ht.get("ENG_NO"));
		request.setAttribute("CHASIS_NO",ht.get("CHASIS_NO"));
		request.setAttribute("BODY",ht.get("BODY"));
		request.setAttribute("COLOR",ht.get("COLOR"));
		request.setAttribute("BRAND",ht.get("BRAND"));
		request.setAttribute("CC",ht.get("CC"));
		request.setAttribute("NOOFSEATS",ht.get("NOOFSEATS"));
		request.setAttribute("BIKE_NAME",ht.get("BIKE_NAME"));
		request.setAttribute("DATEOFMANU",ht.get("DATEOFMANU"));
		request.setAttribute("DISTID",ht.get("DISTID"));
		request.setAttribute("MANDALID",ht.get("MANDALID"));
		request.setAttribute("STATE",ht.get("STATE"));
		request.setAttribute("COUNTRY",ht.get("COUNTRY"));
		request.setAttribute("MANU_MONTH",ht.get("MANU_MONTH"));
		request.setAttribute("MANU_YEAR",ht.get("MANU_YEAR"));
		request.setAttribute("FROMDD",ht.get("FROMDD"));
		request.setAttribute("FROMMM",ht.get("FROMMM"));
		request.setAttribute("FROMYYYY",ht.get("FROMYYYY"));
		request.setAttribute("TODD",ht.get("TODD"));
		request.setAttribute("TOMM",ht.get("TOMM"));
		request.setAttribute("TOYYYY",ht.get("TOYYYY"));
		request.setAttribute("REG_NO",ht.get("REG_NO"));
		System.out.println(ht.get("TOYYYY"));
		System.out.println(request.getParameter("TOYYYY"));
	} else {
		Connection conReg = OracleDriver.getConnection();
		String sql = "SELECT * FROM REG_VEHICLE where ID="+request.getParameter("ID");
		Statement stmt = conReg.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()) {				
			request.setAttribute("ID", rs.getString("ID"));
			request.setAttribute("OWNER_NAME",rs.getString("OWNER_NAME"));
			request.setAttribute("ADDRESS",rs.getString("ADDRESS"));
			request.setAttribute("ENG_NO",rs.getString("ENG_NO"));
			request.setAttribute("CHASIS_NO",rs.getString("CHASIS_NO"));
			request.setAttribute("BODY",rs.getString("BODY"));
			request.setAttribute("COLOR",rs.getString("COLOR"));
			request.setAttribute("BRAND",rs.getString("BRAND"));
			request.setAttribute("CC",rs.getString("CC"));
			request.setAttribute("NOOFSEATS",rs.getString("NOOFSEATS"));
			request.setAttribute("BIKE_NAME",rs.getString("BIKE_NAME"));
			request.setAttribute("DISTID",rs.getString("DISTID"));
			request.setAttribute("MANDALID",rs.getString("MANDALID"));
			request.setAttribute("STATE",rs.getString("STATE"));
			request.setAttribute("COUNTRY",rs.getString("COUNTRY"));
			request.setAttribute("MANU_MONTH",rs.getString("MANU_MONTH"));
			request.setAttribute("MANU_YEAR",rs.getString("MANU_YEAR"));
		}
		rs.close();
		stmt.close();
		conReg.close();
	}
		
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>HOME PAGE</title>
<link href="styles.css" rel="stylesheet" type="text/css" />
<script language="JavaScript">
function submitForMandal() {
	document.customer.action='managerVehicleValidation.jsp';
	document.customer.submit();
}
</script>
</head>
<body>
	<div>
	<TABLE CELLSPACING="0" CELLPADDING="0" ALIGN="CENTER">
		<TR>
			<TD><IMG SRC="images/logo.gif" />
			</TD>
		</TR>
	</TABLE>
	<p></p>
	<table  border="1" align=center>
		<tr>
			<td width="1033" bgcolor="#0033CC">
				<div align="center">
					<font color="white"><strong class="test2">ENHANCED CHECK-POST CLEARANCE AND FAST TRACK MONITORING SYSTEM </strong></font>
				</div>
			</td>
		</tr>
	</table>
	<div id="headpanel">
		<div id="menu">
			<ul>
				<li><a href="home.jsp">Home</a></li>
				<li><div class="gap"></div></li>
				<li><a href="about.jsp">About Us</a></li>
				<li><div class="gap"></div></li>
				<li><a href="contact.jsp">Contact Us</a></li>
				<%
				  if(session.getAttribute("ID")!=null && session.getAttribute("USERID")!=null) {
				 %>
				<li><div class="gap"></div></li>
				<li><a href="customerIndex.jsp">Customer</a></li>
				<%} else  if(session.getAttribute("ID")!=null && session.getAttribute("MANAGERID")!=null) { %>
				<li><div class="gap"></div></li>
				<li><a href="managerIndex.jsp">Manager</a></li>
				<%} else  if(session.getAttribute("ID")!=null && session.getAttribute("ADMINID")!=null) { %>
				<li><div class="gap"></div></li>
				<li><a href="adminIndex.jsp">Admin</a></li>
				<%} else {%>
				<li><div class="gap"></div></li>
				<li><a href="customerIndex.jsp">Customer</a></li>
				<li><div class="gap"></div></li>
				<li><a href="adminIndex.jsp">Admin</a></li>
				<li><div class="gap"></div></li>
				<li><a href="managerIndex.jsp">Manager</a></li>
				<%} %>
				</ul>
		</div>
	</div>
</div>
<br/><br/><br/>
<div>
<form name="customer" action="managerVehicleValidationAction.jsp" method="POST" enctype="multipart/form-data">
<input type="hidden" name="ID" value="<%=request.getAttribute("ID")%>"/>
<table align="center" border="0">
<tr>
<td colspan="3" align="center"><%=(request.getAttribute("response")!=null)?"* "+request.getAttribute("response"):""%></td>
</tr>
</table>
<table align="center" STYLE="border:3px solid blue" border="1">
<tr>
<td colspan="3" align="center">
<font type="arial" color="blue" font size="4">
<b>VEHICLE REGISTRATION PAGE</b></font><br/>
<img src="main.jpg" width="400" height="175">
</td>
</tr>
<tr>
<td colspan="3">
<table  align="center" cellpadding="0" cellspacing="3" border="0">
<tr>
<td align="left">REGISTRATION NO.</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=text name="REG_NO" value="<%=(request.getAttribute("REG_NO")!=null)?request.getAttribute("REG_NO"):""%>" maxlength="100" size=25></td>
</tr>
<tr>
<td align="left">OWNER NAME</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=text name="OWNER_NAME" value="<%=(request.getAttribute("OWNER_NAME")!=null)?request.getAttribute("OWNER_NAME"):""%>" maxlength="100" size=25></td>
</tr>
<tr>
<td align="left">VEHICLE ENGINE NO.</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=text name="ENG_NO" value="<%=(request.getAttribute("ENG_NO")!=null)?request.getAttribute("ENG_NO"):""%>" maxlength="100" size=25></td>
</tr>
<tr>
<td align="left">VEHICLE CHASIS NO.</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=TEXT maxlength="100" name="CHASIS_NO" value="<%=(request.getAttribute("CHASIS_NO")!=null)?request.getAttribute("CHASIS_NO"):""%>" size=25></td>
</tr>
<tr>
<td align="left">VEHICLE BODY TYPE</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=TEXT maxlength="100" name="BODY" value="<%=(request.getAttribute("BODY")!=null)?request.getAttribute("BODY"):""%>" size=25></td>
</tr>
<tr>
<td align="left">VEHICLE BRAND</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=TEXT maxlength="100" name="BRAND" value="<%=(request.getAttribute("BRAND")!=null)?request.getAttribute("BRAND"):""%>" size=25></td>
</tr>
<tr>
<td align="left">VEHICLE NAME</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=TEXT maxlength="100" name="BIKE_NAME" value="<%=(request.getAttribute("BIKE_NAME")!=null)?request.getAttribute("BIKE_NAME"):""%>" size=25></td>
</tr>
<tr>
<td align="left">VEHICLE CC</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=TEXT maxlength="100" name="CC" value="<%=(request.getAttribute("CC")!=null)?request.getAttribute("CC"):""%>" size=25></td>
</tr>
<tr>
<td align="left">SEAT CAPACITY</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=TEXT maxlength="100" name="NOOFSEATS" value="<%=(request.getAttribute("NOOFSEATS")!=null)?request.getAttribute("NOOFSEATS"):""%>" size=25></td>
</tr>
<tr>
<td align="left">VEHICLE COLOR</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=TEXT maxlength="100" name="COLOR" value="<%=(request.getAttribute("COLOR")!=null)?request.getAttribute("COLOR"):""%>" size=25></td>
</tr>
<tr>
<td align="left">MANUFATURE MONTH</td>
<td width="2">&nbsp;</td>
<td width="10">
<SELECT name="MANU_MONTH">
<OPTION value="0">---SELECT---</OPTION>
<%for(int i=1;i<=12;i++) { %>
<OPTION <%=(request.getAttribute("MANU_MONTH")!=null && ((String)request.getAttribute("MANU_MONTH")).equalsIgnoreCase(i+""))?" SELECTED ":"" %>value="<%=i%>"><%=i%></OPTION>
<%} %>
</SELECT>
</td>
</tr>
<tr>
<td align="left">MANUFATURE YEAR</td>
<td width="2">&nbsp;</td>
<td width="10">
<SELECT name="MANU_YEAR">
<OPTION VALUE="0">---SELECT---</OPTION>
<%for(int i=1980;i<=2012;i++) { %>
<OPTION <%=(request.getAttribute("MANU_YEAR")!=null && ((String)request.getAttribute("MANU_YEAR")).equalsIgnoreCase(i+""))?" SELECTED ":"" %> value="<%=i%>"><%=i%></OPTION>
<%} %>
</SELECT>
</td>
</tr>
<tr>
<td align="left">COUNTRY</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=text name="COUNTRY" value="<%=(request.getAttribute("COUNTRY")!=null)?request.getAttribute("COUNTRY"):""%>" maxlength="100" size=25></td>
</tr>
<tr>
<td align="left">STATE</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=text name="STATE" value="<%=(request.getAttribute("STATE")!=null)?request.getAttribute("STATE"):""%>" maxlength="100" size=25></td>
</tr>
<%

		Connection con = OracleDriver.getConnection();
		String sql = "SELECT * FROM DIST";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		Statement stmtMandal = con.createStatement();
		String disticID = (String)request.getAttribute("DISTID");
		if(disticID==null) {
			disticID = "0";
		}
		ResultSet rs1 = stmtMandal.executeQuery("SELECT * FROM MANDAL WHERE DISTID="+disticID);
%>
<tr>
<td align="left">DISTICT</td>
<td width="2">&nbsp;</td>
<td width="10">
<SELECT name="DISTID" onchange="submitForMandal();">
<OPTION VALUE="0">---SELECT---</OPTION>
<%while(rs.next()) { %>
<OPTION <%=(request.getAttribute("DISTID")!=null && ((String)request.getAttribute("DISTID")).equalsIgnoreCase(rs.getString("DISTID")))?" SELECTED ":"" %> value="<%=rs.getInt("DISTID")%>"><%=rs.getString("NAME")%></OPTION>
<%} %>
</SELECT>
</td>
</tr>
<tr>
<td align="left">MANDAL</td>
<td width="2">&nbsp;</td>
<td width="10">
<SELECT name="MANDALID">
<OPTION VALUE="0">---SELECT---</OPTION>
<%while(rs1.next()) { %>
<OPTION <%=(request.getAttribute("MANDALID")!=null && ((String)request.getAttribute("MANDALID")).equalsIgnoreCase(rs1.getString("MANDALID")))?" SELECTED ":"" %> value="<%=rs1.getInt("MANDALID")%>"><%=rs1.getString("NAME")%>-<%=rs1.getString("CODE")%></OPTION>
<%} %>
</SELECT>
</td>
</tr>
<tr>
<td align="left">OWNER ADDRESS</td>
<td width="2">&nbsp;</td>
<td width="10"><textarea rows="5" cols="25" name="ADDRESS"><%=(request.getAttribute("ADDRESS")!=null)?request.getAttribute("ADDRESS"):""%></textarea></td>
</tr>
<tr>
<td align="left">VALID FROM DD/MM/YYYY</td>
<td width="2">&nbsp;</td>
<td width="180">
<SELECT name="FROMDD">
<OPTION value="0">DD</OPTION>
<%for(int i=1;i<=31;i++) { %>
<OPTION value="<%=i%>" <%=(request.getAttribute("FROMDD")!=null && ((String)request.getAttribute("FROMDD")).equalsIgnoreCase(i+""))?" SELECTED ":"" %>><%=i%></OPTION>
<%} %>
</SELECT>
<SELECT name="FROMMM">
<OPTION value="0">MM</OPTION>
<OPTION value="JAN" <%=(request.getAttribute("FROMMM")!=null && ((String)request.getAttribute("FROMMM")).equalsIgnoreCase("JAN"))?" SELECTED ":"" %>>1</OPTION>
<OPTION value="FEB" <%=(request.getAttribute("FROMMM")!=null && ((String)request.getAttribute("FROMMM")).equalsIgnoreCase("FEB"))?" SELECTED ":"" %>>2</OPTION>
<OPTION value="MAR" <%=(request.getAttribute("FROMMM")!=null && ((String)request.getAttribute("FROMMM")).equalsIgnoreCase("MAR"))?" SELECTED ":"" %>>3</OPTION>
<OPTION value="APR" <%=(request.getAttribute("FROMMM")!=null && ((String)request.getAttribute("FROMMM")).equalsIgnoreCase("APR"))?" SELECTED ":"" %>>4</OPTION>
<OPTION value="MAY" <%=(request.getAttribute("FROMMM")!=null && ((String)request.getAttribute("FROMMM")).equalsIgnoreCase("MAY"))?" SELECTED ":"" %>>5</OPTION>
<OPTION value="JUN" <%=(request.getAttribute("FROMMM")!=null && ((String)request.getAttribute("FROMMM")).equalsIgnoreCase("JUN"))?" SELECTED ":"" %>>6</OPTION>
<OPTION value="JUL" <%=(request.getAttribute("FROMMM")!=null && ((String)request.getAttribute("FROMMM")).equalsIgnoreCase("JUL"))?" SELECTED ":"" %>>7</OPTION>
<OPTION value="AUG" <%=(request.getAttribute("FROMMM")!=null && ((String)request.getAttribute("FROMMM")).equalsIgnoreCase("AUG"))?" SELECTED ":"" %>>8</OPTION>
<OPTION value="SEP" <%=(request.getAttribute("FROMMM")!=null && ((String)request.getAttribute("FROMMM")).equalsIgnoreCase("SEP"))?" SELECTED ":"" %>>9</OPTION>
<OPTION value="OCT" <%=(request.getAttribute("FROMMM")!=null && ((String)request.getAttribute("FROMMM")).equalsIgnoreCase("OCT"))?" SELECTED ":"" %>>10</OPTION>
<OPTION value="NOV" <%=(request.getAttribute("FROMMM")!=null && ((String)request.getAttribute("FROMMM")).equalsIgnoreCase("NOV"))?" SELECTED ":"" %>>11</OPTION>
<OPTION value="DEC" <%=(request.getAttribute("FROMMM")!=null && ((String)request.getAttribute("FROMMM")).equalsIgnoreCase("DEC"))?" SELECTED ":"" %>>12</OPTION>
</SELECT>
<SELECT name="FROMYYYY">
<OPTION VALUE="0">YYYY</OPTION>
<%
Calendar cal = Calendar.getInstance();
int year = cal.get(Calendar.YEAR);
for(int i=year;i<=year;i++) { %>
<OPTION value="<%=i%>" <%=(request.getAttribute("FROMYYYY")!=null && ((String)request.getAttribute("FROMYYYY")).equalsIgnoreCase(i+""))?" SELECTED ":"" %>><%=i%></OPTION>
<%} %>
</SELECT>
</td>
</tr>
<tr>
<td align="left">VALID TO DD/MM/YYYY</td>
<td width="2">&nbsp;</td>
<td width="180">
<SELECT name="TODD">
<OPTION value="0">DD</OPTION>
<%for(int i=1;i<=31;i++) { %>
<OPTION value="<%=i%>" <%=(request.getAttribute("TODD")!=null && ((String)request.getAttribute("TODD")).equalsIgnoreCase(i+""))?" SELECTED ":"" %>><%=i%></OPTION>
<%} %>
</SELECT>
<SELECT name="TOMM">
<OPTION value="JAN" <%=(request.getAttribute("TOMM")!=null && ((String)request.getAttribute("TOMM")).equalsIgnoreCase("JAN"))?" SELECTED ":"" %>>1</OPTION>
<OPTION value="FEB" <%=(request.getAttribute("TOMM")!=null && ((String)request.getAttribute("TOMM")).equalsIgnoreCase("FEB"))?" SELECTED ":"" %>>2</OPTION>
<OPTION value="MAR" <%=(request.getAttribute("TOMM")!=null && ((String)request.getAttribute("TOMM")).equalsIgnoreCase("MAR"))?" SELECTED ":"" %>>3</OPTION>
<OPTION value="APR" <%=(request.getAttribute("TOMM")!=null && ((String)request.getAttribute("TOMM")).equalsIgnoreCase("APR"))?" SELECTED ":"" %>>4</OPTION>
<OPTION value="MAY" <%=(request.getAttribute("TOMM")!=null && ((String)request.getAttribute("TOMM")).equalsIgnoreCase("MAY"))?" SELECTED ":"" %>>5</OPTION>
<OPTION value="JUN" <%=(request.getAttribute("TOMM")!=null && ((String)request.getAttribute("TOMM")).equalsIgnoreCase("JUN"))?" SELECTED ":"" %>>6</OPTION>
<OPTION value="JUL" <%=(request.getAttribute("TOMM")!=null && ((String)request.getAttribute("TOMM")).equalsIgnoreCase("JUL"))?" SELECTED ":"" %>>7</OPTION>
<OPTION value="AUG" <%=(request.getAttribute("TOMM")!=null && ((String)request.getAttribute("TOMM")).equalsIgnoreCase("AUG"))?" SELECTED ":"" %>>8</OPTION>
<OPTION value="SEP" <%=(request.getAttribute("TOMM")!=null && ((String)request.getAttribute("TOMM")).equalsIgnoreCase("SEP"))?" SELECTED ":"" %>>9</OPTION>
<OPTION value="OCT" <%=(request.getAttribute("TOMM")!=null && ((String)request.getAttribute("TOMM")).equalsIgnoreCase("OCT"))?" SELECTED ":"" %>>10</OPTION>
<OPTION value="NOV" <%=(request.getAttribute("TOMM")!=null && ((String)request.getAttribute("TOMM")).equalsIgnoreCase("NOV"))?" SELECTED ":"" %>>11</OPTION>
<OPTION value="DEC" <%=(request.getAttribute("TOMM")!=null && ((String)request.getAttribute("TOMM")).equalsIgnoreCase("DEC"))?" SELECTED ":"" %>>12</OPTION>
</SELECT>
<SELECT name="TOYYYY">
<OPTION VALUE="0">YYYY</OPTION>
<%
for(int i=year;i<=year+4;i++) { %>
<OPTION value="<%=i%>" <%=(request.getAttribute("TOYYYY")!=null && ((String)request.getAttribute("TOYYYY")).equalsIgnoreCase(i+""))?" SELECTED ":"" %>><%=i%></OPTION>
<%} %>
</SELECT>
</td>
</tr>
<tr>
<tr>
<td align="left">PHOTO</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=FILE name="PHOTO"/></td>
</tr>
<tr>
<td colspan="3" align="center">
<input type="submit" value="VERIFIED">
</td>
</tr>
<tr><td colspan="3">&nbsp;</td></tr>
<tr>
<td colspan="3">
<font size="3"><a href="managerIndex.jsp">Back</a></font>
</td>
</tr>
</table>
<td>&quot;</td>
</tr>
</table>
</div>
</form>
<%
	} catch(Exception e) {
		System.out.println(e);
	}
 %>
</body>
</html>
