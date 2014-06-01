<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*"
	pageEncoding="UTF-8"%>

<%@page import="database.*"%>

<%
	//System.out.println("USERID:" + USERID +"\nUSERROLE:" + USERROLE + "\n");
	if(USERROLE==0){ //患者
		/* ReserveClinicDao reserveClinicDao = new ReserveClinicDao(); */
	
	%>

<center>

	<%
					ReserveClinicDao reserveClinicDao = new ReserveClinicDao();
					reserveClinicDao.retrive_patien_reservation(USERID);
					
				
					
					%>


	<!--		<table width="90%"><tr><td><hr color="<%//=sysFontColor %>" ></td></tr></table>-->
	<!--		<div id="ConsumerRecords"  class="ConsumerRecords" style="display:none">-->
	<%if(reserveClinicDao.clinic_site.size()!=0){  %>
	<table width="100%">
		<tr>
			<td align="center" colspan="4"><strong>门诊预约</strong></td>

		</tr>
		<tr>
			<td align="center" width="25%"><strong>诊疗机构</strong></td>
			<td align="center" width="25%"><strong>科室</strong></td>
			<td align="center" width="25%"><strong>医生</strong></td>
			<td align="center" width="25%"><strong>预约时间</strong></td>
		</tr>



		<%
				
					for(int i=0;i<reserveClinicDao.clinic_site.size();i++){
				
					
					%>

		<tr>
			<td align="center"><%=reserveClinicDao.clinic_site.get(i) %></td>
			<td align="center"><%=reserveClinicDao.clinic_department.get(i) %></td>
			<td align="center"><%=reserveClinicDao.clinic_doctor_name.get(i) %></td>
			<td align="center"><%=reserveClinicDao.clinic_date.get(i) %></td>
		</tr>
		<%} %>



	</table>
	<%} %>

	<%if(!(reserveClinicDao.shanggongfang_adjust_programe.size() == 0 && reserveClinicDao.shanggongfang_assess_programe.size() == 0)){ %>
	<table width="90%">
		<tr>
			<td colspan="5"><hr color="<%=sysFontColor %>"></td>
		</tr>


		<tr>
			<td align="center" colspan="5"><strong>健康服务</strong></td>

		</tr>

		<tr>
			<td align="center" width="20%"><strong>服务名称</strong></td>
			<td align="center" width="20%"><strong>项目</strong></td>
			<td align="center" width="20%"><strong>时间</strong></td>
			<td align="center" width="20%"><strong>老师</strong></td>
			<td align="center" width="20%"><strong>报名者</strong></td>
		</tr>



		<%
					for(int i=0;i<reserveClinicDao.shanggongfang_adjust_programe.size();i++){	
					
					%>
		<tr>
			<td align="center"><%=reserveClinicDao.shanggongfang_adjust_type.get(i) %></td>
			<td align="center"><%=reserveClinicDao.shanggongfang_adjust_programe.get(i) %></td>
			<td align="center"><%=reserveClinicDao.shanggongfang_adjust_book_date.get(i) %></td>
			<td align="center"><%=reserveClinicDao.shanggongfang_adjust_book_master.get(i) %></td>
			<td align="center"><%=reserveClinicDao.shanggongfang_adjust_name.get(i) %></td>
		</tr>
		<%} %>

		<%
					for(int i=0;i<reserveClinicDao.shanggongfang_assess_programe.size();i++){	
					
					%>
		<tr>
			<td align="center"><%=reserveClinicDao.shanggongfang_assess_type.get(i) %></td>
			<td align="center"><%=reserveClinicDao.shanggongfang_assess_programe.get(i) %></td>
			<td align="center"><%=reserveClinicDao.shanggongfang_assess_book_date.get(i) %></td>
			<td align="center"><%=reserveClinicDao.shanggongfang_assess_book_master.get(i) %></td>
			<td align="center"><%=reserveClinicDao.shanggongfang_assess_name.get(i) %></td>
		</tr>
		<%} %>








	</table>
	<%} %>


	<%if(reserveClinicDao.xuetang.size()!=0){ %>
	<table width="90%">
		<tr>
			<td colspan="2"><hr color="<%=sysFontColor %>"></td>
		</tr>

		<tr>
			<td align="center" colspan="2"><strong>招生在线</strong></td>

		</tr>
		<tr>
			<td align="center" width="50%"><strong>学堂名称</strong></td>
			<td align="center" width="50%"><strong>报名者</strong></td>

		</tr>



		<%
				
					for(int i=0;i<reserveClinicDao.xuetang.size();i++){
				
					
					%>

		<tr>
			<td align="center"><%=reserveClinicDao.xuetang.get(i) %></td>
			<td align="center"><%=reserveClinicDao.xuetang_name.get(i) %></td>
		</tr>
		<%} %>
	</table>
	<%} %>

	<%if(reserveClinicDao.clinic_site.size()==0 && reserveClinicDao.shanggongfang_adjust_programe.size() == 0 && reserveClinicDao.shanggongfang_assess_programe.size() == 0 && reserveClinicDao.xuetang.size()==0){ %>
	您暂时没有预约！
	<%} %>
	<!--		</div>-->
</center>

<%-- <%
	}else if(USERROLE==1){ //医生
		//UserDaoDoctor userDaoDoctor = new UserDaoDoctor();
	%>
		 --%>
<%}%>


