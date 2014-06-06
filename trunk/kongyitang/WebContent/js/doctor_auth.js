
	var  ImgOK = false;

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
    	SelectedKeShi.innerHTML = "<a>" + message + "</a>";
    }
    
    function UploadCriteriaPhoto(){
    	document.getElementById('UploadCriteriaPhoto').style.display='block';
    	document.getElementById('UploadPortraitPhoto').style.display='none';
    }

    function UploadCriteriaPhotoCancel(){
    	//var uploadImage = document.getElementById('uploadImage') ;
    	//uploadImage.outerHTML = uploadImage.outerHTML;
    	//uploadImage.value = null;
    	document.getElementById("msgImg").style.display = "none";
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
    	document.getElementById("msgImg").style.display = "none";
    	document.getElementById('UploadPortraitPhoto').style.display='none';
    }

    function browseBtnClick() {
//    	document.getElementById("uploadImage").click(); 
    	document.getElementById("uploadImage").click(); 
    }
    
    function checkImg(){

    	var uploadImage = document.getElementById("uploadImage").value;
    	var msg = document.getElementById("msgImg");
    	
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
    	
    	if(flag == false){
    		 ImgOK = false;
    		 
    		 document.getElementById("msgImg").style.display = "block";
    		 message = "只能上传.jpg、.jpeg、.bmp、.png、.gif、格式的图片!";
    		 msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
    	}else{
    		ImgOK = true;
    		message = "上传成功，请稍后...";
    	    msg.innerHTML = "<a style='color:green;'>" + message + "</a>";
    	    setTimeout(" document.getElementById('UploadPhoto').style.display='none' ",1500);
    		document.getElementById("msgImg").style.display = "none";
    		//document.getElementById('UploadPhoto').style.display='none';
    		//var uploadForm = document.getElementById("uploadForm");
    		//uploadForm.submit(); 
    		//document.getElementById("msg").style.display = "block";
    	}
    }
    
    ImgOK = true;
    
    function authSubmit()
    {
    	
	   var message = null;
	   var msg = document.getElementById("msgAuth");

	   if(ImgOK){
		   document.getElementById('authSubmit').style.display='none';
		   document.getElementById('authWait').style.display='block';
		   msg.innerHTML = "";
		   var authForm = document.getElementById("authForm");
		   authForm.submit(); 
	   }
    }
    
    
    