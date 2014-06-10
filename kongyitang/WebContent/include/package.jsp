<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%//@page import="com.nlsde.liming.database.*" %>
<%@page import="database.*" %>
<%@page import="login.Validate" %>
<%@page import="tools.*" %>
<%@page import="sendSMS.*" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="security.*" %>
<%@page import="IP.*" %>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String sysColor = "#d8a14f";//#FF8C47
String sysFontColor = "#FF8C47";//#d8a14f
String LGName = null;
String LGRole = null;
String curPath = null;
String sysName = "孔医堂！";
String hrSize  = "999 1px";
String P_IMAGES = "http://121.201.7.153/KYTPic/IllnessDes/";
String D_IMAGES = "http://121.201.7.153/KYTPic/Portrait/";
String ImageUrl_tmp = "E:\\code\\web-java\\file\\" ;
//D_IMAGES = ImageUrl_tmp;

%>