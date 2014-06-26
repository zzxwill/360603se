 <%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="dao.*" %>
 
 <%@ include file="../include/package.jsp"%>  
 <%@ include file="../check/index.jsp"%> 
 <%//@ include file="../check/checkAdmin.jsp"%>  

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    <title><%=sysName %></title>
	 
	 <%@ include file="../include/meta.jsp"%> 
	 <%@ include file="../include/cssJS.jsp"%> 

  </head>
  
<script language=javascript> 
	//setTimeout("document.editUserForm.submit()",200); 
</script> 

  <body>
 <form class="form-horizontal" id="editUserForm" name="editUserForm" method="post" action="../sys?module=user">
<%
	request.setCharacterEncoding("UTF-8");
	String url = "../sys/index.jsp?module=user";
	String info = null;
	String tel = request.getParameter("telephone");
	String changguan_id_string  = request.getParameter("changguan_id");
	String userID_string  = request.getParameter("userID");
	String username  = request.getParameter("username");
	
	 if(null==tel||tel.equals("")||null==changguan_id_string||changguan_id_string.equals("")
			 ||null==userID_string||userID_string.equals("")||null==username||username.equals("")){
		%>
			<script language='javascript' type='text/javascript'>
				window.location = "<%=url%>";
			</script>
		<%
	}else{
		UserDao userAdminDao = new UserDao();

		String pw = request.getParameter("password");
		int changguan_id = Integer.parseInt(changguan_id_string);
		int userID = Integer.parseInt(userID_string);
		int auth = 0;
		auth = 3*GROUP_INTERVAL + changguan_id;
			
		if(null==pw||pw.equals("")){
	    	userAdminDao.modifyUserByAdmin(userID,"",tel,auth,0);
	    }
	    else{
	    	PasswordUtil GP = new PasswordUtil();
	    	pw = GP.generatePassword(pw);
	    	userAdminDao.modifyUserByAdmin(userID,pw,tel,auth,0);
	    }
		userAdminDao.modifyTiaoLiShiUserByAdmin(username,changguan_id,tel,0);
	}

%>
</form>
<script language='javascript' type='text/javascript'>
		window.location = "<%=url%>";
	</script>
</body>
</html>