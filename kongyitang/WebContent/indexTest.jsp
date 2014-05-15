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
    	&nbsp;&nbsp;&nbsp;&nbsp;<a href="reserve_clinic/index.jsp" >门诊预约 >> </a><br>
    	&nbsp;&nbsp;&nbsp;&nbsp;<a href="reserve_shanggongfang/index.jsp" >健康服务 >> </a><br>
    	&nbsp;&nbsp;&nbsp;&nbsp;<a href="reserve_xuetang/index.jsp" >招生在线 >> </a><br>
    	&nbsp;&nbsp;&nbsp;&nbsp;<a href="reserve_product/index.jsp" >产品展示 >> </a><br>
    	<br>
    	<p>提问：<p/>
    	&nbsp;&nbsp;&nbsp;&nbsp;<a href="ask_answer/index.jsp" >提问 >> </a><br>
    	<br>
    	<p>我的：<p/>
    	&nbsp;&nbsp;&nbsp;&nbsp;<a href="my_member/index.jsp" >会员中心 >> </a><br>
    	&nbsp;&nbsp;&nbsp;&nbsp;<a href="my_question/index.jsp" >我的问题 >> </a><br>
    	&nbsp;&nbsp;&nbsp;&nbsp;<a href="my_health/index.jsp" >健康自测 >> </a><br>
    	&nbsp;&nbsp;&nbsp;&nbsp;<a href="my_consume/index.jsp" >消费记录>> </a><br>
	</p>
  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>