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
				<div id="backButton" style="width:60px;" onclick="closeWin();">返回</div>
			</td>
			<td align="center" width="34%"><a style="color:white;">登&nbsp;&nbsp;陆</a></td>
			<td width="33%">&nbsp;&nbsp;</td>
		</tr>
	</table>
	
 	</div>
 <center>
  	<div data-role="content">
	<form method="post" name="loginForm" id="loginForm" action="login_success.jsp">
	     <fieldset data-role="fieldcontain">
	     <link rel="stylesheet" href="../css/my.css" />
 <script>
    function checkLogin()
    {
       document.getElementById("tmpMsg").style.display = "none"; 
	   var loginName = document.getElementById("loginName").value;
	   var loginPW = document.getElementById("loginPW").value;
	   var message = null;
	   var msg = document.getElementById("msgLogin");
	   var flag = 1;
	   if(null==loginPW||loginPW==""){
			  flag = 0;
		 	  message = "请输入您的密码！";
			  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
		}
	   if(null==loginName||loginName==""){
		  flag = 0;
	 	  message = "请输入您的用户名（手机号）！";
		  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
	   }

	   if(flag==1){
		  document.getElementById("loginSubmit").style.display = "none";
		  document.getElementById("loginWait").style.display = "block";
	      var loginForm = document.getElementById("loginForm");
	      loginForm.submit(); 
	   }
    }

</script>
	<%
	request.setCharacterEncoding("UTF-8");
	String url = "index.jsp";
	String loginName = request.getParameter("loginName");
	String loginPW = request.getParameter("loginPW");
	if(null==loginName||loginName.equals("")||null==loginPW||loginPW.equals("")){
	%>
		<script language='javascript' type='text/javascript'>
			window.location = "<%=url%>";
		</script>
	<%		
	}else{
		Validate validate = new Validate();
		if(validate.validate(0, loginName, loginPW)){
			
			UserDaoPatient userDaoPatient = new UserDaoPatient();
			int userID = userDaoPatient.getUserId_by_Tel_Patient(loginName);
			
			GetLocalIpAddress getLocalIpAddress = new GetLocalIpAddress();
			String TMP_IPAdress = getLocalIpAddress.getLocalIpAddress();
			%>
			<%@ include file="../include/IPV4.jsp"%> 
			<%
			if (IPV4 == null || IPV4.length() == 0 || "unknown".equalsIgnoreCase(IPV4)) {
				;
			}else{
				TMP_IPAdress += IPV4;
			}
			
			IPDao ipDao = new IPDao();
			if(ipDao.isUserID_by_address_Exist(userID,0)==1){
				ipDao.modifyAddress(userID,0,TMP_IPAdress);
			}else{
				ipDao.insertIP(userID,0,TMP_IPAdress);
			}
			//System.out.println("Patient success!");
			curPath = request.getParameter("curPath");
			//System.out.println("curPath0:" + curPath + "\n");
			if(null==curPath||curPath.equals("")){
				%>
				<p style='color:red;'>恭喜您 <%=loginName %>，登陆成功！</p>
				<%	
			}else{
				%>
				<div style="color:red"><big>恭喜您 <%=loginName %>，登陆成功！正在返回登陆前界面，请稍后...</big></div>
				<script language='javascript' type='text/javascript'>
					setTimeout(" window.location = '<%=curPath %>' ",1500);
				</script>
				<%
				//System.out.println("curPath00:" + curPath + "\n");
				//response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
				//String newLocn = curPath;
				//response.setHeader("Location",newLocn);				
			}

		}else if(validate.validate(1, loginName, loginPW)){
			
			UserDaoDoctor userDaoDoctor = new UserDaoDoctor();
			int userID = userDaoDoctor.getUserId_by_Tel_Doctor(loginName);
			
			GetLocalIpAddress getLocalIpAddress = new GetLocalIpAddress();
			String TMP_IPAdress = getLocalIpAddress.getLocalIpAddress();
			%>
			<%@ include file="../include/IPV4.jsp"%> 
			<%
			if (IPV4 == null || IPV4.length() == 0 || "unknown".equalsIgnoreCase(IPV4)) {
				;
			}else{
				TMP_IPAdress += IPV4;
			}
			
			IPDao ipDao = new IPDao();
			if(ipDao.isUserID_by_address_Exist(userID,1)==1){
				ipDao.modifyAddress(userID,1,TMP_IPAdress);
			}else{
				ipDao.insertIP(userID,1,TMP_IPAdress);
			}

			//System.out.println("Doctor success!");
			curPath = request.getParameter("curPath");
			//System.out.println("curPath1:" + curPath + "\n");
			if(null==curPath||curPath.equals("")){
				%>
				<p style='color:red;'>恭喜您 <%=loginName %>，登陆成功！</p>
				<%	
			}else{
				%>
				<div style="color:red"><big>恭喜您 <%=loginName %>，登陆成功！正在返回登陆前界面，请稍后...</big></div>
				<script language='javascript' type='text/javascript'>
					setTimeout(" window.location = '<%=curPath %>' ",1500);
				</script>
				<%
				//response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
				//String newLocn = curPath;
				//response.setHeader("Location",newLocn);	
				//System.out.println("curPath11:" + curPath + "\n");				
			}
	
		}else{
			%>
			<table width="100%"><tr><td align="center">登&nbsp;&nbsp;陆<hr color="red" ></td></tr></table>
	    	<table width="95%">
	    		<tr>
	    			<td width="25%"><div id="MyInput">用户名</div></td>
	    			<td width="75%"><input id="loginName" name="loginName" type="text" value="" /></td>
	    		</tr>
	    		<tr>
	    			<td width="25%"><div id="MyInput">密&nbsp;&nbsp;&nbsp;&nbsp;码</div></td>
	    			<td width="75%"><input id="loginPW" name="loginPW" type="password" value="" /></td>
	    		</tr>
    		</table>
	    	<br>
			<div id="msgLogin" ></div>
			<div id="tmpMsg" style='color:red;'>您输入的用户名或密码有误！</div>
			<div id="loginSubmit" ><div id="SubmitButton" onclick="checkLogin()">登&nbsp;&nbsp;&nbsp;&nbsp;陆</div></div>
	    	<div id="loginWait" style="display:none"><div id="SubmitButton">正在登陆，请稍后...</div></div>
	    	<br>
			<div id="SubmitButton" onclick="GoRegister()">注&nbsp;&nbsp;&nbsp;&nbsp;册</div>
			<%
		}
	}
	
	%>
    	</fieldset>
	</form>	
  </div>
</center>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>