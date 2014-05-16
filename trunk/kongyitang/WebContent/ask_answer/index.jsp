<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

 <%@ include file="../include/package.jsp"%> 
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title><%=sysName %></title>

	 <%@ include file="../include/meta.jsp"%> 
	 <%@ include file="../include/cssJS.jsp"%> 


</head>
  
     <%@ include file="../check/index.jsp"%> 
  <% //String weixinID = "oDK3oji70nN1CG77qYR_z_thFUBs"; 
  //oDK3oji70nN1CG77qYR_z_thFUBs
  //gh_f5c1c22104b0

	WeiXinDao weixinDao = new WeiXinDao();
	int userID = 0;
	int role = 0;
	userID = weixinDao.getUserID_By_WeixinID(weixinID);
	role = weixinDao.getRole_By_WeixinID(weixinID);
	
	if(role==0){ //患者
		UserDaoPatient userDaoPatient = new UserDaoPatient();
%>
  
 <body>
  <div data-role="page">
	<div data-role="header">

	<table width="100%">
		<tr>
			<td width="33%" align="center">
				<div id="backButton" style="width:60px;"><a href="javascript:history.back(-1)">返回</a></div>
			</td>
			<td align="center" width="34%"><a style="color:white;">提&nbsp;&nbsp;问</a></td>
			<td width="33%">&nbsp;&nbsp;</td>
		</tr>
	</table>
	
 	</div>
  	<div data-role="content">
  	
  	<form method="post" name="ASKForm" id="ASKForm" action="AskResult.jsp">
	      <fieldset data-role="fieldcontain">
	      
	 <link rel="stylesheet" href="../css/ask.css" />
	<script src="../js/ask.js"></script>
	<div>请详细描述您的病情、症状、发病时间、治疗情况:</div><br>
	<textarea style="min-height:120px" name="QuestionText" id="QuestionText" wrap=virtual 
		placeholder=" ">
	</textarea>
	<br>
	<center>

	<table width="100%">
		<tr>
			<td width="50%" align="center"><div style="width:95%" id="ASKSelect" onclick="UploadPhoto();">上传照片</div></td>
			<td width="50%" align="center"><div  style="width:95%" id="ASKSelect" onclick="SelectKeShi();">选择科室</div></td>
		</tr>
	</table>
	
	<div id="UploadPhoto" class="UploadPhoto" >
		<div><big>上传照片</big></div><br>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="100%"> <div id="ASKPhoto"><big>拍&nbsp;&nbsp;照</big></div></td>
			</tr>
			<tr><td><hr></td></tr>
			<tr>
				<td align="center" width="100%"><div id="ASKPhoto"><big>从相册中选择</big></div></td>
			</tr>
			<tr><td><hr color="<%=sysFontColor %>"></td></tr>
			<tr>
				<td align="center">
					<div id="UploadPhotoCancel" onclick="UploadPhotoCancel()"><big>取&nbsp;&nbsp;消</big></div>
				</td>
			</tr>
		</table>
	</div>
	
	<div id="SelectKeShi" class="SelectKeShi" >
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%"><big>中医内科</big></td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKKeShi" id="ASKKeShi" value="1">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%"><big>中医外科</big></td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKKeShi" id="ASKKeShi" value="2">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%"><big>妇&nbsp;&nbsp;科</big></td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKKeShi" id="ASKKeShi" value="3">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%"><big>儿&nbsp;&nbsp;科</big></td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKKeShi" id="ASKKeShi" value="4">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%"><big>针推科</big></td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKKeShi" id="ASKKeShi" value="5">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr color="<%=sysFontColor %>"></td></tr></table>
		<table width="100%">
			<tr>
				<td width="50%" align="center">
					<div id="SelectKeshiCertain" onclick="SelectKeshiCertain()"><big>确&nbsp;&nbsp;认</big></div>
				</td>
				<td align="center">
					<div id="SelectKeshiCancel" onclick="SelectKeshiCancel()"><big>取&nbsp;&nbsp;消</big></div>
				</td>
			</tr>
		</table>
	</div>
	
	<br>
	<table width="95%" cellpadding="0" cellspacing="1"  border="0">
		<tr>
			<td width="30" align="center"><div id="ASKInput">性&nbsp;&nbsp;别</div></td>
			<td width="70%"><input id="ASKGender" name="ASKGender" type="text" value="" /></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td width="30" align="center"><div id="ASKInput">年&nbsp;&nbsp;龄</div></td>
			<td width="70%"><input id="ASKAge" name="ASKAge" type="text" value="" /></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td width="30" align="center"><div id="ASKInput">联系方式</div></td>
			<td width="70%"><input id="ASKTel" name="ASKTel" type="text" value="" /></td>
		</tr>
	</table>
	
	<br>
	<div id="msgASK"></div>
	<div id="ASKSubmit" style="width:95%" onclick="ASKSubmit()"><big>提&nbsp;&nbsp;交</big></div>
				
	</center>
		</fieldset>
</form>	

	<%}else if(role==1){ %>
<body>
  <div data-role="page">
	<div data-role="header">

	<table width="100%">
		<tr>
			<td width="33%" align="center">
				<div id="backButton" style="width:60px;"><a href="javascript:history.back(-1)">返回</a></div>
			</td>
			<td align="center" width="34%"><a style="color:white;">提问列表</a></td>
			<td width="33%">&nbsp;&nbsp;</td>
		</tr>
	</table>
	
 	</div>
  	<div data-role="content">
<!--  <form method="post" name="ASKSelectForm" id="ASKSelectForm" action="AskResult.jsp?ffff=ddd">-->
<!--	      <fieldset data-role="fieldcontain">-->
	      
	 <link rel="stylesheet" href="../css/ask_doctor.css" />
  	<script src="../js/ask_doctor.js"></script>
	
	<script>
	</script>
	
  	<table width="100%">
  		<tr>
			<td align="center" width="50%"> 
  			<div id="InputBorderHH" align="center" onclick="SelectStatusTop()">
				<div id="SelectedStatusTop" style="display:none"></div>
				<div id="SelectStatusAttentionTop">&nbsp;&nbsp;&nbsp;&nbsp;全部问题&nbsp;&nbsp;
				<img src="../images/down.png" border = "0px"  width="20px"/></div>
	    	</div>
			</td>
			<td align="center" width="50%"> 
			<div id="InputBorderHH" align="center" onclick="SelectKeShiTop()">
				<div id="SelectedKeShiTop" style="display:none"></div>
				<div id="SelectKeShiAttentionTop">&nbsp;&nbsp;&nbsp;&nbsp;全部科室&nbsp;&nbsp;
				<img src="../images/down.png" border = "0px"  width="20px"/></div>
	    	</div>
			</td>
		</tr>
	</table>

	
	<div id="SelectKeShiTop" class="SelectKeShiTop" >
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">中医内科</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKKeShiTop" id="ASKKeShiTop" value="1" onclick="KeshiChanged();">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">中医外科</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKKeShiTop" id="ASKKeShiTop" value="2" onclick="KeshiChanged();">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">妇&nbsp;&nbsp;科</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKKeShiTop" id="ASKKeShiTop" value="3" onclick="KeshiChanged();">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">儿&nbsp;&nbsp;科</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKKeShiTop" id="ASKKeShiTop" value="4" onclick="KeshiChanged();">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">针推科</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKKeShiTop" id="ASKKeShiTop" value="5" onclick="KeshiChanged();">
				</td>
			</tr>
		</table>
	</div>
		
	<div id="SelectStatusTop" class="SelectStatusTop" >
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">已回答</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKStatusTop" id="ASKStatusTop" value="1" onclick="StatusChanged();" >
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">未回答</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKStatusTop" id="ASKStatusTop" value="0" onclick="StatusChanged();">
				</td>
			</tr>
		</table>
	</div>
	
  	<%
  	int qID = 0;
  	
  	%>
  	<% //qID =1; 
  	ASKPatient askPatient = new ASKPatient();
  	//int qNum = askPatient.getQuestionNum();
  	askPatient.getAllQuestionInfos();
  	int qNum = askPatient.num;
  	//System.out.println("num:" + qNum);
  	for(int i=1;i<=qNum;i++){
  		qID = i;
  		//System.out.println("qID:" + qID + "\n");
  	%>
  	
	  	<form method="post" name="ASKForm<%=qID %>" id="ASKForm<%=qID %>" action="AskResult.jsp?qID=<%=qID %>" >
		      <fieldset data-role="fieldcontain">
	
		 <link rel="stylesheet" href="../css/my.css" />
		
		<script >
		function AnswerSubmit(qID){
			//alert("qID:" + qID);
			var ASKForm = document.getElementById('ASKForm' + qID);
			ASKForm.submit(); 
		}
		</script>
		
		<center>
			<div style="width:90%" id="records" >	
				<table width="100%">
					<tr>
						<td width="60%"><%=askPatient.createDates[i] %></td>
						<td width="8%"><img src="../images/child.png" border = "0px"  width="20px"/></td>
						<td width="12%">儿科</td>
						<td width="20%" align="center">
						<%if(askPatient.answered_flags[i]==0){ %>
							<div id="reply_no" class="reply_no">未答复</div>
						<%}else{ %>
							<div id="reply_yes" class="reply_yes">已答复</div>
						<%} %>
						</td>
					</tr>
				</table>
				<div align="left" id="questions"><%=askPatient.contents[i] %></div>
				<br>
				<div style="width:30%" id="reply_yes" class="reply_yes" onclick="AnswerSubmit(<%=qID %>)">回答</div>
			</div>
				
			</center>
			</fieldset>
		</form>	
		<br>
	<%} %>
<!--	</fieldset>-->
<!--</form>	-->
	<%
	}%>
	
  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>