<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

 <%@ include file="../include/package.jsp"%> 
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title><%=sysName %></title>

	 <%@ include file="../include/meta.jsp"%> 
	 <%@ include file="../include/cssJS.jsp"%> 

<style type="text/css">
.ui-btn-corner-all {

-webkit-border-radius:1em;
}
</style>

</head>
  <%//@ include file="../exit/exit.jsp"%>
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
  	<div data-role="content" style="margin:20px auto;width:90%">

	<table width="95%">
		<tr>
			<td align="left" width="50%"><strong>1.注册手机号</strong></td>
			<td width="50%">&nbsp;&nbsp;2.账号新密码<td>
		</tr>
	</table>
	<table width="100%"><tr><td align="center"><hr color="red" ></td></tr></table>

    <form method="post" name="setPasswordForm" id="setPasswordForm" action="setPassword_2.jsp">
	     	 <fieldset data-role="fieldcontain">
	     	 
<link rel="stylesheet" href="../css/my.css" />
	
	<script>
	
	    $(document).ready(function(){
	   		 $("#setPasswordTel").parent().css("-webkit-border-radius",".6em").css("border-left","1px solid #744501");
	   		
	    });
	    function setTelNull() {  
			document.getElementById("setPasswordTel").value = "";
		}
		
	    var flagTel = 1;
		var ifFlag = 1;
		var role = -1;
		
		function getCode(){

			var seconds = 0;
			var message = null;
			
			flagTel = 1; 
			ifFlag = 1;
			role = -1;

			var setPasswordTel = document.getElementById("setPasswordTel").value;
			var msg = document.getElementById("msgSetPassword");
			var hiddenRole = document.getElementById("hiddenSetPassword");
			
			//2013-11-29
			   //if(!( /^1[3,5]\d{9}$/.test(tel))){
			if(!( /^(0|86|17951)?(13[0-9]|15[012356789]|18[0-9]|14[57]|17[0-9])[0-9]{8}$/.test(setPasswordTel))){
				 flagTel = 0;
				// alert(setPasswordTel);
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
				   if((ifFlag==1) &&( setPasswordTel == '<%=userDaoDoctor.UserDoctorTels[j] %>' ))
					{
						ifFlag = 0;//存在
						role = 1;
						hiddenRole.innerHTML = '<input id="role" name="role" type="hidden"  value="' + role + '" />';
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
					   if((ifFlag==1) &&( setPasswordTel == '<%=userDaoPatient.UserPatientTels[i] %>' ))
						{
							ifFlag = 0;
							role = 0;
							hiddenRole.innerHTML = '<input id="role" name="role" type="hidden"  value="' + role + '" />';
					   	}
				 <%}%>
			   	}
				if(ifFlag==1)
				{
					message = "该手机号并未注册孔医堂，请重新输入！";
					msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
			   	}
				
		   }
			 if((flagTel==1)&&(ifFlag==0)){
				document.getElementById("normalGetCode").style.display = "none";
				document.getElementById("waitGetCode").style.display = "block";
				//document.getElementById("msgSetPassword").style.display = "none";
				message = "";
				msg.innerHTML = "<a style='color:white;'>" + message + "</a>";
				//alert("her00");
				 $(document).ready(function(){
					  $("#normalGetCode").click(function(){
					    $.post("setPassword_1_code.jsp",
					    {
					    	setPasswordTel:setPasswordTel
					    },
					    function(data){
						   var html = $(data);
						   var sendMsgStatus = html.find("#sendSetPasswordMsgStatus").val();
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

		function checkSetPassword(){
			var message = null;
			var setPasswordTel = document.getElementById("setPasswordTel").value;
			var setPasswordCode = document.getElementById("setPasswordCode").value;
			var msg = document.getElementById("msgSetPassword");
			if((flagTel==1)&&(ifFlag==0)){
				   $(document).ready(function(){
						  $("#setPasswordNext").click(function(){
						    $.post("setPassword_1_validateCode.jsp",
						    {
						    	setPasswordTel:setPasswordTel,
						    	setPasswordCode:setPasswordCode
						    },
						    function(data){
							   var html = $(data);
							   var validateSetPasswordStatus = html.find("#validateSetPasswordStatus").val();
							   if(validateSetPasswordStatus=="OK"){
								   message = "";
								   msg.innerHTML = "<a style='color:white;'>" + message + "</a>";
								   var setPasswordForm = document.getElementById("setPasswordForm");
								   setPasswordForm.submit(); 
							  }else{
								  message = "验证码错误";
								  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
								}
						      //alert("sendMsgStatus:" + sendMsgStatus);
						    });
						  });
					});
		
				}
		}
	    
	    </script>
	    
	    <table width="100%" cellpadding="0" cellspacing="0px"  border="0">
    		<tr>
    			<td width="65%">
    				<input id="setPasswordTel" name="setPasswordTel" type="text" value="请输入手机号" onfocus="setTelNull()"/>
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
    			<td width="75%"><input id="setPasswordCode" name="setPasswordCode" type="text" value="" /></td>
    			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
    		</tr>
    	</table>
    	<br>
    	<div id="hiddenSetPassword" ></div>
    	<div id="msgSetPassword" ></div>
    	<div id="setPasswordNext"><div id="SubmitButton" onclick="checkSetPassword();" >下一步</div></div>

    	</fieldset>
	</form>	

  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>