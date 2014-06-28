<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

 <%@ include file="../include/package.jsp"%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>预约成功</title>

	 <%@ include file="../include/meta.jsp"%> 
	 <%@ include file="../include/cssJS.jsp"%>
	    <%@ include file="../check/index.jsp"%> 
	 	 <%@ include file="../include/SpecificssJS.jsp"%>
<style type="text/css">
</style>

</head>
  
  <body>


 
<div data-role="page">
	<div data-role="header">
	<table width="100%">
				<tr>
					<td width="33%" align="center">
						<div id="backButton" style="width: 60px;">
							<a id="return_link" onclick="return_to_wechat_main()"></a>
						</div>
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
									onclick="location='index.jsp'"></button></td>
							<td align="center" style="color: white;">预约</td>

						</tr>


					</table> -->
  	
  
   	
    <%
   	Dao dao = new Dao();
    
     request.setCharacterEncoding("utf-8");
	 String site = request.getParameter("site_name");
	
	 String department = request.getParameter("department");
	 String illness_name = request.getParameter("illness_name");
	 
	 if(site == null || department ==null || illness_name == null){
	%>	 
		 <center>
			<div style="color:red"><big>禁止重复提交！
				<br>正在预约前界面，请稍后...</big>
			</div>
			</center>
			<script language='javascript' type='text/javascript'>
				setTimeout(" window.location = 'index.jsp' ",2000);
			</script>	 
	<%	 
	 }else{
	 
		 site = java.net.URLDecoder.decode(site,"UTF-8");
		 site = java.net.URLDecoder.decode(site,"UTF-8");
		 
		 department = java.net.URLDecoder.decode(department,"UTF-8");
		 department = java.net.URLDecoder.decode(department,"UTF-8");



		 
	 int doctorid = Integer.valueOf(request.getParameter("doctor_id")).intValue();
	 int outpatientid = Integer.valueOf(request.getParameter("outpatient_id")).intValue();
	 //int outpatientid = 100001;
	 String date = request.getParameter("date");
	 int outpatient_date_id =Integer.valueOf(request.getParameter("outpatient_date_id"));
	 
	 String purpose = request.getParameter("purpose");
	 
	 
	// String purpose = "复查";
	 String detail = request.getParameter("detail");
	 //int mobile = Integer.valueOf(request.getParameter("mobile")).intValue();
	 long mobile = Long.parseLong(request.getParameter("mobile"));
	 String name = request.getParameter("name");
	 
	 dao.submit_reservation(illness_name, purpose, detail, mobile, name, site, department, doctorid,USERID, outpatientid,date, outpatient_date_id);
	 
	//发送成功预约的短信	
		ReservationSMS reservationSMS = new ReservationSMS();
		String msg = "孔医堂门诊-" + site + "：" + department + "，"+ name + "，" + mobile + "。请准时就诊，谢谢！";
		reservationSMS.run(msg,String.valueOf(mobile).toString());	
		
		String notification = "恭喜您 " + name + "，您已成功预约“门诊-" + site + "“！";
		
				notification = java.net.URLEncoder.encode(notification, "UTF-8");
					System.out.println(notification);
					notification = java.net.URLEncoder.encode(notification, "UTF-8");
					System.out.println(notification);
					String url= "../reserve_xuetang/notify_reserve_xuetang.jsp?notification=" + notification;
		
		
		%>	
			<%-- <br><br>
			<center>
			<div style="color:red"><big>恭喜您 <%=name %> ，您已成功预约"门诊-<%=site %>"！
				<br>正在预约前界面，请稍后...</big>
			</div>
			</center> --%>
			<script language='javascript' type='text/javascript'>
				window.location.href = "<%=url%>";
			</script>
	<%} %>   

  </div>



	<div data-role="footer" data-id="myfooter" data-position="fixed">
	  
	    <script>
		
		
		//微信主界面  Will  5/19/2014
		function return_to_wechat_main(){
				WeixinJSBridge.call('closeWindow');
			/* document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
				WeixinJSBridge.call('closeWindow');
			}); */
		}
		
		
	    </script>
<!-- 	    <table width="100%">
	    	<tr><td>
	<a id='button-special' type="button" data-theme="b" data-mini="true" data-icon="arrow-r" data-iconpos="right" onclick="CloseWin()">我知道了</a>
	  		</td></tr>
	  	</table> -->
	</div>

</div> 

  </body>
</html>