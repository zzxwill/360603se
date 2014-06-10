<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

	<!-- <link rel="stylesheet" href="../css/jquery.mobile-1.3.2.min.css" />
	<script type="text/javascript" src="../js/jquery.min.js"> </script>
	<script type="text/javascript" src="../js/jquery.mobile-1.3.2.min.js"></script> -->
	<!-- Jquery validation -->
	<script type="text/javascript" src="../js/jquery.validate.js"></script>
	
<!-- 	<script type="text/javascript" src="../js/jquery.metadata.js"></script> -->
	
	<link href="../resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet">
   
	
	
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
		
		//返回时，应该把顶部的返回按钮的onclick内容更新
		if("reservation_specific_location" == previous_page){
			$("#return_link").attr("onclick", "display_return_page('reservation_specific_location', 'kongyitang_reservation_index');");
		}/* else if("outpatient_table" == previous_page){
			$("#return_link").attr("onclick", "display_return_page('outpatient_table', 'reservation_specific_location');");
		} */else if("reservation_specific_doctor" == previous_page){
			$("#return_link").attr("onclick", "display_return_page('reservation_specific_doctor', 'reservation_specific_location');");
		}
		else if("reservation_patient_sickinfo" == previous_page){
			$("#return_link").attr("onclick", "display_return_page('reservation_patient_sickinfo', 'reservation_specific_doctor');");
		}
		
		return;
		
		
	}
	
	
	//存储kongyitang_reservation_index页面选定的值
	function set_kongyitang_reservation_index_value(site){
		document.getElementById("site").value = site;
		
		$("#return_link").attr("onclick", "display_return_page('reservation_specific_location', 'kongyitang_reservation_index');");
		
		//reservation_specific_location_name 具体预约某个馆时，顶上显示不同的名字
		$("#reservation_specific_location_name").get(0).innerText = site;
		
		
		//如果没有reutrn, 会提交表单
		return;
	}
	
	
	//存储reservation_specific_location页面选定的值
	function set_reservation_specific_location_value(department, doctorid){
		$("#return_link").attr("onclick","display_return_page('reservation_specific_doctor', 'reservation_specific_location');");
		                                  
		document.getElementById("department").value = department;
		document.getElementById("doctorid").value = doctorid;
		var department_specific =  document.getElementById("department_specific");
		//获取department_specific的innerHTML，但是，不能更改其内容  Will Zhou   5/17/2014
		var reserver_date_table = document.getElementById("reserver_table");//department_specific.innerHTML;
		
		//开始清空department_specific.innerHTML
		//department_specific.innerHTML = "";
		
		department_specific.innerHTML = document.getElementById(doctorid.toString()).innerHTML;
		department_specific.innerHTML += reserver_date_table.innerHTML;
		
		//$("."+department + "_"+doctorid).remove();
		$("#department_specific").find("."+department + "_"+doctorid).remove();
		
		return;
		
		
	}
	
	//存储reservation_specific_doctor页面选定的值
	function set_reservation_specific_doctor_value(outpatientid){
		$("#return_link").attr("onclick","display_return_page('reservation_patient_sickinfo', 'reservation_specific_doctor');");
		
		
		document.getElementById("outpatientid").value = outpatientid;

		var reservation_doctor =  document.getElementById("reservation_doctor");
		
		//var reserve_clinic_illness = document.getElementById("reserve_clinic_illness");//department_specific.innerHTML;
		
		//开始清空department_specific.innerHTML
		//department_specific.innerHTML = "";
		
		reservation_doctor.innerHTML = $( "#department_specific table:first-child" ).get(0).outerHTML;//document.getElementById(doctorid.toString()).innerHTML;
		//reservation_doctor.innerHTML += reserve_clinic_illness.innerHTML;
		
		//$("."+department + "_"+doctorid).remove();
		//$("#reservation_patient_sickinfo").find("."+department + "_"+doctorid).remove();
		//$("#reservation_patient_sickinfo").children("#reserve_clinic_illness").show();
		
		//$("#reservation_patient_sickinfo").hide();
		
		return;
		
		
	}
	
	//存储reservation_patient_sickinfo页面选定的值
