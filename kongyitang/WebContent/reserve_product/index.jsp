<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

 <%@ include file="../include/package.jsp"%> 
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title><%=sysName %></title>

	 <%@ include file="../include/meta.jsp"%> 
	 <%@ include file="../include/cssJS.jsp"%> 
<link rel="stylesheet" href="../css/product.css" />
<style type="text/css">
</style>

</head>
  
 <body>
  <div data-role="page">
	<div data-role="header">
<!--	style="heght:50px;font-sise:25px" -->
	<table width="100%">
		<tr>
			<td width="33%">
				<div id="backButton" style="width:60px;"><a href="javascript:history.back(-1)">返回</a></div>
			</td>
			<td align="center" width="34%"><a style="color:white;">产品展示</a></td>
			<td width="33%">&nbsp;&nbsp;</td>
		</tr>
	</table>
 	</div>
<center>
  	<div data-role="content">
	<div style="color:<%=sysFontColor %>"><strong><h1>孔医堂产品展示</h1></strong></div>
	<div id="paragraph">
		孔医堂（北京）科技有限公司是基于孔伯华医馆基础上经资源整合成立的一家集医疗、产品、网络、文化为一体的，以中医诊疗和健康管理服务为主的中医文化创新型企业。
	</div>
	<div id="paragraph">
		孔医堂旗下医馆汇聚北京名老中医、京城四大名医之孔伯华后裔和四大名医传人，下设三家传统中医医馆和一家专业健康管理机构—北京上工坊健康科技有限公司。
	</div>

 <script>
    function MedicalPS(){
    	window.location = "MedicalPS.jsp";
    }
</script>
<table width="100%"><tr><td><hr color="<%=sysColor %>"></td></tr></table>
		<table width="100%">
			<tr>
				<td width="50%" align="center"><div id="ProductButton" onclick="MedicalPS()">医疗产品服务</div></td>
				<td width="50%" align="center"><div id="ProductButton">非医疗产品服务</div></td>
			</tr>
			<tr>
				<td width="50%" align="center"><div id="ProductButton">健康管理卡</div></td>
				<td width="50%" align="center"><div id="ProductButton">孔伯华学院</div></td>
			</tr>
		</table>

  </div>
</center>
	
<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>