<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

 <%@ include file="../include/package.jsp"%> 
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title><%=sysName %></title>

	 <%@ include file="../include/meta.jsp"%> 
	 <%@ include file="../include/cssJS.jsp"%> 

<style type="text/css">
</style>

</head>
  
 <body>
  <div data-role="page">
	<div data-role="header">
 	</div>
  	<div data-role="content">
    <p>
    <%
    String registerTel =  request.getParameter("registerTel");
    Tools tools = new Tools();
    session.removeAttribute("rightCode");   
	String str_code = tools.GenRandomNum(); 
	
	SendMsg sendMsg = new SendMsg();
	//String tel = "15210983731";
	sendMsg.run(str_code, registerTel);
	session.setAttribute("rightCode",str_code);
	session.setMaxInactiveInterval(60*30);
	
    //System.out.println("registerTel:" + registerTel +"\n");
    %>
    <input id="sendMsgStatus" name="sendMsgStatus" type="hidden"  value="OK" />

  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>