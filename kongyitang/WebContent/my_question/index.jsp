<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
  
   <%//@ include file="../check/index.jsp"%> 
  
  	<link rel="stylesheet" href="../css/my.css" />
	<script src="../js/my.js"></script>
	
 <body>
  <div data-role="page">
	<div data-role="header">
 	</div>
  	<div data-role="content">
  	<center>
	<script>
		function exitLogin(){
			window.location = "../exit/index.jsp";
	 	}
	</script>
	<%
	//System.out.println("USERID:" + USERID +"\nUSERROLE:" + USERROLE + "\n");
	if(USERROLE==0){ //患者
		UserDaoPatient userDaoPatient = new UserDaoPatient();
	
	%>
	 	<div style="width:90%" id="consumerInfos" class="consumerInfos"">
			<table width="95%">
				<tr>
					<td width="25%" align="center"><img src="../images/touxiang.png" border = "0px"  width="40px"/></td>
					<td width="50%" align="left">&nbsp;&nbsp;<big><%=userDaoPatient.getUserName_Patient(USERID) %></big></td>
					<td width="25%" align="right"><div id="exitButton" style="width:95%" onclick="exitLogin()">退出</div>
					</td>
				</tr>
			</table>
		</div>
		<center>
		<table width="60%" cellpadding="0" cellspacing="1"  >
			<tr>
				<td align="center" width="50%"><div style="color:<%=sysFontColor %>"  id="ConsumerRecordsButton" class="ConsumerRecordsButton"  onclick="ConsumerRecordsButton();">我的预约<!-- 消费记录 --></div></td>
				<td align="center" width="50%"><div style="background-color:<%=sysColor %>;color:white" id="AskedRecordsButton" class="AskedRecordsButton" onclick="AskedRecordsButton();">提问记录</div></td>
			</tr>
		</table>
		
		<table width="100%"><tr><td><hr color="<%=sysFontColor %>" ></td></tr></table>
		    <div id="ConsumerRecords"  class="ConsumerRecords" style="display:none">
		    	<%@ include file="../my_reservation/index.jsp"%> 
			</div> 
		</center>
		<div id="AskedRecords" class="AskedRecords">
		<center>
		
		<%
		ASKPatient askPatient = new ASKPatient();
		DepartmentDao departmentDao = new DepartmentDao();
		askPatient.getAllQuestionInfos_Given(USERID);
		//System.out.println("USERID:" + USERID + "\n");
		int departmentID = 0;
		String departmentName = null;
		int answerFlag = 0; 
		//System.out.println("askPatient.num_Given:" + askPatient.num_Given + "\n");
		int question_num_patient = askPatient.num_Given;
		if(question_num_patient>0){
			
			for(int i=1;i<=askPatient.num_Given;i++){
				
				departmentID = askPatient.departments_Given[i];
				departmentName = departmentDao.getDepartmentName(departmentID);
				answerFlag = askPatient.answered_flags_Given[i];
				if(answerFlag==0){
				%>
					<div style="width:90%" id="records" >	
						<table width="100%">
							<tr>
								<td width="60%"><%=askPatient.createDates_Given[i] %></td>
								<td width="8%"><img src="../images/child.png" border = "0px"  width="20px"/></td>
								<td width="12%"><%=departmentName %></td>
								<td width="20%" align="center"><div id="reply_no">未答复</div></td>
							</tr>
						</table>
						<div align="left" id="questions"><%=askPatient.contents_Given[i] %></div>
						<%
						String pic_path = askPatient.picture_paths_Given[i];
						if((null==pic_path)||(pic_path.equals(""))){
							;
						}else{
							%>
							<center>
		  						<img src="<%=P_IMAGES %><%=pic_path %>" border = "0px" width="80%"/>
		  					</center>
							<%
						} 
						%>
					</div>
					<br>
				<%
				}else{
					int questionID = askPatient.ids_Given[i];
					AnswerDao answerDao_Patient = new AnswerDao();
					answerDao_Patient.getAnswers_Given(questionID);
					%>
					<div style="width:90%" id="records" >	
						<table width="100%">
							<tr>
								<td width="60%"><%=askPatient.createDates_Given[i] %></td>
								<td width="8%"><img src="../images/child.png" border = "0px"  width="20px"/></td>
								<td width="12%"><%=departmentName %></td>
								<td width="20%" align="center"><div id="reply_yes">已答复</div></td>
							</tr>
						</table>
						<div align="left" id="questions"><%=askPatient.contents_Given[i] %></div>
						<div align="left"  id="answers">
							<%
							//System.out.println("answerDao_Patient.num_Given_Patient:" + answerDao_Patient.num_Given_Patient + "\n");
							for(int j=1;j<=answerDao_Patient.num_Given_Patient;j++){	
							%>
								<img src="../images/zhuanjiahuida.png" border = "0px"  width="25px"/>专家答复&nbsp;<%=j %>&nbsp;：&nbsp;<%=answerDao_Patient.answers_Given_Patient[j] %><br>
							<%} %>
						</div>
					</div>
					<br>
				<%
				}
			}
		}else{
		%>
		<center>
	  			<div style="width:90%" id="records" ><br><br><div style="color:red" >您还没有相关的任何提问！</div></div>
	  	</center>
		<%
		}

		%>
		</center>
		</div>
	<%
	}else if(USERROLE==1){ //医生
		UserDaoDoctor userDaoDoctor = new UserDaoDoctor();
		int flag = 0;
		flag = userDaoDoctor.IsDoctorExist_by_userID(USERID);
		userDaoDoctor.getAllUserInfo_Doctor(USERID);
	%>
		<div style="width:90%" id="consumerInfos" class="consumerInfos">
			<table width="95%">
			<tr>
				<td width="15%" align="right">
					<% String doctor_portrait = null;
					doctor_portrait = userDaoDoctor.doctor_Portrait_Given;
					if(null==doctor_portrait||doctor_portrait.equals("")){ 
					%>
						<img src="../images/touxiang.png" border = "0px"  width="40px"/></td>
					<%}else{ %>
						<img src="<%=D_IMAGES %><%=doctor_portrait %>" border = "0px"  width="40px"/></td>
					<%}%>
				<td width="60%">
					<table width="100%">
						<tr>
							<td width="50%" align="center"><big><big><strong><%=userDaoDoctor.doctor_Name_Given %></strong></big></big></td>
							<td width="50%" align="center"><img src="../images/v.png" border = "0px"  width="20px"/></td>
						</tr>
						<tr>
							<td width="50%" align="center"><%=userDaoDoctor.doctor_Title_Given %></td>
							<td width="50%" align="center"><div id="doctors"><%=userDaoDoctor.doctor_Department_Given %></div></td>
						</tr>
					</table>
				</td>
				<td align="right" width="25%"><div id="exitButton" style="width:95%" onclick="exitLogin()">退出</div></td>
			</tr>
		</table>
	</div>
	<%
	if(flag==1){//已认证
	%>
		<center>
		<table width="60%" cellpadding="0" cellspacing="1"  >
			<tr>
				<td align="center" width="50%"><div style="color:<%=sysFontColor %>"  id="DoctorConsumerRecordsButton" class="DoctorConsumerRecordsButton"  onclick="DoctorConsumerRecordsButton();">我的预约</div></td>
				<td align="center" width="50%"><div style="background-color:<%=sysColor %>;color:white" id="DoctorAskedRecordsButton" class="DoctorAskedRecordsButton" onclick="DoctorAskedRecordsButton();">回答记录</div></td>
			</tr>
		</table>
		
		<table width="100%"><tr><td><hr color="<%=sysFontColor %>" ></td></tr></table>
		
		<div id="DoctorConsumerRecords"  class="DoctorConsumerRecords" style="display:none">
			<%@ include file="../my_reservation/doctor_index.jsp"%>  
		</div> 
		
		<div id="DoctorAskedRecords"  class="DoctorAskedRecords">
		<%
			AnswerDao answerDao_Doctor = new AnswerDao();
			answerDao_Doctor.getQuestions_Given(USERID);
			int questionID = 0;
			int departmentID = 0;
			String departmentName = null;
			int question_num_doctor = answerDao_Doctor.num_Given_Doctor;
			if(question_num_doctor>0){
				
				for(int i=1;i<=answerDao_Doctor.num_Given_Doctor;i++){
					questionID = answerDao_Doctor.questions_ids_Given_Doctor[i];
					
					ASKPatient askPatient_doctor = new ASKPatient();
					askPatient_doctor.getQuestionInfo(questionID);
					departmentID = askPatient_doctor.department;
					
					DepartmentDao departmentDao_doctor = new DepartmentDao();
					departmentName = departmentDao_doctor.getDepartmentName(departmentID);
				
			%>
				<div style="width:90%" id="records" >	
					<table width="100%">
						<tr>
							<td width="62%"><%=askPatient_doctor.createDate %></td>
							<td width="8%"><img src="../images/child.png" border = "0px"  width="20px"/></td>
							<td width="30%"><%=departmentName %></td>
						</tr>
					</table>
					<div align="left"  id="questions"><%=askPatient_doctor.content %></div>
					
					<%
					String pic_path = askPatient_doctor.picture_path;
					if((null==pic_path)||(pic_path.equals(""))){
						;
					}else{
						%>
						<center>
	  						<img src="<%=P_IMAGES %><%=pic_path %>" border = "0px" width="80%"/>
	  					</center>
						<%
					} 
					%>
					
					<div align="left"  id="answers">
						<img src="../images/zhuanjiahuida.png" border = "0px"  width="25px"/>
						专家答复&nbsp;：&nbsp;<%=answerDao_Doctor.answers_Given_Doctor[i] %>
					</div>
				</div>
				<br>
			<%}
			}else{
			%>
				<center>
			  			<div style="width:90%" id="records" ><br><br><div style="color:red" >您还没有答复相关的任何提问！</div></div>
			  	</center>
			<%
			}
	 		%>
		</div>	
		</center>
	<%		
	}else{//未认证
		%>
		<br>
		<table width="100%"><tr><td><hr color="<%=sysFontColor %>" ></td></tr></table>
		<br><br>
		<script>
		 function GoAuth(){
		    	window.location = "../my_member/doctor_auth_1.jsp";
		    }
		</script>
		<%
		int flagAuth = 0;
		flagAuth = userDaoDoctor.IsDoctorSubmitAuth_by_userID(USERID);
		//System.out.println("USERID: "  + USERID + "\nflagAuth:" + flagAuth);
		if(flagAuth==0){
			%>
			<div id="AuthButton"  style="width:90%;margin-top:10px;" onclick="GoAuth()">医生认证</div>
			<%
		}else{
			%>
			<div id="AuthButton"  style="width:90%;margin-top:10px;background: #DADADA;color:#000000;" >认证状况正在审核!</div>
			<%
		}
	}
	
	}%>

</center>
  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
