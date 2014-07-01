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
<%@ include file="../check/index.jsp"%>

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
img {
max-width: 100%;
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

.ui-content {
	padding: 0px;
}

.Reservation {
	margin: 20px;
	border: 1px solid #744501;
	background: #fff;
}

#reservation_specific_location_name {
	height: 50px;
	line-height: 50px;
	font-size: 19px;
	padding: 0 10px;
	color: #d8a14f;
}

.Reservation #u8_rtf {
	border-top: 1px solid #744501;
	height: 50px;
	line-height: 50px;
	font-size: 17px;
}

.Reservation #u8_rtf div {
	padding: 0 10px;
}

.tab {
	height: 40px;
	line-height: 40px;
	font-size: 17px;
	margin: 20px auto;
}

.DoctorsList {
	margin: 5px auto;
	border: 1px dotted #744501;
	border-bottom: 0px;
	width: 98%;
}

.ui-checkbox input,.ui-radio input {
	position: absolute;
	left: 20px;
	top: 50%;
	width: 10px;
	height: 10px;
	margin: -5px 0 0 0;
	outline: 0 !important;
	z-index: 1;
}

.ui-btn-corner-all {
	-webkit-border-radius: 0px;
}

.ui-fullsize .ui-btn-inner,.ui-fullsize .ui-btn-inner {
	padding-left: 0px;
	font-size: 10px;
	padding: 10px 0px;
}
</style>

<script type="text/javascript">

