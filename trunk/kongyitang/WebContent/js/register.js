	var radio=0;
	//var flagTel = 1;


	  
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
	   var registerKeShi =$('input:radio[name="registerKeShi"]:checked').val();
	  // var registerKeShi = document.getElementById("registerKeShi").value;
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
	    	//registerAge
	    	var right_age = /^[0-9]*[1-9][0-9]*$/; //正整数
	    	if(!(right_age.test(registerAge))){
	    		 flag = 0;
				 message = "请输入正确年龄(正整数)！";
				 msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
			 }
	    }
	    /*
		if(flag==1){
		   if(radio%2==1){//医生有效
			   if(null==registerShiCheng||registerShiCheng==""||null==registerZhengJian||registerZhengJian==""||
					   null==registerZhiCheng||registerZhiCheng==""){
					  flag = 0;
				 	  message = "请您填写各项完整医生信息！";
					  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
				}
			   if(flag==1){
				   if( null==registerKeShi||registerKeShi==""){
					   flag = 0;
				 	   message = "请您选择您所在的科室！";
					   msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
				   }
				  
			   }
		   }
		}*/
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
    
    function SelectKeShi(){
    	document.getElementById('SelectKeShi').style.display='block';
    }
    
    function SelectKeshiCancel(){
    	document.getElementById('SelectKeShi').style.display='none';
    	document.getElementById("SelectKeShi").value = "";
    }

    function SelectKeshiCertain(){
    	
    	document.getElementById('SelectKeShi').style.display='none';
    	//document.getElementById('SelectKeShiAttention').style.display='none';
    	document.getElementById('SelectedKeShi').style.display='block';
    	var SelectedKeShi = document.getElementById("SelectedKeShi");
    	var registerKeShi =$('input:radio[name="registerKeShi"]:checked').val();
    	if(registerKeShi==1){
    		message = "中医内科";
    	}else if(registerKeShi==2){
    		message = "中医外科";
    	}
    	else if(registerKeShi==3){
    		message = "妇&nbsp;&nbsp;科";
    	}
    	else if(registerKeShi==4){
    		message = "儿&nbsp;&nbsp;科";
    	}
    	else if(registerKeShi==5){
    		message = "针推科";
    	}
    	SelectedKeShi.innerHTML = "<a>" + message + "</a>";
    }
    