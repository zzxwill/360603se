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
    <script>
    function reserve_clinic(){
    	window.location = "reserve_clinic/index.jsp";
     }
    function reserve_shanggongfang(){
    	window.location = "reserve_shanggongfang/index.jsp";
     }
    function reserve_xuetang(){
    	window.location = "reserve_xuetang/index.jsp";
     }
    function reserve_product(){
    	window.location = "reserve_product/index.jsp";
     }
    
    function ask_answer(){
    	window.location = "ask_answer/index.jsp";
     }
    
    function my_member(){
    	window.location = "my_member/index.jsp";
     }
    function my_health(){
    	window.location = "my_health/index.jsp";
     }
    function admin(){
    	window.location = "admin/index.jsp";
     }
    </script>
    	<h1>欢迎来到孔医堂！</h1>
    	<h2>《 首页 》</h2>
    	<br><br>   	
    <h2>	  <div onclick="admin();" style="color=red">&nbsp;&nbsp;&nbsp;&nbsp;录入医生信息 >> </div><br> 	</h2>
    	   	
    	   	<br><br>
    	<h3>目录：</h3>
    	<p>预约：<p/>
    	<div onclick="reserve_clinic();" >&nbsp;&nbsp;&nbsp;&nbsp;门诊预约 >> </div><br>
    	<div onclick="reserve_shanggongfang();" >&nbsp;&nbsp;&nbsp;&nbsp;健康服务 >> </div><br>
    	<div onclick="reserve_xuetang();" >&nbsp;&nbsp;&nbsp;&nbsp;招生在线 >> </div><br>
    	<div onclick="reserve_product();" >&nbsp;&nbsp;&nbsp;&nbsp;产品展示 >> </div><br>
    	<br>
    	<p>提问：<p/>
    	<div onclick="ask_answer();" >&nbsp;&nbsp;&nbsp;&nbsp;提问 >> </div><br>
    	<br>
    	<p>我的：<p/>
    	<div onclick="my_member();" >&nbsp;&nbsp;&nbsp;&nbsp;会员中心 >> </div><br>
    	<div onclick="my_health();" >&nbsp;&nbsp;&nbsp;&nbsp;健康自测 >> </div><br>
  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>