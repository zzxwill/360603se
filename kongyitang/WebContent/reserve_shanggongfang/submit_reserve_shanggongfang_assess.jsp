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
							onclick="location.href='index.jsp';">返回</div>
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
									onclick="location='index.jsp'">返回</button></td>
							<td align="center" style="color: white;">健康服务</td>

						</tr>


					</table> -->
  	
    <p>预约成功！<br>

    <%
	Dao dao = new Dao();
    
    request.setCharacterEncoding("utf-8");
	 String type = request.getParameter("type_assess");
	 String name = request.getParameter("name_assess");
	 String  gender_str= request.getParameter("gender_assess");
	 int gender = 2;
	 if("male".equals(gender_str)){
		 gender = 0;
	 }else if("female".equals(gender_str)){
		 gender = 1;
	 }
	 int age =Integer.valueOf(request.getParameter("age_assess")).intValue();
	 String mobile_str = request.getParameter("mobile_assess");
	 long mobile = Long.parseLong(mobile_str);
	 
	 String  adjust_programe = new String();
	 String  book_date = request.getParameter("book_date_assess");
	 String  adjust_master= new String();
	 

	 
	
	 String	 assess_programe=  request.getParameter("assess_programe_assess");
	 String	 assess_master=  request.getParameter("assess_master_assess");
	
	 

	 
	 HashMap hm = new HashMap();
	 hm.put("type", type);
	 hm.put("name", name);
	 hm.put("gender", gender);
	 hm.put("age", age);
	 hm.put("mobile", mobile);

	 hm.put("book_date", book_date);

	 
	 hm.put("assess_programe",assess_programe);
	 hm.put("assess_master",assess_master);
	 
	 
	 
	 
	 dao.submit_reservation_shanggongfang(hm);
	 
	 
	//发送成功预约的短信	
	ReservationSMS reservationSMS = new ReservationSMS();
	String msg = "上工坊健康会所-" + type + "：" + name + "，" + gender  + "，" +age  + "，" + mobile + "。";
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
	    	<tr><td>

	  			<a id='button-special' type="button" data-theme="b" data-mini="true" data-icon="arrow-r" data-iconpos="right" onclick="CloseWin()">我知道了</a>
	  		</td></tr>
	  	</table>
	</div>

</div> 

  </body>
</html>