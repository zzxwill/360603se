<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

 <%@ include file="../include/package.jsp"%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>预约成功</title>

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
  	<table width="100%" cellspacing="0" cellpadding="0">
						<tr bgColor= "#000000">
							<td align="left" style="width: 20%"><button type="button"
									onclick="location='index.jsp'">返回</button></td>
							<td align="center" style="color: white;">预约</td>

						</tr>


					</table>
  	
    <p aligh="center">预约成功！<br>
   	
    <%
   	Dao dao = new Dao();
    
    request.setCharacterEncoding("utf-8");
	 String site = request.getParameter("site");
	 String department = request.getParameter("department");
	 int doctorid = Integer.valueOf(request.getParameter("doctorid")).intValue();
	 //int outpatientid = Integer.valueOf(request.getParameter("outpatientid")).intValue();
	 int outpatientid = 100001;
	 
	 String illness_name = request.getParameter("illness_name");
	 String purpose = request.getParameter("purpose");
	 
	 
	// String purpose = "复查";
	 String detail = request.getParameter("detail");
	 //int mobile = Integer.valueOf(request.getParameter("mobile")).intValue();
	 long mobile = Long.parseLong(request.getParameter("mobile"));
	 String name = request.getParameter("name");
	 
	 dao.submit_reservation(illness_name, purpose, detail, mobile, name, site, department, doctorid);
	 
	//out.println("*********************************************************");
	 //out.println(site);
	 
	 

		/* userDao.insertOrder(weixinID,orderList,total);
		userDao.deleteTmpOrder(weixinID);
		logHelper.dummyLog("deleteTmpOrder!\n");
		//选择快递员
		int expressID = 1;
		userDao.getExpressInfo(expressID);
		//System.out.println("expressName:" + userDao.expressName + "\n");
		logHelper.dummyLog("getExpressInfo!\n"); */
		
		
    %>
	   <!--  <script>
			self.location = '../index.jsp';
	    </script> -->
	
    <br>


  </div>

  <%//@ include file="../include/buttonStyle.jsp"
  %>

	<div data-role="footer" data-id="myfooter" data-position="fixed">
	  
	    <script>
		function CloseWin(){
			//window.opener=null; 
			//window.close(); 
			WeixinJSBridge.call('closeWindow');
		}
	    </script>
	    <table width="100%">
	    	<tr><td>
	<a id='button-special' type="button" data-theme="b" data-mini="true" data-icon="arrow-r" data-iconpos="right" onclick="CloseWin()">我知道了</a>
	  		</td></tr>
	  	</table>
	</div>

</div> 

  </body>
</html>