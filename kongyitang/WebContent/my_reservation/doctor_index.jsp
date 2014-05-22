<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
	
	 <%@page import="database.*" %> 
	 	
	<%
	//System.out.println("USERID:" + USERID +"\nUSERROLE:" + USERROLE + "\n");
	if(USERROLE==1){ //医生
		//UserDaoDoctor userDaoDoctor = new UserDaoDoctor();
	%>
		<center>
	
		
<!--		<table width="90%"><tr><td><hr color="<%//=sysFontColor %>" ></td></tr></table>-->
<!--		<div id="ConsumerRecords"  class="ConsumerRecords" style="display:none">-->
			<table width="100%">
				<tr>
					<td align="center" colspan="4"><strong>门诊预约</strong></td>
				
				</tr>
			
				<tr>
					<td align="center" width="20%"><strong>诊疗机构</strong></td>
					<td align="center" width="20%"><strong>科室</strong></td>
					<td align="center" width="20%"><strong>患者</strong></td>
					<td align="center" width="20%"><strong>预约目的</strong></td>
					<td align="center" width="20%"><strong>预约时间</strong></td>
				</tr>
				
				
				
					<%
					ReserveClinicDao reserveClinicDao = new ReserveClinicDao();
					reserveClinicDao.retrive_doctor_reservation(USERID);
					for(int i=0;i<reserveClinicDao.clinic_doctor_site.size();i++){
				
					
					%>
				
				<tr>
					<td align="center"><%=reserveClinicDao.clinic_doctor_site.get(i) %></td>
					<td align="center"><%=reserveClinicDao.clinic_doctor_department.get(i) %></td>
					<td align="center"><%=reserveClinicDao.clinic_doctor_patient_name.get(i) %></td>
					<td align="center"><%=reserveClinicDao.clinic_doctor_purpose.get(i) %></td>
					<td align="center"><%=reserveClinicDao.clinic_doctor_date.get(i) %></td>
				</tr>
				<%} %>
				
			
			
			</table>
			
			
			
			
			
			
				
				
				
		
			
			</table>
			
			
<!--		</div>-->
		</center>
	<%}%>


  