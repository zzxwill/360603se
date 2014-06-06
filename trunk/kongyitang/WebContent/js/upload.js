function isImg()
{
	var uploadImage = document.getElementById("uploadImage").value;
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
		alert('只能上传.jpg、.jpeg、.bmp、.png、.gif、格式的图片!');
		window.location="index.jsp";
	}
}

function submitImg(){
	
	
	document.getElementById("ImgSubmit").style.display = "none";
	document.getElementById("ImgWait").style.display = "block";
	document.getElementById("ImgCompletd").style.display = "none";

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
		 document.getElementById("ImgSubmit").style.display = "block";
		 document.getElementById("ImgWait").style.display = "none";
		 document.getElementById("ImgCompletd").style.display = "none";
		 
		 document.getElementById("msgImg").style.display = "block";
		 message = "只能上传.jpg、.jpeg、.bmp、.png、.gif、格式的图片!";
		 msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
	}else{
		document.getElementById("msgImg").style.display = "none";
		var uploadForm = document.getElementById("uploadForm");
		uploadForm.submit(); 
		document.getElementById("msg").style.display = "block";
	}
}

function hiddenMsg(){
	//alert("hiddenMsg");
	document.getElementById("ImgSubmit").style.display = "block";
	document.getElementById("ImgWait").style.display = "none";
	document.getElementById("ImgCompletd").style.display = "none";
	
	document.getElementById("msgImg").style.display = "none";
	document.getElementById("msg").style.display = "none";
}


function callback(msg)
{
	//alert("callback");
	document.getElementById("ImgSubmit").style.display = "none";
	document.getElementById("ImgWait").style.display = "none";
	document.getElementById("ImgCompletd").style.display = "block";
	
	//document.getElementById("file").outerHTML = document.getElementById("file").outerHTML;
	document.getElementById("msg").innerHTML = "<font color=red>"+msg+"</font>";
}

