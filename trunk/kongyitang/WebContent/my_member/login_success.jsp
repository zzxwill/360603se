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
  
 <body>
  <div data-role="page">
	<div data-role="header">
 	</div>
 <center>
  	<div data-role="content">
	<form method="post" name="loginForm" id="loginForm" action="login_success.jsp">
	     <fieldset data-role="fieldcontain">
 <script>
    function checkLogin()
    {
       document.getElementById("tmpMsg").style.display = "none"; 
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
		  document.getElementById("loginSubmit").style.display = "none";
		  document.getElementById("loginWait").style.display = "block";
	      var loginForm = document.getElementById("loginForm");
	      loginForm.submit(); 
	   }
    }

</script>
	<%
	request.setCharacterEncoding("UTF-8");
	String url = "index.jsp";
	String loginName = request.getParameter("loginName");
	String loginPW = request.getParameter("loginPW");
	if(null==loginName||loginName.equals("")||null==loginPW||loginPW.equals("")){
	%>
		<script language='javascript' type='text/javascript'>
			window.location = "<%=url%>";
		</script>
	<%		
	}else{
		Validate validate = new Validate();
		if(validate.validate(0, loginName, loginPW)){
			session.setAttribute("loginedUserName",loginName);
			session.setMaxInactiveInterval(60*30);
			//System.out.println("Patient success!");
			%>
			<p style='color:red;'>恭喜您，登陆成功！</p>
			<%	
		}else if(validate.validate(1, loginName, loginPW)){
			session.setAttribute("loginedUserName",loginName);
			session.setMaxInactiveInterval(60*30);
			//System.out.println("Doctor success!");
			%>
			<p style='color:red;'>恭喜您，登陆成功！</p>
			<%	
		}else{
			%>
			<table width="100%"><tr><td align="center">登&nbsp;&nbsp;陆<hr color="red" ></td></tr></table>
	    	<table width="95%">
	    		<tr>
	    			<td width="25%">用户名：</td>
	    			<td width="75%"><input id="loginName" name="loginName" type="text" value="" /></td>
	    		</tr>
	    		<tr>
	    			<td width="25%">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
	    			<td width="75%"><input id="loginPW" name="loginPW" type="password" value="" /></td>
	    		</tr>
	    	</table>
	    	<br>
			<div id="msgLogin" ></div>
			<div id="tmpMsg" style='color:red;'>您输入的用户名或密码有误！</div>
			<div id="loginSubmit" ><a data-theme="b" data-role="button" onclick="checkLogin()">登&nbsp;&nbsp;陆</a></div>
    		<div id="loginWait" style="display:none"><a data-theme="b" data-role="button" onclick="checkLogin()">正在登陆，请稍后...</a></div>
    		<a href="register_1.jsp" data-theme="b" data-role="button" >注&nbsp;&nbsp;册</a>
			<%
		}
	}
	
	%>
    	</fieldset>
	</form>	
  </div>
</center>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>