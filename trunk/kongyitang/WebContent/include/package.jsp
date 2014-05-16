<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%//@page import="com.nlsde.liming.database.*" %>
<%@page import="database.*" %>
<%@page import="login.Validate" %>
<%@page import="tools.*" %>
<%@page import="sendSMS.*" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="security.*" %>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String sysColor = "#d8a14f";//#FF8C47
String sysFontColor = "#FF8C47";//#d8a14f
String loginedUserName = null;
String sysName = "孔医堂！";

%>