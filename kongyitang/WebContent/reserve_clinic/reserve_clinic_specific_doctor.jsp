<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*,java.text.DateFormat,java.text.SimpleDateFormat,java.util.Date"
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
							<a id="return_link" onclick="window.location.href='reservation_clinic_patient_sickinfo.jsp'" ></a>
						</div>
					</td>
					<td align="center" width="54%"><a style="color: white;">预约孔医堂</a></td>
					<td width="23%">&nbsp;&nbsp;</td>
				</tr>
			</table>
		</div>
		<div data-role="content">
			<form name="verifyForm" id="verifyForm" method="post"
				action="submit_reserve_clinic.jsp">



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

				<!-- 具体预约某个医生 -->
				<div id="reservation_specific_doctor" style="display: ;width:90%;margin:10px auto;">
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
					<div id="reserver_table" style="display:;">
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
						request.setCharacterEncoding("utf-8");
						 //String site_name = new String(request.getParameter("site_name").getBytes("utf-8"),"utf-8");
						 String site_name = request.getParameter("site_name");
						 String department = request.getParameter("department");
						 department = java.net.URLDecoder.decode(department,"UTF-8");
						 department = java.net.URLDecoder.decode(department,"UTF-8");
						 //site_name = java.net.URLDecoder.decode(site_name,"UTF-8");
						 //site_name = java.net.URLDecoder.decode(site_name,"UTF-8");
						 System.out.println(site_name);
						 //site_name = java.net.URLEncoder.encode(site_name,"utf-8");
						 
						 String doctor_id_str = request.getParameter("doctor_id");
						 if(site_name == null || department ==null || doctor_id_str == null){
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
									 site_name = java.net.URLDecoder.decode(site_name,"UTF-8");
									 site_name = java.net.URLDecoder.decode(site_name,"UTF-8");
									 site_name = java.net.URLEncoder.encode(site_name,"UTF-8");
									 site_name = java.net.URLEncoder.encode(site_name,"UTF-8");
									 
									 
									 department = java.net.URLDecoder.decode(department,"UTF-8");
									 department = java.net.URLDecoder.decode(department,"UTF-8");
									 department = java.net.URLEncoder.encode(department,"UTF-8");
									 department = java.net.URLEncoder.encode(department,"UTF-8");
						
									 long  doctor_id = Long.parseLong(doctor_id_str);

									 Date currentTime = new Date();
										DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
										String date = dateFormat.format(currentTime);
										
						
					ReserveClinicDao outpatient_dao = new ReserveClinicDao();
						outpatient_dao.retrive_outpatient(doctor_id);
					for(int i=0;i<outpatient_dao.outpatient_id.size();i++){
				
					
					%>
							<tr style="height: 40px; line-height: 40px;">
								<td id="clinic_text"  style="font-size:13px;" align="left" ><%=outpatient_dao.outpatient_date.get(i) %>&nbsp;<!-- 星期X -->&nbsp;<%=outpatient_dao.time.get(i) %>&nbsp;<%=outpatient_dao.outpatient_type.get(i)%></td>
								<td>
									<% if (outpatient_dao.amount.get(i) <= 0){ %>
									<div align="center" class="ASKSubmit_no"
										style="height: 30px; line-height: 30px; font-size:15px;width:60px;margin:0px" onclick="" >预约已满
									</div>
									<%} else if(outpatient_dao.outpatient_date.get(i).compareTo(date) >= 0 ){ %>
									<div align="center" class="ASKSubmit"
										style="height: 30px; line-height: 30px;font-size:15px;width:60px;margin:0px"
										onclick="window.location.href='reservation_clinic_patient_sickinfo.jsp?site_name=<%=site_name%>&department=<%=department %>&doctor_id=<%=doctor_id %>&outpatient_id=<%=outpatient_dao.outpatient_id.get(i) %>'">
										预约
									</div>
									<%}else{ %>
									<div align="center" class="ASKSubmit_no"
										style="height: 30px; line-height: 30px; font-size:15px;width:60px;margin:0px" onclick="" >已停诊
									</div>
									<%}%>										

								</td>

							</tr>
					<%}} %>					

						</table>
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
