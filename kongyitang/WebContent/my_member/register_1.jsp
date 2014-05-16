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

	<table width="95%">
		<tr>
			<td align="left" width="50%"><strong>1.填写资料</strong></td>
			<td width="50%">&nbsp;&nbsp;2.设置账号密码<td>
		</tr>
	</table>
	<table width="100%"><tr><td align="center"><hr color="red" ></td></tr></table>

    <form method="post" name="registerForm" id="registerForm" action="register_2.jsp">
	     	 <fieldset data-role="fieldcontain">
	     	 
<link rel="stylesheet" href="../css/my.css" />
 <script src="../js/register.js"></script>
		
    	<table width="100%">
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
    							<input type="radio" checked name="registerRole" id="registerRole" value="0" onclick="changeRadio()">
    						</td>
    						<td align="left" width="35%" valign="middle">&nbsp;&nbsp;普通用户</td>
    						 
    						<td valign="middle" align="right" width="15%">
    							<input type="radio" name="registerRole" id="registerRole" value="1" onclick="changeRadio()" >
    						<td align="left" width="35%" valign="middle">&nbsp;&nbsp;医生</td>
    					
    					</tr>
					</table></div>
				</td>
				<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
    		</tr>
    	</table>
    
    	<div id="registerDoctor" style="display:none">
	    	<table width="100%">
	    		<tr>
	    			<td width="25%"><div id="MyInput">师&nbsp;&nbsp;&nbsp;&nbsp;承</div></td>
	    			<td width="75%"><input id="registerShiCheng" name="registerShiCheng" type="text" value="" /></td>
	    			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
	    		</tr>
	    		<tr>
	    			<td width="25%"><div id="MyInput">医师证号</div></td>
	    			<td width="75%"><input id="registerZhengJian" name="registerZhengJian" type="text" value="" /></td>
	    			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
	    		</tr>
	    		<tr>
	    			<td width="25%"><div id="MyInput">科&nbsp;&nbsp;&nbsp;&nbsp;室</div></td>
	    			<td width="75%">
	    				<div id="InputBorder" align="center" onclick="SelectKeShi()">
	    					<div id="SelectedKeShi" style="display:none"></div>
	    					<div id="SelectKeShiAttention">选择您所在的科室&nbsp;&nbsp;&nbsp;&nbsp;
	    					<img src="../images/down.png" border = "0px"  width="20px"/></div>
	    				</div>
	    			</td>
	    			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
	    		</tr>
	    		<tr>
	    			<td width="25%"><div id="MyInput">职&nbsp;&nbsp;&nbsp;&nbsp;称</div></td>
	    			<td width="75%"><input id="registerZhiCheng" name="registerZhiCheng" type="text" value="" /></td>
	    			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
	    		</tr>
    		</table>
	    </div>
	    
	        		
    <div id="SelectKeShi" class="SelectKeShi" >
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%"><big>中医内科</big></td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="registerKeShi" id="registerKeShi" value="1">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%"><big>中医外科</big></td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="registerKeShi" id="registerKeShi" value="2">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%"><big>妇&nbsp;&nbsp;科</big></td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="registerKeShi" id="registerKeShi" value="3">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%"><big>儿&nbsp;&nbsp;科</big></td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="registerKeShi" id="registerKeShi" value="4">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%"><big>针推科</big></td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="registerKeShi" id="registerKeShi" value="5">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr color="<%=sysFontColor %>"></td></tr></table>
		<table width="100%">
			<tr>
				<td width="50%" align="center">
					<div id="SelectKeshiCertain" onclick="SelectKeshiCertain()"><big>确&nbsp;&nbsp;认</big></div>
				</td>
				<td align="center">
					<div id="SelectKeshiCancel" onclick="SelectKeshiCancel()"><big>取&nbsp;&nbsp;消</big></div>
				</td>
			</tr>
		</table>
	</div>
	    
	    <table width="100%">
    		<tr>
    			<td width="65%">
    				<input id="registerTel" name="registerTel" type="text" value="" />
    			</td>
    			<td width="45%">
    				<div id="normalGetCode"><div id="SubmitButton" onclick="getCode()">获取验证码</div></div>
    				<div id="waitGetCode" style="display:none"><a data-theme="c" data-role="button" disabled="true"><span id="count">60</span>后重新获取</a></div>
    			</td>
    			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
    		</tr>
    	</table>
    	<table width="100%">
    		<tr>
    			<td width="25%"><div id="MyInput">验证码</div></td>
    			<td width="75%"><input id="registerCode" name="registerCode" type="text" value="" /></td>
    			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
    		</tr>
    	</table>
    	<br>
    	<div id="msgRegister" ></div>
    	<div id="registerNext"><div id="SubmitButton" onclick="checkRegister()">下一步</div></div>

    	</fieldset>
	</form>	

  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>