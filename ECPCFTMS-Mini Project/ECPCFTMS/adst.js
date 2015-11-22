var clicked=""
var gtype=".gif"
var selstate="_over"
if (typeof(loc)=="undefined" || loc==""){
	var loc=""
	if (document.body&&document.body.innerHTML){
		var tt = document.body.innerHTML.toLowerCase();
		var last = tt.indexOf("adst.js\"");
		if (last>0){
			var first = tt.lastIndexOf("\"", last);
			if (first>0 && first<last) loc = document.body.innerHTML.substr(first+1,last-first-1);
		}
	}
}

document.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr>");
document.write("<td><img src=\""+loc+"adst_top.gif\" alt=\"\" width=\"147\" height=\"15\"></td>");
tr(false);
writeButton(loc+"","adst.html","adst_b1",147,32,"adst","",0);
writeButton(loc+"","gcit.html","adst_b2",147,32,"cgit","",0);
writeButton(loc+"","pgdipvlsi.html","adst_b3",147,32,"pgdipvlsi","",0);
writeButton(loc+"","dippchwnw.html","adst_b4",147,32,"pgdipinpc","",0);
writeButton(loc+"","mastdipcad.html","adst_b5",147,32,"masdipcad","",0);
writeButton(loc+"","ecraft.html","adst_b6",147,32,"e-craft","",0);
writeButton(loc+"","eaccounts.html","adst_b7",147,32,"e-ACCOUNTS","",0);
writeButton(loc+"","ora9idev6i.html","adst_b8",147,32,"ORACLE 9i & DEV 6i","",0);
writeButton(loc+"","clangds.html","adst_b9",147,32,"C-LANGUAGE & DS","",0);
writeButton(loc+"","javaadvjava.html","adst_b10",147,32,"JAVA AND ADV. JAVA","",0);
tr(true);
document.write("<td><img src=\""+loc+"adst_bottom.gif\" alt=\"\" width=\"147\" height=\"17\"></td>");
document.write("</tr></table>")
loc="";

function tr(b){if (b) document.write("<tr>");else document.write("</tr>");}

function turn_over(name) {
	if (document.images != null && clicked != name) {
		document[name].src = document[name+"_over"].src;
	}
}

function turn_off(name) {
	if (document.images != null && clicked != name) {
		document[name].src = document[name+"_off"].src;
	}
}

function reg(gname,name)
{
if (document.images)
	{
	document[name+"_off"] = new Image();
	document[name+"_off"].src = loc+gname+gtype;
	document[name+"_over"] = new Image();
	document[name+"_over"].src = loc+gname+"_over"+gtype;
	}
}

function evs(name){ return " onmouseover=\"turn_over('"+ name + "')\" onmouseout=\"turn_off('"+ name + "')\""}

function writeButton(urld, url, name, w, h, alt, target, hsp)
{
	gname = name;
	while(typeof(document[name])!="undefined") name += "x";
	reg(gname, name);
	tr(true);
	document.write("<td>");
	if (alt != "") alt = " alt=\"" + alt + "\"";
	if (target != "") target = " target=\"" + target + "\"";
	if (w > 0) w = " width=\""+w+"\""; else w = "";
	if (h > 0) h = " height=\""+h+"\""; else h = "";	
	if (url != "") url = " href=\"" + urld + url + "\"";
	
	document.write("<a " + url + evs(name) + target + ">");	
	
	if (hsp == -1) hsp =" align=\"right\"";
	else if (hsp > 0) hsp = " hspace=\""+hsp+"\"";
	else hsp = "";
	
	document.write("<img src=\""+loc+gname+gtype+"\" name=\"" + name + "\"" + w + h + alt + hsp + " border=\"0\" /></a></td>");
	tr(false);
}
