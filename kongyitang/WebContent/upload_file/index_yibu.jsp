 <%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
 
 <%@ include file="../include/package.jsp"%>  

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <title><%=sysName %></title>
	 
	 <%@ include file="../include/meta.jsp"%> 
	 <%@ include file="../include/cssJS.jsp"%> 

  </head>
     <%//@ include file="../check/checkAnonymous.jsp"%>
  <body>
 
     <center>

	<form action="../admin/doctor_auth.jsp" id="uploadForm" name="uploadForm" encType="multipart/form-data"  method="post" target="hidden_frame" >
		<script src="../js/upload.js"></script>
		
<!--		<input type="file" id="uploadImage" name="uploadImage" onchange="hiddenMsg();" style="display:none"/>-->
		<div id="submitButton" onclick="uploadImage.click();" >浏览</div>
		<br>
		dddddd:<input type="file" id="uploadImage" name="uploadImage"  />
		<button type="submit">提交</button>
		
		<br>
		<span id="msg"></span>
		<div id="msgImg"></div>
		<div id="ImgSubmit"><div id="submitButton" onclick="submitImg()" >上传文件</div></div>
		<div id="ImgWait" style="display:none"><div id="submitButton">上传中...</div></div>
		<div id="ImgCompletd" style="display:none"><div id="submitButton">上传结束</div></div>
		
		<br>
		<font color="red">支持JPG,JPEG,GIF,BMP,PNG文件的上传</font>              
<!--		<iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>-->
	</form>
	
	</center>
</body>
</html>
