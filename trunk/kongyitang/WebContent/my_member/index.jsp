<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

 <%@ include file="../include/package.jsp"%> 
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title><%=sysName %></title>

	 <%@ include file="../include/meta.jsp"%> 
	 <%@ include file="../include/cssJS.jsp"%> 

<style type="text/css">
</style>

</head>
  <%@ include file="../exit/exit.jsp"%>
 <body>
  <div data-role="page">
	<div data-role="header">
<!--	style="heght:50px;font-sise:25px" -->
	<table width="100%">
		<tr>
			<td width="33%">
				<div id="backButton" style="width:60px;"><a href="javascript:history.back(-1)">返回</a></div>
			</td>
			<td align="center" width="34%"><a style="color:white;">登&nbsp;&nbsp;陆</a></td>
			<td width="33%" align="right">
			&nbsp;&nbsp;
				</td>
		</tr>
	</table>
 	</div>
<center>
  	<div data-role="content">
  	<table width="100%"><tr><td align="center">登&nbsp;&nbsp;陆<hr color="red" ></td></tr></table>
    <form method="post" name="loginForm" id="loginForm" action="login_success.jsp">
	     	 <fieldset data-role="fieldcontain">
<link rel="stylesheet" href="../css/my.css" />
 <script>

 	function setTelNull() {  
		document.getElementById("loginName").value = "";
	}
	
    function checkLogin()
    {
	   var loginName = document.getElementById("loginName").value;
	   var loginPW = document.getElementById("loginPW").value;
	   var message = null;
	   var msg = document.getElementById("msgLogin");
	   var flag = 1;
	   if(null==loginPW||loginPW==""){
			  flag = 0;
		 	  message = "请输入您的密码！";
			  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
		}
	   if(null==loginName||loginName==""){
		  flag = 0;
	 	  message = "请输入您的用户名（手机号）！";
		  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
	   }

	   if(flag==1){
		  document.getElementById("msgLogin").style.display = "none";
	      document.getElementById("loginSubmit").style.display = "none";
		  document.getElementById("loginWait").style.display = "block";
	      var loginForm = document.getElementById("loginForm");
	      loginForm.submit(); 
	   }
    }

    function GoRegister(){
    	window.location = "register_1.jsp";
    }
</script>
		
    	<table width="95%">
    		<tr>
    			<td width="25%"><div id="MyInput">用户名</div></td>
    			<td width="75%"><input id="loginName" name="loginName" type="text" value="请输入手机号" onfocus="setTelNull()" /></td>
    		</tr>
    		<tr>
    			<td width="25%"><div id="MyInput">密&nbsp;&nbsp;&nbsp;&nbsp;码</div></td>
    			<td width="75%"><input id="loginPW" name="loginPW" type="password" value="" /></td>
    		</tr>
    	</table>
    	<br>
    	<%
    	request.setCharacterEncoding("utf-8");
    	curPath = request.getParameter("curPath");
    	if((null==curPath)||curPath.equals("")){
    		;
    	}else{
    		%>
    		<input id="curPath" name="curPath" type="hidden"  value="<%=curPath %>" />
    		<%
    	}
    	%>
    	<div id="msgLogin" ></div>
    	<div id="loginSubmit" ><div id="SubmitButton" onclick="checkLogin()">登&nbsp;&nbsp;&nbsp;&nbsp;陆</div></div>
    	<div id="loginWait" style="display:none"><div id="SubmitButton">正在登陆，请稍后...</div></div>
    	<br>
		<div id="SubmitButton" onclick="GoRegister()">注&nbsp;&nbsp;&nbsp;&nbsp;册</div>

    	</fieldset>
	</form>	
  </div>
</center>
	
<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>