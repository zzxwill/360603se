 <%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="dao.*" %>
 
 <%@ include file="../include/package.jsp"%>  
<%@ include file="../check/checkChangGuan.jsp"%>
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
<%
	request.setCharacterEncoding("UTF-8");
	String url = "../changguan/index.jsp?module=user";
	String info = null;
	String type = request.getParameter("type");
	String changguan_id_string = request.getParameter("changguan_idEdit");
	String userID_tostring = request.getParameter("userId");
	if(null==type||type.equals("")||null==changguan_id_string||changguan_id_string.equals("")){
%>
	<script language='javascript' type='text/javascript'>
		window.location = "<%=url%>";
	</script>
<%		
	}else{
		int changguan_id = Integer.parseInt(changguan_id_string);
		if(type.equals("edit")){ //编辑
			if(null==userID_tostring||userID_tostring.equals("")){
			%>
				<script language='javascript' type='text/javascript'>
					window.location = "<%=url%>";
				</script>
			<%
			}
			else{
				int id = Integer.parseInt(userID_tostring);
				UserDao userAdminDao = new UserDao();
				String pw = request.getParameter("passwordEdit");
				//String nickname = request.getParameter("nickname"+id);
				String tel = request.getParameter("telephoneEdit");
				//String email = request.getParameter("email"+id);
				int auth = GROUP_INTERVAL + changguan_id;
							
				 if(null==pw||pw.equals("")){
			    	userAdminDao.modifyUserByAdmin(id,"",tel,auth,0);
				 }
				 else{
			    	PasswordUtil GP = new PasswordUtil();
			    	pw = GP.generatePassword(pw);
			    	userAdminDao.modifyUserByAdmin(id,pw,tel,auth,0);
				 }
			}
		}
	}
%>
<script language='javascript' type='text/javascript'>
		window.location = "<%=url%>";
	</script>
</body>
</html>