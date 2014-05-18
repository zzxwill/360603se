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
.table-site table {
	border-right: 1px solid #000000;
	border-bottom: 1px solid #000000;
	border-left: 1px solid #000000
}

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
<link rel="stylesheet" href="../css/ask.css" />
<link rel="stylesheet" href="../css/reservation_xuetang.css" />
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
	 
	 $("#submit_adjust_link").click(function() {
		 set_reservation_patient_sickinfo_value();
		    if ($("#verifyForm").valid()) {
		        $("#verifyForm").submit();
		    }
		});
	 
	
	});
</script>



</head>

<body>
	<div data-role="page">
		<div data-role="header">
			<table width="100%">
				<tr>
					<td width="33%" align="center">
						<div id="backButton" style="width: 60px;">
							<a id="return_link" onclick="location.href='../index.jsp';">返回</a>
						</div>
					</td>
					<td align="center" width="34%"><a style="color: white;">预约孔医堂</a></td>
					<td width="33%">&nbsp;&nbsp;</td>
				</tr>
			</table>
		</div>
		<div data-role="content">
			<form name="verifyForm" id="verifyForm" method="post"
				action="submit_reserve_clinic.jsp">



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

						<!-- <tr bgColor="#000000">
							<td align="left" style="width: 20%"><button type="button">返回</button></td>
							<td align="center" style="color: white;">预约孔医堂</td>

						</tr> -->

						<tr>
							<td colspan="2" align="center"><span><strong>孔医堂</strong></span></td>

						</tr>
						<tr>
							<td colspan="2" align="center"><span>依托孔伯华名家研究室，汇聚北京名老中医、京城四大名医的后代和传人。</br>下设三家传统中医诊疗机构（望京馆、展览路馆、五棵松馆），涵盖中医内、外、妇、儿、皮肤等科室。
							</span></td>

						</tr>
					</table>
					<!-- </br> -->

					<!-- <div class="table-site"> -->
					<table bgColor="#FFFFFF" border="0" cellspacing="0" cellpadding="0"
						width="100%">

						<tr>
							<td colspan="2"><hr color="<%=sysColor%>"></td>
						</tr>


						<tr>
							<td id="xuetang_button"><strong>望京馆</strong></td>
							<td>
								<div align="center" id="ASKSubmit"
									onclick="set_kongyitang_reservation_index_value('望京馆');show_hidden('kongyitang_reservation_index');show_hidden('reservation_specific_location');">
									<big>预&nbsp;&nbsp;约</big>
								</div>
							</td>
						</tr>

						<tr>
							<td colspan="2"><hr color="<%=sysColor%>"></td>
						</tr>


						<tr>
							<td id="xuetang_button"><strong>五棵松馆</strong></td>
							<td>
								<div align="center" id="ASKSubmit"
									onclick="set_kongyitang_reservation_index_value('望京馆');show_hidden('kongyitang_reservation_index');show_hidden('reservation_specific_location');">
									<big>预&nbsp;&nbsp;约</big>
								</div>
							</td>
						</tr>

						<tr>
							<td colspan="2"><hr color="<%=sysColor%>"></td>
						</tr>


						<tr>
							<td id="xuetang_button"><strong>展览路馆</strong></td>
							<td>
								<div align="center" id="ASKSubmit"
									onclick="set_kongyitang_reservation_index_value('展览路馆');show_hidden('kongyitang_reservation_index');show_hidden('reservation_specific_location');">
									<big>预&nbsp;&nbsp;约</big>
								</div>
							</td>
						</tr>

						<tr>
							<td colspan="2"><hr color="<%=sysColor%>"></td>
						</tr>


						<tr>
							<td id="xuetang_button"><strong>三里屯SOHO馆</strong></td>
							<td>
								<div align="center" id="ASKSubmit"
									onclick="set_kongyitang_reservation_index_value('三里屯SOHO馆');show_hidden('kongyitang_reservation_index');show_hidden('reservation_specific_location');">
									<big>预&nbsp;&nbsp;约</big>
								</div>
							</td>
						</tr>

						<tr>
							<td colspan="2"><hr color="<%=sysColor%>"></td>
						</tr>

					</table>
					<!-- </div> -->



				</div>


				<!-- 具体预约某个医馆 -->
				<div id="reservation_specific_location" style="display: none;">
					<!-- <table width="100%" cellspacing="0" cellpadding="0">

						<tr bgColor="#000000">
							<td align="left" style="width: 20%"><button type="button"
									onclick="display_return_page('reservation_specific_location', 'kongyitang_reservation_index');">返回</button></td>
							<td align="center" colspan="2" style="color: white;">预约孔医堂</td>

						</tr>
					</table> -->
					<table width="100%">
						<tr>
							<td width="20%"></td>
							<td align="center"><span><strong>望京馆</strong></span></td>

							<td width="20%">
								<div align="center" id="ASKSubmit"
									style="height: 20px; line-height: 20px;"
									onclick="display_hidden_outpatient_table();">出诊表</div>
							</td>

							<!-- <td width="20%" align="right"><a style="width: 70px; height: 28px" href=""
								>出诊表</a></td> -->

						</tr>
						<tr>
							<td colspan="3"><hr color="<%=sysColor%>"></td>
						</tr>


					</table>
					<div id="outpatient_reserve">
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
						<div id="outpatient_reserve">
							<div id="u8_rtf">
								<p style="text-align: center;">
									<big><%=deparment_dao.department[i] %></big> <a
										onclick="show_hidden('<%=deparment_dao.department[i] %>');"><img
										src="../resources/css/images/reserver_clinic/u17_normal.png"
										width="16" height="15" alt="" /></a>
								</p>
							</div>
						</div>
						<div>
							<hr color="<%=sysColor%>">
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
											width="60" height="80" alt="<%=doctor_dao.doctor_id[j] %>" /></td>
										<td id="<%=doctor_dao.doctor_id[j] %>">
											<table width="80%">

												<tr>

													<td width="30%"><span style="text-align: left;"><%=doctor_dao.name[j] %></span></td>
													<td width="30%"><span style="text-align: right"><%=doctor_dao.title[j] %></span></td>
													<td width="20%" align="center"><span
														style="font-weight: bold; font-style: normal; text-decoration: none; color: #1DDA2C;">V</span></td>
												</tr>
												<tr>

													<td><%=deparment_dao.department[i] %></td>
													<td>&nbsp;</td>
													<td>
														<div align="center" id="ASKSubmit"
															class="<%=deparment_dao.department[i] %>_<%=doctor_dao.doctor_id[j] %>"
															onclick="show_hidden('reservation_specific_doctor');show_hidden('reservation_specific_location');set_reservation_specific_location_value('<%=deparment_dao.department[i]%>','<%=doctor_dao.doctor_id[j]%>');">
															<big>预&nbsp;&nbsp;约</big>
														</div>


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




				</div>


				<!-- 出诊表 -->
				<div id="outpatient_table" style="display: none;">

					<table border="1" cellspacing="0" cellpadding="0"
						bordercolorlight="#000000" bordercolordark="#FFFFFF" width="100%">
						<tr>
							<td width="2%"></td>
							<td width="12%">一</td>
							<td width="12%">二</td>
							<td width="12%">三</td>
							<td width="12%">四</td>
							<td width="12%">五</td>
							<td width="12%">六</td>
							<td width="12%">日</td>

						</tr>
						<tr>
							<td>上</td>
							<td></td>
							<td></td>
							<td>肖强<br />徐晓凝
							</td>
							<td></td>
							<td>叶宜颖</td>
							<td></td>
							<td></td>

						</tr>
						<tr>
							<td>下</td>
							<td></td>
							<td></td>
							<td>肖强<br />徐晓凝
							</td>
							<td></td>
							<td>叶宜颖</td>
							<td></td>
							<td></td>

						</tr>

						<tr>
							<td>晚</td>
							<td></td>
							<td></td>
							<td>肖强<br />徐晓凝
							</td>
							<td></td>
							<td>叶宜颖</td>
							<td></td>
							<td></td>

						</tr>
					</table>

				</div>
				<!-- 具体预约某个医生 -->
				<div id="reservation_specific_doctor" style="display: none;">
					<!-- <table width="100%" cellpadding="0" cellspacing="0">
						<tr bgColor="#000000">
							<td align="left" width="20%"><button type="button"
									onclick="display_return_page('reservation_specific_doctor', 'reservation_specific_location');">返回</button></td>
							<td align="center" style="color: white;">预约</td>

						</tr>


					</table> -->
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
					</div>
					<div id="reserver_table" style="display:none;">
						<table width="100%">

							<tr>
								<td align="center"><p>可预约门诊时间</p></td>
							</tr>

							<tr>
								<td><hr color="<%=sysColor%>"></td>
							</tr>
						</table>

						<table width="100%">
							<tr>
								<td id="clinic_text">2014-06-01&nbsp;星期日&nbsp;上午&nbsp;普通门诊</td>
								<td>
									<div align="center" id="ASKSubmit_disabled"
										style="height: 20px; line-height: 20px;" onclick="">已停诊
									</div>

								</td>

							</tr>

							<tr>
								<td id="clinic_text">2014-06-01&nbsp;星期日&nbsp;上午&nbsp;普通门诊</td>
								<td>
									<div align="center" id="ASKSubmit_disabled"
										style="height: 20px; line-height: 20px;" onclick="">已停诊
									</div>
								</td>

							</tr>


							<tr>
								<td id="clinic_text">2014-06-01&nbsp;星期日&nbsp;上午&nbsp;普通门诊</td>
								<td>
									<div align="center" id="ASKSubmit_disabled"
										style="height: 20px; line-height: 20px;" onclick="">已停诊
									</div>
								</td>
							</tr>


							<tr>
								<td id="clinic_text">2014-06-01&nbsp;星期日&nbsp;上午&nbsp;普通门诊</td>
								<td>
									<div align="center" id="ASKSubmit_disabled"
										style="height: 20px; line-height: 20px;" onclick="">
										已停诊<br />
									</div>
								</td>
							</tr>



							<tr>
								<td id="clinic_text">2014-06-02&nbsp;星期一&nbsp;上午&nbsp;普通门诊</td>
								<td>
									<div align="center" id="ASKSubmit"
										style="height: 20px; line-height: 20px;"
										onclick="set_reservation_specific_doctor_value('100001');show_hidden('reservation_specific_doctor');show_hidden('reservation_patient_sickinfo');">申请预约
									</div>
								</td>

								<!-- <td><input type="button" value="申请预约"
									onclick="set_reservation_specific_doctor_value('100001');show_hidden('reservation_specific_doctor');show_hidden('reservation_patient_sickinfo');"></td>
							 -->
							</tr>

						</table>
					</div>





				</div>

				<!-- 患者病情资料 -->
				<div id="reservation_patient_sickinfo" style="display: none;">
					<!-- <table width="100%" cellspacing="0" cellpadding="0">
						<tr bgColor="#000000">
							<td align="left" style="width: 20%"><button type="button"
									onclick="display_return_page('reservation_patient_sickinfo', 'reservation_specific_doctor');">返回</button></td>
							<td align="center" style="color: white;">预约</td>

						</tr>


					</table> -->
					<!-- <div id="zhongyineike" style="display:;">
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
						</table> -->

						
					</div>
					
					
					<div id="reserve_clinic_illness" style="display: none;">

							<table>


								<tr>
									<td id="xuetang_td"><div id="ASKInput" align="center">所患疾病</div></td>

									<td colspan="3"><INPUT name="illness_name" width="80%"></td>
								</tr>
								<tr>
									<td id="xuetang_td"><div id="ASKInput" align="center">预约目的</div></td>
									<td><label><input type="checkbox"
											name="purpose_chk" value="诊断" />诊断</label></td>
									<td><label><input type="checkbox"
											name="purpose_chk" value="治疗" />治疗</label></td>
									<td><label> <input type="checkbox"
											name="purpose_chk" value="复诊" />复诊
									</label></td>
								</tr>
								<tr>
									<td colspan="4"><p>
										<div id="ASKInput" align="left">病情描述及相关检查结果</div>
										</p>
										<p>
											<textarea name="detail" rows="3" cols="30"></textarea>
										</p></td>
								</tr>
								<tr>

									<td id="xuetang_td"><div id="ASKInput" align="center">手机号</div></td>
									<td colspan="3"><INPUT name="mobile" value="" width="80%"></td>
								</tr>
								<tr>

									<td id="xuetang_td"><div id="ASKInput" align="center">姓&nbsp;&nbsp;&nbsp;&nbsp;名</div></td>
									<td colspan="3"><INPUT name="name" value="" width="80%"></td>
								</tr>
							</table>

						



							<br />
							<!-- <INPUT id="u38" type="submit" value="预约"
								> -->
							<!-- <div align="center" id="ASKSubmit" >
							<a id="submit_adjust_link" style="color: white;" onclick="set_reservation_patient_sickinfo_value();"><big>预约</big></a>
						</div> -->
							<div align="center" id="ASKSubmit">
								<a id="submit_adjust_link" style="color: white;"><big>预约</big></a>
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