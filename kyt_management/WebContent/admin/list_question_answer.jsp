<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
<%@page import="dao.*" %>

<%@ include file="../check/index.jsp"%> 
<%@ include file="../check/checkAdmin.jsp"%>  

  <% 
	request.setCharacterEncoding("UTF-8");
 	String url = "../sys/index.jsp";

	request.setCharacterEncoding("UTF-8");
	String qID = request.getParameter("qID");
	
	%>
	 
 	<form method="post" name="AnswerForm" id="AnswerForm" action="list_question_answer_success.jsp?qID=<%=qID %>">
	      <fieldset data-role="fieldcontain">
	      
	  		<link rel="stylesheet" href="../css/my.css" />

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
	  		DepartmentDao departmentDao = new DepartmentDao();
	  		%>
	  		  
	  		<center>
	  		<div style="width:90%" id="records" >	
				<table width="100%">
					<tr>
						<td width="60%"><%=askPatient.createDate %></td>
						<td width="8%"><img src="../images/child.png" border = "0px"  width="20px"/></td>
						<td width="12%"><%=departmentDao.getDepartmentName(askPatient.department) %></td>
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


  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>