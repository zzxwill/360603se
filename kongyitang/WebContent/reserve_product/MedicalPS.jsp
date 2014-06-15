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
				<div id="backButton" style="width:60px;"><a href="javascript:history.back(-1)"></a></div>
			</td>
			<td align="center" width="34%"><a style="color:white;">产品展示</a></td>
			<td width="33%">&nbsp;&nbsp;</td>
		</tr>
	</table>
 	</div>
<center>
  	<div data-role="content">
  	
  	<table width="100%">
  		<tr>
  			<td width="33%" align="center"><div id="ProductNavigation">医疗产品服务</div></td>
  			<td width="34%" align="center"><div style="color:<%=sysFontColor %>">非医疗产品</div></td>
  			<td width="33%" align="center"><div style="color:<%=sysFontColor %>">健康管理卡</div></td>
  		</tr>
  	</table>
  	<table width="100%"><tr><td><hr color="<%=sysColor %>"></td></tr></table>
  	<table width="95%">
  		<tr>
  			<td width="50%" align="center"><strong><big>中医门诊</big></strong></td>
  			<td width="50%" align="center"><img src="../images/zhongyimenzhen.png" border = "0px"  width="100%"/></td>
  		</tr>
  	</table>
  	<table width="100%"><tr><td><hr></td></tr></table>
  	<table width="95%">
  		<tr>
  			<td width="50%" align="center"><strong><big>针灸推拿</big></strong></td>
  			<td width="50%" align="center"><img src="../images/zhenjiutuina.png" border = "0px"  width="100%"/></td>
  		</tr>
  	</table>
  	<table width="100%"><tr><td><hr></td></tr></table>
  	  	<table width="95%">
  		<tr>
  			<td width="50%" align="center"><strong><big>道地药材</big></strong></td>
  			<td width="50%" align="center"><img src="../images/daodiyaocai.png" border = "0px"  width="100%"/></td>
  		</tr>
  	</table>

  </div>
</center>
	
<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>