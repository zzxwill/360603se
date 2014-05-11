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
				action="submit_reserve_clinic.jsp">
<!-- 				<p> -->
<!-- 					<br> -->
<!-- 					
<!--     	<h1>欢迎来到孔医堂！</h1><br> -->
<!--     	<h2>《 门诊预约 》</h2><br> -->
<!--     	 --> 
<!-- 				</p> -->



				<!-- 预约的地点 -->
				<input id="site" name="site" type="hidden">
				<!-- 预约的科室 -->
				<input id="department" name="department" type="hidden">
				<!-- 预约的医生id -->
				<input id="doctorid" name="doctorid" type="hidden">
				<!-- 预约的门诊id(2014-05-01 星期四 上午 普通门诊) -->
				<input id="outpatientid" name="outpatientid" type="hidden">





				<!-- 预约孔医堂首页 -->
				<div id="kongyitang_reservation_index" style="display:">

					<table width="100%">
						<tr>
							<td align="left" style="width: 20%"><button type="button"
									>返回</button></td>
							<td align="center">预约孔医堂</td>

						</tr>
						<tr>
							<td colspan="2" align="center"><span><h1>孔医堂</h1></span></td>

						</tr>
						<tr>
							<td colspan="2" align="center"><span>依托孔伯华名家研究室，汇聚北京名老中医、京城四大名医的后代和传人。</br>下设三家传统中医诊疗机构（望京馆、展览路馆、五棵松馆），涵盖中医内、外、妇、儿、皮肤等科室。
							</span></td>

						</tr>
					</table>
					<table>
						<tr>
							<td style="width: 80%;" align="center">望京馆</td>
							<td><button type="button"
									onclick="set_kongyitang_reservation_index_value('望京馆');show_hidden('kongyitang_reservation_index');show_hidden('reservation_specific_location');">预约</button></td>
						</tr>
						<tr>
							<td style="width: 80%; " align="center">五棵松馆</td>
							<td><button type="button"
									onclick="set_kongyitang_reservation_index_value('望京馆');show_hidden('kongyitang_reservation_index');show_hidden('reservation_specific_location');">预约</button></td>
						</tr>
						<tr>
							<td style="width: 80%; " align="center">展览路馆</td>
							<td><button type="button"
									onclick="set_kongyitang_reservation_index_value('展览路馆');show_hidden('kongyitang_reservation_index');show_hidden('reservation_specific_location');">预约</button></td>
						</tr>
						<tr>
							<td style="width: 80%; " align="center">三里屯SOHO馆</td>
							<td><button type="button"
									onclick="set_kongyitang_reservation_index_value('三里屯SOHO馆');show_hidden('kongyitang_reservation_index');show_hidden('reservation_specific_location');">预约</button></td>
						</tr>
					
					</table>




					<!-- 
				
					<div id="u0" class="u0_container">
						<div id="u0_img" class="u0_normal detectCanvas"></div>
						<div id="u1" class="u1" style="visibility: hidden;">
							<div id="u1_rtf"></div>
						</div>
					</div>
					<div id="u2" class="u2_container">
						<div id="u2_img" class="u2_normal detectCanvas"></div>
						<div id="u3" class="u3" style="visibility: hidden;">
							<div id="u3_rtf"></div>
						</div>
					</div>

					<div id="u4" class="u4">
						<div id="u4_rtf">
							<p style="text-align: left;">
								<span
									style="font-family: 微软雅黑; font-size: 13px; font-weight: bold; font-style: normal; text-decoration: none; color: #FFFFFF;">预约</span><span
									style="font-family: 微软雅黑; font-size: 13px; font-weight: bold; font-style: normal; text-decoration: none; color: #FFFFFF;">孔医堂</span>
							</p>
						</div>
					</div>
					<div id="u5" class="u5_container">
						<div id="u5_img" class="u5_normal detectCanvas"></div>
						<div id="u6" class="u6">
							<div id="u6_rtf">
								<p style="text-align: center;">
									<span
										style="font-family: 微软雅黑; font-size: 13px; font-weight: normal; font-style: normal; text-decoration: none; color: #333333;">依托</span><span
										style="font-family: 微软雅黑; font-size: 13px; font-weight: normal; font-style: normal; text-decoration: none; color: #333333;">孔伯华名家研究室，</span><span
										style="font-family: 微软雅黑; font-size: 13px; font-weight: normal; font-style: normal; text-decoration: none; color: #333333;">汇聚北京名老中医、京城四大名医的后代和传人</span><span
										style="font-family: 微软雅黑; font-size: 13px; font-weight: normal; font-style: normal; text-decoration: none; color: #333333;">。</span><span
										style="font-family: 微软雅黑; font-size: 13px; font-weight: normal; font-style: normal; text-decoration: none; color: #333333;"></span>
								</p>
								<p style="text-align: center;">
									<span
										style="font-family: 微软雅黑; font-size: 13px; font-weight: normal; font-style: normal; text-decoration: none; color: #333333;">下设三家传统中医诊疗机构（望京馆、展览路馆、五棵松馆）</span><span
										style="font-family: 微软雅黑; font-size: 13px; font-weight: normal; font-style: normal; text-decoration: none; color: #333333;">，涵盖</span><span
										style="font-family: 微软雅黑; font-size: 13px; font-weight: normal; font-style: normal; text-decoration: none; color: #333333;">中医内、外、妇、儿、皮肤等科室，</span>
								</p>
							</div>
						</div>
					</div>
					
					<div id="u7" class="u7_container">
						<div id="u7_img" class="u7_normal detectCanvas"></div>
						<div id="u8" class="u8">
							<div id="u8_rtf">

								望京馆
								<button type="button"
									onclick="set_kongyitang_reservation_index_value('望京馆');show_hidden('kongyitang_reservation_index');show_hidden('reservation_specific_location');">预约</button>

							</div>
						</div>
					</div>
					<div id="u9" class="u9_container">
						<div id="u9_img" class="u9_normal detectCanvas"></div>
						<div id="u10" class="u10">
							<div id="u10_rtf">
								<p style="text-align: center;">
									<span
										style="font-family: 微软雅黑; font-size: 13px; font-weight: normal; font-style: normal; text-decoration: none; color: #333333;">五棵松馆</span>
								</p>
							</div>
						</div>
					</div>
					<div id="u11" class="u11_container">
						<div id="u11_img" class="u11_normal detectCanvas"></div>
						<div id="u12" class="u12">
							<div id="u12_rtf">
								<p style="text-align: center;">
									<span
										style="font-family: 微软雅黑; font-size: 13px; font-weight: normal; font-style: normal; text-decoration: none; color: #333333;">展览路馆</span>
								</p>
							</div>
						</div>
					</div>
					<INPUT id="u13" type="submit" class="u13" value="返回">

					<div id="u14" class="u14">
						<div id="u14_rtf">
							<p style="text-align: left;">
								<span
									style="font-family: 微软雅黑; font-size: 13px; font-weight: bold; font-style: normal; text-decoration: none; color: #333333;">孔医堂</span>
							</p>
						</div>
					</div>
					<INPUT id="u15" type="submit" class="u15" value="预约"
						onclick="show_hidden('kongyitang_reservation_index');show_hidden('reservation_specific_location');">

					<INPUT id="u16" type="submit" class="u16" value="预约"> <INPUT
						id="u17" type="submit" class="u17" value="预约">

					<div id="u18" class="u18_container">
						<div id="u18_img" class="u18_normal detectCanvas"></div>
						<div id="u19" class="u19">
							<div id="u19_rtf">
								<p style="text-align: center;">
									<span
										style="font-family: 微软雅黑; font-size: 13px; font-weight: normal; font-style: normal; text-decoration: none; color: #333333;">三里屯SOHO馆</span>
								</p>
							</div>
						</div>
					</div>
					<INPUT id="u20" type="submit" class="u20" value="预约">
 -->

				</div>


				<!-- 具体预约某个医馆 -->
				<div id="reservation_specific_location" style="display: none;">
					<table width="100%">
						<tr>
							<td align="left" style="width: 20%"><button type="button"
									onclick="display_return_page('reservation_specific_location', 'kongyitang_reservation_index');">返回</button></td>
							<td align="center">预约孔医堂</td>

						</tr>
						<tr>
							<td colspan="2" align="center"><span><h1>望京馆</h1></span></td>

						</tr>
						
					</table>
					<!-- 
					<div>
						<INPUT id="u45" type="submit" class="u245" value="返回"> <span
							style="text-align: right">预约孔医堂</span>
					</div>

					<div>
						<p style="text-align: center;"></p>
					</div>
					 -->


					<div id="u8">
						<div id="u8_rtf">
							<p style="text-align: center;">
								中医内科 <a onclick="show_hidden('zhongyineike');"><img
									src="../resources/css/images/reserver_clinic/u17_normal.png"
									width="16" height="15" alt="" /></a>
							</p>
						</div>
					</div>

					<div id="zhongyineike" style="display: none;">
						<div>
							<table border="0" width="100%">
								<tr>
									<td><img
										src="../resources/images/upload/doctor_male.jpg"
										width="50" height="50" alt="" /></td>
									<td>
										<table width="80%">
											<tr>

												<td><span style="text-align: left;">田&nbsp; 野</span></td>
												<td><span style="text-align: right">主治医师</span></td>
												<td align="center"><span style="font-weight:bold;font-style:normal;text-decoration:none;color:#1DDA2C;">V</span></td>
											</tr>
											<tr>

												<td>中医内科</td>
												<td>&nbsp;</td>
												<td>												
												<button id="u21" type="button"
													onclick="set_reservation_specific_location_value('中医内科','100001');show_hidden('reservation_specific_doctor');show_hidden('reservation_specific_location');">预约</button></td>
											</tr>
										</table>
									</td>


								</tr>

								<tr>
									<td><img
										src="../resources/images/upload/doctor_female.jpg"
										width="50" height="50" alt="" /></td>
									<td><table>
											<tr>

												<td><span style="text-align: left;">赵丽丽</span></td>
												<td><span style="text-align: right">主治医师</span></td>
												<td><span style="font-weight:bold;font-style:normal;text-decoration:none;color:#1DDA2C;">V</span></td>
											</tr>
											<tr>

												<td>中医内科</td>
												<td>&nbsp;</td>
												<!-- set_reservation_specific_location_value(department, doctorid) -->
												<td><INPUT id="u21" type="button" value="预约"
													onclick="set_reservation_specific_location_value('中医内科','100002');show_hidden('reservation_specific_doctor');show_hidden('reservation_specific_location');"></td>
											</tr>
										</table></td>


								</tr>






							</table>
						</div>
					</div>


				</div>

				<!-- 具体预约某个医生 -->
				<div id="reservation_specific_doctor" style="display: none;">
										<table width="100%">
						<tr>
							<td align="left" style="width: 20%"><button type="button"
									onclick="display_return_page('reservation_specific_doctor', 'reservation_specific_location');">返回</button></td>
							<td align="center">预约</td>

						</tr>
						
						
					</table>
					<div id="zhongyineike" style="display:;">
						<div>
							<table border="0" width="100%">
								<tr>
									<td><img
										src="../resources/images/upload/doctor_male.jpg"
										width="50" height="50" alt="" /></td>
									<td>
										<table width="80%">
											<tr>

												<td><span style="text-align: left;">田&nbsp; 野</span></td>
												<td><span style="text-align: right">主治医师</span></td>
												<td align="center"><span style="font-weight:bold;font-style:normal;text-decoration:none;color:#1DDA2C;">V</span></td>
											</tr>
											<tr>

												<td>中医内科</td>
												<td>&nbsp;</td>
												<td>												
												</td>
												</tr>
										</table>
									</td>


								</tr>
										</table>
										
							<!-- 			
							<table border="0" width="100%">
								<tr>
									<td width="20%"><img
										src="../resources/css/images/reserver_clinic/u30_normal.png"
										alt="" /></td>
									<td width="80%">
										<table width="100%">
											<tr>

												<td><span style="text-align: left;">田&nbsp; 野</span></td>
												<td><span style="text-align: right">主治医师</span></td>
												<td><img
													src="../resources/css/images/reserver_clinic/v.jpg"
													width="40" height="44" alt="" /></td>
											</tr>
											<tr>

												<td>中医外科</td>
												<td>&nbsp;</td>
												<td></td>
											</tr>
										</table>
									</td>


								</tr>
							</table>
							-->
							<table>
								
								<tr>
									<td><p>可预约门诊时间</p></td>
								</tr>

								<tr>

									<td width="100%">
										<table width="100%">
											<tr>
												<td>2014-05-01</td>
												<td>星期四</td>
												<td>上午</td>
												<td>普通门诊</td>
												<td>已停诊</td>
											</tr>
											<tr>
												<td>2014-05-01</td>
												<td>星期四</td>
												<td>上午</td>
												<td>普通门诊</td>
												<td>已停诊</td>
											</tr>
											<tr>
												<td>2014-05-01</td>
												<td>星期四</td>
												<td>上午</td>
												<td>普通门诊</td>
												<td><input type="button" value="申请预约"
													onclick="set_reservation_specific_doctor_value('100001');show_hidden('reservation_specific_doctor');show_hidden('reservation_patient_sickinfo');"></td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
											</tr>
										</table>
									</td>


								</tr>






							</table>
						</div>
					</div>


				</div>

				<!-- 患者病情资料 -->
				<div id="reservation_patient_sickinfo" style="display: none;">
					<table width="100%">
						<tr>
							<td align="left" style="width: 20%"><button type="button"
									onclick="display_return_page('reservation_patient_sickinfo', 'reservation_specific_doctor');">返回</button></td>
							<td align="center">预约</td>

						</tr>
						
						
					</table>
					<div id="zhongyineike" style="display:;">
													<table border="0" width="100%">
								<tr>
									<td><img
										src="../resources/images/upload/doctor_male.jpg"
										width="50" height="50" alt="" /></td>
									<td>
										<table width="80%">
											<tr>

												<td><span style="text-align: left;">田&nbsp; 野</span></td>
												<td><span style="text-align: right">主治医师</span></td>
												<td align="center"><span style="font-weight:bold;font-style:normal;text-decoration:none;color:#1DDA2C;">V</span></td>
											</tr>
											<tr>

												<td>中医内科</td>
												<td>&nbsp;</td>
												<td>												
												</td>
												</tr>
										</table>
									</td>


								</tr>
										</table>
										
					<div>

						<table>
							<tr>
								<td>所患疾病</td>
								<td colspan="3"><INPUT name="illness_name"  width="80%" ></td>
							</tr>
							<tr>
								<td>预约目的</td>
								<td><label><input type="checkbox" name="diagonose" />诊断</label></td>
								<td><label><input type="checkbox" name="therapy" />治疗</label></td>
								<td><label> <input type="checkbox" name="recheck" />复诊</label></td>
							</tr>
							<tr>
								<td colspan="4"><p>病情描述及相关检查结果</p>
									<p>
										<textarea name="detail" rows="3" cols="30"></textarea>
									</p></td>
							</tr>
							<tr>
								<td>手机号</td>
								<td colspan="3"><INPUT name="mobile" value="" width="80%"></td>
							</tr>
							<tr>
								<td>姓名</td>
								<td colspan="3"><INPUT name="name" value="" width="80%"></td>
							</tr>
						</table>

					</div>


					<div>



						<br /> <INPUT id="u38" type="submit" value="预约">

					</div>
				</div>

				<div data-role="footer" data-id="myfooter" data-position="fixed">
				</div>
		</div>


<!-- 
		<div class="preload">
			<img src="../resources/css/images/reserver_clinic/u0_normal.png"
				width="1" height="1" /><img
				src="../resources/css/images/reserver_clinic/u2_normal.png"
				width="1" height="1" /><img
				src="../resources/css/images/reserver_clinic/u5_normal.png"
				width="1" height="1" /><img
				src="../resources/css/images/reserver_clinic/u7_normal.png"
				width="1" height="1" />

		</div>
 -->


		</form>
	</div>
	</div>
</body>
</html>