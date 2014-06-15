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

</head>
  
 <body>
  <div data-role="page">
	<div data-role="header">
	
	<table width="100%">
		<tr>
			<td width="33%">
				<div id="backButton" style="width:60px;" >
				<a href="javascrpt:closeWin();"></a>
				</div>
			</td>
			<td align="center" width="34%"><a style="color:white;">重置密码成功</a></td>
			<td width="33%">&nbsp;&nbsp;</td>
		</tr>
	</table>
	
 	</div>
  	<div data-role="content">
	
		<%
	    request.setCharacterEncoding("UTF-8");
	 	String url = "setPassword_1.jsp";
	 	
	 	String role = request.getParameter("role");
	 	//System.out.println("role:" + role +"\n");
	 	if(null==role||role.equals("")){
			%>
			<script language='javascript' type='text/javascript'>
				window.location = "<%=url%>";
			</script>
		<%
	 	}else{
			String setPasswordTel = request.getParameter("setPasswordTel");
			String setPasswordPW = request.getParameter("setPasswordPW_2");  
			if(null==setPasswordTel||setPasswordTel.equals("")
					||null==setPasswordPW||setPasswordPW.equals("")){
			%>
				<script language='javascript' type='text/javascript'>
					window.location = "<%=url%>";
				</script>
			<%	
			}else{
				int setPasswordRole_int = Integer.parseInt(role);
				PasswordUtil GP = new PasswordUtil();
				setPasswordPW = GP.generatePassword(setPasswordPW);
				if(setPasswordRole_int==0){
					//System.out.println("patient register!\n");
					UserDaoPatient patient = new UserDaoPatient();
					patient.modifyPassword_Patient(setPasswordTel,setPasswordPW);

					%>
					<center>
					<br><br>
					<p style='color:red;'>您已成功重置孔医堂账号为 <%=setPasswordTel %> 的密码！</p>
					<br>正在登陆界面，请稍后...
					</center>
					<%
					
				}else if(setPasswordRole_int==1){
					UserDaoDoctor doctor = new UserDaoDoctor();
					doctor.modifyPassword_Doctor(setPasswordTel,setPasswordPW);
					%>
					<center>
					<br><br>
					<p style='color:red;'>您已成功重置孔医堂账号为 <%=setPasswordTel %> 的密码！</p>
					<br>正在登陆界面，请稍后...
					</center>
					<%
				}
			%>
			<script language='javascript' type='text/javascript'>
				setTimeout(" window.location = 'index.jsp' ",1500);
			</script>
			<%	
			}
	 	}
	%>
	
  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>