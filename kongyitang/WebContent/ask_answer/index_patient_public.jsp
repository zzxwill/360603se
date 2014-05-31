<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
  	
  	<form method="post" name="ASKSelectForm" id="ASKSelectForm" action="index.jsp?tabDisplay=public">
	      <fieldset data-role="fieldcontain">
		
	  	<%
		request.setCharacterEncoding("UTF-8");
		String url = "index.jsp";
		
	  	int qID = 0;
	  	ASKPatient askPatient_doctor = new ASKPatient();
		
		String ASKStatusTop = request.getParameter("ASKStatusTop");
		String ASKKeShiTop = request.getParameter("ASKKeShiTop");
		int  ASKStatusTop_radio = -1;
		int ASKKeShiTop_radio = 0;
		if(null==ASKStatusTop||ASKStatusTop.equals("")){ //全部问题
			if(null==ASKKeShiTop||ASKKeShiTop.equals("")){ //全部科室
				askPatient_doctor.getAllQuestionInfos_Condition(-1,0);
				ASKStatusTop_radio = -1;  
				ASKKeShiTop_radio = 0;
			}else{
				int ASKKeShiTop_int = Integer.parseInt(ASKKeShiTop);
				if(ASKKeShiTop_int==0){ //全部科室
					askPatient_doctor.getAllQuestionInfos_Condition(-1,0);
					ASKStatusTop_radio = -1;  
					ASKKeShiTop_radio = 0;
				}else if(ASKKeShiTop_int>0){
					askPatient_doctor.getAllQuestionInfos_Condition(-1,ASKKeShiTop_int);
					ASKStatusTop_radio = -1;  
					ASKKeShiTop_radio = ASKKeShiTop_int;
				}
			}
		}else{
			int ASKStatusTop_int = Integer.parseInt(ASKStatusTop);
			if(ASKStatusTop_int==-1){ //全部问题
				if(null==ASKKeShiTop||ASKKeShiTop.equals("")){ //全部科室
					askPatient_doctor.getAllQuestionInfos_Condition(-1,0);
					ASKStatusTop_radio = -1;  
					ASKKeShiTop_radio = 0;
				}else{
					int ASKKeShiTop_int = Integer.parseInt(ASKKeShiTop);
					if(ASKKeShiTop_int==0){ //全部科室
						askPatient_doctor.getAllQuestionInfos_Condition(-1,0);
						ASKStatusTop_radio = -1;  
						ASKKeShiTop_radio = 0;
					}else if(ASKKeShiTop_int>0){
						askPatient_doctor.getAllQuestionInfos_Condition(-1,ASKKeShiTop_int);
						ASKStatusTop_radio = -1;  
						ASKKeShiTop_radio = ASKKeShiTop_int;
					}
				}
			}else if(ASKStatusTop_int>-1){
				if(null==ASKKeShiTop||ASKKeShiTop.equals("")){ //全部科室
					askPatient_doctor.getAllQuestionInfos_Condition(ASKStatusTop_int,0);
					ASKStatusTop_radio = ASKStatusTop_int;  
					ASKKeShiTop_radio = 0;
				}else{
					int ASKKeShiTop_int = Integer.parseInt(ASKKeShiTop);
					if(ASKKeShiTop_int==0){ //全部科室
						askPatient_doctor.getAllQuestionInfos_Condition(ASKStatusTop_int,0);
						ASKStatusTop_radio = ASKStatusTop_int;  
						ASKKeShiTop_radio = 0;
					}else if(ASKKeShiTop_int>0){
						askPatient_doctor.getAllQuestionInfos_Condition(ASKStatusTop_int,ASKKeShiTop_int);
						ASKStatusTop_radio = ASKStatusTop_int;  
						ASKKeShiTop_radio = ASKKeShiTop_int;
					}
				}
			}
		}
		%>
		<%@ include file="../ask_answer/index_patient_topSelect.jsp"%> 
		<%
	  	int questionNum = askPatient_doctor.num_Condition;
	  	//System.out.println("num:" + qNum);
	  	if(questionNum==0){
	  	%>
	  		<link rel="stylesheet" href="../css/ask_public.css" />
	  		<br><br>
	  		<center>
	  			<div style="width:90%" id="ask_records" ><br><br><div style="color:red" >暂无此条件的相关提问！</div></div>
	  		</center>
	  		<br><br><br><br><br>
	  	<%	
	  	}else if(questionNum>0){
	  		int departmentID = 0;
		  	String departmentName = null;
		  	DepartmentDao departmentDao = new DepartmentDao();
		  	
		  	AnswerDao answerDao_Patient = new AnswerDao();
						
	  		for(int i=1;i<=questionNum;i++){
	  			//qID = i;
	  			qID = askPatient_doctor.ids_Condition[i];
	  			answerDao_Patient.getAnswers_Given(qID);
	  			
	  			departmentID = askPatient_doctor.departments_Condition[i];
	  			departmentName = departmentDao.getDepartmentName(departmentID);
	  			int answerFlag =  askPatient_doctor.answered_flags_Condition[i];
	  			//System.out.println("qID:" + qID + "\n");
	  		%>
			
				<link rel="stylesheet" href="../css/ask_public.css" />
				
				<center>
				<div style="width:90%" id="ask_records" >	
					<table width="100%">
						<tr>
							<td width="60%"><%=askPatient_doctor.createDates_Condition[i] %></td>
							<td width="8%"><img src="../images/child.png" border = "0px"  width="20px"/></td>
							<td width="12%"><%=departmentName %></td>
							<td width="20%" align="center">
							<%if(answerFlag==0){ %>
								<div id="ask_reply_no" class="ask_reply_no">未答复</div>
							<%}else if(answerFlag==1){ %>
								<div id="ask_reply_yes" class="ask_reply_yes">已答复</div>
							<%} %>
							</td>
						</tr>
					</table>
					<div align="left" id="ask_questions"><%=askPatient_doctor.contents_Condition[i] %></div>
					<div align="left"  id="ask_answers">
					<%
						//System.out.println("answerDao_Patient.num_Given_Patient:" + answerDao_Patient.num_Given_Patient + "\n");
						for(int j=1;j<=answerDao_Patient.num_Given_Patient;j++){	
						%>
							<img src="../images/zhuanjiahuida.png" border = "0px"  width="25px"/>专家答复&nbsp;<%=j %>&nbsp;：&nbsp;<%=answerDao_Patient.answers_Given_Patient[j] %><br>
					<%} %>
					</div>
					<br>
				</div>
					
				</center>
			<br>
			<%}
	  	}
  	%>	  	
  		</fieldset>
	</form>	

