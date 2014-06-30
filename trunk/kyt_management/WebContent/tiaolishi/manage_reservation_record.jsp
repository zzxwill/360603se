<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="dao.*" %>
<%@ include file="../check/checkTiaoLiShi.jsp"%> 
<%//@ include file="../check/checkAdmin.jsp"%>  

<script type="text/javascript">
	//取消预约时的确认  Will 6/16/2014
	function show_confirm(msg) 
{ 
 return confirm(msg); 

} 
	</script>

<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0" rules=rows>
	<tr align="center" bgcolor="#D5D5D5">
					<td align="center" width=""><strong>场馆</strong></td>
					<td align="center" width=""><strong>类型</strong></td>
					<td align="center" width=""><strong>科室</strong></td>
					<td align="center" width=""><strong>医生</strong></td>
					<td align="center" width=""><strong>用户姓名</strong></td>
					<td align="center" width=""><strong>手机号</strong></td>
					<td align="center" width=""><strong>预约时间</strong></td>
					<td align="center" width=""><strong>状态</strong></td>					
					
				</tr>				
						<%
					ReserveClinicDao reservation_dao = new ReserveClinicDao();
						
						reservation_dao.retrive_patient_reservation(role);
					for(int i=0;i<reservation_dao.clinic_reservation_id.size();i++){
					
					%>
							<tr style="height: 40px; line-height: 40px;">
								<td align="center"><%=reservation_dao.clinic_site.get(i) %>
								<td align="center"><%=reservation_dao.clinic_type.get(i)%></td>
								<td align="center"><%=reservation_dao.clinic_department.get(i)%></td>
								<td align="center"><%=reservation_dao.user_name.get(i)%></td>						
								<td align="center"><%=reservation_dao.clinic_doctor_name.get(i)%></td>
								<td align="center"><%=reservation_dao.user_mobile.get(i)%></td>	
								<td align="center"><%=reservation_dao.date.get(i) %><%=reservation_dao.day.get(i) %><%=reservation_dao.ampm.get(i) %><%=reservation_dao.time.get(i) %></td>
								<td align="center"><%=reservation_dao.clinic_treat_text.get(i) %></td>

							</tr>
					<%} %>	
			
</table>