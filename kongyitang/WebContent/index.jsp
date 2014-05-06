<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

 <%@ include file="include/package.jsp"%> 
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title><%=sysName %></title>

	 <%@ include file="include/meta.jsp"%> 
	
	<link rel="stylesheet" href="css/jquery.mobile-1.3.2.min.css" />
	<script type="text/javascript" src="js/jquery.min.js"> </script>
	<script src="js/jquery.mobile-1.3.2.min.js"></script>

<style type="text/css">
</style>

</head>
  
 <body>
  <div data-role="page">
	<div data-role="header">
 	</div>
  	<div data-role="content">
    <p>
    	<h1>欢迎来到孔医堂！</h1>
    	<h2>《 首页 》</h2>
    	<h3>目录：</h3>
    	<p>预约：<p/>
    	&nbsp;&nbsp;&nbsp;&nbsp;<a href="reserve_clinic" >门诊预约 >> </a><br>
    	&nbsp;&nbsp;&nbsp;&nbsp;<a href="reserve_health" >健康服务 >> </a><br>
    	&nbsp;&nbsp;&nbsp;&nbsp;<a href="reserve_enrol" >招生在线 >> </a><br>
    	&nbsp;&nbsp;&nbsp;&nbsp;<a href="reserve_product" >产品展示 >> </a><br>
    	<br>
    	<p>提问：<p/>
    	&nbsp;&nbsp;&nbsp;&nbsp;<a href="ask_answer" >提问 >> </a><br>
    	<br>
    	<p>我的：<p/>
    	&nbsp;&nbsp;&nbsp;&nbsp;<a href="my_member" >会员中心 >> </a><br>
    	&nbsp;&nbsp;&nbsp;&nbsp;<a href="my_question" >我的问题 >> </a><br>
    	&nbsp;&nbsp;&nbsp;&nbsp;<a href="my_health" >健康自测 >> </a><br>
    	&nbsp;&nbsp;&nbsp;&nbsp;<a href="my_consume" >消费记录>> </a><br>
	</p>
  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>