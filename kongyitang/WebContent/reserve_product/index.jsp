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
				<div id="backButton" style="width:60px;" >
				<a href='../main/index.jsp'></a></div>
			</td>
			<td align="center" width="34%"><a style="color:white;">产品展示</a></td>
			<td width="33%">&nbsp;&nbsp;</td>
		</tr>
	</table>
 	</div>

<table width="100%" cellspacing="0"
						cellpadding="0" class="Introtable">

						<tr>
							<td align="center"><span class="title">孔医堂产品展示</span></td>

						</tr>
						<tr>
							<td>
							<div style="margin-bottom: 20px">
								<p>孔医堂产品板块依托孔门百年传承积淀，融合古方与现代科技，传承经典文化，为广大民众提供众多健康产品及私人订制等各项服务。</p>
							</div>
							</td>

						</tr>
					</table>


 <script>
    function MedicalPS(){
    	window.location = "MedicalPS.jsp";
    }
</script>

		<table bgColor="#FFFFFF" border="0" cellspacing="0" cellpadding="0"
						width="100%"  style="border-top: 1px solid #d8a14f;" id="xuanzhetab">
			<tr>
				<td width="50%" align="center"><div id="ProductButton" onclick="window.location.href='product_jiankang.jsp'">服务产品</div></td>
				<td width="50%" align="center"><div id="ProductButton" onclick="window.location.href='product_chanping.jsp'">健康产品</div></td>
			</tr>
			<!--  <tr>
				<td width="50%" align="center"><div id="ProductButton_no">健康管理卡</div></td>
				<td width="50%" align="center"><div id="ProductButton_no">孔伯华学院</div></td>
			</tr>-->
		</table>

  </div>

	
<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>