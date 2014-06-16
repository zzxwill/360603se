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
  <div data-role="page" style="background-image: url(../images/shouyebg.gif);background-attachment: fixed;background-color: rgb(254, 231, 197);background-position: 50% 0%;background-repeat: no-repeat;">

    <script>
    function reserve(){
    	window.location = "reserve.jsp";
     }
    function reserve_product(){
    	window.location = "../reserve_product/index.jsp";
     }
    
    function ask_answer(){
    	window.location = "../ask_answer/index.jsp";
     }
    
    function my_member(){
    	window.location = "../my_member/index.jsp";
     }
    function my_health(){
    	window.location = "../my_health/index.jsp";
     }
    </script>
    
		<table  border="0" cellspacing="0" cellpadding="0"
						width="100%"  style="border-top: 1px ;margin-top: 150px;" >
			<tr>
			 	<td width="20%"></td>
			 	<td width="30%" align="center"><div class="mainListLeftButton" onclick="reserve();" >预&nbsp;&nbsp;约</div></td>
				<td width="30%" align="center" ><div class="mainListRightButton" onclick="ask_answer();">提&nbsp;&nbsp;问</div></td>
				
				<td width="20%"></br></br></td>
			</tr>
		
		</table>
		
		</br>
		
		
				<table  border="0" cellspacing="0" cellpadding="0"
						width="100%"  style="border-top: 1px;" >
			<tr>
			 	<td width="20%"></td>
				<td width="60%" align="center"><div  id="mainListButton" onclick="reserve_product();" >产品展示</div></br></td>
				
				
				<td width="20%"></td>
			</tr>
			
		
			
			<tr>
			 	<td width="20%"></td>
				<td width="60%" align="center"><div id="mainListButton"  onclick="my_health();" >健康自测</div></br></td>
				
				
				<td width="20%"></td>
			</tr>
			<tr>
			 	<td width="20%"></td>
				<td width="60%" align="center"><div id="mainListButton" onclick="my_member();">会员中心</div></td>
				
				
				<td width="20%"></td>
			</tr>
		
		</table>
		

  </div>

	
<div data-role="footer" data-id="myfooter" data-position="fixed">
</div> 

</div> 

  </body>
</html>