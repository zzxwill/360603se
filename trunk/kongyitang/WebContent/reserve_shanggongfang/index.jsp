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

<style type="text/css">
</style>

</head>

<body>
	<div data-role="page">
		<div data-role="header"></div>
		<div data-role="content">
			<form name="verifyForm" id="verifyForm" method="post">




				<!-- 预约的上工坊健康会所的类型 -->
				<input id="type" name="type" type="hidden">
			
				<!-- 预约上工坊健康会所首页 -->
				<div id="xuetang_reservation_index" style="display:">

					<table width="100%">
						<tr>
							<td align="left" style="width: 20%"><button type="button"
									>返回</button></td>
							<td align="center">健康服务</td>

						</tr>
						<tr>
							<td colspan="2" align="center"><span><h1>健康调理</h1></span></td>

						</tr>
						<tr>
							<td colspan="2" align="center"><span>提供健康咨询、健康评估、健康指导、就医指导、健康管理、健康教育及各项基础保健项目（全身经络推导和局部穴位刺激）。
							</br>非介入人能自然疗法，辩证调养身心健康。
							</span></td>

						</tr>
					</table>
					<table>
						<tr>
							<td style="width: 80%;" align="center">健康评估</td>
							<td><button type="button"
									onclick="set_shanggongfang_reservation_index_value('健康评估');show_hidden('xuetang_reservation_index');show_hidden('xuetang_reservation_content_assess');">预约</button></td>
						</tr>
						<tr>
							<td style="width: 80%; " align="center">健康调理</td>
							<td><button type="button"
									onclick="set_shanggongfang_reservation_index_value('健康调理');show_hidden('xuetang_reservation_index');show_hidden('xuetang_reservation_content');">预约</button></td>
						</tr>
						
						<tr>
							<td style="width: 80%; " align="center">健康讲座</td>
							<td><button type="button"
									onclick="">预约</br>(暂未开放)</button></td>
						</tr>
						
						<tr>
							<td style="width: 80%; " align="center">健康沙龙</td>
							<td><button type="button"
									onclick="">预约</br>(暂未开放)</button></td>
						</tr>
					
					</table>





				</div>



				<!-- 上工坊健康会所 具体预约页面 -->
				<div id="xuetang_reservation_content" style="display: none;">
					<table width="100%">
						<tr>
							<td align="left" style="width: 20%"><button type="button"
									onclick="display_return_page('xuetang_reservation_content', 'xuetang_reservation_index');">返回</button></td>
							<td align="center">健康服务</td>

						</tr>
						<tr>
							<td colspan="2" align="center"><span><h1>健康调理</h1></span></td>

						</tr>
						
						
					</table>


						<table>
							<tr>
								<td>姓名：</td>
								<td colspan="2"><INPUT name="name" value="" width="80%"></td>
							</tr>
							<tr>
								<td>性别：</td>
								<td ><input type="radio" name="gender" value="male" /> 男</td><td>
										<input type="radio" name="gender" value="female" /> 女</td>
							</tr>
							<tr>
								<td>年龄：</td>
								<td colspan="2"><INPUT name="age" value="" width="80%"></td>
							</tr>
							
							<tr>
								<td>手机：</td>
								<td colspan="2"><INPUT name="mobile" value="" width="80%"></td>
							</tr>
							
							
							
							<tr>
								<td>调理项目：</td>
								<td colspan="2">
<select id="adjust_programe" name="adjust_programe">
<option selected="" value="肩颈能量疏通">肩颈能量疏通</option>
<option value="体内净排">体内净排</option>
<option value="头部轻松调理">头部轻松调理</option>
<option value="理络活颜">理络活颜</option>
<option value="办公室综合症调理">办公室综合症调理</option>
<option value="脊柱平衡调理">脊柱平衡调理</option>
<option value="生态内调">生态内调</option>
<option value="经络调理">经络调理</option>
<option value="经络全息">经络全息</option>
<option value="经络疏通">经络疏通</option>
</select>
</td>
							</tr>
							
							<tr>
								<td>预约时间：</td>
								<td colspan="2">
<select id="book_date" name="book_date">
<option selected="" value="2014-06-06 星期一 10:00">2014-05-06 星期一 10:00</option>
<option value="2014-06-06 星期三 12:00">2014-06-06 星期三 12:00</option>
</select>
</td>
							</tr>
							
							<tr>
								<td>调理师：</td>
								<td colspan="2">
<select id="adjust_master" name="adjust_master" class="u29">
<option selected="" value="王毅河">王毅河</option>
<option value="孙庭剑">孙庭剑</option>
</select>
</td>
							</tr>
							
						</table>

					


					<div>



						<br /> <INPUT id="u38" type="submit" value="预约"  onclick="submit_reserve_shanggongfang('submit_reserve_shanggongfang.jsp')">

					</div>
				</div>

				<!-- 上工坊健康会所  健康评估   具体预约页面 -->
				<div id="xuetang_reservation_content_assess" style="display: none;">
					<table width="100%">
						<tr>
							<td align="left" style="width: 20%"><button type="button"
									onclick="display_return_page('xuetang_reservation_content_assess', 'xuetang_reservation_index');">返回</button></td>
							<td align="center">健康服务</td>

						</tr>
						<tr>
							<td colspan="2" align="center"><span><h1>健康评估</h1></span></td>

						</tr>
						
						
					</table>


						<table>
							<tr>
								<td>姓名：</td>
								<td colspan="2"><INPUT name="name_assess" value="" width="80%"></td>
							</tr>
							<tr>
								<td>性别：</td>
								<td ><input type="radio" name="gender_assess" value="male" /> 男</td><td>
										<input type="radio" name="gender" value="female" /> 女</td>
							</tr>
							<tr>
								<td>年龄：</td>
								<td colspan="2"><INPUT name="age_assess" value="" width="80%"></td>
							</tr>
							
							<tr>
								<td>手机：</td>
								<td colspan="2"><INPUT name="mobile_assess" value="" width="80%"></td>
							</tr>
							
							
							
							<tr>
								<td>评估项目：</td>
								<td colspan="2">
<select id="assess_programe" name="assess_programe_assess">
<option selected="" value="私人医生顾问服务">私人医生顾问服务</option>
<option value="个性化健康指导">个性化健康指导</option>
<option value="健康评估">健康评估</option>
<option value="健康咨询">健康咨询</option>
</select>
</td>
							</tr>
							
							<tr>
								<td>预约时间：</td>
								<td colspan="2">
<select id="book_date" name="book_date_assess">
<option selected="" value="2014-06-06 星期一 10:00">2014-05-06 星期一 10:00</option>
<option value="2014-06-06 星期三 12:00">2014-06-06 星期三 12:00</option>
</select>
</td>
							</tr>
							
							<tr>
								<td>调理师：</td>
								<td colspan="2">
<select id="assess_master" name="assess_master_assess" class="u29">
<option selected="" value="李志更">李志更</option>
<option value="孙立彬">孙立彬</option>
<option value="肖强">肖强</option>
<option value="王倩">王倩</option>
<option value="郭培杰">郭培杰</option>
</select>
</td>
							</tr>
							
						</table>

					


					<div>



						<br /> <INPUT id="u38" type="submit" value="预约" onclick="submit_reserve_shanggongfang('submit_reserve_shanggongfang_assess.jsp')">

					</div>
				</div>

				<div data-role="footer" data-id="myfooter" data-position="fixed">
				</div>
		</div>



		</form>
	</div>
	</div>
</body>
</html>