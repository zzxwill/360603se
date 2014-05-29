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
    String registerCode =  request.getParameter("registerCode");
    
    if((null==registerCode)||(registerCode.equals(""))){
    %>
	    <script language='javascript' type='text/javascript'>
				window.location = "<%=url%>";
		</script>
    <%	
    }else{
    	ValidateCodeDao validateCodeDao = new ValidateCodeDao();
	    Tools tools = new Tools();
	    String rightCode = validateCodeDao.getValidateCode(registerCode);
	    int validate = 0;
	    validate = tools.validateCode(registerCode,rightCode);
	    //TODO 验证
		if(validate==1){
			//System.out.println("success!" + "\n");
		%>
		<input id="validateStatus" name="validateStatus" type="hidden"  value="OK" />
		<%
		}    
    }
    	%>
    	
     	<br>
    	<h1>欢迎来到孔医堂！</h1><br>
    	<h2>《 会员注册1 》</h2><br>
	</p>
  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>