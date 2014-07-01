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
		<%@ include file="../reserve_clinic/index_test_js.jsp"%>
			<table width="100%">
				<tr>
					<td width="23%" >
						<div id="backButton">
							<a id="return_link" onclick="window.location.href='../main/index.jsp'" ></a>
						</div>
					</td>
					<td align="center" width="54%">
						<div id="wait" onclick="GoTiming()"><a style="color: white;">预约孔医堂</a></div>
						<div id="normal" onclick="GoReservation()" style="display:none"><a style="color: white;">预约孔医堂</a></div>
					</td>
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
								<p>下设四家传统中医诊疗机构（望京馆、展览路馆、五棵松馆、三里屯馆），涵盖中医内、外、妇、儿、皮肤等科室。</p>
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
								<div align="center" class="ASKSubmit_no" style="width:100px">
								<%// TODO 正常预约撤销ASKSubmit，测试时请注销ASKSubmit_no %>
<!--									onclick="window.location.href='reserve_clinic_department_doctor.jsp?site_id=<%//=reserver_clinic_site_dao.site_id.get(i) %>&site_name=<%//=site_name%>'">-->
									预&nbsp;&nbsp;约 
							</div> 
							
							</td>
						
						<%} %>
				


					</table>
			



				</div>
				


					<div data-role="footer" data-id="myfooter" data-position="fixed">
					</div>
				</div>




		</div>
</body>
</html>
