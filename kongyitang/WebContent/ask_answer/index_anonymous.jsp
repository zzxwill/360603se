<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="database.*" %> 

<body>
  <div data-role="page">
	<div data-role="header">
 	</div>
  	<div data-role="content">
  	<br>
  	<center>
	<div style="width:90%;color:red;">您好， 您尚未登陆孔医堂！<br>如需登陆或注册，请点击下方按钮！</div>
	</center>
	<br>
	<% curPath = request.getScheme() + "://" + request.getHeader("host") + request.getRequestURI();  %>
	<script>
	function GoRegister(){
		window.location = '../my_member/index.jsp?curPath=<%=curPath %>';
		}	
	</script>
	<br>
	<center>
	<div style="width:90%;" id="SubmitButton" onclick="GoRegister()">前往登陆或注册！</div>
	</center>
	</div>

	<div data-role="footer" data-id="myfooter" data-position="fixed"></div> 
</div> 
</body>
