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
							<a id="return_link" onclick="window.location.href='reserve_clinic_specific_doctor.jsp'" ></a>
						</div>
					</td>
					<td align="center" width="54%"><a style="color: white;">预约孔医堂</a></td>
					<td width="23%">&nbsp;&nbsp;</td>
				</tr>
			</table>
		</div>
		
		<%
				
				 request.setCharacterEncoding("utf-8");
				 String  doctor_id_str= request.getParameter("doctor_id");
				 String site_name = request.getParameter("site_name");
				String department = request.getParameter("department");
				String outpatient_id_str= request.getParameter("outpatient_id");
				
				 if(doctor_id_str == null || site_name ==null || department == null || outpatient_id_str==null){
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
				return;}
				 
				 %>
		 <%
					//long  site_id = Long.parseLong(site_id_str);
					long  doctor_id = Long.parseLong(doctor_id_str);
					
					long  outpatient_id = Long.parseLong(outpatient_id_str);	
					 //site_name = java.net.URLDecoder.decode(site_name,"UTF-8");
					 //site_name = java.net.URLDecoder.decode(site_name,"UTF-8");
					/* request.setAttribute("site_name", site_name);
					request.setAttribute("department", department);
					request.setAttribute("doctor_id", doctor_id);
					request.setAttribute("outpatient_id", outpatient_id); */
					
					
					/*  String site_name = request.getParameter("site_name");
					 String department = request.getParameter("department");
					 //site_name = java.net.URLDecoder.decode(site_name,"UTF-8");
					 //site_name = java.net.URLDecoder.decode(site_name,"UTF-8");
					 System.out.println(site_name);
					 //site_name = java.net.URLEncoder.encode(site_name,"utf-8"); */
					site_name = java.net.URLDecoder.decode(site_name,"UTF-8");
					 site_name = java.net.URLDecoder.decode(site_name,"UTF-8");
					 site_name = java.net.URLEncoder.encode(site_name,"UTF-8");
					 site_name = java.net.URLEncoder.encode(site_name,"UTF-8");
					 
					 
					 department = java.net.URLDecoder.decode(department,"UTF-8");
					 department = java.net.URLDecoder.decode(department,"UTF-8");
					 department = java.net.URLEncoder.encode(department,"UTF-8");
					 department = java.net.URLEncoder.encode(department,"UTF-8");
					 
					 
					 
					
					
				 %>
		
		
		
		<div data-role="content">
			<form name="verifyForm" id="verifyForm" method="post"
				action="submit_reserve_clinic.jsp?site_name=<%=site_name%>&department=<%=department %>&doctor_id=<%=doctor_id %>&outpatient_id=<%=outpatient_id %>">
				
				


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


				<!-- 患者病情资料 -->
				<div id="reservation_patient_sickinfo" style="display: ;width:90%;margin:10px auto;">
					<!-- <table width="100%" cellspacing="0" cellpadding="0">
						<tr bgColor="#000000">
							<td align="left" style="width: 20%"><button type="button"
									onclick="display_return_page('reservation_patient_sickinfo', 'reservation_specific_doctor');"></button></td>
							<td align="center" style="color: white;">预约</td>

						</tr>


					</table> -->
					 <div id="reservation_doctor" style="display:;">
						
					</div>
						
						<div id="reserve_clinic_illness" style="display: ;width:100%">

							<table width="100%">


								<tr>
									<td id="xuetang_td"><div id="ASKInput" align="center">所患疾病</div></td>

									<td colspan="3"><INPUT name="illness_name" width="60%"></td>
								</tr>
								<tr>
									<td></td>
									<td colspan="2"><label for="illness_name" class="error"></label></td>
								</tr>
							
								<tr>
									<td id="xuetang_td"><div id="ASKInput" align="center" style="height: 36px;line-height: 36px;">预约目的</div></td>
									<td><label><input type="checkbox"
											name="purpose_chk" value="诊断" />诊断</label></td>
									<td><label><input type="checkbox"
											name="purpose_chk" value="治疗" />治疗</label></td>
									<td><label> <input type="checkbox"
											name="purpose_chk" value="复诊" />复诊
									</label></td>
								</tr>
								<tr>
									<td></td>
									<td colspan="2"><label for="purpose_chk" class="error"></label></td>
								</tr>
								<tr>
									<td colspan="4"><p>
										<div align="left">病情描述及相关检查结果</div>
									
										<p>
											<textarea style="-webkit-border-radius:0.6em;border: 1px solid #744501;" name="detail" rows="3" cols="30"></textarea>
										</p></td>
								</tr>
								<tr>
									<td></td>
									<td colspan="2"><label for="detail" class="error"></label></td>
								</tr>
								<tr>

									<td id="xuetang_td"><div id="ASKInput" align="center">手机号</div></td>
									<td colspan="3"><INPUT name="mobile" value="" width="60%"></td>
								</tr>
								<tr>
									<td></td>
									<td colspan="2"><label for="mobile" class="error"></label></td>
								</tr>
								<tr>

									<td id="xuetang_td"><div id="ASKInput" align="center">姓&nbsp;&nbsp;&nbsp;&nbsp;名</div></td>
									<td colspan="3"><INPUT name="name" value="" width="60%"></td>
								</tr>
								<tr>
									<td></td>
									<td colspan="2"><label for="name" class="error"></label></td>
								</tr>
							</table>

						



							<br />
							<!-- <INPUT id="u38" type="submit" value="预约"
								> -->
							<!-- <div align="center" id="ASKSubmit" >
							<a id="submit_adjust_link" style="color: white;" onclick="set_reservation_patient_sickinfo_value();"><big>预约</big></a>
						</div> -->
							<div align="center" id="ASKSubmit">
								<a id="submit_adjust_link" style="color: white;"  ><big>预约</big></a>
							</div>
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
