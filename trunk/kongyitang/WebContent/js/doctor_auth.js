
	var  ImgOK = false;
	var ImgCriteriaPhoto = false;
	var ImgPortraitPhoto = false;

 	function setNull() {  
		document.getElementById("authShiCheng").value = "";
	}

    function checkAuth()
    {
    	var authShenFenZhenghao = document.getElementById("authShenFenZhenghao").value;
    	var authYiShiZhengHao = document.getElementById("authYiShiZhengHao").value;
    	var authZhiYeLeiXing = document.getElementById("authZhiYeLeiXing").value;
    	var authLingChuangZhiCheng = document.getElementById("authLingChuangZhiCheng").value;
    	var authSuoZaiYiYuan = document.getElementById("authSuoZaiYiYuan").value;
    	var authKeShi = $('input:radio[name="authKeShi"]:checked').val();
    	var authShiCheng = document.getElementById("authShiCheng").value;
	   
	   var message = null;
	   var msg = document.getElementById("msgAuth");
	   var flag = 1;
	   var flagTel = 1;
	   if(null==authShenFenZhenghao||authShenFenZhenghao==""||null==authYiShiZhengHao||authYiShiZhengHao==""
		   ||null==authZhiYeLeiXing||authZhiYeLeiXing==""||null==authLingChuangZhiCheng||authLingChuangZhiCheng==""
			   ||null==authSuoZaiYiYuan||authSuoZaiYiYuan==""||null==authSuoZaiYiYuan||authSuoZaiYiYuan==""
				   ||null==authKeShi||authKeShi==""||null==authShiCheng||authShiCheng==""){
			  flag = 0;
		 	  message = "请您填写各项完整信息！";
			  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
		}
	   
	   if(flag==1){
		   //authShenFenZhenghao
		   var reg = /^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
		   if(!(reg.test(authShenFenZhenghao))){
			   flag = 0;
			   message = "请输入正确的身份证号！";
			   msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
		   }
	   }
	   if(flag==1){
		   msg.innerHTML = "";
		   var authForm = document.getElementById("authForm");
		   authForm.submit(); 
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
    	var authKeShi =$('input:radio[name="authKeShi"]:checked').val();
    	if(authKeShi==1){
    		message = "中医内科";
    	}else if(authKeShi==2){
    		message = "中医外科";
    	}
    	else if(authKeShi==3){
    		message = "妇&nbsp;&nbsp;科";
    	}
    	else if(authKeShi==4){
    		message = "儿&nbsp;&nbsp;科";
    	}
    	else if(authKeShi==5){
    		message = "针推科";
    	}
    	else if(authKeShi==6){
    		message = "男&nbsp;&nbsp;科";
    	}
    	SelectedKeShi.innerHTML = "<a>" + message + "</a>";
    }
    
    
    //上传照片js
    
    function UploadCriteriaPhoto(){
    	document.getElementById('UploadCriteriaPhoto').style.display='block';
    	document.getElementById('UploadPortraitPhoto').style.display='none';
    }

    function UploadCriteriaPhotoCancel(){
    	//var uploadImage = document.getElementById('uploadImage') ;
    	//uploadImage.outerHTML = uploadImage.outerHTML;
    	//uploadImage.value = null;
    	document.getElementById("msgCriteriaImg").style.display = "none";
    	document.getElementById('UploadCriteriaPhoto').style.display='none';
    }
    
    function UploadPortraitPhoto(){
    	document.getElementById('UploadCriteriaPhoto').style.display='none';
    	document.getElementById('UploadPortraitPhoto').style.display='block';
    }

    function UploadPortraitPhotoCancel(){
    	//var uploadImage = document.getElementById('uploadImage') ;
    	//uploadImage.outerHTML = uploadImage.outerHTML;
    	//uploadImage.value = null;
    	document.getElementById("msgPortraitImg").style.display = "none";
    	document.getElementById('UploadPortraitPhoto').style.display='none';
    }

    function browseCriteriaBtnClick() {
//    	document.getElementById("uploadImage").click(); 
    	document.getElementById("uploadCriteriaImage").click(); 
    }
    
    function browsePortraitBtnClick() {
//    	document.getElementById("uploadImage").click(); 
    	document.getElementById("uploadPortraitImage").click(); 
    }
    
    
    function checkCriteriaImg(){
    	
    	var uploadImage = document.getElementById("uploadCriteriaImage").value;
    	//alert("上传医生证照名：" + uploadImage);
    	var msg = document.getElementById("msgCriteriaImg");
    	
    	var pos = uploadImage.lastIndexOf(".");
    	var lastname = uploadImage.substring(pos,uploadImage.length);
    	//var uploadImage = lastname.toLowerCase();
    	var ext = ['.jpg', '.jpeg', '.png','.bmp','.JPG','.JPEG','.PNG','.BMP','.gif','.GIF'];//jpg,jpeg,bmp,png,gif
    	var flag = false;
    	for(var i = 0; i < ext.length; i++)
    	{
    		//alert(ext[i]);
    		if (uploadImage.indexOf(ext[i]) > 0)
    		{
    			flag = true;
    			break;
    		}
    	}
    	
    	if(pos==-1){
    		flag = true;
    	}
    	
    	if(flag == false){
    		
    		 ImgCriteriaPhoto = false;
    		 ImgOK = false;
    		 
    		 document.getElementById("msgCriteriaImg").style.display = "block";
    		 message = "只能上传.jpg、.jpeg、.bmp、.png、.gif、格式的图片!";
    		 msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
    	}else{
    		//ImgOK = true;
    		ImgCriteriaPhoto =  true;
    		alert("恭喜您，医生证照上传成功！ \n\r照片名：" + uploadImage);
    		document.getElementById('UploadCriteriaPhoto').style.display='none';
    		document.getElementById("msgCriteriaImg").style.display = "none";
    		//document.getElementById("msgCriteriaImg").style.display = "block";
    		//message = "医生证照上传成功，请稍后...";
    	   // msg.innerHTML = "<a style='color:green;'>" + message + "</a>";
    	    //setTimeout(" document.getElementById('UploadCriteriaPhoto').style.display='none' ",1500);
    		//document.getElementById("msgCriteriaImg").style.display = "none";
    		//document.getElementById("UploadCriteriaPhoto").style.display = "none";
    	}
    }
    
    function checkPortraitImg(){
    	
    	var uploadImage = document.getElementById("uploadPortraitImage").value;
    	//alert("上传医生头像名：" + uploadImage);
    	var msg = document.getElementById("msgPortraitImg");
    	
    	var pos = uploadImage.lastIndexOf(".");
    	var lastname = uploadImage.substring(pos,uploadImage.length);
    	//var uploadImage = lastname.toLowerCase();
    	var ext = ['.jpg', '.jpeg', '.png','.bmp','.JPG','.JPEG','.PNG','.BMP','.gif','.GIF'];//jpg,jpeg,bmp,png,gif
    	var flag = false;
    	for(var i = 0; i < ext.length; i++)
    	{
    		//alert(ext[i]);
    		if (uploadImage.indexOf(ext[i]) > 0)
    		{
    			flag = true;
    			break;
    		}
    	}
    	
    	if(pos==-1){
    		flag = true;
    	}
    	
    	if(flag == false){
    		
    		 ImgOK = false;
    		 ImgPortraitPhoto = false;
    		 
    		 document.getElementById("msgPortraitImg").style.display = "block";
    		 message = "只能上传.jpg、.jpeg、.bmp、.png、.gif、格式的图片!";
    		 msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
    	}else{
    		
    		//ImgOK = true;
    		ImgPortraitPhoto = true;
    		alert("恭喜您，医生头像上传成功！ \n\r照片名：" + uploadImage);
    		document.getElementById('UploadPortraitPhoto').style.display='none';
    		document.getElementById("msgPortraitImg").style.display = "none";
    		//document.getElementById("msgPortraitImg").style.display = "block";
    		//message = "医生头像上传成功，请稍后...";
    	    //msg.innerHTML = "<a style='color:green;'>" + message + "</a>";
    	    //setTimeout(" document.getElementById('UploadPortraitPhoto').style.display='none' ",1000);
    		//document.getElementById("msgPortraitImg").style.display = "none";
    		//document.getElementById("UploadPortraitPhoto").style.display = "none";
    	}
    }
    
    function authSubmit()
    {
    	
	   var message = null;
	   var msg = document.getElementById("msgAuth");
	   
	   if(ImgCriteriaPhoto&&ImgPortraitPhoto){
	   //if(ImgOK){
		   document.getElementById('msgAuth').style.display='none';
		   document.getElementById('authSubmit').style.display='none';
		   document.getElementById('authWait').style.display='block';
		   msg.innerHTML = "";
		   var authForm = document.getElementById("authForm");
		   authForm.submit(); 
	   }else if(ImgCriteriaPhoto){
		   document.getElementById('msgAuth').style.display='block';
		   message = "请上传医生头像！";
		   msg.innerHTML = "<a style='color:green;'>" + message + "</a>";
	   }else if(ImgPortraitPhoto){
		   document.getElementById('msgAuth').style.display='block';
		   message = "请上传医生证照！";
		   msg.innerHTML = "<a style='color:green;'>" + message + "</a>";
	   }else{
		   document.getElementById('msgAuth').style.display='block';
		   message = "请上传医生证照和头像！";
		   msg.innerHTML = "<a style='color:green;'>" + message + "</a>";
	   }
    }
    
    
    