<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage=""%>   
<%@page import="database.*" %>

<%
request.setCharacterEncoding("utf-8");
loginedUserName = (String)session.getAttribute("loginedUserName");
loginRole = (String)session.getAttribute("role");
//String weixinID = request.getParameter("sid");
if(null==loginedUserName||loginedUserName.equals("")||null==loginRole||loginRole.equals("")){
%>
	<script language='javascript' type='text/javascript'>
		location.href = '../index.jsp';
	</script>
<%	
}else {
	//int CheckRole = 0;
	CheckRole  = Integer.parseInt(loginRole);	//role=场馆id
	
	if(CheckRole<2*GROUP_INTERVAL||CheckRole>3*GROUP_INTERVAL){
		%>
		<script language='javascript' type='text/javascript'>
			location.href = '../index.jsp';
		</script>
	<%
	}
}
%> 
