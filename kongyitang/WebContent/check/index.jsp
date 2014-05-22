<%@ page contentType="text/html; charset=UTF-8" language="java" errorPage=""%>   
<%@page import="database.*" %>
<%@page import="IP.*" %>

<%

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
int USERID = 0;
int USERROLE = 0;
System.out.println("TMP_IPAdress:" + TMP_IPAdress + "\n");
USERID = ipDao.getUserID_by_address(TMP_IPAdress);
USERROLE = ipDao.getUserRole_by_address(TMP_IPAdress);
System.out.println("USERID:" + USERID + "\n");
System.out.println("USERROLE:" + USERROLE + "\n");
//request.setCharacterEncoding("utf-8");

//LGName = request.getParameter("LGName");
//LGRole = request.getParameter("LGRole");

if(USERID==0){
	
	//String curBasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
	curPath = request.getScheme() + "://" + request.getHeader("host") + request.getRequestURI();   

	// System.out.println("curPath:" + curPath + "\n");
	//response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
	//String GOLogin = basePath + "my_member/index.jsp?curPath=";
	//System.out.println("GOLogin:" + GOLogin + "\n");
	//response.setHeader("Location",GOLogin);	
%>
<br>
	<div style="color:red"><big>您尚未登陆孔医堂，正在跳转至登陆界面，请稍后...</big></div>
	<script language='javascript' type='text/javascript'>
		window.location = '../my_member/index.jsp?curPath=<%=curPath %>'//#wechat_redirect
	</script>
<%	
}

%> 