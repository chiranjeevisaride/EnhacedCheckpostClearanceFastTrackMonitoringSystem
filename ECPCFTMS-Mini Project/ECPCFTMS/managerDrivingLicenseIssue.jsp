<%@page import="java.util.*"%>
<%@page import="com.checkpost.OracleDriver"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%
  if(session.getAttribute("ID")==null || session.getAttribute("MANAGERID")==null) {
  	request.setAttribute("response", "Please Login.");
  	request.getRequestDispatcher("index.jsp").forward(request,response);
  }
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

  	if(request.getParameter("PAGE")==null) {  		
  		request.setAttribute("ID", ht.get("ID"));
		request.setAttribute("NAME",ht.get("NAME"));
		request.setAttribute("ADDRESS",ht.get("ADDRESS"));
		request.setAttribute("DISTID",ht.get("DISTID"));
		request.setAttribute("MANDALID",ht.get("MANDALID"));
		request.setAttribute("STATE",ht.get("STATE"));
		request.setAttribute("COUNTRY",ht.get("COUNTRY"));
		request.setAttribute("FROMDD",ht.get("FROMDD"));
		request.setAttribute("FROMMM",ht.get("FROMMM"));
		request.setAttribute("FROMYYYY",ht.get("FROMYYYY"));
		request.setAttribute("DOBDD",ht.get("DOBDD"));
		request.setAttribute("DOBMM",ht.get("DOBMM"));
		request.setAttribute("DOBYYYY",ht.get("DOBYYYY"));
		request.setAttribute("TODD",ht.get("TODD"));
		request.setAttribute("TOMM",ht.get("TOMM"));
		request.setAttribute("TOYYYY",ht.get("TOYYYY"));
		request.setAttribute("DLID",ht.get("DLID"));
		request.setAttribute("BLOODGROUP",ht.get("BLOODGROUP"));
		request.setAttribute("PROOF_AGE",ht.get("PROOF_AGE"));
		request.setAttribute("PROOF_RESIDENCE",ht.get("PROOF_RESIDENCE"));
		request.setAttribute("PHYSICAL_FITNESS",ht.get("PHYSICAL_FITNESS"));
		request.setAttribute("MEDICAL_CERT",ht.get("MEDICAL_CERT"));
		request.setAttribute("LIC_AUTHORITY",ht.get("LIC_AUTHORITY"));
		request.setAttribute("REJECT_REASON",ht.get("REJECT_REASON"));
		request.setAttribute("STATUS",ht.get("STATUS"));
		} else {
		Connection conReg = OracleDriver.getConnection();
		String sql = "SELECT * FROM DRIVING_LICENSE where ID="+request.getParameter("ID");
		Statement stmt = conReg.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()) {				
			request.setAttribute("ID", rs.getString("ID"));
			request.setAttribute("NAME",rs.getString("NAME"));
			request.setAttribute("ADDRESS",rs.getString("ADDRESS"));
			request.setAttribute("DISTID",rs.getString("DISTID"));
			request.setAttribute("MANDALID",rs.getString("MANDALID"));
			request.setAttribute("STATE",rs.getString("STATE"));
			request.setAttribute("COUNTRY",rs.getString("COUNTRY"));
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
	document.customer.action='managerDrivingLicenseIssue.jsp';
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
	<table align=center>
		<tr>
			<td width="880" bgcolor="#0033CC">
				<div align="center">
					<font color="white"><strong class="test2">CENTRAL CHECKPOST COMPUTERIZATION </strong></font>
				</div>
			</td>
		</tr>
	</table>
	<div id="headpanel" style="margin-left:250">
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
<form name="customer" action="managerDrivingLicenseIssueAction.jsp" method="POST" enctype="multipart/form-data">
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
<b>DRIVING LICENSE REGISTRATION PAGE</b></font><br/>
<img src="main.jpg" width="400" height="175">
</td>
</tr>
<tr>
<td colspan="3">
<table  align="center" cellpadding="0" cellspacing="3" border="0">
<tr>
<td align="left">DRIVING LICENSE(DLR) NO.</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=text name="DLID" value="<%=(request.getAttribute("DLID")!=null)?request.getAttribute("DLID"):""%>" maxlength="100" size=25></td>
</tr>
<tr>
<td align="left">OWNER NAME</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=text name="NAME" value="<%=(request.getAttribute("NAME")!=null)?request.getAttribute("NAME"):""%>" maxlength="100" size=25></td>
</tr>
<tr>
<td align="left">DOB DD/MM/YYYY</td>
<td width="2">&nbsp;</td>
<td width="180">
<SELECT name="DOBDD">
<OPTION value="0">DD</OPTION>
<%for(int i=1;i<=31;i++) { %>
<OPTION value="<%=i%>" <%=(request.getAttribute("DOBDD")!=null && ((String)request.getAttribute("DOBDD")).equalsIgnoreCase(i+""))?" SELECTED ":"" %>><%=i%></OPTION>
<%} %>
</SELECT>
<SELECT name="DOBMM">
<OPTION value="0">MM</OPTION>
<OPTION value="JAN" <%=(request.getAttribute("DOBMM")!=null && ((String)request.getAttribute("DOBMM")).equalsIgnoreCase("JAN"))?" SELECTED ":"" %>>1</OPTION>
<OPTION value="FEB" <%=(request.getAttribute("DOBMM")!=null && ((String)request.getAttribute("DOBMM")).equalsIgnoreCase("FEB"))?" SELECTED ":"" %>>2</OPTION>
<OPTION value="MAR" <%=(request.getAttribute("DOBMM")!=null && ((String)request.getAttribute("DOBMM")).equalsIgnoreCase("MAR"))?" SELECTED ":"" %>>3</OPTION>
<OPTION value="APR" <%=(request.getAttribute("DOBMM")!=null && ((String)request.getAttribute("DOBMM")).equalsIgnoreCase("APR"))?" SELECTED ":"" %>>4</OPTION>
<OPTION value="MAY" <%=(request.getAttribute("DOBMM")!=null && ((String)request.getAttribute("DOBMM")).equalsIgnoreCase("MAY"))?" SELECTED ":"" %>>5</OPTION>
<OPTION value="JUN" <%=(request.getAttribute("DOBMM")!=null && ((String)request.getAttribute("DOBMM")).equalsIgnoreCase("JUN"))?" SELECTED ":"" %>>6</OPTION>
<OPTION value="JUL" <%=(request.getAttribute("DOBMM")!=null && ((String)request.getAttribute("DOBMM")).equalsIgnoreCase("JUL"))?" SELECTED ":"" %>>7</OPTION>
<OPTION value="AUG" <%=(request.getAttribute("DOBMM")!=null && ((String)request.getAttribute("DOBMM")).equalsIgnoreCase("AUG"))?" SELECTED ":"" %>>8</OPTION>
<OPTION value="SEP" <%=(request.getAttribute("DOBMM")!=null && ((String)request.getAttribute("DOBMM")).equalsIgnoreCase("SEP"))?" SELECTED ":"" %>>9</OPTION>
<OPTION value="OCT" <%=(request.getAttribute("DOBMM")!=null && ((String)request.getAttribute("DOBMM")).equalsIgnoreCase("OCT"))?" SELECTED ":"" %>>10</OPTION>
<OPTION value="NOV" <%=(request.getAttribute("DOBMM")!=null && ((String)request.getAttribute("DOBMM")).equalsIgnoreCase("NOV"))?" SELECTED ":"" %>>11</OPTION>
<OPTION value="DEC" <%=(request.getAttribute("DOBMM")!=null && ((String)request.getAttribute("DOBMM")).equalsIgnoreCase("DEC"))?" SELECTED ":"" %>>12</OPTION>
</SELECT>
<SELECT name="DOBYYYY">
<OPTION VALUE="0">YYYY</OPTION>
<%
Calendar cal1 = Calendar.getInstance();
int year = cal1.get(Calendar.YEAR);
for(int i=year-50;i<=year-15;i++) { %>
<OPTION value="<%=i%>" <%=(request.getAttribute("DOBYYYY")!=null && ((String)request.getAttribute("DOBYYYY")).equalsIgnoreCase(i+""))?" SELECTED ":"" %>><%=i%></OPTION>
<%} %>
</SELECT>
</td>
</tr>
<tr>
<td align="left">BLOOD GROUP</td>
<td width="2">&nbsp;</td>
<td width="10">
<SELECT name="BLOODGROUP">
<OPTION value="0">BG</OPTION>
<OPTION value="O-" <%=(request.getAttribute("BLOODGROUP")!=null && ((String)request.getAttribute("BLOODGROUP")).equalsIgnoreCase("O-"))?" SELECTED ":"" %>>O-</OPTION>
<OPTION value="O+" <%=(request.getAttribute("BLOODGROUP")!=null && ((String)request.getAttribute("BLOODGROUP")).equalsIgnoreCase("O+"))?" SELECTED ":"" %>>O+</OPTION>
<OPTION value="A-" <%=(request.getAttribute("BLOODGROUP")!=null && ((String)request.getAttribute("BLOODGROUP")).equalsIgnoreCase("A-"))?" SELECTED ":"" %>>A-</OPTION>
<OPTION value="A+" <%=(request.getAttribute("BLOODGROUP")!=null && ((String)request.getAttribute("BLOODGROUP")).equalsIgnoreCase("A+"))?" SELECTED ":"" %>>A+</OPTION>
<OPTION value="B-" <%=(request.getAttribute("BLOODGROUP")!=null && ((String)request.getAttribute("BLOODGROUP")).equalsIgnoreCase("B-"))?" SELECTED ":"" %>>B-</OPTION>
<OPTION value="B+" <%=(request.getAttribute("BLOODGROUP")!=null && ((String)request.getAttribute("BLOODGROUP")).equalsIgnoreCase("B+"))?" SELECTED ":"" %>>B+</OPTION>
<OPTION value="AB-" <%=(request.getAttribute("BLOODGROUP")!=null && ((String)request.getAttribute("BLOODGROUP")).equalsIgnoreCase("AB-"))?" SELECTED ":"" %>>AB-</OPTION>
<OPTION value="AB+" <%=(request.getAttribute("BLOODGROUP")!=null && ((String)request.getAttribute("BLOODGROUP")).equalsIgnoreCase("AB+"))?" SELECTED ":"" %>>AB+</OPTION>
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
<td align="left">CUSTOMER ADDRESS</td>
<td width="2">&nbsp;</td>
<td width="10"><textarea rows="5" cols="25" name="ADDRESS"><%=(request.getAttribute("ADDRESS")!=null)?request.getAttribute("ADDRESS"):""%></textarea></td>
</tr>
<tr>
<td align="left">AGE PROOF</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=text name="PROOF_AGE" value="<%=(request.getAttribute("PROOF_AGE")!=null)?request.getAttribute("PROOF_AGE"):""%>" maxlength="100" size=25></td>
</tr>
<tr>
<td align="left">ADDRESS PROOF</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=text name="PROOF_RESIDENCE" value="<%=(request.getAttribute("PROOF_RESIDENCE")!=null)?request.getAttribute("PROOF_RESIDENCE"):""%>" maxlength="100" size=25></td>
</tr>
<tr>
<td align="left">PHYSICAL FITNESS</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=text name="PHYSICAL_FITNESS" value="<%=(request.getAttribute("PHYSICAL_FITNESS")!=null)?request.getAttribute("PHYSICAL_FITNESS"):""%>" maxlength="100" size=25></td>
</tr>
<tr>
<td align="left">MEDICAL CERT. ISSUE BY</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=text name="MEDICAL_CERT" value="<%=(request.getAttribute("MEDICAL_CERT")!=null)?request.getAttribute("MEDICAL_CERT"):""%>" maxlength="100" size=25></td>
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
 year = cal.get(Calendar.YEAR);
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
<td align="left">LIC AUTHORITY</td>
<td width="2">&nbsp;</td>
<td width="10"><input type=text name="LIC_AUTHORITY" value="<%=(request.getAttribute("LIC_AUTHORITY")!=null)?request.getAttribute("LIC_AUTHORITY"):""%>" maxlength="100" size=25></td>
</tr>
<tr>
<td align="left">REJECT REASON</td>
<td width="2">&nbsp;</td>
<td width="10"><textarea rows="5" cols="25" name="REJECT_REASON"><%=(request.getAttribute("REJECT_REASON")!=null)?request.getAttribute("REJECT_REASON"):""%></textarea></td>
</tr>
<tr>
<td align="left">ACCEPT/REJECT</td>
<td width="2">&nbsp;</td>
<td width="10">
<input type="radio" name="STATUS" <%=(request.getAttribute("STATUS")!=null && request.getAttribute("STATUS").equals("ACCEPT"))?" SELECTED ":""%> VALUE="ACCEPT"/>ACCEPT
<input type="radio" name="STATUS" <%=(request.getAttribute("STATUS")!=null && request.getAttribute("STATUS").equals("REJECT"))?" SELECTED ":""%> VLAUE="REJECT"/>REJECT
</td>
</tr>
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
