<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*"
	pageEncoding="UTF-8"%>

<%@ include file="../include/package.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><%=sysName%></title>

<%@ include file="../include/meta.jsp"%>
<%//\\@ include file="../include/cssJS.jsp"%>
<%@ include file="../include/SpecificssJS.jsp"%>

<style type="text/css">
.table-site table {
	border-right: 1px solid #000000;
	border-bottom: 1px solid #000000;
	border-left: 1px solid #000000
}

.table-site table td {
	border-top: 1px solid #000000
}
</style>


<link rel="stylesheet" href="../css/screen.css" />
<style type="text/css">
#verifyForm label.error {
	margin-left: 10px;
	width: auto;
	display: inline;
}
</style>

<script type="text/javascript">

$().ready(function() {
	 $("#verifyForm").validate({
			rules: {
				
				name: {
					required: true,
					maxlength: 10
				},
			
			
				mobile: {
					required: true,
					number:true,
					minlength: 11,
					maxlength: 11
					
				},
				illness_name: {
					required: true,
					maxlength: 100
				},
				detail: {
					required: true,
					maxlength: 200
				},
				purpose_chk: {
					required: true
				}
			},
			messages: {
				
				name: {
					required: "必填！",
					maxlength: "长度不能超过10个字符！"
				} ,
				
				
				mobile: {
					required: "必填！",
					number:"请填写数字!",
					minlength: "手机号码为11位!",
					maxlength: "手机号码为11位!"
					
				},
				illness_name: {
					required: "必填！",
					maxlength: "长度不能超过100个字符！"
				} ,
				detail: {
					required: "必填！",
					maxlength: "长度不能超过200个字符！"
				} ,
				purpose_chk:{
					required: "必选！"
				} 
			}
		});
	 
	
	});
</script>



</head>

