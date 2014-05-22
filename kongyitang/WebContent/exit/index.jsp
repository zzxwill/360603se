 <%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
 
 <%@ include file="../include/package.jsp"%>  

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <title><%=sysName %></title>
	 
	 <%@ include file="../include/meta.jsp"%> 
	 <%@ include file="../include/cssJS.jsp"%> 

  </head>
     <%@ include file="../check/checkAnonymous.jsp"%>
  <body>
 
     <center>
     <%
     USERROLE = ipDao.getUserRole_by_address(TMP_IPAdress);
	 ipDao.modifyStatus(USERID, USERROLE);
	 String url = "../my_member/index.jsp";
     %>
     <br><br>
     <div style="color:<%=sysFontColor %>" ><big>您已成功注销登陆！<br>
     	正在返回“登陆与注册”界面，请稍后...</big></div>
    </center>
 	<script language='javascript' type='text/javascript'>
		setTimeout(" window.location = '<%=url %>' ",1000);
	</script>
</body>
</html>
