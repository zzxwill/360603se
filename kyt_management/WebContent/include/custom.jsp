<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

	<!-- <link rel="stylesheet" href="../css/jquery.mobile-1.3.2.min.css" />
	<script type="text/javascript" src="../js/jquery.min.js"> </script>
	<script type="text/javascript" src="../js/jquery.mobile-1.3.2.min.js"></script> -->
	<!-- Jquery validation -->
<!--	<script type="text/javascript" src="../js/jquery.validate.js"></script>-->
	
<!-- 	<script type="text/javascript" src="../js/jquery.metadata.js"></script> -->
	
<!--	<link href="../resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet">-->
   
	
	
	<script type="text/javascript" > 


   function getModuleParameter() {
	    var url = location.search; //获取url中"?"符后的字串
	    //alert("url:" + url);
	    var parameter = null;
	    if (url.indexOf("?")!= -1) {
	    	var pos = url.lastIndexOf("=");
	    	parameter = url.substring(pos+1,url.length);
	    }
	    return parameter;
	}
	
	var module = getModuleParameter();
	//alert("module:" + module);
	$(document).ready(function(){
		if(module=="reservation"){
			document.getElementById("reservation").style.display = "block";
			
		}else if(module=="question"){
			document.getElementById("reservation").style.display = "none";
			document.getElementById("question").style.display = "block";
		}
		else if(module=="adminUser"){
			document.getElementById("reservation").style.display = "none";
			document.getElementById("adminUser").style.display = "block";
		}
		else if(module=="doctor"){
			document.getElementById("reservation").style.display = "none";
			document.getElementById("doctor").style.display = "block";
		}
		else if(module=="patient"){
			document.getElementById("reservation").style.display = "none";
			document.getElementById("patient").style.display = "block";
		}
		else if(module=="changguan"){
			document.getElementById("reservation").style.display = "none";
			document.getElementById("changguan").style.display = "block";
		}
		else if(module=="xuetang"){
			document.getElementById("reservation").style.display = "none";
			document.getElementById('xuetang').style.display = 'block';
			
		}
		else if(module=="beixuan"){
			$("#reservation").style.display = "none";
			$("#beixuan").style.display = "block";
		}
 
   });

	   
	function show_hidden(div1,div2,div3,div4,div5,div6,div7,div8){
		var obj1 = document.getElementById(div1);
		var obj2 = document.getElementById(div2);
		var obj3 = document.getElementById(div3);
		var obj4 = document.getElementById(div4);
		var obj5 = document.getElementById(div5);
		var obj6 = document.getElementById(div6);
		var obj7 = document.getElementById(div7);
		var obj8 = document.getElementById(div8);
		
		if(obj1!=null ){
			obj1.style.display = "";
			//return;
		}
		
		if(obj2!=null ){
			obj2.style.display = "none";
			//return;
		}
		if(obj3!=null ){
			obj3.style.display = "none";
			//return;
		}
		if(obj4!=null ){
			obj4.style.display = "none";
			//return;
		}
		if(obj5!=null ){
			obj5.style.display = "none";
			//return;
		}
		if(obj6!=null ){
			obj6.style.display = "none";
			//return;
		}
		if(obj7!=null ){
			obj7.style.display = "none";
			//return;
		}
		if(obj8!=null ){
			obj8.style.display = "none";
			//return;
		}
	}
	
	
	
	function ShowModalWithResult(url,height,width){
	    var sFeatures = "dialogHeight:"+height+";dialogWidth:"+width+";";
	    sFeatures = sFeatures + "center:yes;edge:raised;help:no;scroll:yes;status:no;unadorned:yes;resizable:no";
	    var result= window.showModalDialog(url,null,sFeatures);
	    return result;
	}
	
	
	
	
	
	
	
	</script>
	
	
	
	
	