$().ready(function() {
	
	function UpDown(vid)
	{
		if($(vid).css("border-bottom-width")=="0px")
		{
			$(vid).css("background","#feedd3");
			$(vid).children("img")[0].src="../resources/css/images/reserver_clinic/left.gif";
			$(vid).css("border-bottom","1px solid #d8a14f");
		}
		else
		{
			$(vid).css("background","#fff");
			$(vid).children("img")[0].src="../resources/css/images/reserver_clinic/right.gif";
			$(vid).css("border-bottom","0px");
		}
			
	}
</script>



</head>

<body>
	<div data-role="page">
		<div data-role="header">
			<table width="100%">
				<tr>
					<td width="23%">
						<div id="backButton">
							<a id="return_link"
								onclick="window.location.href='index.jsp'"></a>
						</div>
					</td>
					<td align="center" width="54%"><a style="color: white;">预约孔医堂</a></td>
					<td width="23%">&nbsp;&nbsp;</td>
				</tr>
			</table>
		</div>
		<div data-role="content">



			<!-- 预约的地点 -->
			<input id="site" name="site" type="hidden"> <input
				id="site_id" name="site_id" type="hidden">
			<!-- 预约的科室 -->
			<input id="department" name="department" type="hidden">
			<!-- 预约的医生id -->
			<input id="doctorid" name="doctorid" type="hidden">
			<!-- 预约的门诊id(2014-05-01 星期四 上午 中医门诊) -->
			<input id="outpatientid" name="outpatientid" type="hidden">
			<!-- 预约的门诊的目的 -->
			<input id="purpose" name="purpose" type="hidden">


			<!-- 具体预约某个医馆 -->
			<div id="reservation_specific_location" style="display:;">
				<!-- <table width="100%" cellspacing="0" cellpadding="0">

						<tr bgColor="#000000">
							<td align="left" style="width: 20%"><button type="button"
									onclick="display_return_page('reservation_specific_location', 'kongyitang_reservation_index');"></button></td>
							<td align="center" colspan="2" style="color: white;">预约孔医堂</td>

						</tr>
					</table> -->
				<table width="60%" class="tab">
					<tr>
						<td width="50%" align="center">
							<div id="tab_yu" class="mainListLeftButton"
								onclick="display_hidden_outpatient_ltable();">预约</div>

						</td>
						<td width="50%" align="center">
							<div id="tab_cz" class="mainListRightButton"
								onclick="display_hidden_outpatient_rtable();"
								style="background: #fff; color: #744501;">出诊表</div>
						</td>
					</tr>

				</table>
				<div id="outpatient_reserve" class="Reservation">

					
					<%
					
					request.setCharacterEncoding("utf-8");
					String site_name = request.getParameter("site_name");
					site_name = java.net.URLDecoder.decode(site_name,"UTF-8");
					site_name = java.net.URLDecoder.decode(site_name,"UTF-8");
					String site_temp = site_name;
					site_name = java.net.URLEncoder.encode(site_name,"UTF-8");
					site_name = java.net.URLEncoder.encode(site_name,"UTF-8");
					 
					String siteid = request.getParameter("site_id");
					 
					if(siteid == null || site_name ==null){
							%>
							
					<center>
						<div style="color: red">
							<big>禁止访问！ <br>正在预约前界面，请稍后...
							</big>
						</div>
					</center>
					<script language='javascript' type='text/javascript'>
										setTimeout(" window.location = 'index.jsp' ",1000);
									</script>
					<%	 
							 }else{
					 %>
					 <inupt type="hidden" value="<%=site_temp %>" id="site"/>
					 <div id="reservation_specific_location_name"><%=site_temp %></div>
					 <% 
								long  site_id = Long.parseLong(siteid);
								
								
								//HashMap hm = new HashMap();
								//hm.put("site_id", site_id);
								 
		
					
					
					ReserveClinicDao deparment_dao = new ReserveClinicDao();
					deparment_dao.retrive_deparment();
					for(int i=0;i<deparment_dao.department_num;i++){
				
					
					%>
					<div id="outpatient_reserve">
						<div id="u8_rtf">

							<div style="text-align: left;"
								onclick="show_hidden('<%=deparment_dao.department[i] %>');UpDown(this)">
								<%=deparment_dao.department[i] %>
								<img style="float: right; margin-top: 17px"
									src="../resources/css/images/reserver_clinic/right.gif"
									width="16" height="15" alt="" />
								<!-- <span style="float:right; font-size:14px;color:#d8a14f">共2人</span> -->
							</div>
						</div>  
					</div>

					<div id="<%=deparment_dao.department[i] %>" style="display: none;">
						<div>
							<table border="0" class="DoctorsList">
								<% 
								ReserveClinicDao doctor_dao = new ReserveClinicDao();
								doctor_dao.retrive_doctors_by_deparment(deparment_dao.department_id[i],site_id);
								String deparment = new String();
								for(int j=0;j<doctor_dao.doctor_num;j++){
									deparment = deparment_dao.department[i];
									deparment = java.net.URLEncoder.encode(deparment,"UTF-8");
									deparment = java.net.URLEncoder.encode(deparment,"UTF-8");
								
								%>
								<tr style="border-bottom: 1px dotted #d8a14f;">

									<td id="<%=doctor_dao.doctor_id[j] %>" width="50%">
										<table width="100%" style="font-size: 13px;">

											<tr>
												<%-- <td style="padding: 5px; width: 50px" rowspan="2"><img
													src="../resources/images/upload/doctor_male.jpg" width="40"
													height="60" alt="<%=doctor_dao.doctor_id[j] %>" /></td> --%>
													<td style="padding: 5px; width: 50px" rowspan="2">
													
													<%-- <%=D_IMAGES %><%=doctor_dao.doctor_portrait[j] %> --%>
													<% String url = doctor_dao.doctor_portrait[j];
														if(url==null || url == ""){
															url = "../resources/images/upload/doctor_male.jpg" ;
														}else{
															url = D_IMAGES + url;
														}
													%>
													
													<img
													src="<%=url %>" width="40"
													height="60" alt="<%=doctor_dao.doctor_id[j] %>" /></td>
												<td valign="bottom"><span
													style="text-align: left; font-size: 15px; font-weight: 700"><%=doctor_dao.name[j] %></span><img
													src="../resources/css/images/reserver_clinic/V.gif"
													width="15" height="15" /></td>
												<td valign="bottom" align="center" width="50%"><div
														align="center" class="ASKSubmit_blue"
														style="height: 25px; line-height: 25px; width: 60px; margin: 5px"><%=deparment_dao.department[i] %></div></td>

											</tr>
											<tr>

												<td><span><%=doctor_dao.title[j] %></span></td>
											<%-- 	<td width="10%" align="center">剩余:<%=doctor_dao.doctor_available_amount[i] %></td> --%>
											
												

											</tr>

										</table>
									</td>
									
									
									<td id="<%=doctor_dao.doctor_id[j] %>" width="50%">
										<table width="100%" style="font-size: 13px;">

											
											<tr>

										
<%-- 												<td width="20%" align="center">挂号费:<%=doctor_dao.visit_fee[i] %></td> --%>
												<td width="80%" align="center">简介:
												<%if(null == doctor_dao.introduction[i] ){ %>
													暂无
												<%} else{%>
												<%=doctor_dao.introduction[i] %>
												<%} %>
												
												</td>
												
												

											</tr>

										</table>
									</td>
									
									
									<!-- 传参site_id是为了用于从后一个页面reserve_clinic_specific_doctor.jsp返回时，本页面可以获取到site_id，这样不会出错    Will Zhou   6/29/2014 -->
									<td width="60px">
										<div align="right" class="ASKSubmit"
											style="height: 30px; line-height: 30px; width: 60px; margin: 0px"
											class="<%=deparment_dao.department[i] %>_<%=doctor_dao.doctor_id[j] %>"
											onclick="window.location.href='reserve_clinic_specific_doctor.jsp?site_name=<%=site_name%>&department=<%=deparment %>&doctor_id=<%=doctor_dao.doctor_id[j] %>&site_id=<%=siteid %>'">
											<big>预&nbsp;&nbsp;约</big>
										</div>
									</td>

								</tr>
								<%
								}
								%>


							</table>
						</div>
					</div>
					<%
					}}
				
					
					%>


				</div>




			</div>


			<!-- 出诊表 -->
			<div class="outpatient_table" id="o1"
				style="display: none;  margin: 20px;">
				<img src="../images/CG/o13.jpg" width="100%" /> <br /> <img
					src="../images/CG/o11.jpg" width="100%" /> <br /> <img
					src="../images/CG/o12.jpg" width="100%" />
			</div>
			<div class="outpatient_table" id="o2"
				style="display: none;  margin: 20px;">
				<img src="../images/CG/o23.jpg" width="100%" /> <br /> <img
					src="../images/CG/o21.jpg" width="100%" /> <br /> <img
					src="../images/CG/o22.jpg" width="100%" />
			</div>
			<div class="outpatient_table" id="o3"
				style="display: none;margin: 20px;">
				医馆功能筹备中，敬请期待！ <img src="../images/CG/o31.JPG" width="100%" /> <br />
				<img src="../images/CG/o32.JPG" width="100%" />
			</div>
			<div class="outpatient_table" id="o4"
				style="display: none;  margin: 20px;">
				<img src="../images/CG/o43.jpg" width="100%" /> <br /> <img
					src="../images/CG/o41.jpg" width="100%" /> <br /> <img
					src="../images/CG/o42.jpg" width="100%" />
			</div>
			<div id="outpatient_table"
				style="display: none;  margin: 20px;">

				<table border="1" cellspacing="0" cellpadding="0" width="100%"
					id="reserve_table_td">
					<tr>
						<td width="25%">星期</td>
						<td width="25%">上</td>
						<td width="25%">下</td>
						<td width="25%">晚</td>
					</tr>
					<%--
							ReserveClinicDao outpatient_table_dao = new ReserveClinicDao();
							HashMap hm4outpatienttable = new HashMap();
							hm4outpatienttable.put("type", "门诊");
							outpatient_table_dao.retrive_outpatient_doctor(hm4outpatienttable);
							String tr = new String();
							/* 	String tr2 = new String();
								String tr3 = new String();
								String tr4 = new String();
								String tr5 = new String();
								String tr6 = new String();
								String tr7 = new String(); */

								String td1 = new String();
								String td2 = new String();
								String td3 = new String();
							
							

							String days[] = { "一", "二", "三", "四", "五", "六", "日" };

							for (int j = 0; j < days.length; j++) {
								tr += "<tr><td>"+ days[j] +"</td>";
								td1 = "<td>";
								td2 = "<td>";
								td3 = "<td>";
								for (int t = 0; t < outpatient_table_dao.clinic_doctor_name
										.size(); t++) {
									if (outpatient_table_dao.day.get(t).endsWith(days[j])) {

										//tr += "<tr><td>"+ days[j] +"</td>";
										if (outpatient_table_dao.ampm.get(t).equals("上午")) {
											td1 += outpatient_table_dao.clinic_doctor_name
													.get(t) + "</br>";
										} else if (outpatient_table_dao.ampm.get(t)
												.equals("下午")) {
											td2 += outpatient_table_dao.clinic_doctor_name
													.get(t) + "</br>";
										} else if (outpatient_table_dao.ampm.get(t)
												.equals("晚上")) {
											td3 += outpatient_table_dao.clinic_doctor_name
													.get(t) + "</br>";
										}

									}
								}

								td1 += "</td>";
								td2 += "</td>";
								td3 += "</td>";

								tr += td1 + td2 + td3 + "</tr>";
							}
						--%>

					<%--tr --%>

					<!-- <tr>
							<td>二</td>
							<td>肖强<br />徐晓凝</td>
							<td>肖强<br />徐晓凝</td>
							<td></td>
						</tr>
						<tr>
							<td>三</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>四</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>五</td>
							<td>肖强<br />徐晓凝</td>
							<td>肖强<br />徐晓凝</td>
							<td></td>
						</tr>
						<tr>
							<td>六</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>日</td>
							<td></td>
							<td></td>
							<td></td>
						</tr> -->
				</table>

			</div>




			<div data-role="footer" data-id="myfooter" data-position="fixed">
			</div>
		</div>


	</div>

</body>
</html>
