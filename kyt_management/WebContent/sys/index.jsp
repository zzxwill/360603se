
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
	</center>
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
		<br><br>
	
		<center>
		<div style="width: 1220px;" >
			<table>
				<tr>

					<td width="120px" valign="top">
						<!-- 左侧菜单 -->
						<table  width="120px"  border="0" cellspacing="0" cellpadding="0"  >
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td><div class=" btn btn-primary btn-block" 
								onclick="show_hidden('reservation','question','adminUser','doctor','patient','changguan','xuetang','beixuan');">
								预约管理</div></td>
							</tr>
							<tr>
								<td><div class=" btn btn-primary btn-block" 
								onclick="show_hidden('question','reservation','adminUser','doctor','patient','changguan','xuetang','beixuan');">
								问题列表</div></td>
							</tr>
							<tr>
								<td><div class=" btn btn-primary btn-block" 
								onclick="show_hidden('adminUser','reservation','question','doctor','patient','changguan','xuetang','beixuan');">
								后台用户</div></td>
							</tr>
							<tr>
								<td><div class=" btn btn-primary btn-block" 
								onclick="show_hidden('doctor','reservation','question','adminUser','patient','changguan','xuetang','beixuan');">
								医生管理</div></td>
							</tr>
							<tr>
								<td><div class=" btn btn-primary btn-block" 
								onclick="show_hidden('patient','reservation','question','adminUser','doctor','changguan','xuetang','beixuan');">
								患者管理</div></td>
							</tr>
							<tr>
								<td><div class=" btn btn-primary btn-block" 
								onclick="show_hidden('changguan','reservation','question','adminUser','doctor','patient','xuetang','beixuan');">
								场馆管理</div></td>
							</tr>
							<tr>
								<td><div class=" btn btn-primary btn-block"
								onclick="show_hidden('xuetang','reservation','question','adminUser','doctor','patient','changguan','beixuan');">
								学堂管理</div></td>
							</tr>
							<tr>
								<td><div class=" btn btn-primary btn-block"
								onclick="show_hidden('beixuan','reservation','question','adminUser','doctor','patient','changguan','xuetang');">
								备用选项</div></td>
							</tr>
						</table>
					</td>

					<td width="1100px" valign="top">
						
						<%//预约管理 %>
						<div id="reservation"  >
							<%@ include file="index_reservation_test.jsp"%>
						</div>
						
						<%//问题列表 %>
						<div id="question" style="display: none;"  >
							<%@ include file="../admin/list_question.jsp"%>
						</div>
						
						<%//后台用户 %>
						<div id="adminUser" style="display: none;"  >
							<%@ include file="../admin/insertUser.jsp"%>
							<%@ include file="../admin/editUser.jsp"%>
						</div>
						
						<%//医生管理 %>
						<div id="doctor" style="display: none;" >
						<%// %>
							<%@ include file="../admin/list_doctor.jsp"%>
						</div>	
						
						<%//患者管理 %>
						<div id="patient" style="display: none;" >
							<%// %>
							<%@ include file="../admin/list_patient.jsp"%>
						</div>	
						
						<%//场馆管理 %>
						<div id="changguan" style="display: none;" >
							<%// %>
							关于场馆管理选项，程序猿们正在努力的开发中， 客官请稍后！
						</div>	
						
						<%//学堂管理 %>
						<div id="xuetang" style="display: none;"  >
						<%// %>
							关于学堂管理选项，程序猿们正在努力的开发中， 客官请稍后！
						</div>	
						
						<%//备用选项 %>
						<div id="beixuan" style="display: none;"  >
						<%// %>
							关于备用选项选项，程序猿们正在努力的开发中， 客官请稍后！
						</div>	
					
					</td>
				</tr>

			</table>
		</div>
	</center>

</body>
</html>