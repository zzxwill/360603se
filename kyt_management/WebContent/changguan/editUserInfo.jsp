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
 <form class="form-horizontal" id="editUserForm" name="editUserForm" method="post" action="../changguan?module=adminUser">
<%
	request.setCharacterEncoding("UTF-8");
	String url = "../changguan/index.jsp?module=user";
	String info = null;
	String type = request.getParameter("type");
	String changguan_id_string = request.getParameter("changguan_id");
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
				String auth_tostring = request.getParameter("authority"+id);
				//System.out.println("auth_tostring:" + auth_tostring + "\n");
				if(null==auth_tostring||auth_tostring.equals("")){
	%>
					<script language='javascript' type='text/javascript'>
						window.location = "<%=url%>";
					</script>
	<%				
				 }else{
					 String username = request.getParameter("username"+id);
					 //System.out.println("username:" + username + "\n");
					 if(null==username||username.equals("")){
						%>
							<script language='javascript' type='text/javascript'>
								window.location = "<%=url%>";
							</script>
						<%
					}else{
						UserDao userAdminDao = new UserDao();
						String telephone = request.getParameter("telephone" + id);
						String radio = request.getParameter("radioChangGuan"+id);
						//System.out.println("radio:" + radio + "\n");
						if(radio.equals("1")){
							userAdminDao.deleteUser(id);
							userAdminDao.deleteTiaoLiShiUser(username);
						}else if(radio.equals("0")){
							String pw = request.getParameter("password"+id);
							//String nickname = request.getParameter("nickname"+id);
							String tel = request.getParameter("telephone"+id);
							//String email = request.getParameter("email"+id);
							int auth = Integer.parseInt(auth_tostring);
							if(auth==2||auth==3){
									
								if(auth==3){
									//System.out.println("auth:" + auth + "\n");
									userAdminDao.modifyTiaoLiShiUserByAdmin(username,changguan_id,tel,0);
								}
								auth = auth*GROUP_INTERVAL + changguan_id ;
								
								if(null==pw||pw.equals("")){
							    	userAdminDao.modifyUserByAdmin(id,"",tel,auth,0);
							    }
							    else{
							    	PasswordUtil GP = new PasswordUtil();
							    	pw = GP.generatePassword(pw);
							    	userAdminDao.modifyUserByAdmin(id,pw,tel,auth,0);
							    }
							}else{
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
				}
			}
		}
		else if(type.equals("new")){ //新建
			//TODO：判断非法用户名，是否同名
			String auth_tostring = request.getParameter("authorityNew");
			if(null==auth_tostring||auth_tostring.equals("")||auth_tostring.equals("firstOption")){
			%>
				<script language='javascript' type='text/javascript'>
					window.location = "<%=url%>";
				</script>
			<%				
			}else{
				String name = request.getParameter("usernameNew");
				String pw = request.getParameter("passwordNew");
				if(null==name||name.equals("")||name.equals("null")||null==pw||pw.equals("")||pw.equals("null")){
				%>
					<script language='javascript' type='text/javascript'>
						alert("请输入正确的用户名和密码！");
					window.location = "<%=url%>";
					</script>
				<%
				}
				String nickname = request.getParameter("nicknameNew");
				String tel = request.getParameter("telephoneNew");
				
				int auth = Integer.parseInt(auth_tostring);
				if(auth==2||auth==3){
						UserDao userAdminDao = new UserDao();
						
						if(auth==3){
							//System.out.println("auth:" + auth + "\n");
							userAdminDao.insertTiaoLiShiUser(name,changguan_id,tel,"");
						}
						auth = auth*GROUP_INTERVAL + changguan_id ;
						
						PasswordUtil GP = new PasswordUtil();
				    	pw = GP.generatePassword(pw);
				    	
				    	userAdminDao.insertUser(name,pw,tel,auth);
				}else{
					PasswordUtil GP = new PasswordUtil();
			    	pw = GP.generatePassword(pw);
			    	UserDao userAdminDao = new UserDao();
			    	userAdminDao.insertUser(name,pw,tel,auth);
				}
				// System.out.println("username:" + name + "\npw:" + pw + "\nnickname:" + nickname +"\ntel:" 
				//		+ tel + "\nemail:" + email + "\nauthority:" + auth + "\n");
			}
		}
	}
%>
</form>
<script language='javascript' type='text/javascript'>
		window.location = "<%=url%>";
	</script>
</body>
</html>