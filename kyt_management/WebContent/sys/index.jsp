
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
								<td><div class=" btn btn-primary btn-block" onclick="show_hidden('reservation','question','user','null');">预约管理</div></td>
							</tr>
							<tr>
								<td><div class=" btn btn-primary btn-block" onclick="show_hidden('question','reservation','user','null');">问题列表</div></td>
							</tr>
							<tr>
								<td><div class=" btn btn-primary btn-block" onclick="show_hidden('user','reservation','question','null');">用户列表</div></td>
							</tr>
							<tr>
								<td><div class=" btn btn-primary btn-block">内容管理</div></td>
							</tr>
						</table>
					</td>

					<td width="1100px">
					
						<div id="reservation" >
							<%@ include file="index_reservation_test.jsp"%>
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

</body>
</html>