
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
	
	<script language='javascript' type='text/javascript'>
	function jumpOut(){
		location.href = '../exit/index.jsp';
	}
	</script>
	
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
		<%
		String role_string = loginRole;
		if(null==role_string||role_string.equals("")){
		%>
			<script language='javascript' type='text/javascript'>
				location.href = '../index.jsp';
			</script>
		<%
		}else{
			int role = Integer.parseInt(role_string);
			if(role==0){
			%>
				<%@ include file="common.jsp"%>
			<%	
			}else if(role==1){
			%>
				<%@ include file="admin.jsp"%>
			<%				
			}else if(role>GROUP_INTERVAL){
				role = role - GROUP_INTERVAL;//场馆id
				ChangGuanDao changGuanDao = new ChangGuanDao();
				String name = changGuanDao.getChangGuanName_by_id(role);
				%>
				<%@ include file="changguan.jsp"%>
				<%
			}
		}
		%>
			
		</div>
	</center>

</body>
</html>