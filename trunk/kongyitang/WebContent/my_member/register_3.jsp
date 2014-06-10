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
  
 <body>
  <div data-role="page">
	<div data-role="header">
	
	<table width="100%">
		<tr>
			<td width="33%">
				<div id="backButton" style="width:60px;" onclick="closeWin();">返回</div>
			</td>
			<td align="center" width="34%"><a style="color:white;">注册成功</a></td>
			<td width="33%">&nbsp;&nbsp;</td>
		</tr>
	</table>
	
 	</div>
  	<div data-role="content">
	
		<%
	    request.setCharacterEncoding("UTF-8");
	 	String url = "register_1.jsp";
	 	String indexUrl  = "index.jsp";
	 	
	 	String role = request.getParameter("role");
	 	//System.out.println("role:" + role +"\n");
	 	if(null==role||role.equals("")){
			%>
			<script language='javascript' type='text/javascript'>
				window.location = "<%=url%>";
			</script>
		<%
	 	}else{
			String registerName = request.getParameter("registerName");
			String registerGender = request.getParameter("registerGender");
			String registerAge = request.getParameter("registerAge");
			String registerRole = request.getParameter("registerRole");
			
			//String registerShiCheng = request.getParameter("registerShiCheng");
			//String registerZhengJian = request.getParameter("registerZhengJian");
			//var registerKeShi =$('input:radio[name="registerKeShi"]:checked').val();
			//String registerKeShi = request.getParameter("registerKeShi");
			//String registerZhiCheng = request.getParameter("registerZhiCheng");
			
			String registerTel = request.getParameter("registerTel");
			String registerPW = request.getParameter("registerPW_2");  
			if(null==registerName||registerName.equals("")||null==registerGender||registerGender.equals("")
			   ||null==registerAge||registerAge.equals("")||null==registerRole||registerRole.equals("")
				   ||null==registerTel||registerTel.equals("")||null==registerPW||registerPW.equals("")){
				%>
				<script language='javascript' type='text/javascript'>
					window.location = "<%=url%>";
				</script>
			<%	
			}else{
				int registerGender_int = Integer.parseInt(registerGender);
				int registerAge_int = Integer.parseInt(registerAge);
				int registerRole_int = Integer.parseInt(registerRole);
				PasswordUtil GP = new PasswordUtil();
				registerPW = GP.generatePassword(registerPW);
				if(role.equals("patient")){
					//System.out.println("patient register!\n");
					UserDaoPatient patient = new UserDaoPatient();
					patient.insertUser_Patient(registerName, registerGender_int, registerAge_int,
							registerRole_int, registerTel, registerPW);

					int userID = patient.getUserId_by_Tel_Patient(registerTel);
					
					GetLocalIpAddress getLocalIpAddress = new GetLocalIpAddress();
					String TMP_IPAdress = getLocalIpAddress.getLocalIpAddress();
					%>
					<%@ include file="../include/IPV4.jsp"%> 
					<%
					if (IPV4 == null || IPV4.length() == 0 || "unknown".equalsIgnoreCase(IPV4)) {
						;
					}else{
						TMP_IPAdress += IPV4;
					}
					
					IPDao ipDao = new IPDao();
					//ipDao.modifyAddress(userID,0,TMP_IPAdress);
					ipDao.insertIP(userID,0,TMP_IPAdress);
					%>
					
					<center>
					<br>
					<p style='color:red;'>恭喜您 <strong><%=registerName %> </strong> ，您已成功注册孔医堂！
					<br>
					<br>正在返回“会员中心”，请稍后...</p>
					<br>
					
					<script language='javascript' type='text/javascript'>
						setTimeout(" window.location = '<%=indexUrl %>' ",1500);
					</script>
					</center>
					<%
					
				}else if(role.equals("doctor")){
					//int registerKeShi_int = Integer.parseInt(registerKeShi);
					//System.out.println("doctor register!\n");
					UserDaoDoctor doctor = new UserDaoDoctor();
					doctor.insertUser_Doctor(registerName, registerGender_int, registerAge_int,
							registerRole_int, registerTel, registerPW);
					
					int userID = doctor.getUserId_by_Tel_Doctor(registerTel);
					
					GetLocalIpAddress getLocalIpAddress = new GetLocalIpAddress();
					String TMP_IPAdress = getLocalIpAddress.getLocalIpAddress();
					%>
					<%@ include file="../include/IPV4.jsp"%> 
					<%
					if (IPV4 == null || IPV4.length() == 0 || "unknown".equalsIgnoreCase(IPV4)) {
						;
					}else{
						TMP_IPAdress += IPV4;
					}
					
					IPDao ipDao = new IPDao();
					//ipDao.modifyAddress(userID,0,TMP_IPAdress);
					//需要审核，先不加入ip列表
					ipDao.insertIP(userID,1,TMP_IPAdress);
					%>
					<center>
					<br>
					<p style='color:red;'>恭喜您 <strong><%=registerName %> </strong> ，您已成功注册医生账号孔医堂，请等候身份审核！
					<br>
					<br>正在返回“会员中心”，请稍后...</p>
					<br>
					
					<script language='javascript' type='text/javascript'>
						setTimeout(" window.location = '<%=indexUrl %>' ",1500);
					</script>
					</center>
					<%
					
				}
			}
	 	}
	%>
	
  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>