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
		
	 $("#verifyForm").validate({
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
					
				},
				job: {
					required: true,
					maxlength: 20
				},
				company: {
					required: true,
					maxlength: 20
				},
				title: {
					required: true,
					maxlength: 20
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
					
				},
				job: {
					required: "必填！",
					maxlength: "长度不能超过20个字符！"
				} ,
				company: {
					required: "必填！",
					maxlength: "长度不能超过20个字符！"
				} ,
				title: {
					required: "必填！",
					maxlength: "长度不能超过20个字符！"
				} ,/*,
				confirm_password: {
					required: "Please provide a password",
					minlength: "Your password must be at least 5 characters long",
					equalTo: "Please enter the same password as above"
				},
				email: "Please enter a valid email address",
				agree: "Please accept our policy" */
			}
		});
	 $(".submit_link").click(function() {
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
						<!-- <div id="backButton" style="width: 60px;"
							onclick="return_to_wechat_main()">返回</div> -->
							<div id="backButton" style="width: 60px;">
							<a id="return_link" onclick="return_to_wechat_main()">返回</a>
						</div>
							
					</td>
					<td align="center" width="34%"><a style="color: white;">招生在线</a></td>
					<td width="33%">&nbsp;&nbsp;</td>
				</tr>
			</table>

		</div>

		<div data-role="content">
			<form name="verifyForm" id="verifyForm" method="post"
				action="submit_reserve_xuetang.jsp">

				<!-- 预约的学堂 -->
				<input id="xuetang" name="xuetang" type="hidden">
				<!-- 预约的科室 -->
				<!-- <input id="department" name="department" type="hidden"> -->
				<!-- 预约的医生id -->
				<!-- <input id="doctorid" name="doctorid" type="hidden"> -->
				<!-- 预约的门诊id(2014-05-01 星期四 上午 普通门诊) -->
				<!-- <input id="outpatientid" name="outpatientid" type="hidden"> -->





				<!-- 预约孔医堂首页 -->
				<div id="xuetang_reservation_index" style="display:">

					<table width="100%" bgColor="#fffef0" cellspacing="0"
						cellpadding="0" class="Introtable">

						<!-- <tr bgColor="#000000">
							<td align="left" style="width: 20%"><button type="button">返回</button></td>
							<td align="center" style="color: white;">预约孔医堂</td>

						</tr> -->

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

					<table bgColor="#FFFFFF" border="0" cellspacing="0" cellpadding="0"
						width="100%" class="listTable" >				
						<tr>
							<td class="xuetang_button"><strong>科普学堂</strong></td>
							<td align="right">
								<div align="center" class="ASKSubmit_no"  style="width:100px" onclick="">
									<big>报&nbsp;&nbsp;名</big>
								</div>
							</td>
						</tr>

						<tr>
							<td class="xuetang_button"><strong>紫禁学堂</strong></td>
							<td align="right">
								<div align="center" class="ASKSubmit_no" style="width:100px" onclick="">
									<big>报&nbsp;&nbsp;名</big>
								</div>
							</td>
						</tr>


						<tr>
							<td class="xuetang_button"><strong>国医学堂</strong></td>
							<td align="right">
								<div align="center" class="ASKSubmit" style="width:100px"
									onclick="set_xuetang_reservation_index_value('国医学堂');show_hidden('xuetang_reservation_index');show_hidden('xuetang_reservation_content');">
									<big>报&nbsp;&nbsp;名</big>
								</div>
							</td>
						</tr>

						<tr>
							<td class="xuetang_button"><strong>翰林学堂</strong></td>
							<td align="right">
								<div align="center" class="ASKSubmit_no" style="width:100px" onclick="">
									<big>报&nbsp;&nbsp;名</big>
								</div>
							</td>
						</tr>

					</table>

				</div>




				<!-- 患者病情资料 -->
				<div id="xuetang_reservation_content" style="display: none;margin:0 auto;width:90%">
					<!-- <table width="100%" cellspacing="0" cellpadding="0">
						<tr bgColor= "#000000">
							<td align="left" style="width: 20%"><button type="button"
									onclick="display_return_page('xuetang_reservation_content', 'xuetang_reservation_index');">返回</button></td>
							<td align="center" style="color: white;">招生在线</td>

						</tr>


					</table> -->

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


					</table >


					<table  width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<!-- <td id="ASKInput">：</td> -->
							<td id="xuetang_td"><div id="ASKInput" align="center">姓&nbsp;&nbsp;&nbsp;&nbsp;名</div></td>
							<td colspan="2"><INPUT name="name" value="" width="80%"
								class="required"></td>
						</tr>
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
							<td colspan="2"><INPUT name="age" value="" width="80%"></td>
						</tr>
						<tr>
						
							<td></td>
							<td colspan="2"><label for="age" class="error"></label></td>
							</tr>
						<tr>
						<tr>

							<td id="xuetang_td"><div id="ASKInput">手&nbsp;&nbsp;&nbsp;&nbsp;机</div></td>
							<td colspan="2"><INPUT name="mobile" value="" width="80%"></td>
						</tr>
						<tr>
						
							<td></td>
							<td colspan="2"><label for="mobile" class="error"></label></td>
							</tr>
						<tr>

						<tr>

							<td id="xuetang_td"><div id="ASKInput">职&nbsp;&nbsp;&nbsp;&nbsp;业</div></td>
							<td colspan="2"><INPUT name="job" value="" width="80%"></td>
						</tr>
						<tr>
						
							<td></td>
							<td colspan="2"><label for="job" class="error"></label></td>
							</tr>
						<tr>

						<tr>

							<td id="xuetang_td"><div id="ASKInput">就职单位</div></td>
							<td colspan="2"><INPUT name="company" value="" width="80%"></td>
						</tr>
						<tr>
						
							<td></td>
							<td colspan="2"><label for="company" class="error"></label></td>
							</tr>
						<tr>

						<tr>

							<td id="xuetang_td"><div id="ASKInput">职务/职称</div></td>
							<td colspan="2"><INPUT name="title" value="" width="80%"></td>
						</tr>
						<tr>
						
							<td></td>
							<td colspan="2"><label for="title" class="error"></label></td>
							</tr>
						<tr>

					</table>



					<br />
				
						
						<div  >
							<a  id="ASKSubmit" class="submit_link" style="color: white;widht:100%;display: block;text-align: center;font-size: 17px;"><big>预约</big></a>
						</div>



						<!-- <br />
						<INPUT id="u38" type="submit" value="预约"  class="submit_button"> -->
			
						

				
				</div>

				<div data-role="footer" data-id="myfooter" data-position="fixed">
				</div>
				</form>
		</div>



		
	</div>
	</div>
</body>
</html>