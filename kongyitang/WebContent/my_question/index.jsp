<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

 <%@ include file="../include/package.jsp"%> 
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title><%=sysName %></title>

	 <%@ include file="../include/meta.jsp"%> 
	 <%@ include file="../include/cssJS.jsp"%> 
	
	<link rel="stylesheet" href="../css/my.css" />
	<script src="../js/my.js"></script>

</head>
  
   <%@ include file="../check/index.jsp"%> 
  <% //String weixinID = "gh_f5c1c22104b0"; 
  //oDK3oji70nN1CG77qYR_z_thFUBs
  //gh_f5c1c22104b0
  %>
  
 <body>
  <div data-role="page">
	<div data-role="header">
 	</div>
  	<div data-role="content">
	<%
	
	if(USERROLE==0){ //患者
		UserDaoPatient userDaoPatient = new UserDaoPatient();
	
	%>
		<table>
			<tr>
				<td><img src="../images/touxiang.png" border = "0px"  width="40px"/></td>
				<td>&nbsp;&nbsp;<big><%=userDaoPatient.getUserName_Patient(USERID) %></big></td>
			</tr>
		</table>
		
		<center>
		<table width="60%" cellpadding="0" cellspacing="1"  >
			<tr>
				<td align="center" width="50%"><div style="color:<%=sysFontColor %>"  id="ConsumerRecordsButton" class="ConsumerRecordsButton"  onclick="ConsumerRecordsButton();">消费记录</div></td>
				<td align="center" width="50%"><div style="background-color:<%=sysColor %>;color:white" id="AskedRecordsButton" class="AskedRecordsButton" onclick="AskedRecordsButton();">提问记录</div></td>
			</tr>
		</table>
		
		<table width="100%"><tr><td><hr color="<%=sysFontColor %>" ></td></tr></table>
		<div id="ConsumerRecords"  class="ConsumerRecords" style="display:none">
			<table width="90%">
				<tr>
					<td align="center" width="40%"><strong>日&nbsp;&nbsp;&nbsp;&nbsp;期</strong></td>
					<td align="center" width="30%"><strong>消费金额</strong></td>
					<td align="center" width="30%"><strong>预约馆</strong></td>
				</tr>
				<tr>
					<td align="center">2014-04-02</td>
					<td align="center">200元</td>
					<td align="center">望京馆</td>
				</tr>
				<tr>
					<td align="center">2014-04-03</td>
					<td align="center">100元</td>
					<td align="center">望京馆</td>
				</tr>
				<tr>
					<td align="center">2014-04-04</td>
					<td align="center">150元</td>
					<td align="center">望京馆</td>
				</tr>	
			</table>
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
							<img src="../images/zhuanjiahuida.png" border = "0px"  width="25px"/>专家答复&nbsp;<%=j %>&nbsp;：&nbsp;<%=answerDao_Patient.answers_Given_Patient[j] %></div>
						<%} %>
				</div>
				<br>
			<%
			}
		}
		%>
		</center>
		</div>
	<%
	}else if(USERROLE==1){ //医生
		UserDaoDoctor userDaoDoctor = new UserDaoDoctor();
	%>
		<table width="95%">
		<tr>
			<td width="15%"><img src="../images/touxiang.png" border = "0px"  width="40px"/></td>
			<td width="60%">
				<table width="100%">
					<tr>
						<td><big><big><strong><%=userDaoDoctor.getUserName_Doctor(USERID) %></strong></big></big>
							<img src="../images/v.png" border = "0px"  width="20px"/>
						</td>
					</tr>
					<tr>
						<td>主治医生</td>
					</tr>
				</table>
			</td>
			<td align="center" width="25%"><div id="doctors">中医外科</div></td>
		</tr>
	</table>
	
	<center>
<!--	<div style="color:<%//=sysFontColor %>"><strong>回答记录</strong></div>-->
	
	<table width="60%" cellpadding="0" cellspacing="1"  >
		<tr>
			<td align="center" width="50%"><div style="color:<%=sysFontColor %>"  id="DoctorConsumerRecordsButton" class="DoctorConsumerRecordsButton"  onclick="DoctorConsumerRecordsButton();">消费记录</div></td>
			<td align="center" width="50%"><div style="background-color:<%=sysColor %>;color:white" id="DoctorAskedRecordsButton" class="DoctorAskedRecordsButton" onclick="DoctorAskedRecordsButton();">回答记录</div></td>
		</tr>
	</table>
	
	<table width="100%"><tr><td><hr color="<%=sysFontColor %>" ></td></tr></table>
	
	<div id="DoctorConsumerRecords"  class="DoctorConsumerRecords" style="display:none">
		<table width="90%">
			<tr>
				<td align="center" width="40%"><strong>日&nbsp;&nbsp;&nbsp;&nbsp;期</strong></td>
				<td align="center" width="30%"><strong>消费金额</strong></td>
				<td align="center" width="30%"><strong>预约馆</strong></td>
			</tr>
			<tr>
				<td align="center">2014-04-02</td>
				<td align="center">200元</td>
				<td align="center">望京馆</td>
			</tr>
			<tr>
				<td align="center">2014-04-03</td>
				<td align="center">100元</td>
				<td align="center">望京馆</td>
			</tr>
			<tr>
				<td align="center">2014-04-04</td>
				<td align="center">150元</td>
				<td align="center">望京馆</td>
			</tr>	
		</table>
	</div>
	<div id="DoctorAskedRecords"  class="DoctorAskedRecords">
		<div style="width:90%" id="records" >	
			<table width="100%">
				<tr>
					<td width="80%">2014-04-03</td>
					<td width="8%"><img src="../images/child.png" border = "0px"  width="20px"/></td>
					<td width="12%">儿科</td>
				</tr>
			</table>
			<div align="left"  id="questions">幼儿湿疹比较严重，怎么办？</div>
			<div align="left"  id="answers"><img src="../images/zhuanjiahuida.png" border = "0px"  width="25px"/>专家答复：请前往医院治疗。</div>
		</div>
		<br>
		<div style="width:90%" id="records" >	
			<table width="100%">
				<tr>
					<td width="80%">2014-04-03</td>
					<td width="8%"><img src="../images/child.png" border = "0px"  width="20px"/></td>
					<td width="12%">儿科</td>
				</tr>
			</table>
			<div align="left"  id="questions">幼儿湿疹比较严重，怎么办？</div>
			<div align="left"  id="answers"><img src="../images/zhuanjiahuida.png" border = "0px"  width="25px"/>专家答复：请前往医院治疗。</div>
		</div>
	</div>	
	</center>
	<%}%>


  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>