/*  function set_reservation_patient_sickinfo_value(outpatientid){
	
	 
		document.getElementById("outpatientid").value = outpatientid;
		return;
	}  */
	
	
	
	//存储xuetang_reservation_index页面选定的值
	function set_xuetang_reservation_index_value(site){
		$("#return_link").attr("onclick","display_return_page('xuetang_reservation_content', 'xuetang_reservation_index');");
		
		document.getElementById("xuetang").value = site;
		//如果没有reutrn, 会提交表单
		return;
	}
	
	
	//存储shanggongfang_reservation_index页面选定的值
	function set_shanggongfang_reservation_index_value(site){
		if("健康调理"==site){
			$("#return_link").attr("onclick","display_return_page('xuetang_reservation_content', 'xuetang_reservation_index');");
		}else if("健康评估"==site){
			$("#return_link").attr("onclick","display_return_page('xuetang_reservation_content_assess', 'xuetang_reservation_index');");
		}
		document.getElementById("type_adjust").value = site;
		document.getElementById("type_assess").value = site;
		//如果没有reutrn, 会提交表单
		return;
	}
	
	//上工坊 不同的类型 提交给不同的action
	function submit_reserve_shanggongfang(action){
		//$("verifyForm").validate();
		var verifyForm = document.getElementById("verifyForm");
		verifyForm.action = action;
		verifyForm.submit(); 
		verifyForm.action = "";
		return;
	}
	
	//学堂  提交action
	function submit_reserve_xuetang(action){
		
		
		if ($("#verifyForm").valid()) {
	        $("#verifyForm").submit();
	    }
		//$("verifyForm").validate();
		/* var verifyForm = document.getElementById("verifyForm");
		
		verifyForm.submit(); 
		
		return; */
	}
	
	//存储reservation_patient_sickinfo页面选定的值
	function set_reservation_patient_sickinfo_value(){
		
		var boxes = document.getElementsByName("purpose_chk");  
	    var purpose=boxes[0].value;  
	    for (var i = 1; i < boxes.length; i++){  
	    	if (boxes[i].checked){  
	    		purpose = purpose + " " + boxes[i].value ;  
	    	}  
		}  
		
		document.getElementById("purpose").value = purpose;
		//如果没有reutrn, 会提交表单
		return;
	}
	
	
	//显示或隐藏出诊表  Will  5/16/2014
	function display_hidden_outpatient_table(){
		if($("#outpatient_reserve").is(':hidden')){
			$("#outpatient_table").hide();		
			$("#outpatient_reserve").show();
			$("#tab_yu").css("background","#d8a14f");
			$("#tab_yu").css("color","#fff");
			$("#tab_yuimg").css("background","#d8a14f");
			$("#tab_yuimg").children("img").css("display","");
			
			$("#tab_cz").css("background","#fff");
			$("#tab_cz").css("color","#000");
			$("#tab_czimg").css("background","#fff");
			$("#tab_czimg").children("img").css("display","none");
		}else{
			
			$("#outpatient_table").show();
			$("#outpatient_reserve").hide();
			$("#tab_cz").css("background","#d8a14f");
			$("#tab_cz").css("color","#fff");
			$("#tab_czimg").css("background","#d8a14f");
			$("#tab_czimg").children("img").css("display","");
			
			$("#tab_yu").css("background","#fff");
			$("#tab_yu").css("color","#000");
			$("#tab_yuimg").css("background","#fff");
			$("#tab_yuimg").children("img").css("display","none");
		}
		
	}
	
	
	//返回微信主界面  Will  5/19/2014
	function return_to_wechat_main(){
			WeixinJSBridge.call('closeWindow');
		/* document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
			WeixinJSBridge.call('closeWindow');
		}); */
	}
	
	
	
	
/* 	//取消预约时的确认  Will 6/7/2014
	function show_confirm() 
{ 
 return confirm("确认取消预约?"); 

}  */
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</script>
	
	
	
	
	