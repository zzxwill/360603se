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
	<table width="100%">
		<tr>
			<td width="33%">
				<div id="backButton" style="width:60px;"><a href="javascript:history.back(-1)"></a></div>
			</td>
			<td align="center" width="34%"><a style="color:white;">重置密码</a></td>
			<td width="33%">&nbsp;&nbsp;</td>
		</tr>
	</table>
 	</div>
 	
  	<div data-role="content">
  	<%
    request.setCharacterEncoding("UTF-8");
 	String url = "setPassword_1.jsp";
  	String role = ""; 
  	String setPasswordRole = request.getParameter("role");
  	//System.out.println("setPasswordRole:" + setPasswordRole + "\n");
  	if(null==setPasswordRole||setPasswordRole.equals("")){
		%>
		<script language='javascript' type='text/javascript'>
				window.location = "<%=url %>";
		</script>
		<%	
  	}else{

	  	%>
		<table width="95%">
			<tr>
				<td align="left" width="50%">1.注册手机号</td>
				<td width="50%">&nbsp;&nbsp;<strong>2.账号新密码</strong><td>
			</tr>
		</table>
		<table width="100%"><tr><td align="center"><hr color="red" ></td></tr></table>
	
	    <form method="post" name="setPasswordForm" id="setPasswordForm" action="setPassword_3.jsp">
		     <fieldset data-role="fieldcontain">
	<link rel="stylesheet" href="../css/my.css" />
	<script>
	    function setPasswordSubmit()
	    {
		   var setPasswordPW_1 = document.getElementById("setPasswordPW_1").value;
		   var setPasswordPW_2 = document.getElementById("setPasswordPW_2").value;
		   var message = null;
		   var msg = document.getElementById("msgSetPassword");
		   var flag = 1;
		   if(null==setPasswordPW_1||setPasswordPW_1==""||null==setPasswordPW_2||setPasswordPW_2==""){
				  flag = 0;
			 	  message = "密码不能为空，请输入密码！";
				  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
		    }
		   if(flag==1){
			 	if(setPasswordPW_1==setPasswordPW_2){
			 		document.getElementById("setPasswordSubmit").style.display = "none";
					document.getElementById("setPasswordWait").style.display = "block";
			 		var setPasswordForm = document.getElementById("setPasswordForm");
			 		setPasswordForm.submit(); 
				}else{
					flag = 0;
				 	message = "前后两次输入的密码不一致！";
					msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
				}  
		   }
	    }
	</script>	     	 
		     <%
		     String setPasswordTel = request.getParameter("setPasswordTel"); 
		     String setPasswordCode = request.getParameter("setPasswordCode");
			
			if(null==setPasswordTel||setPasswordTel.equals("")||null==setPasswordCode||setPasswordCode.equals("")){
				//System.out.println("role:" + role +"dddd\n");
				%>
				<script language='javascript' type='text/javascript'>
						window.location = "<%=url %>";
				</script>
			<%	
			}else{
				
		  		int setPasswordRole_int = Integer.parseInt(setPasswordRole);
		  		//System.out.println("registerRole:" + registerRole + "\n");
		  		if(setPasswordRole_int==0){//患者
		  			//System.out.println("registerRole:" + registerRole + "\n");
				%>
					<input id="role" name="role" type="hidden"  value="0" />
				<%
		  		}else if(setPasswordRole_int==1){//医生
		  		%>
					<input id="role" name="role" type="hidden"  value="1" />
				<%
		  		}
				%>
				<input id="setPasswordTel" name="setPasswordTel" type="hidden" value="<%=setPasswordTel %>" />
		
				<table width="100%">
		   			<tr>
		    			<td width="45%"><div id="MyInput">请输入新密码</div></td>
		    			<td width="54%"><input id="setPasswordPW_1" name="setPasswordPW_1" type="password" value="" /></td>
		    			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
		    		</tr>
		    		<tr>
		    			<td width="45%"><div id="MyInput">请再次输入密码</div></td>
		    			<td width="54%"><input id="setPasswordPW_2" name="setPasswordPW_2" type="password" value="" /></td>
		    			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
		    		</tr>
		   		</table>
				<%
		 	}
		 }%>
		 <br>
		<div id="msgSetPassword" ></div>
   		<div id="setPasswordSubmit"><div id="SubmitButton" onclick="setPasswordSubmit()">提&nbsp;&nbsp;&nbsp;&nbsp;交</div></div>
    	<div id="setPasswordWait" style="display:none"><div id="SubmitButton">正在提交，请稍后...</div></div>
    	</fieldset>
	</form>	
  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>