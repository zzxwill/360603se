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
	height:40px;
	line-height:40px;
}
.tjtable
{
	width: 100%;
	text-align: center;
	color: #734400;
	font-size: 16px;
	background: #feedd3;
	font-weight: 600;
	border-bottom: solid #734400 1px;
}

</style>

</head>
  
 <body>
  <div data-role="page">
	<div data-role="header">

	<table width="100%">
		<tr>
			<td width="23%">
				<div id="backButton" style="width:60px;" >
					<a href="../main/index.jsp"></a>
				</div>
			</td>
			<td align="center" width="54%"><a style="color:white;">健康自测结果</a></td>
			<td width="23%">&nbsp;&nbsp;</td>
		</tr>
	</table>
 	</div>
 	
  <!--	<div data-role="content" style="width:90%;margin:0 auto">
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
<table width="100%"><tr><td><hr></td></tr></table>-->
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
		String sugges = null;
		String color = null;
		
		if(score==100){
			suggestion = "请继续保持";
			sugges = "优秀";
			color="#2dbf00";
		}else if(score>=80){
			suggestion = "还有提升空间";
			sugges = "良好";
			color="#2dbf00";
		}else if(score>=60){
			suggestion = "还有很大提升空间";
			sugges = "中等";
			color="#2dbf00";
		}else if(score>=40){
			suggestion = "定期健康体检";
			sugges = "较差";
			color="#b30f0e";
		}else if(score<40){
			suggestion = "全面的健康体检";
			sugges = "很差";
			color="#b30f0e";
		}
		%>
		<table class="tjtable">
				<tr>
					<td colspan=2  style="height: 20px;lime-height: 20px;">
					
					</td>
				</tr>
				<tr>
					<td colspan=2>
					您最后的测试得分为
					</td>
				</tr>
				<tr>
					<td colspan=2>
						<span style="color:<%=color %>;font-size: 24px;"><%=score %>分</span>
					</td>
				</tr>
				<tr>
					<td colspan=2>
						您的健康状况
					</td>
				</tr>
				<tr>
					<td colspan=2>
						<span style="color:<%=color %>;font-size: 24px;"><%=sugges %></span>
					</td>
				</tr>
				<tr>
					<td colspan=2>
						<div style="border-bottom: solid #734400 1px;width: 90%;margin: 0 auto;"></div>
					</td>
				</tr>
				<tr>
					<td style="text-align: left;padding-left: 5%;">
						 专家建议：<span style="color:<%=color %>;text-decoration:underline "><%=suggestion %></span>
					</td>
					<td style="text-align: right;padding-right: 5%;">
						<div style="width:80px;float: right;" id="submitButton" onclick="">体检预约</div>
					</td>
				</tr>
				<tr>
					<td colspan=2  style="height: 20px;lime-height: 20px;">
					</td>
				</tr>	
			
		</table>
		<%
	}
%>
  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>