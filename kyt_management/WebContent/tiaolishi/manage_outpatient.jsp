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
					<td align="center" width=""><strong>出诊时间</strong></td>
					<td align="center" width=""><strong>预约总数</strong></td>	
					<td align="center" width=""><strong>已预约数</strong></td>	
					<td align="center" width=""><strong>剩余预约数</strong></td>					
					<td align="center" width=""><strong>操作</strong></td>
					
				</tr>				
						<%
					ReserveClinicDao outpatient_dao = new ReserveClinicDao();
						HashMap hm = new HashMap();
						String outpatient_user_role =  role + GROUP_INTERVAL + "";
						outpatient_dao.retrive_outpatient(hm,outpatient_user_role);
					for(int i=0;i<outpatient_dao.outpatient_id.size();i++){
				
					
					%>
							<tr style="height: 40px; line-height: 40px;">
								<td align="center"><%=outpatient_dao.clinic_site.get(i) %>
								<td align="center"><%=outpatient_dao.outpatient_type.get(i)%></td>
								<td align="center"><%=outpatient_dao.clinic_department.get(i)%></td>
								<td align="center"><%=outpatient_dao.clinic_doctor_name.get(i)%></td>
								<td align="center"><%=outpatient_dao.outpatient_day.get(i) %><%=outpatient_dao.ampm.get(i) %><%=outpatient_dao.time.get(i) %></td>
								<td align="center"><%=outpatient_dao.total_amount.get(i) %></td>
								<td align="center"><%=outpatient_dao.used_amount.get(i) %></td>
								<td align="center"><%=outpatient_dao.amount.get(i) %></td>
								
							
								<td>
									<% if(outpatient_dao.status.get(i) == 0){ %>
									<!-- <div align="center" class="ASKSubmit_no"
										style="height: 30px; line-height: 30px; font-size:15px;width:60px;margin:0px" onclick="" >已停诊
									</div> -->
									<p id="submit_adjust_link"   style='color: red;'>停&nbsp;诊</p>
									<%} else { %>
									<p id="submit_adjust_link"  style='color: green;'>正&nbsp;常</p>
									<%}%>
									
								</td>

							</tr>
					<%} %>	
			
</table>