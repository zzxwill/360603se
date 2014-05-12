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
			<form name="verifyForm" id="verifyForm" method="post"
				action="submit_reserve_xuetang.jsp">
<!-- 				<p> -->
<!-- 					<br> -->
<!-- 					
<!--     	<h1>欢迎来到孔医堂！</h1><br> -->
<!--     	<h2>《 门诊预约 》</h2><br> -->
<!--     	 --> 
<!-- 				</p> -->



				<!-- 预约的学堂 -->
				<input id="xuetang" name="xuetang" type="hidden">
				<!-- 预约的科室 -->
				<input id="department" name="department" type="hidden">
				<!-- 预约的医生id -->
				<input id="doctorid" name="doctorid" type="hidden">
				<!-- 预约的门诊id(2014-05-01 星期四 上午 普通门诊) -->
				<input id="outpatientid" name="outpatientid" type="hidden">





				<!-- 预约孔医堂首页 -->
				<div id="xuetang_reservation_index" style="display:">
				<table width="100%" cellspacing="0" cellpadding="0">
						<tr bgColor= "#000000">
							<td align="left" style="width: 20%"><button type="button"
									onclick="location=index.jsp">返回</button></td>
							<td align="center" style="color: white;">招生在线</td>

						</tr>


					</table>

					<table width="100%">
					<!-- 
						<tr>
							<td align="left" style="width: 20%"><button type="button"
									>返回</button></td>
							<td align="center">招生在线</td>

						</tr>
						 -->
						
						<tr>
							<td colspan="2" align="center"><span><h1>孔伯华学院</h1></span></td>

						</tr>
						<tr>
							<td colspan="2" align="center"><span>孔伯华学院下设以国学精读为主的“紫禁学堂”，以中医教学为主的“国医学堂”，以儿童启蒙为主的“翰林学堂”和开展公益的“社区教室”。
							</br>弘扬中华文化，以文化滋养生活，推动中医现代化进程。
							</span></td>

						</tr>
					</table>
					<table>
						<tr>
							<td style="width: 80%;" align="center">科普学堂</td>
							<td><button type="button"
									onclick="">报名</br>(暂未开放)</button></td>
						</tr>
						<tr>
							<td style="width: 80%; " align="center">紫禁学堂</td>
							<td><button type="button"
									onclick="">报名</br>(暂未开放)</button></td>
						</tr>
						<tr>
							<td style="width: 80%; " align="center">国医学堂</td>
							<td><button type="button"
									onclick="set_xuetang_reservation_index_value('国医学堂');show_hidden('xuetang_reservation_index');show_hidden('xuetang_reservation_content');">报名</button></td>
						</tr>
						<tr>
							<td style="width: 80%; " align="center">翰林学堂</td>
							<td><button type="button"
									onclick="">报名</br>(暂未开放)</button></td>
						</tr>
					
					</table>





				</div>



				<!-- 患者病情资料 -->
				<div id="xuetang_reservation_content" style="display: none;">
				<table width="100%" cellspacing="0" cellpadding="0">
						<tr bgColor= "#000000">
							<td align="left" style="width: 20%"><button type="button"
									onclick="display_return_page('xuetang_reservation_content', 'xuetang_reservation_index');">返回</button></td>
							<td align="center" style="color: white;">招生在线</td>

						</tr>


					</table>
					
					<table width="100%">
					<!-- 
						<tr>
							<td align="left" style="width: 20%"><button type="button"
									onclick="display_return_page('xuetang_reservation_content', 'xuetang_reservation_index');">返回</button></td>
							<td align="center">招生在线</td>

						</tr>
						 -->
						<tr>
							<td colspan="2" align="center"><span><h1>国医学堂</h1></span></td>

						</tr>
						
						
					</table>


						<table>
							<tr>
								<td>姓名：</td>
								<td colspan="3"><INPUT name="name" value="" width="80%"></td>
							</tr>
							<tr>
								<td>性别：</td>
								<td ><input type="radio" name="gender" value="male" /> 男</td><td>
										<input type="radio" name="gender" value="female" /> 女</td>
							</tr>
							<tr>
								<td>年龄：</td>
								<td colspan="3"><INPUT name="age" value="" width="80%"></td>
							</tr>
							
							<tr>
								<td>手机：</td>
								<td colspan="2"><INPUT name="mobile" value="" width="80%"></td>
							</tr>
							
							<tr>
								<td>职业：</td>
								<td colspan="2"><INPUT name="job" value="" width="80%"></td>
							</tr>
							
							<tr>
								<td>就职单位：</td>
								<td colspan="2"><INPUT name="company" value="" width="80%"></td>
							</tr>
							
							<tr>
								<td>职务/职称：</td>
								<td colspan="2"><INPUT name="title" value="" width="80%"></td>
							</tr>
							
						</table>

					


					<div>



						<br /> <INPUT id="u38" type="submit" value="提交审核">

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