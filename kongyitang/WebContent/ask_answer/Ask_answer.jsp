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
  %>
  
 <body>
  <div data-role="page">
	<div data-role="header">
	
	<table width="100%">
		<tr>
			<td width="33%">
				<div id="backButton" style="width:60px;" >
					<a onclick="closeWin();"></a>
				</div>
			</td>
			<td align="center" width="34%"><a style="color:white;">回复成功</a></td>
			<td width="33%">&nbsp;&nbsp;</td>
		</tr>
	</table>
	
 	</div>
  	<div data-role="content">
  	
  	<form method="post" name="registerForm" id="registerForm" action="register_2.jsp">
	      <fieldset data-role="fieldcontain">

<script>

</script>
  	
	<%
	
	request.setCharacterEncoding("UTF-8");
 	String url = "index.jsp";

	if(USERROLE==1){ //医生

		String qID = request.getParameter("qID");
		if(null==qID||qID.equals("")){
			%>
			<script language='javascript' type='text/javascript'>
					window.location = "<%=url %>";
			</script>
			<%	
	  	}else{
	  		int qID_int = Integer.parseInt(qID);
	  		String AnswerText = request.getParameter("AnswerText");
	  		if(null==AnswerText||AnswerText.equals("")){
				%>
				<script language='javascript' type='text/javascript'>
						window.location = "<%=url %>";
				</script>
				<%	
		  	}else{
		  		AnswerDao answerDao = new AnswerDao();
		  		//System.out.println("AnswerText:" + AnswerText + "\nuserID:" + userID + "\nqID_int:" + qID_int);
		  		answerDao.insertAnswer(AnswerText,USERID,qID_int);
		  		ASKPatient askPatient = new ASKPatient();
		  		askPatient.modifyQuestion(qID_int);
		  	%>
			  	<div>您对上述问题给出的回复是：</div><br>
			  	<div style="color:<%=sysFontColor %>"><%=AnswerText %></div><br>
			  	<div>感谢您对患者的关心，祝您身体健康！</div>
			  	<%
		  	}
	  	}
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