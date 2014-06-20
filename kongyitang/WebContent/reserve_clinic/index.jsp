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
.ui-content
{
	padding:0px;
}

.Reservation
{
	margin:20px;
	border: 1px solid #744501;
	background: #fff;
}
#reservation_specific_location_name
{
	height: 50px;
	line-height: 50px;
	font-size: 19px;
	padding:0 10px;
	color:#d8a14f;
}
.Reservation #u8_rtf
{
	border-top: 1px solid #744501;
	height: 50px;
	line-height: 50px;
	font-size: 17px;
	
	
}
.Reservation #u8_rtf div
{
	padding:0 10px;
}
.tab
{
	
	height: 40px;
	
	line-height: 40px;
	font-size: 17px;
	margin:20px auto;	
}

.DoctorsList
{
	margin:5px auto	;
	border: 1px dotted #744501;
	border-bottom:0px;
	width:98%;
}

.ui-checkbox input, .ui-radio input {
    position: absolute;
    left: 20px;
    top: 50%;
    width: 10px;
    height: 10px;
    margin: -5px 0 0 0;
    outline: 0!important;
    z-index: 1;
}
.ui-btn-corner-all
{
	-webkit-border-radius:0px;
}
.ui-fullsize .ui-btn-inner, .ui-fullsize .ui-btn-inner
{
	padding-left:0px;
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
					<td width="23%" >
						<div id="backButton">
							<a id="return_link" onclick="window.location.href='../main/index.jsp'" ></a>
						</div>
					</td>
					<td align="center" width="54%"><a style="color: white;">预约孔医堂</a></td>
					<td width="23%">&nbsp;&nbsp;</td>
				</tr>
			</table>
		</div>
		<div data-role="content">
	



				<!-- 预约的地点 -->
				<input id="site" name="site" type="hidden">
				<input id="site_id" name="site_id" type="hidden">
				<!-- 预约的科室 -->
				<input id="department" name="department" type="hidden">
				<!-- 预约的医生id -->
				<input id="doctorid" name="doctorid" type="hidden">
				<!-- 预约的门诊id(2014-05-01 星期四 上午 中医门诊) -->
				<input id="outpatientid" name="outpatientid" type="hidden">
				<!-- 预约的门诊的目的 -->
				<input id="purpose" name="purpose" type="hidden">

				<!-- 预约孔医堂首页 -->
				<div id="kongyitang_reservation_index" style="display:">

					<table width="100%"  cellspacing="0"
						cellpadding="0" class="Introtable">

						<tr>
							<td align="center"><span class="title">孔医堂</span></td>

						</tr>
						<tr>
							<td>
							<div style="margin-bottom: 20px">
								<p>依托孔伯华名家研究室，汇聚北京名老中医、京城四大名医的后代和传人。</p>
								<p>下设三家传统中医诊疗机构（望京馆、展览路馆、五棵松馆），涵盖中医内、外、妇、儿、皮肤等科室。</p>
							</div>
							</td>

						</tr>
					</table>
					<!-- </br> -->

					<!-- <div class="table-site"> -->
					<table bgColor="#FFFFFF" border="0" cellspacing="0" cellpadding="0"
						width="100%" class="listTable">
						
						<%
						ReserveClinicDao reserver_clinic_site_dao = new ReserveClinicDao();
						reserver_clinic_site_dao.retrive_site();
						String site_name = new String();
						for (int i = 0; i < reserver_clinic_site_dao.site_id.size(); i++){
							site_name = reserver_clinic_site_dao.site_name.get(i);
							 site_name = java.net.URLEncoder.encode(site_name,"UTF-8");
							 site_name = java.net.URLEncoder.encode(site_name,"UTF-8");
						
						%>
						<tr>
							<td class="xuetang_button"><strong><%=reserver_clinic_site_dao.site_name.get(i) %></strong></td>
							<td align="right">
								<div align="center" class="ASKSubmit" style="width:100px"

									onclick="window.location.href='reserve_clinic_department_doctor.jsp?site_id=<%=reserver_clinic_site_dao.site_id.get(i) %>&site_name=<%=site_name%>'">

									预&nbsp;&nbsp;约
								</div>
							</td>
						
						<%} %>
				


					</table>
			


												<tr>
												<td style="padding:5px;width:50px" rowspan="2"><img src="<%=D_IMAGES %><%=doctor_dao.doctor_portrait[i] %>" 
													width="40" height="60" alt="<%=doctor_dao.doctor_id[j] %>" /></td>		
													<td valign="bottom" ><span style="text-align: left;font-size: 15px;font-weight: 700"><%=doctor_dao.name[j] %></span><img src="../resources/css/images/reserver_clinic/V.gif" 
													width="15" height="15" /></td>
													<td valign="bottom" align="center"  width="50%"><div align="center" class="ASKSubmit_blue" style="height: 25px; line-height: 25px;width:60px;margin:5px"><%=deparment_dao.department[i] %></div></td>													
													
												</tr>
												<tr>



				</div>



				<!-- 出诊表 -->
				<div class="outpatient_table" id="o1" style="display: none;text-align:center;margin:20px;">
					<img src="../images/CG/o13.jpg" width="100%"/>
					<br/>
					<img src="../images/CG/o11.jpg" width="100%"/>
					<br/>
					<img src="../images/CG/o12.jpg" width="100%"/>
				</div>
				<div class="outpatient_table" id="o2" style="display: none;text-align:center;margin:20px;">
					<img src="../images/CG/o23.jpg" width="100%"/>
					<br/>
					<img src="../images/CG/o21.jpg" width="100%"/>
					<br/>
					<img src="../images/CG/o22.jpg" width="100%"/>
				</div>
				<div class="outpatient_table" id="o3" style="display: none;text-align:center;margin:20px;">
					医馆功能筹备中，敬请期待！
					<img src="../images/CG/o31.jpg" width="100%"/>
					<br/>
					<img src="../images/CG/o32.jpg" width="100%"/>
				</div>
				<div class="outpatient_table" id="o4" style="display: none;text-align:center;margin:20px;">
					<img src="../images/CG/o43.jpg" width="100%"/>
					<br/>
					<img src="../images/CG/o41.jpg" width="100%"/>
					<br/>
					<img src="../images/CG/o42.jpg" width="100%"/>
				</div>
				<div id="outpatient_table" style="display: none;background: #fff;margin:20px;">

					<table border="1" cellspacing="0" cellpadding="0"
						width="100%" id="reserve_table_td">
						<tr>
							<td width="25%">星期</td>
							<td width="25%">上</td>
							<td width="25%">下</td>
							<td width="25%">晚</td>
						</tr>
						<%
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
						%>

						<%=tr %>
						
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
				<!-- 具体预约某个医生 -->
				<div id="reservation_specific_doctor" style="display: none;width:90%;margin:10px auto;">
					<!-- <table width="100%" cellpadding="0" cellspacing="0">
						<tr bgColor="#000000">
							<td align="left" width="20%"><button type="button"
									onclick="display_return_page('reservation_specific_doctor', 'reservation_specific_location');"></button></td>
							<td align="center" style="color: white;">预约</td>

						</tr>


					</table> -->
					<div id="department_specific" style="display:;margin:10px;">
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
						<%
					ReserveClinicDao outpatient_dao = new ReserveClinicDao();
						outpatient_dao.retrive_outpatient();
					for(int i=0;i<outpatient_dao.outpatient_id.size();i++){
				


					<div data-role="footer" data-id="myfooter" data-position="fixed">
					</div>
				</div>




		</div>
</body>
</html>
