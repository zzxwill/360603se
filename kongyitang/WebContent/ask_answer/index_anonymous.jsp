<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="database.*" %> 

<body>
  <div data-role="page">
	<div data-role="header">
 	</div>
  	<div data-role="content">
	<p style='color:red;'>您好， 您还未登陆孔医堂，如需登陆或注册，请点击下方按钮！</p>
	<br>
	<% curPath = request.getScheme() + "://" + request.getHeader("host") + request.getRequestURI();  %>
	<script>
	function GoRegister(){
		window.location = '../my_member/index.jsp?curPath=<%=curPath %>';
		}	
	</script>
	<br>
	<center>
	<div id="SubmitButton" onclick="GoRegister()">前往登陆或注册！</div>
	</center>
	</div>

	<div data-role="footer" data-id="myfooter" data-position="fixed"></div> 
</div> 
</body>
