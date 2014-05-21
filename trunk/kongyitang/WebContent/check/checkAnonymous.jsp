<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage=""%>   
<%@page import="database.*" %>
<%@page import="IP.*" %>

<%

GetLocalIpAddress getLocalIpAddress = new GetLocalIpAddress();
String TMP_IPAdress = getLocalIpAddress.getLocalIpAddress();
%>
<%@ include file="../include/IPV4.jsp"%> 
<%
if (IPV4 == null || IPV4.length() == 0 || "unknown".equalsIgnoreCase(IPV4)) {
	;
}else{
	TMP_IPAdress += IPV4;
	//System.out.println("TMP_IPAdress:" + TMP_IPAdress + "\n");
}
IPDao ipDao = new IPDao();
int USERID = 0;
int USERROLE = 0;
USERID = ipDao.getUserID_by_address(TMP_IPAdress);
//USERROLE = ipDao.getUserRole_by_address(TMP_IPAdress);

%> 