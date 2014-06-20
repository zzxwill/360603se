<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*"
	pageEncoding="UTF-8"%>

<%@page import="database.*"%>
<%@page import="dao.*"%>
<%@ include file="../check/index.jsp"%>
<%//@ include file="../check/checkAdmin.jsp"%>

<table width="100%" align="center" border="1" cellpadding="0"
	cellspacing="0" rules=rows>
	<tr align="center" bgcolor="#D5D5D5">
		<th align="center" width="4%"><strong>编号</strong></th>
		<th align="center" width="6%"><strong>姓名</strong></th>
		<th align="center" width="6%"><strong>性别</strong></th>
		<th align="center" width="6%"><strong>年龄</strong></th>
		<th align="center" width="14%"><strong>手机</strong></th>
		<th align="center" width="9%"><strong>师从</strong></th>
		<td align="center" width="12%"><strong>医师证号</strong></th>
		<th align="center" width="9%"><strong>科室</strong></th>
		<th align="center" width="9%"><strong>职 称</strong></th>
		<th align="center" width="9%"><strong>场馆</strong></th>
		<th align="center" width="7%"><strong>审核状态</strong></th>

	</tr>
</table>

	<%
		request.setCharacterEncoding("utf-8");

		String user_role =  role + GROUP_INTERVAL + "";
		//String user_role = (String)session.getAttribute("adminCheck");
	
	    DepartmentDao  departmentDao_changguan = new DepartmentDao();
		UserDao doctor_dao = new UserDao();

		doctor_dao.retrive_doctors(user_role);

		for (int i = 0; i < doctor_dao.doctor_id.size(); i++) {
	%>
<table width="100%" align="center" border="1" cellpadding="0"
	cellspacing="0" rules=rows>
	<tr align="center" width="100%">
		<td align="center" width="45%">
			<table align="center" width="100%">
				<tr>
					<td align="center" width="15%"><%=doctor_dao.doctor_id.get(i)%></td>
					<td align="center" width="25%"><%=doctor_dao.doctor_name.get(i)%></td>
					<td align="center" width="15%"><%=doctor_dao.doctor_gender.get(i)%></td>
					<td align="center" width="15%"><%=doctor_dao.doctor_age.get(i)%></td>
					<td align="center" width="30%"><%=doctor_dao.doctor_mobile.get(i)%></td>
				</tr>
			</table>
		</td>
		<td align="center" width="45%">
			<table align="center" width="100%">
				<tr>
					<td align="center" width="20%"><%=doctor_dao.doctor_master.get(i)%></td>
					<td align="center" width="25%">
						<%=(null==doctor_dao.doctor_doctor_criteria.get(i)||doctor_dao.doctor_doctor_criteria.get(i).equals(""))?"暂无":doctor_dao.doctor_doctor_criteria.get(i)%>
					</td>
					<td align="center" width="20%">
					<%
						if(null==doctor_dao.doctor_department.get(i)||doctor_dao.doctor_department.get(i).equals("")){
						%>
							暂无
						<%	
						}else{
							int departmentID = Integer.parseInt(doctor_dao.doctor_department.get(i));
							String departmentName = departmentDao_changguan.getDepartmentName(departmentID);
							%>
							<%=departmentName %>
							<%	
						}
					%>
					</td>
					<td align="center" width="20%">
						<%=(null==doctor_dao.doctor_title.get(i)||doctor_dao.doctor_title.get(i).equals(""))?"暂无":doctor_dao.doctor_title.get(i)%>
					</td>
					<td align="center" width="30%"><%=doctor_dao.site_name.get(i)%></td>
					<td align="center" width="15%">
						<%//=doctor_dao.doctor_validate_flag.get(i)%>
						<%=(doctor_dao.doctor_validate_flag.get(i).equals("否"))?"<p style='color: red;'>未审核</p>":"<p style='color: green;'>已审核</p>"%>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<%
	if(!((null==doctor_dao.doctor_criteria_photo.get(i))||(doctor_dao.doctor_criteria_photo.get(i).equals("")))){
	%>	
	<tr>
		<td align="center" width="45%"><strong>医生&nbsp;<%=i+1 %>：</strong>
			<%
			if(!((null==doctor_dao.doctor_criteria_photo.get(i))||(doctor_dao.doctor_criteria_photo.get(i).equals("")))){
			%>
				<img src="<%=D_IMAGES %><%=doctor_dao.doctor_criteria_photo.get(i) %>" border = "0px" width="80%"/>
			<%	
			}
			%>
		</td>
		<td align="center" width="45%">
			<%
			if(!((null==doctor_dao.doctor_portrait.get(i))||(doctor_dao.doctor_portrait.get(i).equals("")))){
			%>
				<img src="<%=D_IMAGES %><%=doctor_dao.doctor_portrait.get(i) %>" border = "0px" width="80%"/>
			<%	
			}
			%>
		</td>
		<td align="center" width="10%"></td>
	
	</tr>
	<%	
	}
	%>
	
	<%} %>
</table>
