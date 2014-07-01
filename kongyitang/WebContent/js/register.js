	
	var radio=0;
	
	function test(){
		//alert("setup:\rtest");
	}
	
    function checkRegister()
    {
    	// alert("setup:\r");
	   var registerName = document.getElementById("registerName").value;
	   var registerGender = document.getElementById("registerGender").value;
	   var registerAge = document.getElementById("registerAge").value;
	   var registerRole = document.getElementById("registerRole").value;
	   
	   var registerTel = document.getElementById("registerTel").value;
	   var registerCode = document.getElementById("registerCode").value;  
	   
	   var message = null;
	   var msg = document.getElementById("msgRegister");
	   var flag = 1;
	   var flagTel = 1;
	  // alert("registerCode:" + registerCode);
	   if(null==registerName||registerName==""||null==registerGender||registerGender==""
		   ||null==registerAge||registerAge==""||null==registerRole||registerRole==""
			   ||null==registerTel||registerTel==""||null==registerCode||registerCode==""){
			  flag = 0;
		 	  message = "请您填写各项完整信息！";
			  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
		}
	   
	    if(flag==1){
	    	//registerAge
	    	var right_age = /^[0-9]*[1-9][0-9]*$/; //正整数
	    	if(!(right_age.test(registerAge))){
	    		 flag = 0;
				 message = "请输入正确年龄(正整数)！";
				 msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
			 }
	    }

	   if(flag==1){
		   //registerNext
		   
		   if(!( /^(0|86|17951)?(13[0-9]|15[012356789]|18[0-9]|14[57]|17[0-9])[0-9]{8}$/.test(registerTel))){
				 flagTel = 0;
				 message = "请输入正确的手机号！";
				 msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
			 }
			if(flagTel==1){
			   $(document).ready(function(){
					  $("#registerNext").click(function(){
					    $.post("register_1_validateCode.jsp",
					    {
					      	registerCode:registerCode,
					      	registerTel:registerTel
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
    