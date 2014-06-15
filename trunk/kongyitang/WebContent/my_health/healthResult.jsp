<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

 <%@ include file="../include/package.jsp"%> 
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title><%=sysName %></title>

	 <%@ include file="../include/meta.jsp"%> 
	 <%@ include file="../include/cssJS.jsp"%> 

<style type="text/css">
 table td
{
	height:30px;
	line-height:30px;
}
</style>

</head>
  
 <body>
  <div data-role="page">
	<div data-role="header">

	<table width="100%">
		<tr>
			<td width="33%">
				<div id="backButton" style="width:60px;" >
					<a onclick="closeWin();"></a>
				</div>
			</td>
			<td align="center" width="34%"><a style="color:white;">健康自测结果</a></td>
			<td width="33%">&nbsp;&nbsp;</td>
		</tr>
	</table>
 	</div>
 	
  	<div data-role="content" style="width:90%;margin:0 auto">
<br/>
 <center><strong>各问题答案及评分规则</strong></center>
 <table width="100%"><tr><td align="center"><hr color="red" ></td></tr></table>
<table width="100%">
	<tr>
		<td width="30%"><strong>问题1：</strong></td>
		<td width="70%">有(0分)，没有(20分)</td>
	<tr>
</table>
<table width="100%"><tr><td><hr></td></tr></table>
<table width="100%">
	<tr>
		<td width="30%"><strong>问题2：</strong></td>
		<td width="70%">是(0分)，否(20分)</td>
	<tr>
</table>
<table width="100%"><tr><td><hr></td></tr></table>
<table width="100%">
	<tr>
		<td width="30%"><strong>问题3：</strong></td>
		<td width="70%">有(0分)，没有(20分)</td>
	<tr>
</table>
<table width="100%"><tr><td><hr></td></tr></table>
<table width="100%">
	<tr>
		<td width="30%"><strong>问题4：</strong></td>
		<td width="70%">每天(20分)，每周(15分)，每月(10分)，不做(0分)</td>
	<tr>
</table>
<table width="100%"><tr><td><hr></td></tr></table>
<table width="100%">
	<tr>
		<td width="30%"><strong>问题5：</strong></td>
		<td width="70%">是(0分)，否(20分)</td>
	<tr>
</table>
<table width="100%"><tr><td><hr></td></tr></table>
<%
	request.setCharacterEncoding("UTF-8");
	String url = "index.jsp";
	String health_q_1 = request.getParameter("health_q_1");
	String health_q_2 = request.getParameter("health_q_2");
	String health_q_3 = request.getParameter("health_q_3");
	String health_q_4 = request.getParameter("health_q_4");
	String health_q_5 = request.getParameter("health_q_5");
	if(null==health_q_1||health_q_1.equals("")||null==health_q_1||health_q_1.equals("")||
			null==health_q_1||health_q_1.equals("")||null==health_q_1||health_q_1.equals("")||
			null==health_q_1||health_q_1.equals("")){
		%>
		<script language='javascript' type='text/javascript'>
			window.location = "<%=url%>";
		</script>
	<%	
	}else{
		//System.out.println("health_q_5:" + health_q_5);
		int health_q_1_int = Integer.parseInt(health_q_1);
		int health_q_2_int = Integer.parseInt(health_q_2);
		int health_q_3_int = Integer.parseInt(health_q_3);
		int health_q_4_int = Integer.parseInt(health_q_4);
		int health_q_5_int = Integer.parseInt(health_q_5);
		int score = 0;
		score = (health_q_1_int + health_q_2_int + health_q_3_int + health_q_5_int)*20;
		if(health_q_4_int>0){
			score += (health_q_4_int + 1)*5;
		}
		String suggestion = null;
		if(score==100){
			suggestion = "您健康状况为优秀，请继续保持!";
		}else if(score>=80){
			suggestion = "您健康状况为良好，还有提升空间!";
		}else if(score>=60){
			suggestion = "您健康状况为中等，还有很大提升空间!";
		}else if(score>=40){
			suggestion = "您健康状况为较差，需要良好的作息和锻炼!";
		}else if(score<40){
			suggestion = "您健康状况为很差，急需良好的作息和锻炼!";
		}
		%>
		<center><p>您最后的测试得分为：&nbsp;<a style="color:red;"><strong><%=score %></strong>&nbsp;</a>分!</p>
			<p><%=suggestion %></p>
		</center>
		<%
	}
%>
  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>