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
   <%//@ include file="../check/index.jsp"%> 
 <body>
  <div data-role="page">
	<div data-role="header">
		后台录入医生系统
 	</div>
  	<div data-role="content" style="margin:20px auto;width:90%">
<center>
    <form method="post" name="doctorForm" id="doctorForm" action="doctor_auth_brief.jsp" encType="multipart/form-data"  target="hidden_frame"  >
<!--	     	 <fieldset data-role="fieldcontain">-->
	
   	<table  width="70%" border="0" cellspacing="0" cellpadding="0">
    		<tr>
    			<td width="25%"><div id="MyInput">姓&nbsp;&nbsp;&nbsp;&nbsp;名</div></td>
    			<td width="75%"><input id="userName" name="userName" type="text" value="" /></td>
    			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
    		</tr>
    		<tr height="35px" style="line-height:45px">
    			<td width="25%"><div id="MyInput">性&nbsp;&nbsp;&nbsp;&nbsp;别</div></td>
    			<td width="75%"><div id="InputBorder" >
    				<table width="100%" height=" 45px">
    					<tr>
    						<td valign="middle" align="right" width="25%">
    							<input type="radio" checked name="userGender" id="userGender" value="0">
    						</td>
    						<td align="left" width="25%">&nbsp;&nbsp;男</td>
    						 
    						<td valign="middle" align="right" width="25%">
    							<input type="radio" name="userGender" id="userGender" value="1"></td>
    						<td align="left" width="25%">&nbsp;&nbsp;女</td>
    					</tr>
					</table></div>
				</td>
				<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
    		</tr>
    		<tr>
    			<td width="25%"><div id="MyInput">场&nbsp;&nbsp;&nbsp;&nbsp;馆</div></td>
    			<td width="75%">
    			<select name="site_id" id="site_id">	
					<option value="firstOption"><-请选择-> </option>
							<option value="1" >望京馆</option>
							<option value="2" >展览路馆</option>
							<option value="3" >五棵松馆</option>
							<option value="4" >三里屯馆</option>
				</select>
    			</td>
    			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
    		</tr>
    		<tr>
    			<td width="25%"><div id="MyInput">科&nbsp;&nbsp;&nbsp;&nbsp;室</div></td>
    			<td width="75%"><input id="department" name="department" type="text" value="" /></td>
    			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
    		</tr>
    		<tr>
    			<td width="25%"><div id="MyInput">医生简介</div></td>
    			<td width="75%"><input id="introduction" name="introduction" type="text" value="" /></td>
    			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
    		</tr>
    		<tr>
    			<td width="25%"><div id="MyInput">医生头像</div></td>
    			<td width="75%">
    			<input id="doctor_portrait" name="doctor_portrait" type="file" />
    			</td>
    			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
    		</tr>
    	</table>
	
    	<br>
    	<button type="submit">提交</button>
    	
<!--		<iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>-->
    	</fieldset>
	</form>	
</center>
  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>