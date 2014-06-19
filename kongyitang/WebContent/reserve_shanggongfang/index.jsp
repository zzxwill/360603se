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

</style>

<script type="text/javascript">

$().ready(function() {
	 $("#adjust_form").validate({
			rules: {
				
				name: {
					required: true,
					maxlength: 10
				},
				gender: "required",
				age: {
					required: true,
					number:true,
					min: 0,
					max: 200
					
				},
				mobile: {
					required: true,
					number:true,
					minlength: 11,
					maxlength: 11
					
				}
			},
			messages: {
				
				name: {
					required: "必填！",
					maxlength: "长度不能超过10个字符！"
				} ,
				gender: {
					required: "必选！",
					
				},
				age: {
					required: "必填！",
					number:"请填写数字!",
					min: "年龄必须大于0岁",
					max: "年龄必须小于200岁"
				},
				mobile: {
					required: "必填！",
					number:"请填写数字!",
					minlength: "手机号码为11位!",
					maxlength: "手机号码为11位!"
					
				}
			}
		});
	 
	 $("#assess_form").validate({
			rules: {
				
				name_assess: {
					required: true,
					maxlength: 10
				},
				gender_assess: "required",
				age_assess: {
					required: true,
					number:true,
					min: 0,
					max: 200
					
				},
				mobile_assess: {
					required: true,
					number:true,
					minlength: 11,
					maxlength: 11
					
				}
			},
			messages: {
				
				name_assess: {
					required: "必填！",
					maxlength: "长度不能超过10个字符！"
				} ,
				gender_assess: {
					required: "必选！",
					
				},
				age_assess: {
					required: "必填！",
					number:"请填写数字!",
					min: "年龄必须大于0岁",
					max: "年龄必须小于200岁"
				},
				mobile_assess: {
					required: "必填！",
					number:"请填写数字!",
					minlength: "手机号码为11位!",
					maxlength: "手机号码为11位!"
					
				}
			}
		});

	 $(".submit_assess_link").click(function() {
		    if ($("#assess_form").valid()) {
		        $("#assess_form").submit();
		    }
		});
	
	
	$(".submit_adjust_link").click(function() {
	    if ($("#adjust_form").valid()) {
	        $("#adjust_form").submit();
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
					<td width="23%">
						<!-- <div id="backButton" style="width: 60px;"
							onclick="location.href='../index.jsp';"></div> -->
							<div id="backButton">
							<a id="return_link" onclick="window.location.href='../main/index.jsp'"></a>
						</div>
					</td>
					<td align="center" width="54%"><a style="color: white;">健康服务</a></td>
					<td width="23%">&nbsp;&nbsp;</td>
				</tr>
			</table>
		</div>
		<div data-role="content" style="margin-bottom: 20px;">
<!-- 			<form name="verifyForm" id="verifyForm" method="post"> -->

				<!-- 预约的上工坊健康会所的类型 -->
				<!-- <input id="type" name="type" type="hidden"> -->
				
				
				<!-- 预约孔医堂首页 -->
				<div id="shanggongfang_reservation_pre_index" style="display:">

					<table width="100%"  cellspacing="0"
						cellpadding="0" class="Introtable">

						<tr>
							<td align="center"><span class="title">健康调理</span></td>

						</tr>
						<tr>
							<td>
							<div style="margin-bottom: 20px">
								<p>提供健康咨询、健康评估、健康指导、就医指导、健康管理、健康教育及各项基础保健项目（全身经络推导和局部穴位刺激）。</p>
								<p>非介入人能自然疗法，辩证调养身心健康。</p>
							</div>
							</td>

						</tr>
					</table>
					<!-- </br> -->

					<!-- <div class="table-site"> -->
					<table bgColor="#FFFFFF" border="0" cellspacing="0" cellpadding="0"
						width="100%" class="listTable">
						<tr>
							<td class="xuetang_button"><strong>望京馆</strong></td>
							<td align="right">
								<div align="center" class="ASKSubmit" style="width:100px"
									onclick="set_shanggongfang_reservation_pre_index_value('望京馆');show_hidden('shanggongfang_reservation_pre_index');show_hidden('xuetang_reservation_index');show_hidden('reservation_specific_location');">
									预&nbsp;&nbsp;约
								</div>
							</td>
						</tr>
						<tr>
							<td class="xuetang_button"><strong>五棵松馆</strong></td>
							<td align="right">
								<div align="center" class="ASKSubmit" style="width:100px"
									onclick="set_shanggongfang_reservation_pre_index_value('五棵松馆');show_hidden('shanggongfang_reservation_pre_index');show_hidden('xuetang_reservation_index');show_hidden('reservation_specific_location');">
									预&nbsp;&nbsp;约
								</div>
							</td>
						</tr>
						<tr>
							<td class="xuetang_button"><strong>展览路馆</strong></td>
							<td align="right">
								<div align="center" class="ASKSubmit_no" style="width:100px" >
									<!-- <div align="center" class="ASKSubmit" style="width:100px"
									onclick="set_kongyitang_reservation_index_value('展览路馆');show_hidden('xuetang_reservation_pre_index');show_hidden('kongyitang_reservation_index');show_hidden('reservation_specific_location');"> -->
									<div align="center" class="ASKSubmit_no" style="width:100px">									
									预&nbsp;&nbsp;约
								</div>
							</td>
						</tr>
						
					
						
						
						<tr>
							<td class="xuetang_button"><strong>三里屯SOHO馆</strong></td>
							<td align="right">
								<div align="center" class="ASKSubmit" style="width:100px"
									onclick="set_shanggongfang_reservation_pre_index_value('三里屯SOHO馆');show_hidden('shanggongfang_reservation_pre_index');show_hidden('xuetang_reservation_index');show_hidden('reservation_specific_location');">
									预&nbsp;&nbsp;约
								</div>
							</td>
						</tr>


					</table>
			



				</div>
				

				<!-- 预约上工坊健康会所首页 -->
				<div id="xuetang_reservation_index" style="display:none">

					<table width="100%"  cellspacing="0"
						cellpadding="0" class="Introtable">

						<!-- <tr bgColor="#000000">
							<td align="left" style="width: 20%"><button type="button"></button></td>
							<td align="center" style="color: white;">预约孔医堂</td>

						</tr> -->

						<tr>
							<td align="center"><span class="title">预约</span></td>

						</tr>
					<!-- 	<tr>
							<td>
							<div style="margin-bottom: 20px">
								<p>提供健康咨询、健康评估、健康指导、就医指导、健康管理、健康教育及各项基础保健项目（全身经络推导和局部穴位刺激）。</p>
								<p>非介入人能自然疗法，辩证调养身心健康。</p>
							</div>
							</td>

						</tr> -->
					</table>

					<table bgColor="#FFFFFF" border="0" cellspacing="0" cellpadding="0"
						width="100%" class="listTable" >				
						<tr>
							<td class="xuetang_button"><strong>健康评估</strong></td>
							<td align="right">
								<div align="center" class="ASKSubmit" style="width:100px" onclick="set_shanggongfang_reservation_index_value('健康评估');show_hidden('xuetang_reservation_index');show_hidden('xuetang_reservation_content_assess');">
									<big>预&nbsp;&nbsp;约</big>
								</div>
							</td>
						</tr>

						<!-- <tr>
							<td class="xuetang_button"><strong>健康调理</strong></td>
							<td align="right">
								<div align="center" class="ASKSubmit" style="width:100px"  onclick="set_shanggongfang_reservation_index_value('健康调理');show_hidden('xuetang_reservation_index');show_hidden('xuetang_reservation_content');">
									<big>预&nbsp;&nbsp;约</big>
								</div>
							</td>
						</tr>


						<tr>
							<td class="xuetang_button"><strong>健康讲座</strong></td>
							<td align="right">
								<div align="center" class="ASKSubmit_no" style="width:100px" onclick="">
									<big>预&nbsp;&nbsp;约</big>
								</div>
							</td>
						</tr>

						<tr>
							<td class="xuetang_button"><strong>健康沙龙</strong></td>
							<td align="right">
								<div align="center" class="ASKSubmit_no" style="width:100px" onclick="">
									<big>预&nbsp;&nbsp;约</big>
								</div>
							</td>
						</tr> -->

					</table>

				</div>
				
				


				<!-- 上工坊健康会所 具体预约页面 -->
				<div id="xuetang_reservation_content" style="display: none;margin:0 auto;width:90%">
					<form id="adjust_form" action="submit_reserve_shanggongfang.jsp" method="post">
					<!-- 预约的地点 -->
					<!-- <input id="site_assess" name="site_assess" type="hidden"> -->
					
					<!-- 预约的上工坊健康会所的类型 -->
					<input id="type_adjust" name="type_adjust" type="hidden">
					<!-- <table width="100%" cellspacing="0" cellpadding="0">
						<tr bgColor="#000000">
							<td align="left" style="width: 20%"><button type="button"
									onclick="display_return_page('xuetang_reservation_content', 'xuetang_reservation_index');"></button></td>
							<td align="center" style="color: white;">健康服务</td>

						</tr>


					</table> -->

					<table width="100%">
						<!-- 
						<tr>
							<td align="left" style="width: 20%"><button type="button"
									onclick="display_return_page('xuetang_reservation_content', 'xuetang_reservation_index');"></button></td>
							<td align="center">健康服务</td>

						</tr>
						-->
						<tr>
							<td colspan="2" align="center"><span><h1>健康调理</h1></span></td>

						</tr>


					</table>


					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td id="xuetang_td"><div id="ASKInput" style="height: 39px;line-height: 39px;">诊疗机构</div></td>
							<td colspan="2"><select id="site"
								name="site">
									<option selected="" value="望京馆">望京馆</option>
									<option value="五棵松馆">五棵松馆</option>
									<option value="展览路馆">展览路馆</option>
									<option value="三里屯SOHO馆">三里屯SOHO馆</option>							
							</select></td>
						</tr>
						
						<tr>
							<td id="xuetang_td"><div id="ASKInput" align="center">姓&nbsp;&nbsp;&nbsp;&nbsp;名</div></td>
							<td colspan="2"><INPUT name="name" value=""  ></td>
							<tr>
								<td></td>
							<td colspan="2"><label for="name" class="error"></label></td>
										
							</tr>
						<tr>
							<td id="xuetang_td"><div id="ASKInput">性&nbsp;&nbsp;&nbsp;&nbsp;别</div></td>
							<td><input type="radio" name="gender" value="male"  style="float:left;margin-left:10px" /> 男 </td>
							<td><input type="radio" name="gender" value="female" style="float:left;margin-left:10px" /> 女</td>
						</tr>
						<tr>
								<td></td>
							<td colspan="2"><label for="gender" class="error"></label></td>
										
							</tr>
						<tr>							
							<td id="xuetang_td"><div id="ASKInput">年&nbsp;&nbsp;&nbsp;&nbsp;龄</div></td>
							<td colspan="2"><INPUT name="age" value="" ></td>
						</tr>
						<tr>
								<td></td>
							<td colspan="2"><label for="age" class="error"></label></td>
										
							</tr>

						<tr>
							<td id="xuetang_td"><div id="ASKInput">手&nbsp;&nbsp;&nbsp;&nbsp;机</div></td>
							<td colspan="2"><INPUT name="mobile" value="" ></td>
						</tr>
						<tr>
								<td></td>
							<td colspan="2"><label for="mobile" class="error"></label></td>
										
							</tr>



						<tr>
							<td id="xuetang_td"><div id="ASKInput" style="height: 39px;line-height: 39px;">调理项目</div></td>
							<td colspan="2"><select id="adjust_programe"
								name="adjust_programe">
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
							</select></td>
						</tr>

						<tr>
							<td id="xuetang_td"><div id="ASKInput" style="height: 39px;line-height: 39px;">预约时间</div></td>
							<td colspan="2"><select id="book_date" name="book_date">

								<% 
									ReserveClinicDao reserveClinicDao = new ReserveClinicDao();
								reserveClinicDao.retrive_outpatient_time("健康服务");
								for ( int i = 0; i< reserveClinicDao.outpatient_id.size(); i++){
								
								%>
									<option selected="" value='<%=reserveClinicDao.date.get(i) %><%=reserveClinicDao.day.get(i) %><%=reserveClinicDao.ampm.get(i) %><%=reserveClinicDao.time.get(i) %>'>
									<%=reserveClinicDao.date.get(i) %><%=reserveClinicDao.day.get(i) %><%=reserveClinicDao.ampm.get(i) %><%=reserveClinicDao.time.get(i) %></option>
								
								<%} %>

							</select></td>
						</tr>

						<tr>
							<td id="xuetang_td"><div id="ASKInput" style="height: 39px;line-height: 39px;">调理师</div></td>
							<td colspan="2"><select id="adjust_master"
								name="adjust_master" class="u29">
									<option selected="" value="王毅河">王毅河</option>
									<option value="孙庭剑">孙庭剑</option>
							</select></td>
						</tr>

					</table>




					<div>



						<br /> <!-- <INPUT id="u38" type="submit" value="预约"
							onclick="submit_reserve_shanggongfang('submit_reserve_shanggongfang.jsp')"> -->
							<!-- <INPUT id="u38" type="submit" value="预约"> -->
							<div  >
							<a  id="ASKSubmit" class="submit_adjust_link" style="color: white;widht:100%;display: block;text-align: center;font-size: 17px;"><big>预约</big></a>
						</div>

					</div>
					</form>
				</div>

				<!-- 上工坊健康会所  健康评估   具体预约页面 -->
				<div id="xuetang_reservation_content_assess" style="display: none;margin:0 auto;width:90%">
				<form id="assess_form" action="submit_reserve_shanggongfang_assess.jsp" method="post">
					<!-- 预约的上工坊健康会所的类型 -->
					<input id="type_assess" name="type_assess" type="hidden">
					<input id="site_assess" name="site_assess" type="hidden">
					<!-- <table width="100%" cellspacing="0" cellpadding="0">
						<tr bgColor="#000000">
							<td align="left" style="width: 20%"><button type="button"
									onclick="display_return_page('xuetang_reservation_content_assess', 'xuetang_reservation_index');"></button></td>
							<td align="center" style="color: white;">健康服务</td>

						</tr>


					</table> -->

					<table width="100%">
						<!-- 
						<tr>
							<td align="left" style="width: 20%"><button type="button"
									onclick="display_return_page('xuetang_reservation_content_assess', 'xuetang_reservation_index');"></button></td>
							<td align="center">健康服务</td>

						</tr>
						 -->
						<tr>
							<td colspan="2" align="center"><span><h1>健康评估</h1></span></td>

						</tr>


					</table>


					<table  width="100%" border="0" cellspacing="0" cellpadding="0">
						<!-- <tr>
							<td id="xuetang_td"><div id="ASKInput" style="height: 39px;line-height: 39px;">诊疗机构</div></td>
							<td colspan="2"><select id="site_assess"
								name="site_assess">
									<option selected="" value="望京馆">望京馆</option>
									<option value="五棵松馆">五棵松馆</option>
									<option value="展览路馆">展览路馆</option>
									<option value="三里屯SOHO馆">三里屯SOHO馆</option>							
							</select></td>
						</tr> -->
						
						<tr>
							<!-- <td id="ASKInput">：</td> -->
							<td id="xuetang_td"><div id="ASKInput" align="center">姓&nbsp;&nbsp;&nbsp;&nbsp;名</div></td>
							<td colspan="2"><INPUT name="name_assess" value=""
								 class="required"></td>
								<tr>
								<td></td>
								<td colspan="2"><label for="name_assess" class="error"></label></td>
										
							</tr>
						<tr>
							<td id="xuetang_td"><div id="ASKInput">性&nbsp;&nbsp;&nbsp;&nbsp;别</div></td>
							<td><input type="radio" name="gender_assess" value="male"  style="float:left;margin-left:10px" /> 男 </td>
							<td><input type="radio" name="gender_assess" value="female" style="float:left;margin-left:10px" /> 女</td>
						</tr>
						<tr>
								<td></td>
								<td colspan="2"><label for="gender_assess" class="error"></label></td>
										
							</tr>
						<tr>
							<td id="xuetang_td"><div id="ASKInput">年&nbsp;&nbsp;&nbsp;&nbsp;龄</div></td>
							<td colspan="2"><INPUT name="age_assess" value=""
								></td>
						</tr>
						<tr>
								<td></td>
								<td colspan="2"><label for="age_assess" class="error"></label></td>
										
							</tr>

						<tr>
							<td id="xuetang_td"><div id="ASKInput">手&nbsp;&nbsp;&nbsp;&nbsp;机</div></td>
							<td colspan="2"><INPUT name="mobile_assess" value=""
								></td>
						</tr>
						<tr>
								<td></td>
								<td colspan="2"><label for="mobile_assess" class="error"></label></td>
										
							</tr>



						<tr>
					
							<td id="xuetang_td"><div id="ASKInput" align="center"  style="height: 39px;line-height: 39px;">评估项目</div></td>
							<td colspan="2"><select id="assess_programe"
								name="assess_programe_assess">
									<option selected="" value="私人医生顾问服务">私人医生顾问服务</option>
									<option value="个性化健康指导">个性化健康指导</option>
									<option value="健康评估">健康评估</option>
									<option value="健康咨询">健康咨询</option>
							</select></td>
						</tr>

						<tr>
							
							<td id="xuetang_td"><div id="ASKInput" align="center"  style="height: 39px;line-height: 39px;">预约时间</div></td>
							<td colspan="2"><select id="book_date"
								name="book_date_assess">

									<% 
									//ReserveClinicDao reserveClinicDao = new ReserveClinicDao();
								reserveClinicDao.retrive_outpatient_time("健康服务");
								for ( int i = 0; i< reserveClinicDao.outpatient_id.size(); i++){
								
								%>
									<option selected="" value='<%=reserveClinicDao.date.get(i) %><%=reserveClinicDao.day.get(i) %><%=reserveClinicDao.ampm.get(i) %><%=reserveClinicDao.time.get(i) %>'>
									<%=reserveClinicDao.date.get(i) %><%=reserveClinicDao.day.get(i) %><%=reserveClinicDao.ampm.get(i) %><%=reserveClinicDao.time.get(i) %></option>
								
								<%} %>

							</select></td>
						</tr>

						<tr>
					
							<td id="xuetang_td"><div id="ASKInput" align="center" style="height: 39px;line-height: 39px;">调理师</div></td>
							<td colspan="2"><select id="assess_master"
								name="assess_master_assess" class="u29">
									<option selected="" value="李志更">李志更</option>
									<option value="孙立彬">孙立彬</option>
									<option value="肖强">肖强</option>
									<option value="王倩">王倩</option>
									<option value="郭培杰">郭培杰</option>
							</select></td>
						</tr>

					</table>




					<div>



						<br /><!--  <INPUT id="u38" type="submit" value="预约"
							onclick="submit_reserve_shanggongfang('submit_reserve_shanggongfang_assess.jsp')"> -->
							 <!-- <INPUT id="u38" type="submit" value="预约" > -->
						
						<div>
							<a  id="ASKSubmit" class="submit_assess_link" style="color: white;widht:100%;display: block;text-align: center;font-size: 17px;"><big>预约</big></a>
						</div>
					</div>
					</form>
				</div>

				<div data-role="footer" data-id="myfooter" data-position="fixed">
				</div>
		</div>



		<!-- </form> -->
	</div>
	</div>
</body>
</html>