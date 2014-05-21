<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*"
	pageEncoding="UTF-8"%>

<%@ include file="../include/package.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>预约成功</title>

<%@ include file="../include/meta.jsp"%>
<%@ include file="../include/cssJS.jsp"%>
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
							onclick="location.href='index.jsp';">返回</div>
					</td>
					<td align="center" width="34%"><a style="color: white;">预约</a></td>
					<td width="33%">&nbsp;&nbsp;</td>
				</tr>
			</table>
		</div>

		<div data-role="content">
			<!-- <table width="100%" cellspacing="0" cellpadding="0">
						<tr bgColor= "#000000">
							<td align="left" style="width: 20%"><button type="button"
									onclick="location='index.jsp'">返回</button></td>
							<td align="center" style="color: white;">预约</td>

						</tr>


					</table> -->

			<p>
				预约成功！<br>

				<%
   	Dao dao = new Dao();
    
    request.setCharacterEncoding("utf-8");
	 String xuetang = request.getParameter("xuetang");
	 String name = request.getParameter("name");
	 String  gender_str= request.getParameter("gender");
	 int gender = 2;
	 if("male".equals(gender_str)){
		 gender = 0;
	 }else if("female".equals(gender_str)){
		 gender = 1;
	 }
	 int age =Integer.valueOf(request.getParameter("age")).intValue();
	 String mobile_str = request.getParameter("mobile");
	 long mobile = Long.parseLong(mobile_str);
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
		String msg = "孔伯华学院-" + xuetang + "：" + name + "，" + gender  + "，" +age  + "，" + mobile + "。";
		reservationSMS.run(msg,String.valueOf(mobile).toString());		
		
    %>
				<!--  <script>
			self.location = '../index.jsp';
	    </script> -->

				<br>
		</div>

		<%//@ include file="../include/buttonStyle.jsp"
  %>

		<div data-role="footer" data-id="myfooter" data-position="fixed">

			<script>
		function CloseWin(){
			//window.opener=null; 
			//window.close(); 
			WeixinJSBridge.call('closeWindow');
		}
	    </script>
			<table width="100%">
				<tr>
					<td><a id='button-special' type="button" data-theme="b"
						data-mini="true" data-icon="arrow-r" data-iconpos="right"
						onclick="CloseWin()">我知道了</a></td>
				</tr>
			</table>
		</div>

	</div>

</body>
</html>