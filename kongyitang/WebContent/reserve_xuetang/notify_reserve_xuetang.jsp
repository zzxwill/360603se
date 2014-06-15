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

<script type="text/javascript">
//微信主界面  Will  5/19/2014
function return_to_wechat_main(){
		WeixinJSBridge.call('closeWindow');

}
</script>

</head>

<body>
	<%
    //request.setCharacterEncoding("utf-8");
	//String notification = new String (request.getParameter("notification").getBytes("ISO-8859-1"),"UTF-8");
	String notification = request.getParameter("notification");
	notification = java.net.URLDecoder.decode(notification, "UTF-8");
	notification = java.net.URLDecoder.decode(notification, "UTF-8");
	
	%>


	<div data-role="page">
		<div data-role="header">
			<table width="100%">
				<tr>
					<td width="33%" align="center">				

						<div id="backButton" style="width: 60px;"
							>
							<a onclick="return_to_wechat_main()"></a>
							</div>

					</td>
					<td align="center" width="34%"><a style="color: white;">预约</a></td>
					<td width="33%">&nbsp;&nbsp;</td>
				</tr>
			</table>
		</div>

		<div data-role="content">
		
			<p>
				<br>	
				
			<% String url="index.jsp"; %>	
			<br><br>
			<center>
			<div style="color:red"><big> <%=notification %></big>
			</div>
			</center>
	
				
		</div>
		
<!-- 		<center>
			<div id="SubmitButton" style="width:90%"  onclick="return_to_wechat_main();">我知道了</div>
		</center> -->

		<div data-role="footer" data-id="myfooter" data-position="fixed">

			<table width="100%">
				<tr>
					<td><a id='button-special' type="button" data-theme="b"
						data-mini="true" data-icon="arrow-r" data-iconpos="right"
						onclick="return_to_wechat_main()">我知道了</a></td>
				</tr>
			</table>

		</div>

	</div>
	
	<a onclick="return_to_wechat_main()" href="#">return</a>

</body>
</html>