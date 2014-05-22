<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

 <%@ include file="../include/package.jsp"%> 
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title><%=sysName %></title>

	 <%@ include file="../include/meta.jsp"%> 
	 <%@ include file="../include/cssJS.jsp"%> 
    
</head>
  
     <%@ include file="../check/checkAnonymous.jsp"%> 
     <%//@ include file="../check/index.jsp"%>
  <% //String weixinID = "oDK3oji70nN1CG77qYR_z_thFUBs"; 
  //oDK3oji70nN1CG77qYR_z_thFUBs
  //gh_f5c1c22104b0

%>
<%
if(USERID>0){//患者或医生
	USERROLE = ipDao.getUserRole_by_address(TMP_IPAdress);
	if(USERROLE==0){ //患者
	%>
		<%@ include file="../ask_answer/index_patient.jsp"%> 

	<%}
	else if(USERROLE==1){ //医生
	%>
		<%@ include file="../ask_answer/index_doctor.jsp"%> 
  	<%
	}
}else{//游客
	%>
	 	<%@ include file="../ask_answer/index_anonymous.jsp"%> 
<%}%>

</html>
