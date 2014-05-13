	var radio=0;
	var flagTel = 1;

	function getCode(){
		var seconds = 0;
		var message = null;
		document.getElementById("normalGetCode").style.display = "none";
		document.getElementById("waitGetCode").style.display = "block";
		var registerTel = document.getElementById("registerTel").value;
		var msg = document.getElementById("msgRegister");
		//2013-11-29
		   //if(!( /^1[3,5]\d{9}$/.test(tel))){
		if(!( /^(0|86|17951)?(13[0-9]|15[012356789]|18[0-9]|14[57])[0-9]{8}$/.test(registerTel))){
			 flagTel = 0;
			 message = "请输入正确的手机号！";
			 msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
		 }
		 if(flagTel==1){
			 $(document).ready(function(){
				  $("#normalGetCode").click(function(){
				    $.post("register_1_code.jsp",
				    {
				      	registerTel:registerTel
				    },
				    function(data){
					   var html = $(data);
					   var sendMsgStatus = html.find("#sendMsgStatus").val();
				      //alert("sendMsgStatus:" + sendMsgStatus);
				    });
				  });
			});
		}
		
		setInterval(function(){
		  	seconds += 1;
		  	document.getElementById('count').innerHTML = 60-seconds;
		  	if(seconds == 60){
		  		seconds = 0;
				document.getElementById("normalGetCode").style.display = "block";
				document.getElementById("waitGetCode").style.display = "none";
		  	}
		},1000);
		
	}
	  
 	function changeRadio(){
		var registerRole = document.getElementById("registerRole").value;
		radio++;
		//alert(radio);
		if(radio%2==1){
			document.getElementById("registerDoctor").style.display = "block";
		}else{
			document.getElementById("registerDoctor").style.display = "none";
		}
		
	}
	
    function checkRegister()
    {
	   var registerName = document.getElementById("registerName").value;
	   var registerGender = document.getElementById("registerGender").value;
	   var registerAge = document.getElementById("registerAge").value;
	   var registerRole = document.getElementById("registerRole").value;
	   
	   var registerShiCheng = document.getElementById("registerShiCheng").value;
	   var registerZhengJian = document.getElementById("registerZhengJian").value;
	   var registerKeShi = document.getElementById("registerKeShi").value;
	   var registerZhiCheng = document.getElementById("registerZhiCheng").value;
	   
	   var registerTel = document.getElementById("registerTel").value;
	   var registerCode = document.getElementById("registerCode").value;  
	   
	   var message = null;
	   var msg = document.getElementById("msgRegister");
	   var flag = 1;
	   var flagTel = 1;
	   if(null==registerName||registerName==""||null==registerGender||registerGender==""
		   ||null==registerAge||registerAge==""||null==registerRole||registerRole==""
			   ||null==registerTel||registerTel==""||null==registerCode||registerCode==""){
			  flag = 0;
		 	  message = "请您填写各项完整信息！";
			  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
		}
		if(flag==1){
		   if(radio%2==1){//医生有效
			   if(null==registerShiCheng||registerShiCheng==""||null==registerZhengJian||registerZhengJian==""||
					   null==registerKeShi||registerKeShi==""||null==registerZhiCheng||registerZhiCheng==""){
					  flag = 0;
				 	  message = "请您填写各项完整医生信息！";
					  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
				}
		   }
		}
	   if(flag==1){
		   //registerNext
		   
		   if(!( /^(0|86|17951)?(13[0-9]|15[012356789]|18[0-9]|14[57])[0-9]{8}$/.test(registerTel))){
				 flagTel = 0;
				 message = "请输入正确的手机号！";
				 msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
			 }
			if(flagTel==1){
			   $(document).ready(function(){
					  $("#registerNext").click(function(){
					    $.post("register_1_validateCode.jsp",
					    {
					      	registerCode:registerCode
					    },
					    function(data){
						   var html = $(data);
						   var validateStatus = html.find("#validateStatus").val();
						   if(validateStatus=="OK"){
							   var registerForm = document.getElementById("registerForm");
						      	registerForm.submit(); 
						  }else{
							  message = "验证码错误";
							  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
							}
					      //alert("sendMsgStatus:" + sendMsgStatus);
					    });
					  });
				});
	
			}
	   }
    }