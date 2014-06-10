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
				<div id="backButton" style="width:60px;" onclick="closeWin();">返回</div>
			</td>
			<td align="center" width="34%"><a style="color:white;">孔医堂</a></td>
			<td width="33%">&nbsp;&nbsp;</td>
		</tr>
	</table>
 	</div>

<table width="100%" bgColor="#fffef0" cellspacing="0"
						cellpadding="0" class="Introtable">

						<tr>
							<td align="center"><span class="title">孔医堂</span></td>

						</tr>
						
					</table>




		<table bgColor="#fffef0" border="0" cellspacing="0" cellpadding="0"
						width="100%"  style="border-top: 1px ;" >
			<tr>
			 	<td width="20%"></td>
				<td width="30%" align="center"><div  style="background:#7B68EE; color:white" ><a href="../ask_answer/index.jsp" style="color:white;">提问</a></div></td>
				<td width="30%" align="center"><div style="background:#EE7600; color:white" ><a href="reserve.jsp" style="color:white;">预约</a></div></td>
				<td width="20%"></br></br></td>
			</tr>
		
		</table>
		
		</br>
		
		
				<table bgColor="#fffef0" border="0" cellspacing="0" cellpadding="0"
						width="100%"  style="border-top: 1px;" >
			<tr>
			 	<td width="20%"></td>
				<td width="60%" align="center"><div  style="background:#00CD00; color:white"><a href="../reserve_product/index.jsp" style="color:white;">产品展示</a></div></br></td>
				
				
				<td width="20%"></td>
			</tr>
			
		
			
			<tr>
			 	<td width="20%"></td>
				<td width="60%" align="center"><div style="background:#00CD00; color:white"><a href="../my_health/index.jsp" style="color:white;">健康自测</a></div></br></td>
				
				
				<td width="20%"></td>
			</tr>
			<tr>
			 	<td width="20%"></td>
				<td width="60%" align="center"><div style="background:#00CD00; color:white"><a href="../my_member/index.jsp" style="color:white;">会员中心</a></div></td>
				
				
				<td width="20%"></td>
			</tr>
		
		</table>
		

  </div>

	
<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>