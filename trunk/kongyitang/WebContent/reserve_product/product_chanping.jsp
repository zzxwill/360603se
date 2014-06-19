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
					<td align="center" width="54%"><a style="color: white;">健康产品</a></td>
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
							
							<p>
	<strong>清灵甘露茶</strong>
</p>
<p style="text-indent:0;text-align: center;"><img src="../images/product/3.jpg" /></p>
<p>
	一九二五年，上海发生了震惊中外的五卅运动，此事件激起了全国一片声讨和抗议，人们纷纷抵制日货，表达了自己的愤怒。<br />
&nbsp;&nbsp;孔伯华先生决心用自己的实际行动支持国人的爱国行动。当时世面上有一种日本制造的丹药非常畅销，但孔伯华知道这种丹药效果并不及中医所制造的丹药。为了让更多的人了解和使用中药,孔伯华研制了一种清灵甘露茶，由鲜苇根、薄荷、佩兰、藿香、青茶、竹叶卷心、双花、荷叶等药物煎制而成，用于预防和治疗外感风热感冒，还可治疗中暑，颇有成效。
</p>
<p>
	清灵甘露茶，融合百年古方与现代科技，传承经典文化，还原真实口感，着力祛除当代人们因久居都市、压力过大而形成的内热体质，为居家养生之必备茶饮。
</p>
<p style="text-indent:0;text-align: center;"><img src="../images/product/2.jpg" /></p>
<p>
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