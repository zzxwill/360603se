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
    <%
    String url = "index.jsp";
    String setPasswordTel =  request.getParameter("setPasswordTel");
    String setPasswordCode =  request.getParameter("setPasswordCode");
    
    if((null==setPasswordTel)||(setPasswordTel.equals(""))
    		||(null==setPasswordCode)||(setPasswordCode.equals(""))){
    %>
	    <script language='javascript' type='text/javascript'>
				window.location = "<%=url%>";
		</script>
    <%	
    }else{
    	
        ValidateCodeDao validateCodeDao = new ValidateCodeDao();
        String rightCode = validateCodeDao.getValidateCode(setPasswordTel);
       // String rightCode = (String)session.getAttribute("rightCode");
        int validate = 0;
        Tools tools = new Tools();
        validate = tools.validateCode(setPasswordCode,rightCode);
        //TODO 验证
    	if(validate==1){
    		//System.out.println("success!" + "\n");
    	%>
    	<input id="validateSetPasswordStatus" name="validateSetPasswordStatus" type="hidden"  value="OK" />
    	<%
    	}    
        %>
    	
    <%} %>

     	<br>
    	<h1>欢迎来到孔医堂！</h1><br>
    	<h2>《 重置密码1 》</h2><br>
  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>