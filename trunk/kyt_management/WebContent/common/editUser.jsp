<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="database.*" %>
<%@page import="dao.*" %>

<%@ include file="../check/checkCommon.jsp"%> 
<%//@ include file="../check/checkAdmin.jsp"%>  

<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0" rules=rows>
	<tr align="center" bgcolor="#D5D5D5">
		<td align="center"><strong>用户名</strong></td>
		<td align="center"><strong>电 &nbsp;话</strong></td>
		<td align="center"><strong>权 &nbsp;限</strong></td>
		<td align="center"><strong>状&nbsp;态</strong></td>
		<td align="center"><strong>编&nbsp;辑</strong></td>
	</tr>
	<%
	UserDao userAdminDao = new UserDao();
	userAdminDao.getCommonUserInfo(loginedUserName);
	
	int group = 0;
	int id=0;
	id = userAdminDao.UserID_Common;
	
	ChangGuanDao UserChangGuanDao = new ChangGuanDao();
	String ChangGuanName = UserChangGuanDao.getChangGuanName_by_id(role);
	%>

	<tr align="center" >
		<td align="center"><%=userAdminDao.UserName_Common %></td>
		<td align="center"><%=userAdminDao.UserTel_Common %></td>
		<td align="center">
			<div style="color:#773A24"><%=ChangGuanName %>客服</div>
		</td>
		<td align="center" >
			<%=(userAdminDao.IsUserDel(id)==1)?"<p style='color: red;'>禁&nbsp;用</p>":"<p style='color: green;'>正&nbsp;常</p>" %>
		</td>
		<td align="center" valign="middle" >
				
			<form class="form-horizontal" id="userForm" method="post" action="../common/editUserInfo.jsp">	
				<div class="view"> 
			       <!-- Button to trigger modal --> 
			       <div align="right">
			       <center><a id="myModalLinkUser" href="#myModalContainerUser" role="button" class="btn btn-primary" data-toggle="modal">编辑</a> </center>
			       </div>
			       <!-- Modal -->
			       <div id="myModalContainerUser" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabelUser" aria-hidden="true">
			         <div class="modal-header">
			           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			           <h3 id="myModalLabelUser" contenteditable="true">编辑<%=ChangGuanName %>客服信息</h3>
			         </div>
			         
					<div class="modal-body">
					
<script>


    function checkEditUserInput()
    {
       //alert(id);
	   var telephoneEdit = document.getElementById('telephone').value; 
	   
	   var message = null;
	   var msg = document.getElementById("msgUser");
	   var flag = 1;  
	   if(null==telephoneEdit||telephoneEdit == ""){
			  flag = 0;
		 	  message = "请输入正确的电话！";
			  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
			  //alert(message);
	   }
	   if(flag==1){
	      //var addrForm = document.forms("addrForm");
	      var userForm = document.getElementById("userForm");
	      userForm.submit(); 
	   }
    }

</script>
					
					<div align="center" style="color: red">密码若不修改请勿填写！</div>
					<table width="58%" align="center" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td align="left" width="25%">用户名:</td>
							<td align="center" width="70%">
								<input style="height: 30px" type="text" name="username" id="username" style="width:90%;" value="<%=userAdminDao.UserName_Common %>" readonly /></td>
							<td width="5%"><a style="color: red;">&nbsp;&nbsp;*</a></td>
						</tr>
						<tr>
							<td align="left" width="25%">密 &nbsp;码:</td>
							<td align="center" width="70%">
								<input style="height: 30px" type="password" name="password" style="width:90%;" /></td>
							<td width="5%"><a style="color: red;">&nbsp;&nbsp;*</a></td>
						</tr>
						<tr>
							<td align="left" width="25%">电 &nbsp;话:</td>
							<td align="center" width="70%">
								<input style="height: 30px" type="text" id="telephone" name="telephone" style="width:90%;" value="<%=userAdminDao.UserTel_Common %>" /></td>
							<td width="5%"><a style="color: red;">&nbsp;&nbsp;*</a></td>
						</tr>
					</table>
					<input  type="hidden" id="changguan_id" name="changguan_id" value="<%=role %>" />
					<input  type="hidden" id="userID" name="userID" value="<%=id %>" />
					</div>
			         
			         <div class="modal-footer">
			         <table width="95%">
			         	<tr>
			         		<td width="66%" align="center" valign="top">&nbsp;
			         			<div id="msgUser"></div>
			         		</td>
			         		<td width="17%" align="center"  valign="bottom">
			          			 <button class="btn" data-dismiss="modal" aria-hidden="true" contenteditable="true">取消</button>
			          		</td>
							<td width="17%" align="center"  valign="bottom">
			           			<input class="btn btn-primary" type="button" value="保存设置"  onclick="checkEditUserInput()"/>
			           		</td>
			           	</tr>
			          </table>
			         </div>
			       </div>
			     </div>
			</form>

		</td>
	</tr>
</table>
