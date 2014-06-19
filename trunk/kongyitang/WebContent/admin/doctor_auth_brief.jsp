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
  <%//@ include file="../check/index.jsp"%> 
</head>
  
 <body>
  <div data-role="page">
	<div data-role="header">
	
	录入成功！
	
 	</div>
  	<div data-role="content">
	<%@ include file="../admin/doctor_auth_upload.jsp"%> 
	<%
    request.setCharacterEncoding("UTF-8");
 	String url = "index.jsp";
  	String userName = su.getRequest().getParameter("userName");
  	String userGender_string = su.getRequest().getParameter("userGender");
  	//String userTel = su.getRequest().getParameter("userTel");
  	String site_id_string = su.getRequest().getParameter("site_id");
  	//String title = su.getRequest().getParameter("title");
  	//String master = su.getRequest().getParameter("master");
  	String department = su.getRequest().getParameter("department");
  	//String certified_type = su.getRequest().getParameter("certified_type");
  	//String visti_fee_string = su.getRequest().getParameter("visti_fee");
  	String introduction = su.getRequest().getParameter("introduction");
  	
  	//System.out.println("userName:" + userName + "\n");
  	//System.out.println("site_id_string:" + site_id_string + "\n");
  	String doctor_portrait = null;
  	doctor_portrait = su.getRequest().getParameter("doctor_portrait");
  	//System.out.println("doctor_portrait:" + doctor_portrait + "\n");
  	
  	if(null==userName||userName.equals("")||null==userGender_string||userGender_string.equals("")
  	||null==site_id_string||site_id_string.equals("")||null==doctor_portrait||doctor_portrait.equals("")
  	||null==department||department.equals("")||null==introduction||introduction.equals("")){
		%>
		<script language='javascript' type='text/javascript'>
			alert("您输入的数据不完整！")
			window.location = "<%=url %>";
		</script>
		<%	
  	}else{
  		
  	  	if(sign==true){
  	  		doctor_portrait = filename;
  		}else{
  			doctor_portrait = null;
  		}
  		
  		//TODO 照片处理
  		
  		int userGender = Integer.parseInt(userGender_string);
  		int site_id = Integer.parseInt(site_id_string);
  		int visti_fee = 0;
  		String userTel = "XXXXXX";
  		String title = "";
  		String master = "";
  		String certified_type = "";
  		String visti_fee_string = "";
  		
  		InsertDoctorInfo insertDoctorInfo = new InsertDoctorInfo();
  		insertDoctorInfo.insertUser_Doctor(userName, userGender, department, userTel, title, master, 
  				certified_type, doctor_portrait, visti_fee, introduction, site_id);
  		System.out.println("insert doctor  successed");
  		/*
  		System.out.println(USERID + "\n," + authShenFenZhenghao + "\n," + authYiShiZhengHao + "\n," 
  				+ authZhiYeLeiXing + "\n," + authLingChuangZhiCheng + "\n," + authSuoZaiYiYuan
  				+ authKeShi + "\n," + authShiCheng + "\n," + uploadCriteriaImage + "\n,"
  				+ uploadPortraitImage + "\n");
  		*/
  	%>
  	<center>
  	<br><br>

  	<br><br>
  	<script>
	  	function GoBack(){
	  		window.location = "index_brief.jsp";
	  	}
  	</script>
  	
	<a href="index_brief.jsp">继续录入</a>
	
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