<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%
String IPV4 = request.getHeader("x-forwarded-for");
if (IPV4 == null || IPV4.length() == 0 || "unknown".equalsIgnoreCase(IPV4)) {
	IPV4 = request.getHeader("Proxy-Client-IP");
}
if (IPV4 == null || IPV4.length() == 0 || "unknown".equalsIgnoreCase(IPV4)) {
	IPV4 = request.getHeader("WL-Proxy-Client-IP");
}
if (IPV4 == null || IPV4.length() == 0 || "unknown".equalsIgnoreCase(IPV4)) {
	IPV4 = request.getRemoteAddr();
}

%>