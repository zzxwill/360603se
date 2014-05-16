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
 	</div>
  	<div data-role="content">
	
		<%
	    request.setCharacterEncoding("UTF-8");
	 	String url = "register_1.jsp";
	 	
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
			
			String registerShiCheng = request.getParameter("registerShiCheng");
			String registerZhengJian = request.getParameter("registerZhengJian");
			//var registerKeShi =$('input:radio[name="registerKeShi"]:checked').val();
			String registerKeShi = request.getParameter("registerKeShi");
			String registerZhiCheng = request.getParameter("registerZhiCheng");
			
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
					session.setAttribute("loginedUserName",registerName);
					session.setMaxInactiveInterval(60*30);
					
				}else if(role.equals("doctor")){
					int registerKeShi_int = Integer.parseInt(registerKeShi);
					//System.out.println("doctor register!\n");
					UserDaoDoctor doctor = new UserDaoDoctor();
					doctor.insertUser_Doctor(registerName, registerGender_int, registerAge_int,
							registerRole_int, registerTel, registerShiCheng, registerZhengJian,
							registerKeShi_int, registerZhiCheng, registerPW);
					session.setAttribute("loginedUserName",registerName);
					session.setMaxInactiveInterval(60*30);
				}
			%>
			<p style='color:red;'>恭喜您 <strong><%=registerName %> </strong> ，您已成功注册孔医堂！</p>
			<%
			}
	 	}
	%>
	
  </div>

<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>