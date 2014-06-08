<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*"
	pageEncoding="UTF-8"%>

<%@ include file="../include/package.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>

<%@ include file="../include/meta.jsp"%>
<%@ include file="../include/cssJS.jsp"%>
   <%@ include file="../check/index.jsp"%> 
<style type="text/css">
</style>

<script type="text/javascript">
//返回微信主界面  Will  5/19/2014
function return_to_wechat_main(){
		WeixinJSBridge.call('closeWindow');

}
</script>

</head>

<body>



	<div data-role="page">
		<div data-role="header">
			<table width="100%">
				<tr>
					<td width="33%" align="center">

					<!-- 	<div id="backButton" style="width: 60px;">
							<a id="return_link" onclick="location.href='index.jsp'">返回</a>
						</div> -->

						<div id="backButton" style="width: 60px;"
							onclick="return_to_wechat_main()">返回</div>
										

					</td>
					<td align="center" width="34%"><a style="color: white;">预约</a></td>
					<td width="33%">&nbsp;&nbsp;</td>
				</tr>
			</table>
		</div>

		<div data-role="content">
			

				<%
   	Dao dao = new Dao();
    
    request.setCharacterEncoding("utf-8");
	 String xuetang = request.getParameter("xuetang");
	 String name = request.getParameter("name");
	 
	 
	 if(xuetang == null || name == null){
		 
	%>
	<center>
			<div style="color:red"><big>禁止重复提交！
				<br>正在返回预约前界面，请稍后...</big>
			</div>
			</center>
			<script language='javascript' type='text/javascript'>
				setTimeout(" window.location = 'index.jsp' ",2000);
			</script>	 
		 	 
	<%	 
	 }else {
	 
	 String  gender_str= request.getParameter("gender");
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
	 if(request.getParameter("age") != null){
	 	age =Integer.valueOf(request.getParameter("age")).intValue();
	 }
	 String mobile_str = request.getParameter("mobile");
	 long mobile = 0;
	 if(mobile_str!=null){
	 	mobile = Long.parseLong(mobile_str);
	 }
	 String  job= request.getParameter("job");
	 String  company= request.getParameter("company");
	 String  title= request.getParameter("title");
	 
	 HashMap hm = new HashMap();
	 hm.put("xuetang", xuetang);
	 hm.put("name", name);
	 hm.put("gender", gender);
	 hm.put("age", age);
	 hm.put("mobile", mobile);
	 hm.put("job", job);
	 hm.put("company", company);
	 hm.put("title", title);
	 hm.put("username", USERID);
	 
	 
	 
	 dao.submit_reservation_xuetang(hm);
	 
	 
	 
	 //发送成功预约的短信	
	ReservationSMS reservationSMS = new ReservationSMS();
		String msg = "招生在线-" + xuetang + "：" + name + "，" + gender_sms  + "，" +age  + "，" + mobile + "。";
		reservationSMS.run(msg,String.valueOf(mobile).toString());		
		
	String notification = "恭喜您 " + name + "，您已成功预约“孔伯华学院-" + xuetang + "“！";
		
    %>
			
				<br>
		

				
			<% 
			notification = java.net.URLEncoder.encode(notification, "UTF-8");
				System.out.println(notification);
				notification = java.net.URLEncoder.encode(notification, "UTF-8");
				System.out.println(notification);
				String url= "notify_reserve_xuetang.jsp?notification=" + notification;
				
			%>

			 <script language='javascript' type='text/javascript'>
				 window.location.href = "<%=url%>"; 
			</script>
		<%} %>		
		

		<div data-role="footer" data-id="myfooter" data-position="fixed">
		</div>

	</div>
	
	

</body>
</html>