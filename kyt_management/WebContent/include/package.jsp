<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="database.*" %>
<%@page import="security.*" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String adminCheck = null;
String loginedUserName = null;

String sysName = "孔医堂后台管理系统";

String sysColor = "#d8a14f";//#FF8C47
String sysFontColor = "#FF8C47";//#d8a14f

%>