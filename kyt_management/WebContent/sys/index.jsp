
<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*"
	pageEncoding="UTF-8"%>

<%@ include file="../include/package.jsp"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title><%=sysName %></title>

<%@ include file="../include/meta.jsp"%>
<%@ include file="../include/cssJS.jsp"%>
<%@ include file="../include/tableCSS.jsp"%>
<%@ include file="../include/custom.jsp"%>




</head>

<body>
	<%@ include file="../check/index.jsp"%>


	<center>
		<h1>
			<p style='color: red;'><%=sysName %></p>
		</h1>
		
		<div>
		<table align="right">
						<tr>
							<td>Welcome&nbsp;,&nbsp;<%=loginedUserName %>&nbsp;!&nbsp;&nbsp;&nbsp;
							</td>
							<td><a class="btn btn-warning" contenteditable="true"
								onclick="jumpOut()">退出</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
					</table>
		</div>
	
	
	
		<div style="width: 1200px;">
			<table>
				<tr>

					<td>
						<!-- 左侧菜单 -->
						<table border="1" cellspacing="0" cellpadding="0"  style="position:absolute; left:177px; top:58px;">
							<tr>
								<td><a onclick="show_hidden('reservation','question','user','null');">预约管理</a></td>
							</tr>


							<tr>
								<td><a onclick="show_hidden('question','reservation','user','null');">问题列表</a></td>
							</tr>
							<tr>
								<td><a onclick="show_hidden('user','reservation','question','null');">用户列表</a></td>
							</tr>
							<tr>
								<td>内容管理</td>
							</tr>
						</table>
					</td>

					<td>
						<div id="reservation" >
						<!-- 右侧 -->
						<table>
							<tr>
								<!-- 右侧菜单 -->
								<td>
									<table border="1" cellspacing="0" cellpadding="0">
										<tr>
											<td>预约类目管理</td>
											<td>出诊时间管理</td>
											<td>预约记录管理</td>
										</tr>
									</table>
								</td>
							</tr>

							<tr>
								<!-- 右侧内容 -->
								<td>
									<table width="648" border="0" cellpadding="0" cellspacing="0"
										style='width: 486.00pt; border-collapse: collapse; table-layout: fixed;'>
										<tr height="19" style='height: 14.25pt;'>
											<td height="19" width="72"
												style='height: 14.25pt; width: 54.00pt;'>场馆</td>
											<td width="341" style='width: 255.75pt;'>门诊科室</td>
											<td width="163" style='width: 122.25pt;'>健康服务类目</td>
											<td width="72" style='width: 54.00pt;'><a
												id="submit_adjust_link" onclick="return show_confirm();"
												href="../my_reservation/cancell_reservation.jsp?type=adjust&clinic_reservation_normal_id=\%>"><big>添加场馆</big></a>


											</td>
										</tr>

										<tr>
											<td colspan="4"><hr color="<%=sysFontColor%>"></td>
										</tr>

										<tr height="38" style='height: 28.50pt;'>
											<td height="38" style='height: 28.50pt;' x:str>望京馆</td>
											<td x:str>中医内科、中医外科、妇科、儿科、针推科</td>
											<td class="xl22" x:str>健康评估、健康调理<br />健康沙龙、健康讲座
											</td>
											<td x:str>修改 删除</td>
										</tr>

										<tr>
											<td colspan="4"><hr color="<%=sysFontColor%>"></td>
										</tr>

										<tr height="38" style='height: 28.50pt;'>
											<td height="38" style='height: 28.50pt;' x:str>展览路馆</td>
											<td x:str>中医内科、中医外科、妇科、儿科、针推科</td>
											<td class="xl22" x:str>健康评估、健康调理<br />健康沙龙、健康讲座
											</td>
											<td x:str>修改 删除</td>
										</tr>

										<tr>
											<td colspan="4"><hr color="<%=sysFontColor%>"></td>
										</tr>

										<tr height="19" style='height: 14.25pt;'>
											<td height="19" style='height: 14.25pt;' x:str>五棵松馆</td>
											<td x:str>中医内科、中医外科、妇科、儿科、针推科</td>
											<td />
											<td x:str>修改 删除</td>
										</tr>

										<tr>
											<td colspan="4"><hr color="<%=sysFontColor%>"></td>
										</tr>
										<tr height="38" style='height: 28.50pt;'>
											<td height="38" style='height: 28.50pt;' x:str>三里屯SOH<span
												style='display: none;'>O馆</span></td>
											<td x:str>中医内科、中医外科、妇科、儿科、针推科</td>
											<td class="xl22" x:str>健康评估、健康调理<br />健康沙龙、健康讲座
											</td>
											<td x:str>修改 删除</td>
										</tr>
										<tr>
											<td colspan="4"><hr color="<%=sysFontColor%>"></td>
										</tr>
									</table>



									<table width="648" border="0" cellpadding="0" cellspacing="0"
										style='width: 486.00pt; border-collapse: collapse; table-layout: fixed;'>
										<tr height="19" style='height: 14.25pt;'>
											<td height="19" width="72"
												style='height: 14.25pt; width: 54.00pt;'>招生在线</td>
											<td width="72" style='width: 54.00pt;'><a
												id="submit_adjust_link" onclick="return show_confirm();"
												href="../my_reservation/cancell_reservation.jsp?type=adjust&clinic_reservation_normal_id=\%>"><big>添加学堂</big></a>


											</td>
										</tr>

										<tr>
											<td colspan="2"><hr color="<%=sysFontColor%>"></td>
										</tr>

										<tr height="38" style='height: 28.50pt;'>
											<td height="38" style='height: 28.50pt;' x:str>科普学堂</td>

											<td x:str>修改 删除</td>
										</tr>
										<tr>
											<td colspan="2"><hr color="<%=sysFontColor%>"></td>
										</tr>

										<tr height="38" style='height: 28.50pt;'>
											<td height="38" style='height: 28.50pt;' x:str>紫禁学堂</td>

											<td x:str>修改 删除</td>
										</tr>
										<tr>
											<td colspan="2"><hr color="<%=sysFontColor %>"></td>
										</tr>

										<tr height="38" style='height: 28.50pt;'>
											<td height="38" style='height: 28.50pt;' x:str>国医学堂</td>

											<td x:str>修改 删除</td>
										</tr>
										<tr>
											<td colspan="2"><hr color="<%=sysFontColor %>"></td>
										</tr>

										<tr height="38" style='height: 28.50pt;'>
											<td height="38" style='height: 28.50pt;' x:str>翰林学堂</td>

											<td x:str>修改 删除</td>
										</tr>
									</table>



								</td>

							</tr>
						</table>
					</div>
						<div id="question" style="display: none;">
							<%@ include file="../admin/list_question.jsp"%>
						</div>
						<div id="user" style="display: none;">
							<%@ include file="../admin/insertUser.jsp"%>
							<%@ include file="../admin/editUser.jsp"%>
							<%@ include file="../admin/list_doctor.jsp"%>
						</div>
						
						
					
					</td>



				</tr>



			</table>



		</div>
	</center>









	<center>
		<%-- <h1>
			<p style='color: red;'><%=sysName %></p>
		</h1>
 --%>
		<div style="width: 1200px;">

			<div class="tabbable" id="tabs-652502">
				<!-- Only required for left/right tabs -->
				<script>
	function jumpOut(){
		self.location = '../exit';
	}
    </script>
				<ul class="nav nav-tabs">
				<%
	String url = "../sys";
    request.setCharacterEncoding("utf-8");
    //String checkedName = (String)session.getAttribute("loginedUserName");
    adminCheck = (String)session.getAttribute("adminCheck");
    if(null==adminCheck||adminCheck.equals("")){
    	//System.out.println("admincheck:" + adminCheck + "\n");
    %>
				<script language='javascript' type='text/javascript'>
		window.location = "<%=url%>";
	</script>
				<%}else if(adminCheck.endsWith("true222")){ %>
					<li class="active"><a href="#panel-user_doctor" data-toggle="tab" contenteditable="true" style="cursor: pointer">医生列表</a></li>
					
					<li><a href="#panel-user_patient" data-toggle="tab" contenteditable="true" style="cursor: pointer">患者列表</a></li>
					
					<li><a href="#panel-question" data-toggle="tab" contenteditable="true" style="cursor: pointer">提问列表</a></li>
					
					<li><a href="#panel-reservation" data-toggle="tab" contenteditable="true" style="cursor: pointer">预约列表</a></li>
					
					<li><a href="#panel-outpatient" data-toggle="tab"
						contenteditable="true" style="cursor: pointer">出诊时间管理</a></li>
					
					<li><a href="#panel-user" data-toggle="tab"
						contenteditable="true" style="cursor: pointer">用户信息</a></li>
					
					<li class=""><a href="#panel-shop" data-toggle="tab"
						contenteditable="true" style="cursor: pointer">店铺信息</a></li>
					
					<li class=""><a href="#panel-financial" data-toggle="tab"
						contenteditable="true" style="cursor: pointer">财务信息</a></li>
					
					<li class=""><a href="#panel-chart" data-toggle="tab"
						contenteditable="true" style="cursor: pointer">统计报表</a></li>
				<%}else if(adminCheck.startsWith("staff222")){ %>
					<li class="active"><a href="#panel-user_doctor" data-toggle="tab" contenteditable="true" style="cursor: pointer">医生列表</a></li>
					
					<!-- <li><a href="#panel-user_patient" data-toggle="tab" contenteditable="true" style="cursor: pointer">患者列表</a></li> -->
					
					<li><a href="#panel-question" data-toggle="tab" contenteditable="true" style="cursor: pointer">提问列表</a></li>
					
					<li><a href="#panel-reservation" data-toggle="tab" contenteditable="true" style="cursor: pointer">预约列表</a></li>
					
					<!-- <li><a href="#panel-outpatient" data-toggle="tab"
						contenteditable="true" style="cursor: pointer">出诊时间管理</a></li>
					
					<li><a href="#panel-user" data-toggle="tab"
						contenteditable="true" style="cursor: pointer">用户信息</a></li>
					
					<li class=""><a href="#panel-shop" data-toggle="tab"
						contenteditable="true" style="cursor: pointer">店铺信息</a></li>
					
					<li class=""><a href="#panel-financial" data-toggle="tab"
						contenteditable="true" style="cursor: pointer">财务信息</a></li>
					
					<li class=""><a href="#panel-chart" data-toggle="tab"
						contenteditable="true" style="cursor: pointer">统计报表</a></li> -->
				<%} %>
		<%-- 			<table align="right">
						<tr>
							<td>Welcome&nbsp;,&nbsp;<%=loginedUserName %>&nbsp;!&nbsp;&nbsp;&nbsp;
							</td>
							<td><a class="btn btn-warning" contenteditable="true"
								onclick="jumpOut()">退出</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
					</table> --%>
				</ul>

				<%
   
    if(null==adminCheck||adminCheck.equals("")){
    	//System.out.println("admincheck:" + adminCheck + "\n");
    %>
				<script language='javascript' type='text/javascript'>
		window.location = "<%=url%>";
	</script>
				<%}else if(adminCheck.endsWith("true222")){ %>

				<div class="tab-content">
					<%//医生列表 %>
					<div class="tab-pane active" id="panel-user_doctor">
						<%-- <%@ include file="../admin/insertUser.jsp"%>  --%>
						<%-- <%@ include file="../admin/list_doctor.jsp"%> --%>
					</div>

					<%//患者列表 %>
					<div class="tab-pane" id="panel-user_patient">
						<%-- <%@ include file="../admin/insertUser.jsp"%>  --%>
						<%@ include file="../admin/list_patient.jsp"%>
					</div>
					
					
					<%//提问列表%>
					<div class="tab-pane" id="panel-question">
						
						<%-- <%@ include file="../admin/list_question.jsp"%> --%>
					</div>
					
					
					<%//预约列表%>
					<div class="tab-pane" id="panel-reservation">
						<%-- <%@ include file="../admin/insertUser.jsp"%>  --%>
						<%@ include file="../admin/list_reservation.jsp"%>
					</div>
					
					
					<%//出诊时间管理 %>
					<div class="tab-pane" id="panel-outpatient">
						<%-- <%@ include file="../admin/insertUser.jsp"%>  --%>
						<%@ include file="../admin/manage_outpatient.jsp"%>
					</div>

					<%//用户信息 %>
					<div class="tab-pane" id="panel-user">
						<%-- <%@ include file="../admin/insertUser.jsp"%>
						<%@ include file="../admin/editUser.jsp"%> --%>
					</div>

					<%//商店信息 %>
					<div class="tab-pane" id="panel-shop">
						<%@ include file="../admin/insertShop.jsp"%>
						<%@ include file="../admin/editShop.jsp"%>
					</div>

					<%//财务信息 %>
					<div class="tab-pane" id="panel-financial">
						<%@ include file="../admin/insertFinancial.jsp"%>
						<%@ include file="../admin/editFinancial.jsp"%>
					</div>

					<%//统计报表 %>
					<div class="tab-pane" id="panel-chart">已删除</div>

				</div>
				<%}else if(adminCheck.endsWith("staff_wjg222")){ %>
				<div class="tab-content">
					<%//医生列表 %>
					<div class="tab-pane active" id="panel-user_doctor">
						<%-- <%@ include file="../admin/insertUser.jsp"%>  --%>
					<%-- 	<%@ include file="../admin/list_doctor.jsp"%> --%>
					</div>
					
					
					<%//提问列表%>
					<div class="tab-pane" id="panel-question">
						
						<%-- <%@ include file="../admin/list_question.jsp"%> --%>
					</div>

						<%//预约列表%>
					<div class="tab-pane" id="panel-reservation">
						<%-- <%@ include file="../admin/insertUser.jsp"%>  --%>
						<%@ include file="../admin/list_reservation.jsp"%>
					</div>

				</div>
				<%}else{ %>
				<div class="tab-content">
					<%-- <%//医生列表 %>
					<div class="tab-pane active" id="panel-user_doctor">
						<%@ include file="../admin/list_doctor.jsp"%>
					</div>

					<%//用户信息 %>
					<div class="tab-pane" id="panel-user">
						<%@ include file="../common/editUser.jsp"%>
					</div>

					<%//商店信息 %>
					<div class="tab-pane" id="panel-shop">
						<%@ include file="../common/insertShop.jsp"%>
						<%@ include file="../common/editShop.jsp"%>
					</div>

					<%//财务信息 %>
					<div class="tab-pane" id="panel-financial">
						<%@ include file="../common/insertFinancial.jsp"%>
						<%@ include file="../common/editFinancial.jsp"%>
					</div>

					<%//统计报表 %>
					<div class="tab-pane" id="panel-chart">已删除</div> --%>

				</div>
				<%} %>
				
				
				

			</div>

		</div>
</body>
</html>