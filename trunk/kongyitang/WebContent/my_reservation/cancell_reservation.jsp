<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*"
	pageEncoding="UTF-8"%>

<%@ include file="../include/package.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>取消成功</title>

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

						<div id="backButton" style="width: 60px;">
							<a id="return_link" onclick="location.href='index.jsp'">返回</a>
						</div>

						<!-- <div id="backButton" style="width: 60px;"
							onclick="return_to_wechat_main()">返回</div> -->

					</td>
					<td align="center" width="34%"><a style="color: white;">取消预约</a></td>
					<td width="33%">&nbsp;&nbsp;</td>
				</tr>
			</table>
		</div>

		<div data-role="content">
		

				<%
   	Dao dao = new Dao();
    
    request.setCharacterEncoding("utf-8");
	 long clinic_reservation_normal_id = Long.parseLong(request.getParameter("clinic_reservation_normal_id"));
	 
	
	 
	 HashMap hm = new HashMap();
	 hm.put("clinic_reservation_normal_id", clinic_reservation_normal_id);
	 
	
	 
	 
	 
	 dao.cancell_reservation(hm);
	 
	 
	 
	 //发送成功预约的短信	
	/* ReservationSMS reservationSMS = new ReservationSMS();
		String msg = "招生在线-" + xuetang + "：" + name + "，" + gender_sms  + "，" +age  + "，" + mobile + "。";
		reservationSMS.run(msg,String.valueOf(mobile).toString());		
		 */
    %>
			
				<br>
		
				
			<% String url="../my_consume/index.jsp"; %>	
			<br><br>
			<center>
		 	<div style="color:red"><big>取消成功！
				<br>正在返回预约前界面，请稍后...</big>
			</div> 
			</center>
			<script language='javascript' type='text/javascript'>
				setTimeout(" window.location = '<%=url %>' ",1000);
			</script>
				
		</div>

		<div data-role="footer" data-id="myfooter" data-position="fixed">

		</div>

	</div>

</body>
</html>