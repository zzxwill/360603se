<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>


<script type="text/javascript" src="../js/tiaolishi.js"></script> 
	<table width="100%">
		<tr>

			<td width="120px" valign="top">
				<!-- 左侧菜单 -->
				<table  width="120px"  border="0" cellspacing="0" cellpadding="0"  >
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_tiaolishi_hidden('yuyue','doctor','patient','question','user');">
						预约列表</div></td>
					</tr>
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_tiaolishi_hidden('question','doctor','patient','user','yuyue');">
						问题列表</div></td>
					</tr>
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_tiaolishi_hidden('doctor','patient','question','user','yuyue');">
						医生管理</div></td>
					</tr>
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_tiaolishi_hidden('patient','doctor','question','user','yuyue');">
						患者管理</div></td>
					</tr>
					
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_tiaolishi_hidden('user','question','doctor','patient','yuyue');">
						用户管理</div></td>
					</tr>
					
				</table>
			</td>

			<td width="1100px" valign="top">
				
				<%//预约列表 %>
				<div id="yuyue" >
				<%// %>
				<script>
				  
				   function getModuleParameter() {
					    var url = location.search; //获取url中"?"符后的字串
					    //alert("url:" + url);
					    var parameter = null;
					    if (url.indexOf("?")!= -1) {
					    	var pos = url.lastIndexOf("=");
					    	parameter = url.substring(pos+1,url.length);
					    	if(parameter!="yuyue"){
					    		document.getElementById("yuyue").style.display = "none";
					    	}
					    }
					    return parameter;
					}
					
					var module = getModuleParameter();
					
					//alert("module:" + module);
					$(document).ready(function(){
						if(module=="yuyue"){
							document.getElementById("yuyue").style.display = "block";
						}
						else if(module=="patient"){
							document.getElementById("yuyue").style.display = "none";
							document.getElementById("patient").style.display = "block";
						}
						else if(module=="question"){
							document.getElementById("yuyue").style.display = "none";
							document.getElementById("question").style.display = "block";
						}
						else if(module=="user"){
							document.getElementById("yuyue").style.display = "none";
							document.getElementById("user").style.display = "block";
						}
						else if(module=="doctor"){
							document.getElementById("yuyue").style.display = "none";
							document.getElementById("doctor").style.display = "block";
						}
				 
				   });
				</script>
					
					<%//@ include file="../tiaolishi/manage_reservation_record.jsp"%>
					<%@ include file="../tiaolishi/list_reservation.jsp_new.jsp"%>
				</div>	
				
				<%//医生列表 %>
				<div id="doctor" style="display: none;"  >
					<%// %>
					<%@ include file="../tiaolishi/list_doctor.jsp"%>
				</div>
				
				<%//患者管理 %>
				<div id="patient" style="display: none;"  >
				<%// %>
					<%@ include file="../tiaolishi/list_patient.jsp"%>
				</div>
				
				<%//问题列表 %>
				<div id="question" style="display: none;"  >
				<%// %>
					<%@ include file="../tiaolishi/list_question.jsp"%>
				</div>
				
				<%//用户管理 %>
				<div id="user" style="display: none;"  >
				<%// %>
					<%@ include file="../tiaolishi/editUser.jsp"%>
				</div>

			</td>
		</tr>

	</table>