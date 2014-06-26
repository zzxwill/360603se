<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="database.*" %>
<%@page import="dao.*" %>
<%
UserDao userChangGuanAdminDao = new UserDao();
int ChangGuanAdminID = userChangGuanAdminDao.getUserID(loginedUserName);
userChangGuanAdminDao.getUserInfo(ChangGuanAdminID);

ChangGuanDao UserChangGuanDao = new ChangGuanDao();
String ChangGuanName = UserChangGuanDao.getChangGuanName_by_id(role);

%>

	<tr align="center" >
		<td align="center">1</td>
		<td align="center"><%=userChangGuanAdminDao.UserName %></td>
		<td align="center"><%=userChangGuanAdminDao.UserTel %></td>
		<td align="center">
			<div style="color:green"><%=ChangGuanName %>主</div>
		</td>
		<td align="center" >
			<%=(userChangGuanAdminDao.IsUserDel(ChangGuanAdminID)==1)?"<p style='color: red;'>禁&nbsp;用</p>":"<p style='color: green;'>正&nbsp;常</p>" %>
		</td>
		<td align="center" valign="middle" >
				
			<form class="form-horizontal" id="userFormEdit" method="post" action="../changguan/editUserOwnInfo.jsp?type=edit&userId=<%=ChangGuanAdminID %>">	
				<div class="view"> 
			       <!-- Button to trigger modal --> 
			       <div align="right">
			       <center><a id="myModalLinkUserEdit" href="#myModalContainerUserEdit" role="button" class="btn btn-primary" data-toggle="modal">编辑</a> </center>
			       </div>
			       <!-- Modal -->
			       <div id="myModalContainerUserEdit" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabelUserEdit" aria-hidden="true">
			         <div class="modal-header">
			           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			           <h3 id="myModalLabelUserEdit" contenteditable="true">编辑<%=ChangGuanName %>用户信息</h3>
			         </div>
			         
					<div class="modal-body">
					
<script>


    function checkEditUserOwnInput()
    {
       //alert(id);
	   var telephoneEdit = document.getElementById('telephoneEdit').value; 
	   
	   var message = null;
	   var msg = document.getElementById("msgUserEdit");
	   var flag = 1;  
	   if(null==telephoneEdit||telephoneEdit == ""){
			  flag = 0;
		 	  message = "请输入正确的电话！";
			  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
			  //alert(message);
	   }
	   if(flag==1){
	      //var addrForm = document.forms("addrForm");
	      var userForm = document.getElementById("userFormEdit");
	      userForm.submit(); 
	   }
    }

</script>
					
					<div align="center" style="color: red">密码若不修改请勿填写！</div>
					<table width="58%" align="center" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td align="left" width="25%">用户名:</td>
							<td align="center" width="70%">
								<input style="height: 30px" type="text" name="usernameEdit" id="usernameEdit" style="width:90%;" value="<%=userChangGuanAdminDao.UserName %>" readonly /></td>
							<td width="5%"><a style="color: red;">&nbsp;&nbsp;*</a></td>
						</tr>
						<tr>
							<td align="left" width="25%">密 &nbsp;码:</td>
							<td align="center" width="70%">
								<input style="height: 30px" type="password" name="passwordEdit" style="width:90%;" /></td>
							<td width="5%"><a style="color: red;">&nbsp;&nbsp;*</a></td>
						</tr>
						<tr>
							<td align="left" width="25%">电 &nbsp;话:</td>
							<td align="center" width="70%">
								<input style="height: 30px" type="text" id="telephoneEdit" name="telephoneEdit" style="width:90%;" value="<%=userChangGuanAdminDao.UserTel %>" /></td>
							<td width="5%"><a style="color: red;">&nbsp;&nbsp;*</a></td>
						</tr>
					</table>
					<input  type="hidden" id="changguan_idEdit" name="changguan_idEdit" value="<%=role %>" />
					</div>
			         
			         <div class="modal-footer">
			         <table width="95%">
			         	<tr>
			         		<td width="66%" align="center" valign="top">&nbsp;
			         			<div id="msgUserEdit"></div>
			         		</td>
			         		<td width="17%" align="center"  valign="bottom">
			          			 <button class="btn" data-dismiss="modal" aria-hidden="true" contenteditable="true">取消</button>
			          		</td>
							<td width="17%" align="center"  valign="bottom">
			           			<input class="btn btn-primary" type="button" value="保存设置"  onclick="checkEditUserOwnInput()"/>
			           		</td>
			           	</tr>
			          </table>
			         </div>
			       </div>
			     </div>
			</form>

		</td>
	</tr>