function SelectKeShi(){
	document.getElementById('SelectKeShi').style.display='block';
}

function SelectKeshiCancel(){
	document.getElementById('SelectKeShi').style.display='none';
	document.getElementById("SelectKeShi").value = "";
}

function SelectKeshiCertain(){
	document.getElementById('SelectKeShi').style.display='none';
}

function UploadPhoto(){
	document.getElementById('UploadPhoto').style.display='block';
}

function UploadPhotoCancel(){
	document.getElementById('UploadPhoto').style.display='none';
}

function ASKSubmit(){
	
	var QuestionText = document.getElementById("QuestionText").value;
	var ASKKeShi = $('input:radio[name="ASKKeShi"]:checked').val();
	//var ASKKeShi = document.getElementById("ASKKeShi").value;
	var ASKGender = document.getElementById("ASKGender").value;
	var ASKAge = document.getElementById("ASKAge").value;
	var ASKTel = document.getElementById("ASKTel").value;
	
   var message = null;
   var msg = document.getElementById("msgASK");
   var flag = 1;
   //alert("ASKKeShi:"+ ASKKeShi);
	if(null==QuestionText||QuestionText==""||null==ASKKeShi||ASKKeShi==""||
			null==ASKGender||ASKGender==""||null==ASKAge||ASKAge==""||
			null==ASKTel||ASKTel==""){
		  flag = 0;
	 	  message = "请您填写各项完整信息！";
		  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
	}
	if(flag==1){
		if((ASKGender!="男")&&(ASKGender!="女")){
			flag = 0;
		 	message = "请您正确填写性别信息，如 “男”！";
			msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
		}
	}
	if(flag==1){
		if(!( /^[123456789]|([0-9]{2})$/.test(ASKAge))){
			 flag = 0;
			 message = "请输入年龄信息，如“23”！";
			 msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
		 }
	}
	
	if(flag==1){
		if(!( /^(0|86|17951)?(13[0-9]|15[012356789]|18[0-9]|14[57])[0-9]{8}$/.test(ASKTel))){
			 flag = 0;
			 message = "请输入正确的手机号！";
			 msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
		 }
	}
	if(flag==1){
		var ASKForm = document.getElementById("ASKForm");
		ASKForm.submit(); 
	}
	
	
}