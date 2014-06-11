<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="database.*" %>

						
						<!-- 右侧 -->
						<table width="90%">
							<tr>
								<!-- 右侧菜单 -->
								<td>
									<table border="1" cellspacing="0" cellpadding="0">
										<tr>
											<td>预约类目管理</td>
											<td>出诊时间管理</td>
											<td>预约记录管理</td>
										</tr>
									</table>
								</td>
							</tr>

							<tr>
								<!-- 右侧内容 -->
								<td>
									<table width="100%" border="0" cellpadding="0" cellspacing="0"
										style='border-collapse: collapse; table-layout: fixed;'>
										<tr height="19" style='height: 14.25pt;'>
											<td height="19" width="72"
												style='height: 14.25pt; width: 54.00pt;'>场馆</td>
											<td width="341" style='width: 255.75pt;'>门诊科室</td>
											<td width="163" style='width: 122.25pt;'>健康服务类目</td>
											<td width="72" style='width: 54.00pt;'><a
												id="submit_adjust_link" onclick="return show_confirm();"
												href="../my_reservation/cancell_reservation.jsp?type=adjust&clinic_reservation_normal_id=\%>"><big>添加场馆</big></a>


											</td>
										</tr>

										<tr>
											<td colspan="4"><hr color="<%=sysFontColor%>"></td>
										</tr>

										<tr height="38" style='height: 28.50pt;'>
											<td height="38" style='height: 28.50pt;' x:str>望京馆</td>
											<td x:str>中医内科、中医外科、妇科、儿科、针推科</td>
											<td class="xl22" x:str>健康评估、健康调理<br />健康沙龙、健康讲座
											</td>
											<td x:str>修改 删除</td>
										</tr>

										<tr>
											<td colspan="4"><hr color="<%=sysFontColor%>"></td>
										</tr>

										<tr height="38" style='height: 28.50pt;'>
											<td height="38" style='height: 28.50pt;' x:str>展览路馆</td>
											<td x:str>中医内科、中医外科、妇科、儿科、针推科</td>
											<td class="xl22" x:str>健康评估、健康调理<br />健康沙龙、健康讲座
											</td>
											<td x:str>修改 删除</td>
										</tr>

										<tr>
											<td colspan="4"><hr color="<%=sysFontColor%>"></td>
										</tr>

										<tr height="19" style='height: 14.25pt;'>
											<td height="19" style='height: 14.25pt;' x:str>五棵松馆</td>
											<td x:str>中医内科、中医外科、妇科、儿科、针推科</td>
											<td />
											<td x:str>修改 删除</td>
										</tr>

										<tr>
											<td colspan="4"><hr color="<%=sysFontColor%>"></td>
										</tr>
										<tr height="38" style='height: 28.50pt;'>
											<td height="38" style='height: 28.50pt;' x:str>三里屯SOH<span
												style='display: none;'>O馆</span></td>
											<td x:str>中医内科、中医外科、妇科、儿科、针推科</td>
											<td class="xl22" x:str>健康评估、健康调理<br />健康沙龙、健康讲座
											</td>
											<td x:str>修改 删除</td>
										</tr>
										<tr>
											<td colspan="4"><hr color="<%=sysFontColor%>"></td>
										</tr>
									</table>



									<table width="648" border="0" cellpadding="0" cellspacing="0"
										style='width: 486.00pt; border-collapse: collapse; table-layout: fixed;'>
										<tr height="19" style='height: 14.25pt;'>
											<td height="19" width="72"
												style='height: 14.25pt; width: 54.00pt;'>招生在线</td>
											<td width="72" style='width: 54.00pt;'><a
												id="submit_adjust_link" onclick="return show_confirm();"
												href="../my_reservation/cancell_reservation.jsp?type=adjust&clinic_reservation_normal_id=\%>"><big>添加学堂</big></a>


											</td>
										</tr>

										<tr>
											<td colspan="2"><hr color="<%=sysFontColor%>"></td>
										</tr>

										<tr height="38" style='height: 28.50pt;'>
											<td height="38" style='height: 28.50pt;' x:str>科普学堂</td>

											<td x:str>修改 删除</td>
										</tr>
										<tr>
											<td colspan="2"><hr color="<%=sysFontColor%>"></td>
										</tr>

										<tr height="38" style='height: 28.50pt;'>
											<td height="38" style='height: 28.50pt;' x:str>紫禁学堂</td>

											<td x:str>修改 删除</td>
										</tr>
										<tr>
											<td colspan="2"><hr color="<%=sysFontColor %>"></td>
										</tr>

										<tr height="38" style='height: 28.50pt;'>
											<td height="38" style='height: 28.50pt;' x:str>国医学堂</td>

											<td x:str>修改 删除</td>
										</tr>
										<tr>
											<td colspan="2"><hr color="<%=sysFontColor %>"></td>
										</tr>

										<tr height="38" style='height: 28.50pt;'>
											<td height="38" style='height: 28.50pt;' x:str>翰林学堂</td>

											<td x:str>修改 删除</td>
										</tr>
									</table>



								</td>

							</tr>
						</table>
