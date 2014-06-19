<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*"
	pageEncoding="UTF-8"%>

<%@ include file="../include/package.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><%=sysName%></title>

<%@ include file="../include/meta.jsp"%>
<%@ include file="../include/cssJS.jsp"%>
<%@ include file="../include/SpecificssJS.jsp"%>
  
<link rel="stylesheet" href="../css/screen.css" />
<link rel="stylesheet" href="../css/reservation_xuetang.css" />


<style type="text/css">
#verifyForm label.error {
	margin-left: 10px;
	width: auto;
	display: inline;
}
.ui-content
{
	padding:0px;
}

</style>

</head>

<body>
	<div data-role="page">
		<div data-role="header">

			<table width="100%">
				<tr>
					<td width="23%">
						<!-- <div id="backButton" style="width: 60px;"
							onclick="return_to_wechat_main()"></div> -->
							<div id="backButton" style="width: 60px;">
							<a id="return_link" onclick="window.location.href='../reserve_product/index.jsp'"></a>
						</div>
							
					</td>
					<td align="center" width="54%"><a style="color: white;">健康评估</a></td>
					<td width="23%">&nbsp;&nbsp;</td>
				</tr>
			</table>

		</div>

		<div data-role="content" style="margin-bottom: 20px;">
			<form name="verifyForm" id="verifyForm" method="post"
				action="submit_reserve_xuetang.jsp">

				<!-- 预约的学堂 -->
				<input id="xuetang" name="xuetang" type="hidden">
				<!-- 预约的科室 -->
				<!-- <input id="department" name="department" type="hidden"> -->
				<!-- 预约的医生id -->
				<!-- <input id="doctorid" name="doctorid" type="hidden"> -->
				<!-- 预约的门诊id(2014-05-01 星期四 上午 普通门诊) -->
				<!-- <input id="outpatientid" name="outpatientid" type="hidden"> -->





				<!-- 预约孔医堂首页 -->
				<div id="xuetang_reservation_index" style="display:">

					<table width="100%"  cellspacing="0"
						cellpadding="0" class="Introtable">

						<!-- <tr bgColor="#000000">
							<td align="left" style="width: 20%"><button type="button"></button></td>
							<td align="center" style="color: white;">预约孔医堂</td>

						</tr> -->

						<tr>
							<td>
							<div style="margin-bottom: 20px" >
							<p style="text-indent:0;text-align: center;"><img src="../images/product/1.JPG" /></p>
							<p>
	<strong>健康评估介绍：</strong>
</p>
<p>
	孔医堂上工坊健康评估,是秉承中医养生防病理念和中医治未病思想设立的、具有鲜明中医特色的健康评估体系。在解析西医体检报告的基础上，通过中医“望、闻、问、切”四诊分型辩证，结合孔医堂特有的体质分类方法，针对人们的体质和症状做出健康状况评估,并依此量身定制，提供一整套具有个性化、针对性的健康调理指导方案。
</p>
<p>
	<strong>健康评估服务内容：</strong>
</p>
<p>
	西医体检报告解析
</p>
<p>
	中医四诊健康评估
</p>
<p>
	提供个性化健康调理指导方案（10个工作日内）
</p>
<p>
	全年值班医师电话咨询服务
</p>
<p>
	一年内四次约专题健康沙龙活动
</p>
<p>
	建立私密专属的健康档案
</p>
<p align="left">
	&nbsp;
</p>
							</div>
							</td>

						</tr>
					</table>

				

				</div>


		

			
				<div data-role="footer" data-id="myfooter" data-position="fixed">
				</div>
				</form>
		



		
	</div>
	</div>
</body>
</html>