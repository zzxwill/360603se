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
				<div id="backButton" style="width:60px;" onclick="closeWin();">返回</div>
			</td>
			<td align="center" width="34%"><a style="color:white;">认证成功</a></td>
			<td width="33%">&nbsp;&nbsp;</td>
		</tr>
	</table>
	
 	</div>
  	<div data-role="content">
	<%@ include file="../my_member/doctor_auth_upload.jsp"%> 
	<%
    request.setCharacterEncoding("UTF-8");
 	String url = "doctor_auth_1.jsp";
  	//String ASKKeShi = su.getRequest().getParameter("ASKKeShi");
  	String authShenFenZhenghao = su.getRequest().getParameter("authShenFenZhenghao");
  	String authYiShiZhengHao = su.getRequest().getParameter("authYiShiZhengHao");
  	String authZhiYeLeiXing = su.getRequest().getParameter("authZhiYeLeiXing");
  	String authLingChuangZhiCheng = su.getRequest().getParameter("authLingChuangZhiCheng");
  	String authSuoZaiYiYuan = su.getRequest().getParameter("authSuoZaiYiYuan");
  	String authKeShi = su.getRequest().getParameter("authKeShi");
  	String authShiCheng = su.getRequest().getParameter("authShiCheng");
  	
  	//String uploadCriteriaImage = su.getRequest().getParameter("uploadCriteriaImage");
  	//String uploadPortraitImage = su.getRequest().getParameter("uploadPortraitImage");
	
  	String uploadCriteriaImage = null;
  	String uploadPortraitImage = null;
  	
  	if(sign==true){
  		uploadCriteriaImage = filename;
  		uploadPortraitImage = filename02;
	}else{
		uploadCriteriaImage = null;
  		uploadPortraitImage = null;
	}
  	
  	if(null==authShenFenZhenghao||authShenFenZhenghao.equals("")||null==authYiShiZhengHao||authYiShiZhengHao.equals("")
  	||null==authZhiYeLeiXing||authZhiYeLeiXing.equals("")||null==authLingChuangZhiCheng||authLingChuangZhiCheng.equals("")
  	||null==authSuoZaiYiYuan||authSuoZaiYiYuan.equals("")||null==authKeShi||authKeShi.equals("")
  	||null==authShiCheng||authShiCheng.equals("")||null==uploadCriteriaImage||uploadCriteriaImage.equals("")
  	||null==uploadPortraitImage||uploadPortraitImage.equals("")){
		%>
		<script language='javascript' type='text/javascript'>
				window.location = "<%=url %>";
		</script>
		<%	
  	}else{
  		
  		//TODO 照片处理
  		
  		DepartmentDao departmentDao = new DepartmentDao();
  		authKeShi = departmentDao.getDepartmentName(Integer.parseInt(authKeShi));
  		
  		UserDaoDoctor userDaoDoctor = new UserDaoDoctor();
  		userDaoDoctor.authentication_Doctor(USERID,authShenFenZhenghao,authYiShiZhengHao,authZhiYeLeiXing,
  				authLingChuangZhiCheng,authSuoZaiYiYuan,authKeShi,authShiCheng,uploadCriteriaImage,uploadPortraitImage);
  		
  		System.out.println("Auth  successed");
  		/*
  		System.out.println(USERID + "\n," + authShenFenZhenghao + "\n," + authYiShiZhengHao + "\n," 
  				+ authZhiYeLeiXing + "\n," + authLingChuangZhiCheng + "\n," + authSuoZaiYiYuan
  				+ authKeShi + "\n," + authShiCheng + "\n," + uploadCriteriaImage + "\n,"
  				+ uploadPortraitImage + "\n");
  		*/
  	%>
  	<center>
  	<br><br>
  	
  	<div style="color:red"><big>您的资料已经提交成功，我们将在5个工作日内完成审核。</big></div>
  	<br><br>
  	<script>
	  	function GoBack(){
	  		window.location = "index.jsp";
	  	}
  	</script>
	<div id="submitButton"  style="width:90%;margin-top:10px;" onclick="GoBack()">返回“会员中心”</div>
  	</center>
  	<%
  	}
	%>
	
  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>