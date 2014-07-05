<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<style type="text/css">

#ViewDoctorInfo<%=qID %><%=tmp_id %>{ 
    display: none; 
    position: absolute;  /*absolute ,,relative*/ 
    /*top: 5%;  */
    left: 25%;
    width: 45%; 
    /*height: 60%;*/ 
    padding: 10px; 
    border: 1px solid #d8a14f; 
    background-color: white; 
    z-index:5555;
    overflow: auto; 
}

#ViewDoctorInfoClose<%=qID %><%=tmp_id %>{ 
	border-style:solid; 
	border-width:1px; 
	border-color:#744501;
	height:25px;
	line-height:25px;
	background:#d8a14f;
	color:white;
	border-top-left-radius:10px 10px;
    border-top-right-radius:10px 10px;
    border-bottom-right-radius:10px 10px;
    border-bottom-left-radius:10px 10px;
}

</style>



<div id="ViewDoctorInfo<%=qID %><%=tmp_id %>" name="ViewDoctorInfo<%=qID %><%=tmp_id %>"  class="ViewDoctorInfo<%=qID %><%=tmp_id %>" >

<%
	if(tmp_id==0){
		doctor_info = "暂无&nbsp;专家&nbsp;医生信息！";
	%>
	<table width="100%" cellpadding="0" cellspacing="0px"  >
		<tr><td width="100%" align="center">
		 <%=doctor_info %>
		 </td></tr>
	</table>
	<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr><td  width="100%"><hr></td></tr>
			<tr><td width="100%" align="center">
				 <div id="ViewDoctorInfoClose<%=qID %><%=tmp_id %>" onclick="ViewDoctorInfoClose(<%=qID %>,<%=tmp_id %>)">确&nbsp;&nbsp;认</div>
			 </td></tr>
			
	</table>
	<%
	}else{
		doctor_info = "医生&nbsp;" +answerDao_Patient.answers_doctor_name_Given_Patient[j]+ "&nbsp;信息:";
		//System.out.println("tmp_portrait:"+ tmp_portrait + "\n");
		if(!((null==tmp_portrait)||(tmp_portrait.equals("")))){
		%>
		
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td width="60%" align="right" valign="middle">
				 	<%=doctor_info %>
				 </td>
				<td  width="40%" align="center" valign="middle">
				 	<img width="40px" src="<%=D_IMAGES %><%=tmp_portrait %>"/>
				 </td>
				 
			</tr>

		</table>
		<table width="100%"><tr><td  width="100%"><hr></td></tr></table>			
		<table width="100%" cellpadding="0" cellspacing="0px"  >
		<%
		}else{
			%>
			
			<table width="100%" cellpadding="0" cellspacing="0px"  >
				<tr><td width="100%" align="center">
				 <%=doctor_info %>
				 </td></tr>
				<tr><td  width="100%"><hr></td></tr>
			</table>
			<table width="100%" cellpadding="0" cellspacing="0px"  >
			<%
		} 
		if(!(null==tmp_department||tmp_department.equals(""))){
			//doctor_info = "所属科室：&nbsp;" +tmp_department+ "&nbsp;";
		%>
			<tr>
				<td align="center" width="50%">所属科室：&nbsp;</td>
				<td align="center" width="50%"><%=tmp_department %>&nbsp;</td>
			</tr>
		<%
		}
		else{
			//doctor_info = "所属科室：：&nbsp;" +"暂无"+ "&nbsp;";
		%>
			<tr>
				<td align="center" width="50%">所属科室：&nbsp;</td>
				<td align="center" width="50%">暂无&nbsp;</td>
			</tr>
		<%	
		}
		if(!(null==tmp_intruduction||tmp_intruduction.equals(""))){
			//doctor_info += "简&nbsp;&nbsp;介：&nbsp;" +tmp_intruduction+ "&nbsp;<br>";
		%>
			<tr>
				<td align="center" width="50%">简&nbsp;&nbsp;介：&nbsp;</td>
				<td align="center" width="50%"><%=tmp_intruduction %>&nbsp;</td>
			</tr>
		<%
		}else{
			//doctor_info += "简&nbsp;&nbsp;介：&nbsp;" +"暂无"+ "&nbsp;<br>";
		%>
			<tr>
				<td align="center" width="50%">简&nbsp;&nbsp;介：&nbsp;</td>
				<td align="center" width="50%">暂无&nbsp;</td>
			</tr>
		<%
		}
		if(!(0==tmp_visit_fee)){
			//doctor_info += "出诊费：&nbsp;" +tmp_visit_fee+ "&nbsp;<br>";
		%>
			<tr>
				<td align="center" width="50%">出诊费：&nbsp;</td>
				<td align="center" width="50%"><%=tmp_visit_fee %>&nbsp;</td>
			</tr>
		<%
		}else{
			//doctor_info += "出诊费：&nbsp;" +"暂无"+ "&nbsp;<br>";
		%>
			<tr>
				<td align="center" width="50%">出诊费：&nbsp;</td>
				<td align="center" width="50%">暂无&nbsp;</td>
			</tr>
		<%
		}
		if(!(null==tmp_changguan||tmp_changguan.equals(""))){
			//doctor_info += "所属场馆：&nbsp;" +tmp_changguan+ "&nbsp;<br>";
		%>
			<tr>
				<td align="center" width="50%">所属场馆：&nbsp;</td>
				<td align="center" width="50%"><%=tmp_changguan %>&nbsp;</td>
			</tr>
		<%
		}else{
			//doctor_info += "所属场馆：&nbsp;" +"暂无"+ "&nbsp;<br>";
		%>
			<tr>
				<td align="center" width="50%">所属场馆：&nbsp;</td>
				<td align="center" width="50%">暂无&nbsp;</td>
			</tr>
		<%
		}
		%>
		</table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr><td  width="100%"><hr></td></tr>
			<tr><td width="100%" align="center">
				 <div id="ViewDoctorInfoClose<%=qID %><%=tmp_id %>" onclick="ViewDoctorInfoClose(<%=qID %>,<%=tmp_id %>)">确&nbsp;&nbsp;认</div>
			 </td></tr>
			
		</table>
		<%
	}
%>

</div>