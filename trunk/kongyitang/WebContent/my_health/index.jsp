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
			<td align="center" width="34%"><a style="color:white;">健康自测</a></td>
			<td width="33%">&nbsp;&nbsp;</td>
		</tr>
	</table>
 	</div>
 	
  	<div data-role="content">
    <form method="post" name="healthForm" id="healthForm" action="healthResult.jsp">
	     	 <fieldset data-role="fieldcontain">

 <script>
    function healthSubmit()
    {
       var health_q_1 = $('input:radio[name="health_q_1"]:checked').val();
       var health_q_2 = $('input:radio[name="health_q_2"]:checked').val();
       var health_q_3 = $('input:radio[name="health_q_3"]:checked').val();
       var health_q_4 = $('input:radio[name="health_q_4"]:checked').val();
       var health_q_5 = $('input:radio[name="health_q_5"]:checked').val();
	   var message = null;
	   var msg = document.getElementById("msgHealth");
	   var flag = 1;
	   if(null==health_q_1||health_q_1==""||null==health_q_2||health_q_2==""||null==health_q_3||health_q_3==""||
			   null==health_q_4||health_q_4==""||null==health_q_5||health_q_5==""){
			  flag = 0;
		 	  message = "请填写全部的健康测试问题！";
			  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
		}

	   if(flag==1){
	      var healthForm = document.getElementById("healthForm");
	      healthForm.submit(); 
	   }
    }
</script> 	

<table width="100%">
	<tr>
		<td width="100%"><strong>问题1：</strong>您是否有晚睡的习惯？</td>
	<tr>
	<tr>
		<td><table width="100%">
			<tr>
				<td width="15%" align="right" valign="middle">
					<input type="radio" name="health_q_1" id="health_q_1" value="0">
				</td>
				<td width="35%" align="left">
					有
				</td>
				<td width="15%" align="right"  valign="middle">
					<input type="radio" name="health_q_1" id="health_q_1" value="1">
				</td>
				<td width="35%" align="left">
					没有
				</td>
			</tr>
		</table></td>
	</tr>
	<tr><td><hr></td></tr>
	<tr>
		<td width="100%"><strong>问题2：</strong>您是否经常职业性久坐？</td>
	<tr>
	<tr>
		<td><table width="100%">
			<tr>
				<td width="15%" align="right" valign="middle">
					<input type="radio" name="health_q_2" id="health_q_2" value="0">
				</td>
				<td width="35%" align="left">
					是
				</td>
				<td width="15%" align="right" valign="middle">
					<input type="radio" name="health_q_2" id="health_q_2" value="1">
				</td>
				<td width="35%" align="left">
					否
				</td>
			</tr>
		</table></td>
	</tr>
	<tr><td><hr></td></tr>
	<tr>
		<td width="100%"><strong>问题3：</strong>您是否有烟酒嗜好？</td>
	<tr>
	<tr>
		<td><table width="100%">
			<tr>
				<td width="15%" align="right" valign="middle">
					<input type="radio" name="health_q_3" id="health_q_3" value="0">
				</td>
				<td width="35%" align="left">
					是
				</td>
				<td width="15%" align="right" valign="middle">
					<input type="radio" name="health_q_3" id="health_q_3" value="1">
				</td>
				<td width="35%" align="left">
					没有
				</td>
			</tr>
		</table></td>
	</tr>
	<tr><td><hr></td></tr>	
		<tr>
		<td width="100%"><strong>问题4：</strong>您多久做一次运动？</td>
	<tr>
	<tr>
		<td><table width="100%">
			<tr>
				<td width="12.5%" align="right" valign="middle">
					<input type="radio" name="health_q_4" id="health_q_4" value="3">
				</td>
				<td width="12.5%" align="left">
					每天
				</td>
				<td width="12.5%" align="right" valign="middle">
					<input type="radio" name="health_q_4" id="health_q_4" value="2">
				</td>
				<td width="12.5%" align="left">
					每周
				</td>
				<td width="12.5%" align="right" valign="middle">
					<input type="radio" name="health_q_4" id="health_q_4" value="1">
				</td>
				<td width="12.5%" align="left">
					每月
				</td>
				<td width="12.5%" align="right" valign="middle">
					<input type="radio" name="health_q_4" id="health_q_4" value="0">
				</td>
				<td width="12.5%" align="left">
					不做
				</td>
			</tr>
		</table></td>
	</tr>
	<tr><td><hr></td></tr>	
		<tr>
		<td width="100%"><strong>问题5：</strong>您的体重是否超重？</td>
	<tr>
	<tr>
		<td><table width="100%">
			<tr>
				<td width="15%" align="right" valign="middle">
					<input type="radio" name="health_q_5" id="health_q_5" value="0">
				</td>
				<td width="35%" align="left">
					是
				</td>
				<td width="15%" align="right" valign="middle">
					<input type="radio" name="health_q_5" id="health_q_5" value="1">
				</td>
				<td width="35%" align="left">
					否
				</td>
			</tr>
		</table></td>
	</tr>
</table>
	<br>
   	<div id="msgHealth" ></div>
   	<div id="healthSubmit"><a data-theme="b" data-role="button" onclick="healthSubmit()">提交并查看结果</a></div>
    	</fieldset>
	</form>	
  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>