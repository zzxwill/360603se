<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*,java.text.DateFormat,java.text.SimpleDateFormat,java.util.Date"
	pageEncoding="UTF-8"%>

<%@page import="database.*"%>

<%
	//System.out.println("USERID:" + USERID +"\nUSERROLE:" + USERROLE + "\n");
	if(USERROLE==0){ //患者
		/* ReserveClinicDao reserveClinicDao = new ReserveClinicDao(); */
	
	%>

<center>
<form name="verifyForm" id="verifyForm" method="post"
				action="cancell_reservation.jsp">

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
			<td align="center" width="20%"><strong>诊疗机构</strong></td>
			<td align="center" width="20%"><strong>科室</strong></td>
			<td align="center" width="20%"><strong>医生</strong></td>
			<td align="center" width="20%"><strong>预约时间</strong></td>
			<td align="center" width="20%"><strong>操作</strong></td>
		</tr>



		<%
				
					for(int i=0;i<reserveClinicDao.clinic_site.size();i++){
				
					
					%>

		<tr>
			<td align="center"><%=reserveClinicDao.clinic_site.get(i) %></td>
			<td align="center"><%=reserveClinicDao.clinic_department.get(i) %></td>
			<td align="center"><%=reserveClinicDao.clinic_doctor_name.get(i) %></td>
			<td align="center"><%=reserveClinicDao.clinic_date.get(i) %>&nbsp;<%=reserveClinicDao.clinic_time.get(i) %></td>
			<td align="center">
			<%Date currentTime = new Date();
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String date = dateFormat.format(currentTime);
			if(reserveClinicDao.clinic_treat_flag.get(i) == 2){
			%>
			<div align="center" class="ASKSubmit_no"
										style="height: 30px; line-height: 30px; font-size:15px;width:60px;margin:0px" onclick="" >已取消
									</div>
			<%
			
			}else if(date.compareTo(reserveClinicDao.clinic_date.get(i))>=0 && reserveClinicDao.clinic_treat_flag.get(i) != 2){
			%>
			
			<div align="center" class="ASKSubmit_no"
										style="height: 30px; line-height: 30px; font-size:15px;width:60px;margin:0px" onclick="" >取消
									</div>
			
			
			
			<%	
			}else {
				%>	
			<div align="center" class="ASKSubmit"
										style="height: 30px; line-height: 30px; font-size:15px;width:60px;margin:0px" >
										<a id="submit_adjust_link" style="color: white;" href="../my_reservation/cancell_reservation.jsp?clinic_reservation_normal_id=<%=reserveClinicDao.clinic_reservation_normal_id.get(i) %>" ><big>取消</big></a>
									</div>	
								
		
			
			<%
			}%>
			</td>
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
	</form>
</center>

<%-- <%
	}else if(USERROLE==1){ //医生
		//UserDaoDoctor userDaoDoctor = new UserDaoDoctor();
	%>
		 --%>
<%}%>


