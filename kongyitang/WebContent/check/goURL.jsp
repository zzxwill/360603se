<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage=""%>   

<%
response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
String newLocn = curPath;
response.setHeader("Location",newLocn);	
%> 