<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*"
	pageEncoding="UTF-8"%>

<%@page import="database.*"%>
<%@page import="dao.*"%>
<%@ include file="../check/index.jsp"%>
<%//@ include file="../check/checkAdmin.jsp"%>

<table width="100%" align="center" border="1" cellpadding="0"
	cellspacing="0" rules=rows>
	<tr align="center" bgcolor="#D5D5D5">
		<td align="center" width="6%"><strong>编号</strong></td>
		<td align="center" width="12%"><strong>姓名</strong></td>
		<td align="center" width="6%"><strong>性别</strong></td>
		<td align="center" width="6%"><strong>年龄</strong></td>
		<td align="center" width="14%"><strong>手机</strong></td>
		<td align="center" width="9"><strong>师从</strong></td>
		<td align="center" width="12%"><strong>医师证号</strong></td>
		<td align="center" width="9%"><strong>科室</strong></td>
		<td align="center" width="9%"><strong>职 称</strong></td>
		<td align="center" width="7%"><strong>审核状态</strong></td>
		<td align="center" width="10%"><strong>操作</strong></td>


	</tr>
</table>

	<%
		request.setCharacterEncoding("utf-8");
		//String user_role = (String)request.getsession().getAttribute("adminCheck");
    	//String checkedName = (String)session.getAttribute("loginedUserName");
    	String user_role = (String)session.getAttribute("adminCheck");
	
	
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
						<%=(null==doctor_dao.doctor_department.get(i)||doctor_dao.doctor_department.get(i).equals(""))?"暂无":doctor_dao.doctor_department.get(i)%>
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
		<td align="center" width="10%" valign="middle">
			<form class="form-horizontal"
				id="shopForm<%=doctor_dao.doctor_id.get(i)%>" method="post"
				action="../admin/approve_doctor.jsp?type=edit&doctor_id=<%=doctor_dao.doctor_id.get(i)%>">
				<div class="view">
					<!-- Button to trigger modal -->
					<div align="right">
						<center>
							<a id="myModalLinkShop<%=doctor_dao.doctor_id.get(i)%>"
								href="#myModalContainerShop<%=doctor_dao.doctor_id.get(i)%>"
								role="button" class="btn btn-primary" data-toggle="modal">编辑</a>
								
							
						</center>
					</div>
					<!-- Modal -->
					<div id="myModalContainerShop<%=doctor_dao.doctor_id.get(i)%>"
						class="modal hide fade" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabelShop<%=doctor_dao.doctor_id.get(i)%>"
						aria-hidden="true">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h3 id="myModalLabelShop<%=doctor_dao.doctor_id.get(i)%>"
								contenteditable="true">医生资质审核</h3>
						</div>

						<div class="modal-body">


							<table width="60%" align="center" border="0" cellpadding="0"
								cellspacing="0">
								<tr>
									<td align="left" width="49%">姓名:</td>
									<td align="center" width="50%"><input style="height: 30px"
										type="text" name="shopName<%=doctor_dao.doctor_id.get(i)%>"
										id="shopName<%=doctor_dao.doctor_id.get(i)%>"
										style="width:90%;" value="<%=doctor_dao.doctor_name.get(i)%>" readonly="readonly"/></td>
									<td width="1%"><a style="color: red;">&nbsp;&nbsp;</a></td>
								</tr>

								<tr>
									<td align="left" width="49%">性别:</td>
									<td align="center" width="50%"><input style="height: 30px"
										type="text" id="shopKeeper<%=doctor_dao.doctor_id.get(i)%>"
										name="shopKeeper<%=doctor_dao.doctor_id.get(i)%>"
										style="width:90%;"
										value="<%=doctor_dao.doctor_gender.get(i)%>"  readonly="readonly"/></td>
									<td width="1%"><a style="color: red;">&nbsp;&nbsp;</a></td>
								</tr>
								<tr>
									<td align="left" width="49%">年龄:</td>
									<td align="center" width="50%"><input style="height: 30px"
										type="text"
										id="shopKeeperTel<%=doctor_dao.doctor_id.get(i)%>"
										name="shopKeeperTel<%=doctor_dao.doctor_id.get(i)%>"
										style="width:90%;" value="<%=doctor_dao.doctor_age.get(i)%>" readonly="readonly"/></td>
									<td width="1%"><a style="color: red;">&nbsp;&nbsp;</a></td>
								</tr>

								<tr>
									<td align="left" width="49%">手机:</td>
									<td align="center" width="50%"><input style="height: 30px"
										type="text"
										id="shopKeeperTel<%=doctor_dao.doctor_id.get(i)%>"
										name="shopKeeperTel<%=doctor_dao.doctor_id.get(i)%>"
										style="width:90%;"
										value="<%=doctor_dao.doctor_mobile.get(i)%>" readonly="readonly"/></td>
									<td width="1%"><a style="color: red;">&nbsp;&nbsp;</a></td>
								</tr>


								<tr>
									<td align="left" width="49%">师从:</td>
									<td align="center" width="50%"><input style="height: 30px"
										type="text"
										id="shopKeeperTel<%=doctor_dao.doctor_id.get(i)%>"
										name="shopKeeperTel<%=doctor_dao.doctor_id.get(i)%>"
										style="width:90%;"
										value="<%=doctor_dao.doctor_master.get(i)%>" readonly="readonly"/></td>
									<td width="1%"><a style="color: red;">&nbsp;&nbsp;</a></td>
								</tr>
								<tr>
									<td align="left" width="49%">医师证号:</td>
									<td align="center" width="50%"><input style="height: 30px"
										type="text"
										id="shopKeeperTel<%=doctor_dao.doctor_id.get(i)%>"
										name="shopKeeperTel<%=doctor_dao.doctor_id.get(i)%>"
										style="width:90%;"
										value="<%=doctor_dao.doctor_doctor_criteria.get(i)%>" readonly="readonly"/></td>
									<td width="1%"><a style="color: red;">&nbsp;&nbsp;</a></td>
								</tr>
								<tr>
									<td align="left" width="49%">科室:</td>
									<td align="center" width="50%"><input style="height: 30px"
										type="text"
										id="shopKeeperTel<%=doctor_dao.doctor_id.get(i)%>"
										name="shopKeeperTel<%=doctor_dao.doctor_id.get(i)%>"
										style="width:90%;"
										value="<%=doctor_dao.doctor_department.get(i)%>" readonly="readonly"/></td>
									<td width="1%"><a style="color: red;">&nbsp;&nbsp;</a></td>
								</tr>
								<tr>
									<td align="left" width="49%">职 称:</td>
									<td align="center" width="50%"><input style="height: 30px"
										type="text"
										id="shopKeeperTel<%=doctor_dao.doctor_id.get(i)%>"
										name="shopKeeperTel<%=doctor_dao.doctor_id.get(i)%>"
										style="width:90%;"
										value="<%=doctor_dao.doctor_title.get(i)%>" readonly="readonly"/></td>
									<td width="1%"><a style="color: red;">&nbsp;&nbsp;</a></td>
								</tr>
								<tr>
									<td align="left" width="49%"><p style="color: red;">审核:</p></td>
									<td align="center" width="50%">
										<table width="100%">
											<tr align="center">
												<td align="right" width="35%">不通过</td>
												<td valign="middle" align="left" width="15%">
													<input type="radio" checked name="radio<%=doctor_dao.doctor_id.get(i)%>" value="0"></td>
					
												<td align="right" width="35%">通过</td>
												<td valign="middle" align="left" width="15%">
													<input type="radio" name="radio<%=doctor_dao.doctor_id.get(i)%>" value="1"></td>
											</tr>
										</table>
									</td>									
								</tr>

							</table>

						</div>

						<div class="modal-footer">

							<table width="95%">
								<tr>
									<td width="66%" align="center" valign="top">&nbsp;
										<div id="msgShop<%=doctor_dao.doctor_id.get(i)%>"></div>
									</td>
									<td width="17%" align="center" valign="bottom">
										<button class="btn" data-dismiss="modal" aria-hidden="true"
											contenteditable="true">取消</button>
									</td>
									<td width="17%" align="center" valign="bottom"><input
										class="btn btn-primary" type="submit" value="提交审核" /></td>
								</tr>
							</table>

						</div>
					</div>
					
						
				</div>
			</form>
				
					<form class="form-horizontal"
				id="shopForm<%=doctor_dao.doctor_id.get(i)%>" method="post"
				action="../admin/assign_site_for_doctor.jsp?type=edit&doctor_id=<%=doctor_dao.doctor_id.get(i)%>">
				<div class="view">
					<!-- Button to trigger modal -->
					<div align="right">
						<center>
						
							<a id="myModalLinkSite<%=doctor_dao.doctor_id.get(i)%>"
								href="#myModalContainerSite<%=doctor_dao.doctor_id.get(i)%>"
								role="button" class="btn btn-primary" data-toggle="modal">场馆分配</a>
						</center>
					</div>
					<!-- Modal -->
					
					
						<div id="myModalContainerSite<%=doctor_dao.doctor_id.get(i)%>"
						class="modal hide fade" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabelShop<%=doctor_dao.doctor_id.get(i)%>"
						aria-hidden="true">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h3 id="myModalLabelShop<%=doctor_dao.doctor_id.get(i)%>"
								contenteditable="true">场馆分配</h3>
						</div>

						<div class="modal-body">


							<table width="60%" align="center" border="0" cellpadding="0"
								cellspacing="0">
								<tr>
									<td align="left" width="49%">姓名:</td>
									<td align="center" width="50%"><input style="height: 30px"
										type="text" name="shopName<%=doctor_dao.doctor_id.get(i)%>"
										id="shopName<%=doctor_dao.doctor_id.get(i)%>"
										style="width:90%;" value="<%=doctor_dao.doctor_name.get(i)%>" readonly="readonly"/></td>
									<td width="1%"><a style="color: red;">&nbsp;&nbsp;</a></td>
								</tr>

								<tr>
								<td align="left"><strong>场馆</strong></td>
								<td colspan="2"><select id="site" name="site">
								<OPTION selected="" value="0">选择场馆</OPTION>
										<%
		request.setCharacterEncoding("utf-8");
		ReserveClinicDao site_dao = new ReserveClinicDao();

		site_dao.retrive_sites();

		for (int j = 0; j < site_dao.site_id.size(); j++) {
	%>
	<option value='<%=site_dao.site_id.get(j) %>'"><%=site_dao.site_name.get(j) %></option>
	
									
										<%} %>
								</select></td>
							</tr>
							

							</table>

						</div>

						<div class="modal-footer">

							<table width="95%">
								<tr>
									<td width="66%" align="center" valign="top">&nbsp;
										<div id="msgShop<%=doctor_dao.doctor_id.get(i)%>"></div>
									</td>
									<td width="17%" align="center" valign="bottom">
										<button class="btn" data-dismiss="modal" aria-hidden="true"
											contenteditable="true">取消</button>
									</td>
									<td width="17%" align="center" valign="bottom"><input
										class="btn btn-primary" type="submit" value="分配" /></td>
								</tr>
							</table>

						</div>
					</div>
				</div>
			</form>
		
		
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
