<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

	<link rel="stylesheet" href="../css/jquery.mobile-1.3.2.min.css" />
	<script type="text/javascript" src="../js/jquery.min.js"> </script>
	<script src="../js/jquery.mobile-1.3.2.min.js"></script>
	
	<link href="../resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet">
    <link href="../resources/css/axure_rp_page.css" type="text/css" rel="stylesheet">
    <link href="../resources/css/reserver_clinic/axurerp_pagespecificstyles.css" type="text/css" rel="stylesheet">
<!--     <link href="../resources/css/reserver_clinic/reserve_clinic_deparment.css" type="text/css" rel="stylesheet"> -->
	
	
	<script type="text/javascript" > 
	function show_hidden(id){
		var obj = document.getElementById(id);
	
		if(obj!=null && obj.style.display == "none"){
			obj.style.display = "";
			return;
		}
		if(obj!=null && obj.style.visibility == ""){
			obj.style.display = "none";
			return;
		}
		
	}
	
	//返回时，显示之前的页面
	function display_return_page(current_page, previous_page){
		var cur_obj = document.getElementById(current_page);
		var pre_obj = document.getElementById(previous_page);
		if(cur_obj!=null & pre_obj != null){
			cur_obj.style.display = "none";
			pre_obj.style.display = "";
		}
		return;
		
		
	}
	
	
	//存储kongyitang_reservation_index页面选定的值
	function set_kongyitang_reservation_index_value(site){
		document.getElementById("site").value = site;
		//如果没有reutrn, 会提交表单
		return;
	}
	
	
	//存储reservation_specific_location页面选定的值
	function set_reservation_specific_location_value(department, doctorid){
		document.getElementById("department").value = department;
		document.getElementById("doctorid").value = doctorid;
		return;
		
		
	}
	
	//存储reservation_specific_doctor页面选定的值
	function set_reservation_specific_doctor_value(outpatientid){
		document.getElementById("outpatientid").value = outpatientid;
		return;
	}
	
	//存储reservation_patient_sickinfo页面选定的值
	function set_reservation_patient_sickinfo_value(outpatientid){
		document.getElementById("outpatientid").value = outpatientid;
		return;
	}
	
	
	
	//存储xuetang_reservation_index页面选定的值
	function set_xuetang_reservation_index_value(site){
		document.getElementById("xuetang").value = site;
		//如果没有reutrn, 会提交表单
		return;
	}
	
	
	//存储shanggongfang_reservation_index页面选定的值
	function set_shanggongfang_reservation_index_value(site){
		document.getElementById("type").value = site;
		//如果没有reutrn, 会提交表单
		return;
	}
	
	//上工坊 不同的类型 提交给不同的action
	function submit_reserve_shanggongfang(action){
		var verifyForm = document.getElementById("verifyForm");
		verifyForm.action = action;
		   verifyForm.submit(); 
	}
	
	
	</script>
	
	
	
	
	