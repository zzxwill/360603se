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
  <%//@ include file="../exit/exit.jsp"%>
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
  	<div data-role="content" style="margin:20px auto;width:90%">

	<table width="95%">
		<tr>
			<td align="left" width="50%"><strong>1.填写资料</strong></td>
			<td width="50%">&nbsp;&nbsp;2.设置账号密码<td>
		</tr>
	</table>
	<table width="100%"><tr><td align="center"><hr color="red" ></td></tr></table>

    <form method="post" name="registerForm" id="registerForm" action="register_2.jsp">
	     	 <fieldset data-role="fieldcontain">
	     	 
<link rel="stylesheet" href="../css/my.css"/>
<!-- <script src="../js/register.js"></script>-->
<%@ include file="../my_member/register_js.jsp"%>
 	
    	<table  width="100%" border="0" cellspacing="0" cellpadding="0">
    		<tr>
    			<td width="25%"><div id="MyInput">姓&nbsp;&nbsp;&nbsp;&nbsp;名</div></td>
    			<td width="75%"><input id="registerName" name="registerName" type="text" value="" /></td>
    			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
    		</tr>
    		<tr height="35px">
    			<td width="25%"><div id="MyInput">性&nbsp;&nbsp;&nbsp;&nbsp;别</div></td>
    			<td width="75%"><div id="InputBorder">
    				<table width="100%">
    					<tr>
    						<td valign="middle" align="right" width="15%">
    							<input type="radio" checked name="registerGender" id="registerGender" value="0">
    						</td>
    						<td align="left" width="35%">&nbsp;&nbsp;男</td>
    						 
    						<td valign="middle" align="right" width="15%">
    							<input type="radio" name="registerGender" id="registerGender" value="1">
    						<td align="left" width="35%">&nbsp;&nbsp;女</td>
    					</tr>
					</table></div>
				</td>
				<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
    		</tr>
    		<tr>
    			<td width="25%"><div id="MyInput">年&nbsp;&nbsp;&nbsp;&nbsp;龄</div></td>
    			<td width="75%"><input id="registerAge" name="registerAge" type="text" value="" /></td>
    			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
    		</tr>
    		<tr height="35px">
    			<td width="25%"><div id="MyInput">类&nbsp;&nbsp;&nbsp;&nbsp;别</div></td>
    			<td width="75%"><div id="InputBorder">
    				<table width="100%">
    					<tr>
    					
    						<td valign="middle" align="right" width="15%">
    							<input type="radio" checked name="registerRole" id="registerRole" value="0" >
    						</td>
    						<td align="left" width="45%" valign="middle">&nbsp;&nbsp;普通用户</td>
    						 
    						<td valign="middle" align="right" width="15%">
    							<input type="radio" name="registerRole" id="registerRole" value="1" >
    						<td align="left" width="25%" valign="middle">&nbsp;&nbsp;医生</td>
    					
    					</tr>
					</table></div>
				</td>
				<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
    		</tr>
    	</table>
  
	    <script>
	    $(document).ready(function(){
	   		 $("#registerTel").parent().css("-webkit-border-radius",".6em");
	    });
	    function setTelNull() {  
			document.getElementById("registerTel").value = "";
		}
		
	    var flagTel = 1;
		function getCode(){
			var seconds = 0;
			var message = null;
			
			flagTel = 1;
			var right = 1;	 
			var ifFlag = 1;

			var registerTel = document.getElementById("registerTel").value;
			var msg = document.getElementById("msgRegister");
			//2013-11-29
			   //if(!( /^1[3,5]\d{9}$/.test(tel))){
			if(!( /^(0|86|17951)?(13[0-9]|15[012356789]|18[0-9]|14[57])[0-9]{8}$/.test(registerTel))){
				 flagTel = 0;
				 message = "请输入正确的手机号！";
				 msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
			 }

		   if(flagTel==1){
			<%
			   UserDaoDoctor userDaoDoctor = new UserDaoDoctor();
			   userDaoDoctor.getAllUserTel_Doctor();
			   //int j=1;
			   for(int j=1;j<=userDaoDoctor.UserDoctorNum;j++){
				  // System.out.println(j + " : " + userAdminDaoNew.UserNames[j] + "\n");
			   %>
				   if((ifFlag==1) &&( registerTel == '<%=userDaoDoctor.UserDoctorTels[j] %>' ))
					{
					    //alert(registerTel);
						flagTel = 0;
						ifFlag = 0;
						right = 0;
						message = "用户名(手机号)已注册，请重新输入！";
						msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
						//alert(message);
						//break;
				   	}
			<%} %>
				if(ifFlag==1){
					
					<%
				   UserDaoPatient userDaoPatient = new UserDaoPatient();
				   userDaoPatient.getAllUserTel_Patient();
				   //int i=1;
				   for(int i=1;i<=userDaoPatient.UserPatientNum;i++){
					  // System.out.println(i + " : " + userAdminDaoNew.UserNames[i] + "\n");
				   %>
					   if((ifFlag==1) &&( registerTel == '<%=userDaoPatient.UserPatientTels[i] %>' ))
						{
						    //alert(registerTel);
							flagTel = 0;
							ifFlag = 0;
							right = 0;
							message = "用户名(手机号)已注册，请重新输入！";
							msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
							//alert(message);
							//break;
					   	}
				 <%}%>
			   	}
		   }
			 
			 if(flagTel==1){

				document.getElementById("normalGetCode").style.display = "none";
				document.getElementById("waitGetCode").style.display = "block";
				
				message = "您输入的手机号可用！";
				msg.innerHTML = "<a style='color:green;'>" + message + "</a>";
				
				 $(document).ready(function(){
					  $("#normalGetCode").click(function(){
					    $.post("register_1_code.jsp",
					    {
					      	registerTel:registerTel
					    },
					    function(data){
						   var html = $(data);
						   var sendMsgStatus = html.find("#sendMsgStatus").val();
					      //alert("sendMsgStatus:" + sendMsgStatus);
					    });
					  });
					  
				});
					
				 setInterval(function(){
					  	seconds += 1;
					  	document.getElementById('count').innerHTML = 60-seconds;
					  	if(seconds == 60){
					  		seconds = 0;
							document.getElementById("normalGetCode").style.display = "block";
							document.getElementById("waitGetCode").style.display = "none";
					  	}
				},1000);
			}
		}
	    
	    </script>
	    
	    <table width="100%" cellpadding="0" cellspacing="0px"  border="0">
    		<tr>
    			<td width="65%">
    				<input id="registerTel" name="registerTel" type="text" value="请输入手机号" onfocus="setTelNull()"/>
    			</td>
    			<td width="45%">
    				<div id="normalGetCode"><div id="SubmitButton" onclick="getCode()">获取验证码</div></div>
    				<div id="waitGetCode" style="display:none"><a data-theme="c" data-role="button" disabled="true"><span id="count">60</span>后重新获取</a></div>
    			</td>
    			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
    		</tr>
    	</table>
    	<table width="100%" cellpadding="0" cellspacing="0px"  border="0">
    		<tr>
    			<td width="25%"><div id="MyInput">验证码</div></td>
    			<td width="75%"><input id="registerCode" name="registerCode" type="text" value="" /></td>
    			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
    		</tr>
    	</table>
    	<br>
    	<div id="msgRegister" ></div>
    	<div id="registerNext"><div id="SubmitButton" onclick="checkRegister();">下一步</div></div>
    	
    	</fieldset>
	</form>	

  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>