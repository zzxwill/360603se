<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

 <%@ include file="../include/package.jsp"%> 
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title><%=sysName %></title>

	 <%@ include file="../include/meta.jsp"%> 
	 <%@ include file="../include/cssJS.jsp"%> 

<style type="text/css">
</style>
   <%@ include file="../check/index.jsp"%> 
</head>
  
 <body>
  <div data-role="page">
	<div data-role="header">
	<table width="100%">
		<tr>
			<td width="33%">
				<div id="backButton" style="width:60px;"><a href="javascript:history.back(-1)"></a></div>
			</td>
			<td align="center" width="34%"><a style="color:white;">医生认证</a></td>
			<td width="33%">&nbsp;&nbsp;</td>
		</tr>
	</table>
 	</div>
 	
  	<div data-role="content">
  	<%
    request.setCharacterEncoding("UTF-8");
 	String url = "doctor_auth_1.jsp";
  	String role = ""; 
  	String authShenFenZhenghao = request.getParameter("authShenFenZhenghao");
  	String authYiShiZhengHao = request.getParameter("authYiShiZhengHao");
  	String authZhiYeLeiXing = request.getParameter("authZhiYeLeiXing");
  	String authLingChuangZhiCheng = request.getParameter("authLingChuangZhiCheng");
  	String authSuoZaiYiYuan = request.getParameter("authSuoZaiYiYuan");
  	String authKeShi = request.getParameter("authKeShi");
  	String authShiCheng = request.getParameter("authShiCheng");
  	
  	if(null==authShenFenZhenghao||authShenFenZhenghao.equals("")||null==authYiShiZhengHao||authYiShiZhengHao.equals("")
  	||null==authZhiYeLeiXing||authZhiYeLeiXing.equals("")||null==authLingChuangZhiCheng||authLingChuangZhiCheng.equals("")
  	||null==authSuoZaiYiYuan||authSuoZaiYiYuan.equals("")||null==authKeShi||authKeShi.equals("")
  	||null==authShiCheng||authShiCheng.equals("")){
		%>
		<script language='javascript' type='text/javascript'>
				window.location = "<%=url %>";
		</script>
		<%	
  	}else{
 	
	  	%>

    	<form method="post" name="authForm" id="authForm" action="doctor_auth_3.jsp" encType="multipart/form-data" >
	     	 <fieldset data-role="fieldcontain">
	     	 
		<link rel="stylesheet" href="../css/doctor_auth.css" />
		 <script src="../js/doctor_auth.js"></script>
	     	 
		 <input id="authShenFenZhenghao" name="authShenFenZhenghao" type="hidden" value="<%=authShenFenZhenghao %>" />
		 <input id="authYiShiZhengHao" name="authYiShiZhengHao" type="hidden" value="<%=authYiShiZhengHao %>" />
		 <input id="authZhiYeLeiXing" name="authZhiYeLeiXing" type="hidden" value="<%=authZhiYeLeiXing %>" />
		 <input id="authLingChuangZhiCheng" name="authLingChuangZhiCheng" type="hidden" value="<%=authLingChuangZhiCheng %>" />
		 <input id="authSuoZaiYiYuan" name="authSuoZaiYiYuan" type="hidden" value="<%=authSuoZaiYiYuan %>" />
		 <input id="authKeShi" name="authKeShi" type="hidden" value="<%=authKeShi %>" />
		 <input id="authShiCheng" name="authShiCheng" type="hidden" value="<%=authShiCheng %>" />

	<%}%>
		
	<center>	
	<br><br>
	<table width="70%">
		<tr>
			<td width="95%" align="center"><div style="width:95%" id="UploadPhoto" onclick="UploadCriteriaPhoto();">上传医生证照</div></td>
			<td width="5%"><a style="color:red;">&nbsp;&nbsp;*</a></td>
		</tr>
		<tr>
			<td width="95%" align="center">&nbsp;<br></td>
			<td width="5%">&nbsp;<br></td>
		</tr>
		<tr>
			<td width="95%" align="center"><div  style="width:95%" id="UploadPhoto" onclick="UploadPortraitPhoto();">上传医生头像</div></td>
			<td width="5%"><a style="color:red;">&nbsp;&nbsp;*</a></td>
		</tr>
	</table>
	
	<div id="UploadCriteriaPhoto" class="UploadCriteriaPhoto" >
		<div><big>上传医生证照</big></div><br>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
			<td></td>
<!--				<td align="center" width="100%"> <div id="PhotoButton">拍&nbsp;&nbsp;照</div></td>-->
			</tr>
<!--			<tr><td><hr></td></tr>-->
			<tr>
				<td align="center" width="100%">		
				<div id="PhotoButton" style="position:relative;">从相册中选择
					<input style="position:absolute;left:0;top:-35;width:100%;height:100%;opacity:0;" 
					type="file" id="uploadCriteriaImage" name="uploadCriteriaImage" onchange="checkCriteriaImg();" />
				</div>
				</td>
			</tr>
			<tr><td><hr color="<%=sysFontColor %>"></td></tr>
			<tr>
				<td align="center">
					<div id="msgCriteriaImg"></div>
					<div id="UploadCriteriaPhotoCancel" onclick="UploadCriteriaPhotoCancel()">取&nbsp;&nbsp;消</div>
				</td>
			</tr>
		</table>
	</div>
	
	<div id="UploadPortraitPhoto" class="UploadPortraitPhoto" >
		<div><big>上传医生头像</big></div><br>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
			<td></td>
<!--				<td align="center" width="100%"> <div id="PhotoButton">拍&nbsp;&nbsp;照</div></td>-->
			</tr>
<!--			<tr><td><hr></td></tr>-->
			<tr>
				<td align="center" width="100%">		
				<div id="PhotoButton" style="position:relative;">从相册中选择
					<input  style="position:absolute;left:0;top:-35;width:100%;height:100%;opacity:0;" 
					type="file" id="uploadPortraitImage" name="uploadPortraitImage" onchange="checkPortraitImg();"/>
				</div>
				</td>
			</tr>
			<tr><td><hr color="<%=sysFontColor %>"></td></tr>
			<tr>
				<td align="center">
					<div id="msgPortraitImg"></div>
					<div id="UploadPortraitPhotoCancel" onclick="UploadPortraitPhotoCancel()">取&nbsp;&nbsp;消</div>
				</td>
			</tr>
		</table>
	</div>
	
		 <br><br>
		<div id="msgAuth" ></div>
   		<div id="authSubmit"  style="width:90%"><div id="submitButton" onclick="authSubmit()">提交审核</div></div>
    	<div id="authWait" style="display:none;width:90%"><div id="submitButton">正在提交，请稍后...</div></div>
    	<br>
    	</center>
    	</fieldset>
	</form>	
  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>