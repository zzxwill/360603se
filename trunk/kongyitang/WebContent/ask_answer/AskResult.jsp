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
  
     <%@ include file="../check/index.jsp"%> 
  <% //String weixinID = "oDK3oji70nN1CG77qYR_z_thFUBs"; 
  //oDK3oji70nN1CG77qYR_z_thFUBs
  //gh_f5c1c22104b0

	request.setCharacterEncoding("UTF-8");
 	String url = "index.jsp";

	if(USERROLE==0){ //患者

  %>
  
 <body>
  <div data-role="page">
	<div data-role="header">
	
	<table width="100%">
		<tr>
			<td width="33%" align="center">
				<div id="backButton" style="width:60px;" onclick="closeWin();">
					<a href="javascrpt:closeWin();"></a>
				</div>
			</td>
			<td align="center" width="34%"><a style="color:white;">提问成功</a></td>
			<td width="33%">&nbsp;&nbsp;</td>
		</tr>
	</table>
	
 	</div>
  	<div data-role="content">


<script>

</script>
	<%@ include file="../ask_answer/index_patient_upload.jsp"%> 
	<%
		String ASKKeShi = su.getRequest().getParameter("ASKKeShi");
  		String ASKGender = su.getRequest().getParameter("ASKGender");
  		String ASKAge = su.getRequest().getParameter("ASKAge");
		//UserDaoPatient userDaoPatient = new UserDaoPatient();
		if(null==ASKKeShi||ASKKeShi.equals("")||null==ASKGender||ASKGender.equals("")||
				null==ASKAge||ASKAge.equals("")){
			//System.out.println("setup-null\n");
			%>
			<script language='javascript' type='text/javascript'>
					window.location = "<%=url %>";
			</script>
			<%	
	  	}else{

	  		String picture_path = null;
	  		
	  		if(sign==true){
	  			picture_path = filename;
	  		}else{
	  			picture_path = null;
	  		}
	  		//System.out.println("picture_path:" + picture_path + "\n");
	  		
	  		String QuestionText = su.getRequest().getParameter("QuestionText");
	  		String ASKTel = su.getRequest().getParameter("ASKTel");
	  		int ASKGender_int = 0;
	  		ASKGender_int = Integer.parseInt(ASKGender);

	  		int ASKKeShi_int = Integer.parseInt(ASKKeShi);
	  		int ASKAge_int = Integer.parseInt(ASKAge);
	  		
	  		ASKPatient askPatient = new ASKPatient();
	  		askPatient.insertQuestion(USERID,QuestionText,picture_path,ASKKeShi_int,ASKGender_int,ASKAge_int,ASKTel);
	  	%>
	  	<br><br>
	  	<div>您所关心的问题是：</div><br>
	  	<div style="color:<%=sysFontColor %>"><%=QuestionText %></div><br>
	  	<%
	  	if((null==picture_path)||(picture_path.equals(""))){
	  		;
	  	}else{
	  		%>
	  		<center>
	  		<img src="<%=P_IMAGES %><%=picture_path %>" border = "0px" width="50%"/>
	  		</center>
	  		<%
	  	}
	  	%>
	  	<br>
	  	<div>我们会安排相关领域的专家医生尽快为您解答，请您注意查看提问记录！</div><br>
	  	<div>孔医堂全体员工再次祝您身体健康！</div>
	  	<%
	  	}
		
	%>
	</center>
	
	<%}else if(USERROLE==1){ //医生

		request.setCharacterEncoding("UTF-8");
		String qID = request.getParameter("qID");
	
	%>
	 
 <body>
  <div data-role="page">
	<div data-role="header">
	
	<table width="100%">
		<tr>
			<td width="33%" align="center">
				<div id="backButton" style="width:60px;"><a href="javascript:history.back(-1)"></a></div>
			</td>
			<td align="center" width="34%"><a style="color:white;">问题详情</a></td>
			<td width="33%">&nbsp;&nbsp;</td>
		</tr>
	</table>
	
 	</div>
  	<div data-role="content">
 	<form method="post" name="AnswerForm" id="AnswerForm" action="Ask_answer.jsp?qID=<%=qID %>">
	      <fieldset data-role="fieldcontain">
	      
	  		<link rel="stylesheet" href="../css/my.css" />
	  <style type="text/css">
	</style>

	  		<script>
	  		function AnswerSubmit(){
	  			
	  			var AnswerText = document.getElementById("AnswerText").value;
	  			AnswerText = AnswerText.replace(/(^\s*)/g,"");//删除左边的空格
	  			//alert("AnswerText:" + AnswerText);
	  			var message = null;
	  			var msg = document.getElementById("msgAnswer");
	  		    var flag = 1;
	  		   if(null==AnswerText||AnswerText==""){
	  			  flag = 0;
	  		 	  message = "请输入对患者问题的答复！";
	  		 	  //alert("message:" +  message);
	  			  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
		  	  }
	  		 if(flag==1){
	  			document.getElementById("answerSubmit").style.display = "none";
	  		    document.getElementById("answerWait").style.display = "block";
	  			var AnswerForm = document.getElementById("AnswerForm");
	  			AnswerForm.submit(); 
	  		 }
	  	}
	  			
	  		</script>
	
	<%
	

		//System.out.println("qID:" + qID);
		if(null==qID||qID.equals("")){
			%>
			<script language='javascript' type='text/javascript'>
					window.location = "<%=url %>";
			</script>
			<%
	  	}else{
	  		int qID_int = Integer.parseInt(qID);
	  		ASKPatient askPatient = new ASKPatient();
	  		askPatient.getQuestionInfo(qID_int);
	  		%>
	  		  
	  		<center>
	  		<div style="width:90%" id="records" >	
				<table width="100%">
					<tr>
						<td width="60%"><%=askPatient.createDate %></td>
						<td width="8%"><img src="../images/child.png" border = "0px"  width="20px"/></td>
						<td width="12%">儿科</td>
						<td width="20%" align="center">
						<%if(askPatient.answered_flag==0){ %>
							<div id="reply_no" class="reply_no">未答复</div>
						<%}else{ %>
							<div id="reply_yes" class="reply_yes">已答复</div>
						<%} %>
						</td>
					</tr>
				</table>
				<div align="left" id="questions"><%=askPatient.content %></div>
			</div>
			<br>
			<textarea style="min-height:150px" name="AnswerText" id="AnswerText" wrap=virtual 
				placeholder="请输入回复内容">
			</textarea>
			<br>
			<div id="msgAnswer"></div>
			<div id="answerSubmit" ><div id=submitButton style="width:95%" onclick="AnswerSubmit()"><big>答&nbsp;&nbsp;复</big></div></div>
			<div id="answerWait" style="display:none"><div id="SubmitButton"><big>正在提交答复，请稍后...</big></div></div>
	  		</center>
	  		<%
	  	}
		%>
		
	</fieldset>
</form>	
	<%
	
	} %>
	

  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>