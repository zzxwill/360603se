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

String sysColor = "#FF8C47";
String loginedUserName = null;
String sysName = "孔医堂！";

%>