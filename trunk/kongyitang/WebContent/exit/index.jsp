 <%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
 
 <%@ include file="../include/package.jsp"%>  
 <%@ include file="../check/index.jsp"%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    <title><%=sysName %></title>
	 
	 <%@ include file="../include/meta.jsp"%> 
	 <%@ include file="../include/cssJS.jsp"%> 

  </head>
 
  <body>
 
     <center>
    <%   
    	session.removeAttribute("loginedUserName");   
   		session.removeAttribute("userRole"); 
   		session.removeAttribute("curPath"); 
    	//session 删除
    	session.invalidate();   
    	//设置无缓存   
    	response.setHeader("progma","no-cache");      
    	response.setHeader("Cache-Control","no-cache");      
    	//response.setDateHeader("Expires",0);
    	//response.setHeader("Refresh","0;URL=admin.jsp");
    %>
    </center>
 	<script>
		self.location = '../my_member/index.jsp';
		//window.location = "../sys";
    </script>
</body>
</html>