<body>
	<div data-role="page">
		<div data-role="header">
			<!-- 
			<table width="100%">
				<tr>
					<td width="33%"><a style="width: 70px; height: 28px"
						onclick="javascript:history.back(-1)" data-theme="c"
						data-role="button" data-mini="true" data-icon="back"
						data-iconpos="left">返回</a></td>
					<td align="center" width="34%"><a style="color: white;">预约孔医堂</a></td>
					<td width="33%">&nbsp;&nbsp;</td>
				</tr>
			</table>
			-->
		</div>
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
				<!-- 预约的门诊的目的 -->
				<input id="purpose" name="purpose" type="hidden">







				<!-- 预约孔医堂首页 -->
				<div id="kongyitang_reservation_index" style="display:">

					<table width="100%" bgColor="#FFFFFF" cellspacing="0"
						cellpadding="0">

						<tr bgColor="#000000">
							<td align="left" style="width: 20%"><button type="button">返回</button></td>
							<td align="center" style="color: white;">预约孔医堂</td>

						</tr>

						<tr>
							<td colspan="2" align="center"><span><strong>孔医堂</strong></span></td>

						</tr>
						<tr>
							<td colspan="2" align="center"><span>依托孔伯华名家研究室，汇聚北京名老中医、京城四大名医的后代和传人。</br>下设三家传统中医诊疗机构（望京馆、展览路馆、五棵松馆），涵盖中医内、外、妇、儿、皮肤等科室。
							</span></td>

						</tr>
					</table>
					</br>

					<div class="table-site">
						<table bgColor="#FFFFFF" border="0" cellspacing="0"
							cellpadding="0">
							<tr>
								<td style="width: 80%;" align="center">望京馆</td>
								<td><button type="button"
										onclick="set_kongyitang_reservation_index_value('望京馆');show_hidden('kongyitang_reservation_index');show_hidden('reservation_specific_location');">预约</button></td>
							</tr>
							<tr>
								<td style="width: 80%;" align="center">五棵松馆</td>
								<td><button type="button"
										onclick="set_kongyitang_reservation_index_value('望京馆');show_hidden('kongyitang_reservation_index');show_hidden('reservation_specific_location');">预约</button></td>
							</tr>
							<tr>
								<td style="width: 80%;" align="center">展览路馆</td>
								<td><button type="button"
										onclick="set_kongyitang_reservation_index_value('展览路馆');show_hidden('kongyitang_reservation_index');show_hidden('reservation_specific_location');">预约</button></td>
							</tr>
							<tr>
								<td style="width: 80%;" align="center">三里屯SOHO馆</td>
								<td><button type="button"
										onclick="set_kongyitang_reservation_index_value('三里屯SOHO馆');show_hidden('kongyitang_reservation_index');show_hidden('reservation_specific_location');">预约</button></td>
							</tr>

						</table>
					</div>



				</div>


				<!-- 具体预约某个医馆 -->
				<div id="reservation_specific_location" style="display: none;">
					<table width="100%" cellspacing="0" cellpadding="0">

						<tr bgColor="#000000">
							<td align="left" style="width: 20%"><button type="button"
									onclick="display_return_page('reservation_specific_location', 'kongyitang_reservation_index');">返回</button></td>
							<td align="center" colspan="2" style="color: white;">预约孔医堂</td>

						</tr>
					</table>
					<table>
						<tr>
							<td width="33%">&nbsp;&nbsp;</td>
							<td align="center"><span><strong>望京馆</strong></span></td>

							<td width="33%"><a style="width: 70px; height: 28px" href=""
								data-role="button" data-mini="true">出诊表</a></td>

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

					<%
					ReserveClinicDao deparment_dao = new ReserveClinicDao();
					deparment_dao.retrive_deparment();
					for(int i=0;i<deparment_dao.department_num;i++){
				
					
					%>
					<div id="u8">
						<div id="u8_rtf">
							<p style="text-align: center;">
								<%=deparment_dao.department[i] %>
								<a onclick="show_hidden('<%=deparment_dao.department[i] %>');"><img
									src="../resources/css/images/reserver_clinic/u17_normal.png"
									width="16" height="15" alt="" /></a>
							</p>
						</div>
					</div>

					<div id="<%=deparment_dao.department[i] %>" style="display: none;">
						<div>
							<table border="0" width="100%">
								<% 
								ReserveClinicDao doctor_dao = new ReserveClinicDao();
								doctor_dao.retrive_doctors_by_deparment(deparment_dao.department_id[i]);
								for(int j=0;j<doctor_dao.doctor_num;j++){
								%>
								<tr>
									<td><img src="../resources/images/upload/doctor_male.jpg"
										width="50" height="50" alt="<%=doctor_dao.doctor_id[j] %>" /></td>
									<td id="<%=doctor_dao.doctor_id[j] %>">
										<table width="80%" >

											<tr>

												<td><span style="text-align: left;"><%=doctor_dao.name[j] %></span></td>
												<td><span style="text-align: right"><%=doctor_dao.title[j] %></span></td>
												<td align="center"><span
													style="font-weight: bold; font-style: normal; text-decoration: none; color: #1DDA2C;">V</span></td>
											</tr>
											<tr>

												<td><%=deparment_dao.department[i] %></td>
												<td>&nbsp;</td>
												<td>
													<button id="u21" type="button"
														onclick="show_hidden('reservation_specific_doctor');show_hidden('reservation_specific_location');set_reservation_specific_location_value('<%=deparment_dao.department[i] %>','<%=doctor_dao.doctor_id[j] %>');">
														预约</button>
												</td>
											</tr>
										</table>
									</td>


								</tr>
								<%
								}
								%>

							
							</table>
						</div>
					</div>
					<%
					}
				
					
					%>

					

					



				</div>

				<!-- 具体预约某个医生 -->
				<div id="reservation_specific_doctor" style="display: none;">
					<table width="100%" cellpadding="0" cellspacing="0">
						<tr bgColor="#000000">
							<td align="left" width="20%"><button type="button"
									onclick="display_return_page('reservation_specific_doctor', 'reservation_specific_location');">返回</button></td>
							<td align="center" style="color: white;">预约</td>

						</tr>


					</table>
					<div id="department_specific" style="display:;">
							<!-- <table border="0" width="100%">
								<tr>
									<td><img src="../resources/images/upload/doctor_male.jpg"
										width="50" height="50" alt="" /></td>
									<td>
										<table width="80%">
											<tr>
												<td><span style="text-align: left;">田&nbsp; 野</span></td>
												<td><span style="text-align: right">主治医师</span></td>
												<td align="center"><span
													style="font-weight: bold; font-style: normal; text-decoration: none; color: #1DDA2C;">V</span></td>
											</tr>
											<tr>
												<td>中医内科</td>
												<td>&nbsp;</td>
												<td></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>			 -->			
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

				<!-- 患者病情资料 -->
				<div id="reservation_patient_sickinfo" style="display: none;">
					<table width="100%" cellspacing="0" cellpadding="0">
						<tr bgColor="#000000">
							<td align="left" style="width: 20%"><button type="button"
									onclick="display_return_page('reservation_patient_sickinfo', 'reservation_specific_doctor');">返回</button></td>
							<td align="center" style="color: white;">预约</td>

						</tr>


					</table>
					<div id="zhongyineike" style="display:;">
						<table border="0" width="100%">
							<tr>
								<td><img src="../resources/images/upload/doctor_male.jpg"
									width="50" height="50" alt="" /></td>
								<td>
									<table width="80%">
										<tr>

											<td><span style="text-align: left;">田&nbsp; 野</span></td>
											<td><span style="text-align: right">主治医师</span></td>
											<td align="center"><span
												style="font-weight: bold; font-style: normal; text-decoration: none; color: #1DDA2C;">V</span></td>
										</tr>
										<tr>

											<td>中医内科</td>
											<td>&nbsp;</td>
											<td></td>
										</tr>
									</table>
								</td>


							</tr>
						</table>

						<div>

							<table>
								<tr>
									<td>所患疾病</td>
									<td colspan="3"><INPUT name="illness_name" width="80%"></td>
								</tr>
								<tr>
									<td>预约目的</td>
									<td><label><input type="checkbox"
											name="purpose_chk" value="诊断" />诊断</label></td>
									<td><label><input type="checkbox"
											name="purpose_chk" value="治疗" />治疗</label></td>
									<td><label> <input type="checkbox"
											name="purpose_chk" value="复诊" />复诊
									</label></td>
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



							<br /> <INPUT id="u38" type="submit" value="预约"
								onclick="set_reservation_patient_sickinfo_value();">

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