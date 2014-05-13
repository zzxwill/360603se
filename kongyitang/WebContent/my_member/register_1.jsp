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
				<a style="width:70px;height:28px" href="javascript:history.back(-1)" data-theme="c" data-role="button"  data-mini="true" data-icon="back" data-iconpos="left">返回</a>
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

 <script src="../js/register.js"></script>
		
    	<table width="100%">
    		<tr>
    			<td width="25%">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
    			<td width="75%"><input id="registerName" name="registerName" type="text" value="" /></td>
    			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
    		</tr>
    		<tr height="35px">
    			<td width="25%">性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
    			<td width="75%">
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
					</table>
				</td>
				<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
    		</tr>
    		<tr>
    			<td width="25%">年&nbsp;&nbsp;&nbsp;&nbsp;龄：</td>
    			<td width="75%"><input id="registerAge" name="registerAge" type="text" value="" /></td>
    			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
    		</tr>
    		<tr height="35px">
    			<td width="25%">类&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
    			<td width="75%">
    				<table width="100%">
    					<tr>
    						<td valign="middle" align="right" width="15%">
    							<input type="radio" checked name="registerRole" id="registerRole" value="0" onclick="changeRadio()">
    						</td>
    						<td align="left" width="35%">&nbsp;&nbsp;普通用户</td>
    						 
    						<td valign="middle" align="right" width="15%">
    							<input type="radio" name="registerRole" id="registerRole" value="1" onclick="changeRadio()" >
    						<td align="left" width="35%">&nbsp;&nbsp;医生</td>
    					</tr>
					</table>
				</td>
				<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
    		</tr>
    	</table>
    	<div id="registerDoctor" style="display:none">
	    	<table width="100%">
	    		<tr>
	    			<td width="55%">
	    				<table width="100%">
	    					<tr>
				    			<td width="15%">师承:</td>
				    			<td width="84%">
									<input id="registerShiCheng" name="registerShiCheng" type="text" value="" />
								</td>
	    						<td width="1%"><a style="color:red;">&nbsp;&nbsp;*</a></td>
	    					</tr>
	    				</table>
	    			</td>
	    			<td width="45%">
	    				<table width="100%">
	    					<tr>
				    			<td width="35%">医师证号:</td>
				    			<td width="64%">
									<input id="registerZhengJian" name="registerZhengJian" type="text" value="" />
								</td>
				    			<td width="1%"><a style="color:red;">&nbsp;&nbsp;*</a></td>
				    		</tr>
				    	</table>
				    </td>
	    		</tr>
	    		<tr>
	    			<td width="50%">
	    				<table width="100%">
	    					<tr>
				    			<td width="15%">科室:</td>
				    			<td width="84%">
				    				<select name="registerKeShi" id="registerKeShi" data-native-menu="false">
										<option value="1" "selected">中医内科</option>
										<option value="2">中医外科</option>
										<option value="3">妇科</option>
										<option value="4">儿科</option>
										<option value="5">针推科</option>
				    				 </select>
<!--									<input id="registerKeShi" name="registerKeShi" type="text" value="" />-->
								</td>
	    						<td width="1%"><a style="color:red;">&nbsp;&nbsp;*</a></td>
	    					</tr>
	    				</table>
	    			</td>
	    			<td width="50%">
	    				<table width="100%">
	    					<tr>
				    			<td width="15%">职称:</td>
				    			<td width="84%">
									<input id="registerZhiCheng" name="registerZhiCheng" type="text" value="" />
								</td>
				    			<td width="1%"><a style="color:red;">&nbsp;&nbsp;*</a></td>
				    		</tr>
				    	</table>
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
    				<div id="normalGetCode"><a data-theme="b" data-role="button" onclick="getCode()">获取验证码</a></div>
    				<div id="waitGetCode" style="display:none"><a data-theme="c" data-role="button" disabled="true"><span id="count">60</span>后重新获取</a></div>
    			</td>
    			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
    		</tr>
    	</table>
    	<table width="100%">
    		<tr>
    			<td width="25%">验证码：</td>
    			<td width="75%"><input id="registerCode" name="registerCode" type="text" value="" /></td>
    			<td><a style="color:red;">&nbsp;&nbsp;*</a></td>
    		</tr>
    	</table>
    	<br>
    	<div id="msgRegister" ></div>
    	<div id="registerNext"><a data-theme="b" data-role="button" onclick="checkRegister()">下一步</a></div>

    	</fieldset>
	</form>	

  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>