 <%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
 
    <%   
    	session.removeAttribute("loginedUserName");   
   		session.removeAttribute("userRole"); 
   		//session.removeAttribute("curPath"); 
    	//session 删除
    	//session.invalidate();   
    	//设置无缓存   
    	//response.setHeader("progma","no-cache");      
    	//response.setHeader("Cache-Control","no-cache");      
    	//response.setDateHeader("Expires",0);
    	//response.setHeader("Refresh","0;URL=admin.jsp");
    %>
