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
    String url = "index.jsp";
    String setPasswordTel =  request.getParameter("setPasswordTel");
    //String setPasswordRole =  request.getParameter("role");
    if((null==setPasswordTel)||(setPasswordTel.equals(""))){
    %>
	    <script language='javascript' type='text/javascript'>
				window.location = "<%=url%>";
		</script>
    <%	
    }else{
    	
    	ValidateCodeDao validateCodeDao = new ValidateCodeDao();
    	validateCodeDao.deleteValidateCode(setPasswordTel);
    	
    	Tools tools = new Tools(); 
    	String str_code = tools.GenRandomNum(); 
    	
    	SendMsg sendMsg = new SendMsg();
    	//String tel = "15210983731";
    	sendMsg.run(str_code, setPasswordTel);
    	validateCodeDao.insertValidateCode(setPasswordTel,str_code);
    	
       // System.out.println("str_code:" + str_code +"\n");
        %>
        <input id="sendSetPasswordMsgStatus" name="sendSetPasswordMsgStatus" type="hidden"  value="OK" />
    <%} %>
    
  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>