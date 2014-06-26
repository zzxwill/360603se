<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="../js/common.js"></script> 
	<table width="100%">
		<tr>

			<td width="120px" valign="top">
				<!-- 左侧菜单 -->
				<table  width="120px"  border="0" cellspacing="0" cellpadding="0"  >
					
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_common_hidden('doctor','patient','question','yuyue','user','paiqi');">
						医生管理</div></td>
					</tr>
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_common_hidden('patient','doctor','question','yuyue','user','paiqi');">
						患者管理</div></td>
					</tr>
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_common_hidden('question','doctor','patient','yuyue','user','paiqi');">
						问题列表</div></td>
					</tr>
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_common_hidden('yuyue','doctor','patient','question','user','paiqi');">
						预约列表</div></td>
					</tr>
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_common_hidden('user','yuyue','doctor','patient','question','paiqi');">
						用户管理</div></td>
					</tr>
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_common_hidden('paiqi','yuyue','doctor','patient','question','user');">
						医生排期</div></td>
					</tr>
				</table>
			</td>

			<td width="1100px" valign="top">
				
				<%//医生列表 %>
				<div id="doctor" >
					<%// %>
					<script>
				  
				   function getModuleParameter() {
					    var url = location.search; //获取url中"?"符后的字串
					    //alert("url:" + url);
					    var parameter = null;
					    if (url.indexOf("?")!= -1) {
					    	var pos = url.lastIndexOf("=");
					    	parameter = url.substring(pos+1,url.length);
					    	if(parameter!="doctor"){
					    		document.getElementById("doctor").style.display = "none";
					    	}
					    }
					    return parameter;
					}
					
					var module = getModuleParameter();
					
					//alert("module:" + module);
					$(document).ready(function(){
						if(module=="doctor"){
							document.getElementById("doctor").style.display = "block";
						}
						else if(module=="patient"){
							document.getElementById("doctor").style.display = "none";
							document.getElementById("patient").style.display = "none";
						}
						else if(module=="question"){
							document.getElementById("doctor").style.display = "none";
							document.getElementById("question").style.display = "none";
						}
						else if(module=="yuyue"){
							document.getElementById("doctor").style.display = "none";
							document.getElementById("yuyue").style.display = "none";
						}
						else if(module=="user"){
							document.getElementById("doctor").style.display = "none";
							document.getElementById("user").style.display = "block";
						}
						else if(module=="paiqi"){
							document.getElementById("doctor").style.display = "none";
							document.getElementById("paiqi").style.display = "none";
						}
				   });
				</script>
					
					<%@ include file="../common/list_doctor.jsp"%>
				</div>
				
				<%//患者管理 %>
				<div id="patient" style="display: none;"  >
				<%// %>
					<%@ include file="../common/list_patient.jsp"%>
				</div>
				<script type="text/javascript">
					$("#patient").css("height",(document.body.clientHeight-65) +"px");
				</script>
				
				<%//问题列表 %>
				<div id="question" style="display: none;"  >
				<%// %>
					<%@ include file="../common/list_question.jsp"%>
				</div>
				<script type="text/javascript">
					$("#question").css("height",(document.body.clientHeight-65) +"px");
				</script>
				
				<%//预约列表 %>
				<div id="yuyue" style="display: none;"  >
				<%// %>
					<%@ include file="../common/manage_reservation_record.jsp"%>
				</div>	
				<script type="text/javascript">
					$("#yuyue").css("height",(document.body.clientHeight-65) +"px");
				</script>
				
				<%//用户管理 %>
				<div id="user" style="display: none;"  >
				<%// %>
					<%@ include file="../common/editUser.jsp"%>
				</div>	
				<script type="text/javascript">
					$("#user").css("height",(document.body.clientHeight-65) +"px");
				</script>
				
				<%//医生排期  TODO 排期 %>
				<div id="paiqi" style="display: none;" >
				<%// %>
				医生排期
					<%//@ include file="../common/paiqi.jsp"%>
				</div>	
				<script type="text/javascript">
					$("#paiqi").css("height",(document.body.clientHeight-65) +"px");
				</script>
				
			</td>
		</tr>

	</table>