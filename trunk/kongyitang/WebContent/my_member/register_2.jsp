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
				<div id="backButton" style="width:60px;"><a href="javascript:history.back(-1)">返回</a></div>
			</td>
			<td align="center" width="34%"><a style="color:white;">注&nbsp;&nbsp;册</a></td>
			<td width="33%">&nbsp;&nbsp;</td>
		</tr>
	</table>
 	</div>
 	
  	<div data-role="content">
  	<%
    request.setCharacterEncoding("UTF-8");
 	String url = "register_1.jsp";
  	String role = ""; 
  	String registerRole = request.getParameter("registerRole");
  	
  	if(null==registerRole||registerRole.equals("")){
		%>
		<script language='javascript' type='text/javascript'>
				window.location = "<%=url %>";
		</script>
		<%	
  	}else{
  		int registerRole_int = Integer.parseInt(registerRole);
  		//System.out.println("registerRole:" + registerRole + "\n");
  		if(registerRole_int==0){//患者
  			//System.out.println("registerRole:" + registerRole + "\n");
  			role = "patient";
  		}else if(registerRole_int==1){//医生
  			role = "doctor";
  		}
  	
	  	%>
		<table width="95%">
			<tr>
				<td align="left" width="50%">1.填写资料</td>
				<td width="50%">&nbsp;&nbsp;<strong>2.设置账号密码</strong><td>
			</tr>
		</table>
		<table width="100%"><tr><td align="center"><hr color="red" ></td></tr></table>
	
	    <form method="post" name="registerForm" id="registerForm" action="register_3.jsp?role=<%=role %>">
		     <fieldset data-role="fieldcontain">
	<link rel="stylesheet" href="../css/my.css" />
	<script>
	    function registerSubmit()
	    {
		   var registerPW_1 = document.getElementById("registerPW_1").value;
		   var registerPW_2 = document.getElementById("registerPW_2").value;
		   var message = null;
		   var msg = document.getElementById("msgRegister");
		   var flag = 1;
		   if(null==registerPW_1||registerPW_1==""||null==registerPW_2||registerPW_2==""){
				  flag = 0;
			 	  message = "密码不能为空，请输入密码！";
				  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
		    }
		   if(flag==1){
			 	if(registerPW_1==registerPW_2){
			 		var registerForm = document.getElementById("registerForm");
			 		registerForm.submit(); 
				}else{
					flag = 0;
				 	message = "前后两次输入的密码不一致！";
					msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
				}  
		   }
	    }
	</script>	     	 
		     <%
	
			String registerName = request.getParameter("registerName");
			String registerGender = request.getParameter("registerGender");
			String registerAge = request.getParameter("registerAge");
			
			String registerShiCheng = request.getParameter("registerShiCheng");
			String registerZhengJian = request.getParameter("registerZhengJian");
			String registerKeShi = request.getParameter("registerKeShi");
			String registerZhiCheng = request.getParameter("registerZhiCheng");
			
			String registerTel = request.getParameter("registerTel");
			String registerCode = request.getParameter("registerCode");  
			
			if(null==registerName||registerName.equals("")||null==registerGender||registerGender.equals("")
			   ||null==registerAge||registerAge.equals("")||null==registerRole||registerRole.equals("")
				   ||null==registerTel||registerTel.equals("")||null==registerCode||registerCode.equals("")){
				//System.out.println("role:" + role +"dddd\n");
				%>
				<script language='javascript' type='text/javascript'>
						window.location = "<%=url %>";
				</script>
			<%	
			}else{
					//int registerGender_int = Integer.parseInt(registerGender);
					//int registerAge_int = Integer.parseInt(registerAge);
				%>
				<input id="registerName" name="registerName" type="hidden" value="<%=registerName %>" />
				<input id="registerGender" name="registerGender" type="hidden" value="<%=registerGender %>" />
				<input id="registerAge" name="registerAge" type="hidden"  value="<%=registerAge %>" />
				<input name="registerRole" id="registerRole" type="hidden"  value="<%=registerRole %>" >
				<input id="registerTel" name="registerTel" type="hidden" value="<%=registerTel %>" />
				<table width="100%">
		   			<tr>
		    			<td width="45%"><div id="MyInput">请输入新密码</div></td>
		    			<td width="54%"><input id="registerPW_1" name="registerPW_1" type="password" value="" /></td>
		    			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
		    		</tr>
		    		<tr>
		    			<td width="45%"><div id="MyInput">请再次输入密码</div></td>
		    			<td width="54%"><input id="registerPW_2" name="registerPW_2" type="password" value="" /></td>
		    			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
		    		</tr>
		   		</table>
				<%
				if(registerRole_int==1){//医生
				%>
				<input id="registerShiCheng" name="registerShiCheng" type="hidden" value="<%=registerShiCheng %>" />
				<input id="registerZhengJian" name="registerZhengJian" type="hidden" value="<%=registerZhengJian %>" />
				<input id="registerKeShi" name="registerKeShi" type="hidden" value="<%=registerKeShi %>" />
				<input id="registerZhiCheng" name="registerZhiCheng" type="hidden" value="<%=registerZhiCheng %>" />
				<%}
		 	}
		 }%>
		 <br>
		<div id="msgRegister" ></div>
   		<div id="registerSubmit"><div id="SubmitButton" onclick="registerSubmit()">提&nbsp;&nbsp;&nbsp;&nbsp;交</div></div>
 
    	</fieldset>
	</form>	
  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>