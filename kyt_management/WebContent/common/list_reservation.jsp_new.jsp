<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*"
	pageEncoding="UTF-8"%>

<%@page import="database.*"%>


<!-- 右侧 -->
<table width="90%">
	<tr>
		<!-- 右侧菜单 -->
		<td>
			<table>
				<tr>
					<!-- <td><div class=" btn btn-primary btn-block" 
								onclick="show_hidden('reservation_category_manage','outpatient_time_manage','reservation_record_manage','','','','','');">
								预约类目管理</div></td> -->
					<td><div class=" btn btn-primary btn-block" style="width: 120px;"
							onclick="show_hidden('outpatient_time_manage','reservation_category_manage','reservation_record_manage','','','','','');">
							出诊时间管理</div></td>
					<td><div class=" btn btn-primary btn-block" style="width: 120px;"
							onclick="show_hidden('reservation_record_manage','outpatient_time_manage','reservation_category_manage','','','','','');">
							预约记录管理</div></td>

				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<!-- 右侧内容 -->
		<td>
			
			<div id="outpatient_time_manage" style="display:;">

				<table>

					<tr>
					
						<td><select id="site" name="site">
								<option selected value="0">选择场馆</option>
								<option value="望京馆">望京馆</option>
								<option value="五棵松馆">五棵松馆</option>
								<option value="展览路馆">展览路馆</option>
								<option value="三里屯SOHO馆">三里屯SOHO馆</option>
						</select></td>

						<td><SELECT id="u18">
								<OPTION selected value="选择科室">选择科室</OPTION>
								<OPTION value="中医内科">中医内科</OPTION>
								<OPTION value="中医外科">中医外科</OPTION>
								<OPTION value="妇科">妇科</OPTION>
								<OPTION value="儿科">儿科</OPTION>
								<OPTION value="针推科">针推科</OPTION>
						</SELECT></td>

						<td><select id="site" name="site">
								<option selected value="0">选择时间</option>
								<option value="周一上午9:30-11:30">周一上午9:30-11:30</option>
						</select></td>

						<td><INPUT id="u92" type=text value="医生姓名" class="u92">
						<td>
						<td><INPUT id="u93" type="submit" class="u93" value="查询">
						<td>
<!--						<td><INPUT id="u93" type="submit" class="u93" value="删除">-->
						<td>
						
						
						<td >
							<INPUT id="u94" type="submit" class="u94" value="添加排期"
							onclick="ShowModalWithRoleResult('../common/add_outpatient_info.jsp','600px','800px');;return false"" >
						</td>
					</tr>

					<tr>
						<td colspan="7"><%@ include file="../common/manage_outpatient.jsp"%>
						</td>

					</tr>

					<tr>
						<td colspan="7"><hr color="<%=sysFontColor%>"></td>
					</tr>


				</table>
				<%// String reservation_user_role =  role + GROUP_INTERVAL + ""; %>
				<input id="user_role" name="user_role"  type="hidden" value="<%=role %>" readonly/>

			</div>
	
			<div id="reservation_record_manage" style="display:none;">

				<table>

					<tr>
					
						<td><select id="site" name="site">
								<option selected value="0">选择场馆</option>
								<option value="望京馆">望京馆</option>
								<option value="五棵松馆">五棵松馆</option>
								<option value="展览路馆">展览路馆</option>
								<option value="三里屯SOHO馆">三里屯SOHO馆</option>
						</select></td>

						<td><SELECT id="u18">
								<OPTION selected value="选择科室">选择科室</OPTION>
								<OPTION value="中医内科">中医内科</OPTION>
								<OPTION value="中医外科">中医外科</OPTION>
								<OPTION value="妇科">妇科</OPTION>
								<OPTION value="儿科">儿科</OPTION>
								<OPTION value="针推科">针推科</OPTION>
						</SELECT></td>

						<td><select id="site" name="site">
								<option selected value="0">选择时间</option>
								<option value="周一上午9:30-11:30">周一上午9:30-11:30</option>
						</select></td>

						<td><INPUT id="u92" type=text value="医生姓名" class="u92">
						<td>
						<td><INPUT id="u93" type="submit" class="u93" value="取消">
						<td>
						<td><INPUT id="u93" type="submit" class="u93" value="履约">
						<td>
						<td><INPUT id="u94" type="submit" class="u94" value="爽约"
							>
						<td>
					</tr>

					<tr>
						<td colspan="7"><%@ include
								file="../common/manage_reservation_record.jsp"%>

						</td>

					</tr>

					<tr>
						<td colspan="7"><hr color="<%=sysFontColor%>"></td>
					</tr>


				</table>

			</div>

		</td>

	</tr>
</table>
