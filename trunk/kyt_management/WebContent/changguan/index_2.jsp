<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="../js/changguan.js"></script> 
	<table width="100%">
		<tr>

			<td width="120px" valign="top">
				<!-- 左侧菜单 -->
				<table  width="120px"  border="0" cellspacing="0" cellpadding="0"  >
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_changguan_hidden('yuyue','doctor','changguan','patient','question','user','paiqi');">
						预约列表</div></td>
					</tr>
					<!--
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_changguan_hidden('paiqi','yuyue','doctor','changguan','patient','question','user');">
						医生排期</div></td>
					</tr>
					-->
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_changguan_hidden('question','doctor','changguan','patient','yuyue','user','paiqi');">
						问题列表</div></td>
					</tr>
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_changguan_hidden('doctor','changguan','patient','question','yuyue','user','paiqi');">
						医生管理</div></td>
					</tr>
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_changguan_hidden('patient','doctor','changguan','question','yuyue','user','paiqi');">
						患者管理</div></td>
					</tr>
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_changguan_hidden('changguan','doctor','patient','question','yuyue','user','paiqi');">
						场馆管理</div></td>
					</tr>

					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_changguan_hidden('user','paiqi','yuyue','doctor','changguan','patient','question');">
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
						else if(module=="doctor"){
							document.getElementById("yuyue").style.display = "none";
							document.getElementById("doctor").style.display = "block";
						}
						else if(module=="patient"){
							document.getElementById("yuyue").style.display = "none";
							document.getElementById("patient").style.display = "block";
						}
						else if(module=="question"){
							document.getElementById("yuyue").style.display = "none";
							document.getElementById("question").style.display = "block";
						}
						else if(module=="changguan"){
							document.getElementById("yuyue").style.display = "none";
							document.getElementById("changguan").style.display = "block";
						}
						else if(module=="user"){
							document.getElementById("yuyue").style.display = "none";
							document.getElementById("user").style.display = "block";
						}
						else if(module=="paiqi"){
							document.getElementById("yuyue").style.display = "none";
							document.getElementById("paiqi").style.display = "block";
						}
				 
				   });
				</script>
				
					<%//@ include file="../changguan/manage_reservation_record.jsp"%>
					<%@ include file="../changguan/list_reservation.jsp_new.jsp"%>
				</div>	
				
				<%//场馆管理 %>
				<div id="changguan" style="display: none;" >
					<%// %>					
					<%@ include file="../changguan/editChangGuan.jsp"%>
				</div>	
				
				<%//医生管理 %>
				<div id="doctor" style="display: none;" >
				<%// %>
					<%@ include file="../changguan/list_doctor.jsp"%>
				</div>	
				
				<%//患者管理 %>
				<div id="patient" style="display: none;"  >
				<%// %>
					<%@ include file="../changguan/list_patient.jsp"%>
				</div>
				
				<%//问题列表 %>
				<div id="question" style="display: none;"  >
				<%// %>
					<%@ include file="../changguan/list_question.jsp"%>
				</div>
				

				
				<%//用户管理 ，本场馆%>
				<div id="user" style="display: none;"  >
				<%// %>
					<%@ include file="../changguan/insertUser.jsp"%>
					<%@ include file="../changguan/editUser.jsp"%>
				</div>
				
				<%//医生排期  TODO 排期  %>
				<div id="paiqi" style="display: none;"  >
				<%// %>
				医生排期
					<%//@ include file="../changguan/paiqi.jsp"%>
				</div>
			
			</td>
		</tr>

	</table>