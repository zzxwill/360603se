<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="../js/changguan.js"></script> 
	<table>
		<tr>

			<td width="120px" valign="top">
				<!-- 左侧菜单 -->
				<table  width="120px"  border="0" cellspacing="0" cellpadding="0"  >
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_changguan_hidden('changguan','doctor','beixuan');">
						场馆管理</div></td>
					</tr>
					<tr>
						<td><div class=" btn btn-primary btn-block" 
						onclick="show_changguan_hidden('doctor','changguan','beixuan');">
						医生管理</div></td>
					</tr>
<!--							<tr>
								<td><div class=" btn btn-primary btn-block"
								onclick="show_changguan_hidden('beixuan','doctor','changguan');">
								备用选项</div></td>
							</tr>-->
				</table>
			</td>

			<td width="1100px" valign="top">
				
				<%//场馆管理 %>
				<div id="changguan" >
					<%// %>
					<script>
				  
				   function getModuleParameter() {
					    var url = location.search; //获取url中"?"符后的字串
					    //alert("url:" + url);
					    var parameter = null;
					    if (url.indexOf("?")!= -1) {
					    	var pos = url.lastIndexOf("=");
					    	parameter = url.substring(pos+1,url.length);
					    	if(parameter!="changguan"){
					    		document.getElementById("changguan").style.display = "none";
					    	}
					    }
					    return parameter;
					}
					
					var module = getModuleParameter();
					
					//alert("module:" + module);
					$(document).ready(function(){
						if(module=="changguan"){
							document.getElementById("changguan").style.display = "block";
						}
						else if(module=="doctor"){
							document.getElementById("changguan").style.display = "none";
							document.getElementById("doctor").style.display = "block";
						}
						else if(module=="beixuan"){
							$("#changguan").style.display = "none";
							$("#beixuan").style.display = "block";
						}
				 
				   });
				</script>
					
					<%//@ include file="../changguan/editChangGuan.jsp"%>
				</div>	
				
				<%//医生管理 %>
				<div id="doctor" style="display: none;" >
				<%// %>
					<%//@ include file="../changguan/list_doctor.jsp"%>
				</div>	
				
				<%//备用选项 %>
				<div id="beixuan" style="display: none;"  >
				<%// %>
					此选项仅用于后续备用环节！
				</div>	
			
			</td>
		</tr>

	</table>