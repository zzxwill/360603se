<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

 <%@ include file="../include/package.jsp"%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>预约成功</title>

	 <%@ include file="../include/meta.jsp"%> 
	 <%@ include file="../include/cssJS.jsp"%>
	 <%@ include file="../include/SpecificssJS.jsp"%>
   <%@ include file="../check/index.jsp"%> 
<style type="text/css">
</style>

</head>
  
  <body>


 
<div data-role="page">
	<div data-role="header">
	<table width="100%">
				<tr>
					<td width="33%" align="center">
						<div id="backButton" style="width: 60px;"
							><a onclick="return_to_wechat_main()"></a></div>
					</td>
					<td align="center" width="34%"><a style="color: white;">健康服务</a></td>
					<td width="33%">&nbsp;&nbsp;</td>
				</tr>
			</table>
 	</div>

  	<div data-role="content">
  		<!-- <table width="100%" cellspacing="0" cellpadding="0">
						<tr bgColor= "#000000">
							<td align="left" style="width: 20%"><button type="button"
									onclick="location='index.jsp'"></button></td>
							<td align="center" style="color: white;">健康服务</td>

						</tr>


					</table> -->

			<p>
				<!-- 预约成功！<br> -->

				<%
	Dao dao = new Dao();
    
    request.setCharacterEncoding("utf-8");
	 String type = request.getParameter("type_assess");
	 String site = request.getParameter("site_assess");
	 String name = request.getParameter("name_assess");
	 
	 if(type == null || site == null || name == null){
		
	%>
				<center>
			<div style="color:red"><big>禁止重复提交！
				<br>正在预约前界面，请稍后...</big>
			</div>
			</center>
			<script language='javascript' type='text/javascript'>
				setTimeout(" window.location = 'index.jsp' ", 2000);
			</script>	 
	<%	 
		 
	 }else{
	 
	 String  gender_str= request.getParameter("gender_assess");
	 int gender = 2;
	 String gender_sms = "";
	 if("male".equals(gender_str)){
		 gender = 0;
		 gender_sms = "男";
	 }else if("female".equals(gender_str)){
		 gender = 1;
		 gender_sms = "女";
	 }
	 
	 int age = 0;
	 if(request.getParameter("age_assess") != null){
		 age =Integer.valueOf(request.getParameter("age_assess")).intValue();
	 }
	 
	 
	 String mobile_str = request.getParameter("mobile_assess");
	 
	 long mobile = 0;
	 if(mobile_str !=null){
		mobile =  Long.parseLong(mobile_str);
	 }
	 String  adjust_programe = new String();
	 String  book_date = request.getParameter("book_date_assess");
	/*  long outpatient_id  = 0;
	 if(book_date != null){
		 outpatient_id = Long.parseLong(book_date);
	 } */
	 
	 
	 String  adjust_master= new String();
	 

	 
	
	 String	 assess_programe=  request.getParameter("assess_programe_assess");
	 String	 assess_master=  request.getParameter("assess_master_assess");
	
	 

	 
	 HashMap hm = new HashMap();
	 hm.put("type", type);
	 hm.put("site",site);
	 hm.put("name", name);
	 hm.put("gender", gender);
	 hm.put("age", age);
	 hm.put("mobile", mobile);

	 hm.put("book_date", book_date);

	 
	 hm.put("assess_programe",assess_programe);
	 hm.put("assess_master",assess_master);
	 
	 hm.put("username", USERID);
	 
	 
	 
	 
	 dao.submit_reservation_shanggongfang(hm);
	 
	 
	//发送成功预约的短信	
	ReservationSMS reservationSMS = new ReservationSMS();
	String msg = "健康服务-" + type + "-" + site + "：" + name + "，" + gender_sms  + "，" +age  + "，" + mobile + "。";
	reservationSMS.run(msg,String.valueOf(mobile).toString());	
	
	String notification = "恭喜您 " + name + "，您已成功预约“上工坊健康会所-" + type + "“！";
	 
	 
	notification = java.net.URLEncoder.encode(notification, "UTF-8");
	System.out.println(notification);
	notification = java.net.URLEncoder.encode(notification, "UTF-8");
	System.out.println(notification);
	String url= "../reserve_xuetang/notify_reserve_xuetang.jsp?notification=" + notification;
	 %>
				<br>
				<br>
<%-- 			<center>
			<div style="color:red"><big>恭喜您 <%=name %> ，您已成功预约"上工坊健康会所-<%=type %>"！
				<br>正在预约前界面，请稍后...</big>
			</div>
			</center> --%>
			<script language='javascript' type='text/javascript'>
				window.location.href = "<%=url %>";
			</script>
		<%} %>
  </div>

  <%//@ include file="../include/buttonStyle.jsp"
  %>

	<div data-role="footer" data-id="myfooter" data-position="fixed">

<!--	    <script>-->
<!--		function CloseWin(){-->
<!--			//window.opener=null; -->
<!--			//window.close(); -->
<!--			WeixinJSBridge.call('closeWindow');-->
<!--		}-->
<!--	    </script>-->
<!--	    <table width="100%">-->
<!--	    	<tr><td>-->
<!---->
<!--	  			<a id='button-special' type="button" data-theme="b" data-mini="true" data-icon="arrow-r" data-iconpos="right" onclick="CloseWin()">我知道了</a>-->
<!--	  		</td></tr>-->
<!--	  	</table>-->
	</div>

</div> 

  </body>
</html>