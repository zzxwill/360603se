<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
	 
	 <%@page import="database.*" %> 
	 
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
  	
  	<form method="post" name="ASKSelectForm" id="ASKSelectForm" action="index.jsp">
	      <fieldset data-role="fieldcontain">
	      
	 <%@ include file="../ask_answer/index_doctor_topSelect.jsp"%> 
		
	  	<%
		request.setCharacterEncoding("UTF-8");
		String url = "index.jsp";
		
	  	int qID = 0;
	  	ASKPatient askPatient_doctor = new ASKPatient();
		
		String ASKStatusTop = request.getParameter("ASKStatusTop");
		String ASKKeShiTop = request.getParameter("ASKKeShiTop");
		if(null==ASKStatusTop||ASKStatusTop.equals("")){ //全部问题
			if(null==ASKKeShiTop||ASKKeShiTop.equals("")){ //全部科室
				askPatient_doctor.getAllQuestionInfos_Condition(-1,0);
			}else{
				int ASKKeShiTop_int = Integer.parseInt(ASKKeShiTop);
				if(ASKKeShiTop_int==0){ //全部科室
					askPatient_doctor.getAllQuestionInfos_Condition(-1,0);
				}else if(ASKKeShiTop_int>0){
					askPatient_doctor.getAllQuestionInfos_Condition(-1,ASKKeShiTop_int);
				}
			}
		}else{
			int ASKStatusTop_int = Integer.parseInt(ASKStatusTop);
			if(ASKStatusTop_int==-1){ //全部问题
				if(null==ASKKeShiTop||ASKKeShiTop.equals("")){ //全部科室
					askPatient_doctor.getAllQuestionInfos_Condition(-1,0);
				}else{
					int ASKKeShiTop_int = Integer.parseInt(ASKKeShiTop);
					if(ASKKeShiTop_int==0){ //全部科室
						askPatient_doctor.getAllQuestionInfos_Condition(-1,0);
					}else if(ASKKeShiTop_int>0){
						askPatient_doctor.getAllQuestionInfos_Condition(-1,ASKKeShiTop_int);
					}
				}
			}else if(ASKStatusTop_int>-1){
				if(null==ASKKeShiTop||ASKKeShiTop.equals("")){ //全部科室
					askPatient_doctor.getAllQuestionInfos_Condition(ASKStatusTop_int,0);
				}else{
					int ASKKeShiTop_int = Integer.parseInt(ASKKeShiTop);
					if(ASKKeShiTop_int==0){ //全部科室
						askPatient_doctor.getAllQuestionInfos_Condition(ASKStatusTop_int,0);
					}else if(ASKKeShiTop_int>0){
						askPatient_doctor.getAllQuestionInfos_Condition(ASKStatusTop_int,ASKKeShiTop_int);
					}
				}
			}
		}

	  	int questionNum = askPatient_doctor.num_Condition;
	  	//System.out.println("num:" + qNum);
	  	if(questionNum==0){
	  	%>
	  		<link rel="stylesheet" href="../css/my.css" />
	  		<center>
	  			<div style="width:90%" id="records" ><br><br><div style="color:red" >暂无此条件的相关提问！</div></div>
	  		</center>
	  	<%	
	  	}else if(questionNum>0){
	  		int departmentID = 0;
		  	String departmentName = null;
		  	DepartmentDao departmentDao = new DepartmentDao();
	  		for(int i=1;i<=questionNum;i++){
	  			//qID = i;
	  			qID = askPatient_doctor.ids_Condition[i];
	  			departmentID = askPatient_doctor.departments_Condition[i];
	  			departmentName = departmentDao.getDepartmentName(departmentID);
	  			int answerFlag =  askPatient_doctor.answered_flags_Condition[i];
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
							<td width="60%"><%=askPatient_doctor.createDates_Condition[i] %></td>
							<td width="8%"><img src="../images/child.png" border = "0px"  width="20px"/></td>
							<td width="12%"><%=departmentName %></td>
							<td width="20%" align="center">
							<%if(answerFlag==0){ %>
								<div id="reply_no" class="reply_no">未答复</div>
							<%}else if(answerFlag==1){ %>
								<div id="reply_yes" class="reply_yes">已答复</div>
							<%} %>
							</td>
						</tr>
					</table>
					<div align="left" id="questions"><%=askPatient_doctor.contents_Condition[i] %></div>
					<br>
					<div style="width:30%" id="reply_yes" class="reply_yes" onclick="AnswerSubmit(<%=qID %>)">回答</div>
				</div>
					
				</center>
				</fieldset>
			</form>	
			<br>
			<%}
	  	}
  	%>
  		</fieldset>
	</form>	
</div>
	<div data-role="footer" data-id="myfooter" data-position="fixed"></div> 
</div>
</body>	
