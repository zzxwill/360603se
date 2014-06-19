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
   <%@ include file="../check/index.jsp"%> 
 <body>
  <div data-role="page">
	<div data-role="header">
	<table width="100%">
		<tr>
			<td width="33%">
				<div id="backButton" style="width:60px;"><a href="javascript:history.back(-1)"></a></div>
			</td>
			<td align="center" width="34%"><a style="color:white;">医生认证</a></td>
			<td width="33%">&nbsp;&nbsp;</td>
		</tr>
	</table>
 	</div>
  	<div data-role="content" style="margin:20px auto;width:90%">

    <form method="post" name="authForm" id="authForm" action="doctor_auth_2.jsp">
	     	 <fieldset data-role="fieldcontain">
	     	 
<link rel="stylesheet" href="../css/doctor_auth.css" />
 <script src="../js/doctor_auth.js"></script>

   	<table width="100%" border="0" cellspacing="0" cellpadding="0">
   		<tr>
   			<td width="25%"><div id="MyInput">身份证号</div></td>
   			<td width="75%"><input id="authShenFenZhenghao" name="authShenFenZhenghao" type="text" value="" /></td>
   			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
   		</tr>
   		<tr>
   			<td width="25%"><div id="MyInput">医师证号</div></td>
   			<td width="75%"><input id="authYiShiZhengHao" name="authYiShiZhengHao" type="text" value="" /></td>
   			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
   		</tr>
   		<tr>
   			<td width="25%"><div id="MyInput">职业类型</div></td>
   			<td width="75%"><input id="authZhiYeLeiXing" name="authZhiYeLeiXing" type="text" value="" /></td>
   			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
   		</tr>
   		<tr>
   			<td width="25%"><div id="MyInput">临床职称</div></td>
   			<td width="75%"><input id="authLingChuangZhiCheng" name="authLingChuangZhiCheng" type="text" value="" /></td>
   			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
   		</tr>
   		<tr>
   			<td width="25%"><div id="MyInput">所在医院</div></td>
   			<td width="75%"><input id="authSuoZaiYiYuan" name="authSuoZaiYiYuan" type="text" value="" /></td>
   			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
   		</tr>
   		<tr>
   			<td width="25%"><div id="MyInput">科&nbsp;&nbsp;&nbsp;&nbsp;室</div></td>
   			<td width="75%">
   				<div id="InputBorder" align="center" onclick="SelectKeShi()">
   					<div id="SelectedKeShi" style="display:none;float: left;"></div>
   					<div id="SelectKeShiAttention">选择科室&nbsp;&nbsp;&nbsp;&nbsp;
   					<img src="../images/down.png" border = "0px"  width="20px"/></div>
   				</div>
   			</td>
   			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
   		</tr>
   		<tr>
   			<td width="25%"><div id="MyInput">师&nbsp;&nbsp;&nbsp;&nbsp;承</div></td>
   			<td width="75%"><input id="authShiCheng" name="authShiCheng" type="text" value="您的流派" onfocus="setNull();"/></td>
   			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
   		</tr>
  	</table>
	    
	        		
    <div id="SelectKeShi" class="SelectKeShi" >
		<table width="100%" cellpadding="0" cellspacing="0px"  border="0"  >
			<tr>
				<td align="center" width="70%"><big>中医内科</big></td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="authKeShi" id="authKeShi" value="1">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px" border="0" >
			<tr>
				<td align="center" width="70%"><big>中医外科</big></td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="authKeShi" id="authKeShi" value="2">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px" border="0" >
			<tr>
				<td align="center" width="70%"><big>妇&nbsp;&nbsp;科</big></td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="authKeShi" id="authKeShi" value="3">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px" border="0" >
			<tr>
				<td align="center" width="70%"><big>儿&nbsp;&nbsp;科</big></td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="authKeShi" id="authKeShi" value="4">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px" border="0" >
			<tr>
				<td align="center" width="70%"><big>针推科</big></td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="authKeShi" id="authKeShi" value="5">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px" border="0" >
			<tr>
				<td align="center" width="70%"><big>男&nbsp;&nbsp;科</big></td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="authKeShi" id="authKeShi" value="6">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr color="<%=sysFontColor %>"></td></tr></table>
		<table width="100%" >
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

    	<br>
    	<div id="msgAuth" ></div>
    	<div id="authNext"><div id="submitButton" onclick="checkAuth();">下一步</div></div>

    	</fieldset>
	</form>	

  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>