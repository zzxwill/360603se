<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="database.*" %>
<%@ include file="../check/index.jsp"%> 
<%//@ include file="../check/checkAdmin.jsp"%>  

<%
FinancialDao financialAdminDao = new FinancialDao();
//UserDao userFinancialDao = new UserDao();
int chartNum = 0;
chartNum = financialAdminDao.getFinancialNum();

int FId = 0;
for(FId=1;FId<=chartNum;FId++){
	financialAdminDao.getFinancialInfo(FId);
	
%>

<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0" rules=rows>
	<tr>
		<td width="80%">&nbsp; &nbsp; &nbsp; &nbsp;财务表编号&nbsp;<%=FId %>&nbsp;,&nbsp;所属店铺：&nbsp;<strong><%=financialAdminDao.shopName %></strong>&nbsp;&nbsp;,&nbsp;&nbsp;日期： &nbsp;<strong><%=financialAdminDao.chartDate %></strong>&nbsp;&nbsp;,&nbsp;&nbsp;作者：&nbsp;<%=financialAdminDao.userName %></td>
		<td width="20%" valign="bottom" align="center">
		<br>
<!--		<form class="form-horizontal" id="financialForm<%=FId %>" method="post" action="../sys/index.jsp">-->
		<form class="form-horizontal" id="financialForm<%=FId %>" method="post" action="../admin/editFinancialInfo.jsp?type=edit&FId=<%=FId %>">
			<div class="view"> 
		       <!-- Button to trigger modal --> 
		       <div align="right">
		       <a id="myModalLinkFinancial<%=FId %>" href="#myModalContainerFinancial<%=FId %>" role="button" class="btn btn-primary" data-toggle="modal" contenteditable="true">编辑</a> 
		       </div>
		       <!-- Modal -->
		       <div id="myModalContainerFinancial<%=FId %>" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabelFinancial<%=FId %>" aria-hidden="true">
		         <div class="modal-header">
		           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		           <h3 id="myModalLabelFinancial<%=FId %>" contenteditable="true">编辑财务表信息</h3>
		         </div>
		         <div class="modal-body" style="line-height:200%" >
	           	    
<script>
    function checkEditFinancialInput(FId)
    {
       //alert(FId);
	   
	   var form_datetimeEdit = document.getElementById("form_datetime"+FId).value;
	   var CashEdit = document.getElementById("Cash"+FId).value;
	   var ShuaKaEdit = document.getElementById("ShuaKa"+FId).value;
	   var YaGaoKaEdit = document.getElementById("YaGaoKa"+FId).value;
	   var ThirtyDaiJinQuanEdit = document.getElementById("ThirtyDaiJinQuan"+FId).value;
	   var FiftyDaiJinQuanEdit = document.getElementById("FiftyDaiJinQuan"+FId).value;
	   var TongKaEdit = document.getElementById("TongKa"+FId).value;
	   var MeiTuanEdit = document.getElementById("MeiTuan"+FId).value;
	   var NuoMiEdit = document.getElementById("NuoMi"+FId).value;
	   var DianPingEdit = document.getElementById("DianPing"+FId).value;
	   var ElevenDaiJinQuanEdit = document.getElementById("ElevenDaiJinQuan"+FId).value;
	   var PreVipCashEdit = document.getElementById("PreVipCash"+FId).value;
	   var PreVipShuaKaEdit = document.getElementById("PreVipShuaKa"+FId).value;
	   var PreTongKaCashEdit = document.getElementById("PreTongKaCash"+FId).value;
	   var PreTongKaShuaKaEdit = document.getElementById("PreTongKaShuaKa"+FId).value;
	   var StandardSeatsEdit = document.getElementById("StandardSeats"+FId).value;
	   var ActualitySeatsEdit = document.getElementById("ActualitySeats"+FId).value;
	   var StandardDesksEdit = document.getElementById("StandardDesks"+FId).value;
	   var ActualityDesksEdit = document.getElementById("ActualityDesks"+FId).value;
	   var NoPeopleDesksEdit = document.getElementById("NoPeopleDesks"+FId).value;
	   
	   var message = null;
	   var msg = document.getElementById("msgFinancial"+FId);
	   var flag = 1;   

	   if(null==CashEdit||CashEdit == ""||null==ShuaKaEdit||ShuaKaEdit == ""
		   ||null==YaGaoKaEdit||YaGaoKaEdit == ""||null==ThirtyDaiJinQuanEdit||ThirtyDaiJinQuanEdit == ""
			   ||null==FiftyDaiJinQuanEdit||FiftyDaiJinQuanEdit == ""
		   ||null==TongKaEdit||TongKaEdit == ""||null==MeiTuanEdit||MeiTuanEdit == ""||null==NuoMiEdit||NuoMiEdit == ""
		   ||null==DianPingEdit||DianPingEdit == ""||null==ElevenDaiJinQuanEdit||ElevenDaiJinQuanEdit == ""
			   ||null==PreVipCashEdit||PreVipCashEdit == ""
		   ||null==PreVipShuaKaEdit||PreVipShuaKaEdit == ""||null==PreTongKaCashEdit||PreTongKaCashEdit == ""
			   ||null==PreTongKaShuaKaEdit||PreTongKaShuaKaEdit == ""
		   ||null==StandardSeatsEdit||StandardSeatsEdit == ""||null==ActualitySeatsEdit||ActualitySeatsEdit == ""
			   ||null==StandardDesksEdit||StandardDesksEdit == ""
		   ||null==ActualityDesksEdit||ActualityDesksEdit == ""||null==NoPeopleDesksEdit||NoPeopleDesksEdit == ""){
			  flag = 0;
		 	  message = "请输入正确的各项信息！";
			  msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
	   }
	   if(null==form_datetimeEdit||form_datetimeEdit == ""){
		   flag = 0;
		   message = "请输入正确的财务表日期！";
		   msg.innerHTML = "<a style='color:red;'>" + message + "</a>";
	   }
	   if(flag==1){
	      //var addrForm = document.forms("addrForm");
	      var financialForm = document.getElementById("financialForm"+FId);
	      financialForm.submit(); 
	   }
    }

</script>
	           	    
	           	    <table width="95%">
						<tr>
							<td align="center" width="30%" valign="bottom" ><p style="color:red;">删除财务表：</p></td>
							<%
							if(financialAdminDao.IsFinancialDel(FId)==1){
							%>
								
								<td align="right" width="5%">否</td>
								<td valign="middle" align="center" width="5%">
									<input type="radio" name="financialRadio<%=FId %>" value="0"></td>
								<td width="5%">&nbsp;</td>
								<td align="right" width="5%">是</td>
								<td valign="middle" align="center" width="5%">
									<input type="radio" checked name="financialRadio<%=FId %>" value="1"></td>
							<%
							}else{
							%>
								<td align="right" width="5%">否</td>
								<td valign="middle" align="center" width="5%">
									<input type="radio" checked name="financialRadio<%=FId %>" value="0"></td>
								<td width="5%">&nbsp;</td>
								<td align="right" width="5%">是</td>
								<td valign="middle" align="center" width="5%">
									<input type="radio" name="financialRadio<%=FId %>" value="1"></td>
							
							<%} %>
								<td width="1%" valign="bottom" ><p style="color:red;">&nbsp;&nbsp;*</p></td>
								<td width="44%">(若选择删除下面可不用修改)</td>
							</tr>
						</table>
						
	           	    <center>
	           	    
	           	    <table width ="98%">
	           	    	<tr>
				           	<td width="50%">
				           	  	 <table width="100%">
				           	     	<tr>
				           	     		<td align="center" width="35%">所属分店：</td>
				           	     		<td width="64%">
				           	     		<%
				           	     			ShopDao shopEditFinancialDao = new ShopDao();
				           	     			int tempShopID = financialAdminDao.shopID;
				           	     		%>
				           	     			<select name="shopSelect<%=FId %>" id="shopSelect<%=FId %>" data-native-menu="false" style="width:100%">
											<%for(int i=1;i<=shopEditFinancialDao.getShopNum();i++){ 
												if(shopEditFinancialDao.IsShopDel(i)==0){
												%>
												<option value="<%=i %>" <%=tempShopID==i ? "selected":"" %> >
													<%=shopEditFinancialDao.getShopName(i) %>
												</option>
												<%}
											}%>
								        </select>
				           	     		</td>
				           	     		<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
				           	     	</tr>
	           	     			</table> 
	           	     		</td>
	           	     		<td width="50%">
				           	     <table width ="100%">
				           	     	<tr>
				           	     		<td align="center" width="45%">财务表日期：</td>
				           	     		<td width="54%">
				           	     			<div class="input-append date form_datetime<%=FId %>">
											  	<input id="form_datetime<%=FId %>" name="form_datetime<%=FId %>" style="height:30px; width:80%;" type="text" value="<%=financialAdminDao.chartDate %>" readonly>
											    <span class="add-on"><i class="icon-th"></i></span>
											</div>
											 
											<script type="text/javascript">
											    $(".form_datetime<%=FId %>").datetimepicker({
											        format: "yyyy-mm-dd",
											        autoclose: true,
											        todayBtn: true,
											        minView: 'month',
											        language:'zh-CN',
											        pickerPosition: "bottom-left"
											    });
											</script> 
				           	     		</td>
				           	     		<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
				           	     	</tr>
				           	     </table>
				           	 </td>
	           	     	</tr>
	           	     </table>
	           	     <table width="95%"><tr><td><hr></td></tr></table>
	           	     </center>   
							   	     	
		           	    <table width="100%" align="center" border="0" cellpadding="2" cellspacing="1" rules="cols">
		           	    	<tr style="line-height:200%" >
		           	    		<td width="50%" style="line-height:200%" >
					           	    <table  width="95%" align="center" border="0" cellpadding="1" cellspacing="1">
							    		<tr>
							    			<td align="left" width="39%" >现 &nbsp;金(元):</td>
							    			<td align="center" width="60%">
							    				<input style="height:30px; width:90%" type="text" id="Cash<%=FId %>" name="Cash<%=FId %>" value="<%=financialAdminDao.Cash %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="39%" >刷 &nbsp;卡(元):</td>
							    			<td align="center" width="60%">
							    				<input style="height:30px; width:90%" type="text" id="ShuaKa<%=FId %>" name="ShuaKa<%=FId %>" value="<%=financialAdminDao.ShuaKa %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="39%" >雅高卡(元):</td>
							    			<td align="center" width="60%">
							    				<input style="height:30px; width:90%" type="text" id="YaGaoKa<%=FId %>" name="YaGaoKa<%=FId %>" value="<%=financialAdminDao.YaGaoKa %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="39%" >30元券(张):</td>
							    			<td align="center" width="60%">
							    				<input style="height:30px; width:90%" type="text" id="ThirtyDaiJinQuan<%=FId %>" name="ThirtyDaiJinQuan<%=FId %>" value="<%=financialAdminDao.ThirtyDaiJinQuan %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="39%" >50元券(张):</td>
							    			<td align="center" width="60%">
							    				<input style="height:30px; width:90%" type="text" id="FiftyDaiJinQuan<%=FId %>" name="FiftyDaiJinQuan<%=FId %>" value="<%=financialAdminDao.FiftyDaiJinQuan %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="39%" >通 &nbsp;卡(元):</td>
							    			<td align="center" width="60%">
							    				<input style="height:30px; width:90%" type="text" id="TongKa<%=FId %>" name="TongKa<%=FId %>" value="<%=financialAdminDao.TongKa %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="39%" >美&nbsp;团(元):</td>
							    			<td align="center" width="60%">
							    				<input style="height:30px; width:90%" type="text" id="MeiTuan<%=FId %>" name="MeiTuan<%=FId %>" value="<%=financialAdminDao.MeiTuan %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="39%" >糯&nbsp;米(元):</td>
							    			<td align="center" width="60%">
							    				<input style="height:30px; width:90%" type="text" id="NuoMi<%=FId %>" name="NuoMi<%=FId %>" value="<%=financialAdminDao.NuoMi %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="39%" >点&nbsp;评(元) :</td>
							    			<td align="center" width="60%">
							    				<input style="height:30px; width:90%" type="text" id="DianPing<%=FId %>" name="DianPing<%=FId %>" value="<%=financialAdminDao.DianPing %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="39%" >11元券(张):</td>
							    			<td align="center" width="60%">
							    				<input style="height:30px; width:90%" type="text" id="ElevenDaiJinQuan<%=FId %>" name="ElevenDaiJinQuan<%=FId %>" value="<%=financialAdminDao.ElevenDaiJinQuan %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
								    		
									</table>
								</td>
								<td width="50%">
								
									<table  width="95%" align="center" border="0" cellpadding="1" cellspacing="1">
							    		<tr>
							    			<td align="left" width="44%" >会员充现(元):</td>
							    			<td align="center" width="55%">
							    				<input style="height:30px; width:90%" type="text" id="PreVipCash<%=FId %>" name="PreVipCash<%=FId %>" style="width:90%;" value="<%=financialAdminDao.PreVipCash %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="44%" >会员刷卡(元):</td>
							    			<td align="center" width="55%">
							    				<input style="height:30px; width:90%" type="text" id="PreVipShuaKa<%=FId %>" name="PreVipShuaKa<%=FId %>" value="<%=financialAdminDao.PreVipShuaKa %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="44%" >通卡充现(元):</td>
							    			<td align="center" width="55%">
							    				<input style="height:30px; width:90%" type="text" id="PreTongKaCash<%=FId %>" name="PreTongKaCash<%=FId %>" value="<%=financialAdminDao.PreTongKaCash %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="44%" >通卡刷卡(元):</td>
							    			<td align="center" width="55%">
							    				<input style="height:30px; width:90%" type="text" id="PreTongKaShuaKa<%=FId %>" name="PreTongKaShuaKa<%=FId %>" value="<%=financialAdminDao.PreTongKaShuaKa %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="44%" >标准餐位(位):</td>
							    			<td align="center" width="55%">
							    				<input style="height:30px; width:90%" type="text" id="StandardSeats<%=FId %>" name="StandardSeats<%=FId %>" value="<%=financialAdminDao.StandardSeats %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="44%" >实际餐位(位):</td>
							    			<td align="center" width="55%">
							    				<input style="height:30px; width:90%" type="text" id="ActualitySeats<%=FId %>" name="ActualitySeats<%=FId %>" value="<%=financialAdminDao.ActualitySeats %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="44%" >标准餐桌(张):</td>
							    			<td align="center" width="55%">
							    				<input style="height:30px; width:90%" type="text" id="StandardDesks<%=FId %>" name="StandardDesks<%=FId %>" value="<%=financialAdminDao.StandardDesks %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="44%" >实际餐桌(张):</td>
							    			<td align="center" width="55%">
							    				<input style="height:30px; width:90%" type="text" id="ActualityDesks<%=FId %>" name="ActualityDesks<%=FId %>" value="<%=financialAdminDao.ActualityDesks %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="44%" >0人桌(张):</td>
							    			<td align="center" width="55%">
							    				<input style="height:30px; width:90%" type="text" id="NoPeopleDesks<%=FId %>" name="NoPeopleDesks<%=FId %>" value="<%=financialAdminDao.NoPeopleDesks %>"/>
							    			</td>
							    			<td width="1%"><p style="color:red;">&nbsp;&nbsp;*</p></td>
							    		</tr>
							    		<tr>
							    			<td align="left" width="44%" >&nbsp;</td>
							    			<td align="center" width="55%" height=30px>&nbsp;</td>
							    			<td width="1%">&nbsp;</td>
							    		</tr>
							    		
									</table>
								</td>
							</tr>
						</table>
		         </div>
		         <div class="modal-footer">
		         
		         <table width="95%">
		         	<tr>
		         		<td width="66%" align="center" valign="top">&nbsp;
		         			<div id="msgFinancial<%=FId %>"></div>
		         		</td>
		         		<td width="17%" align="center"  valign="bottom">
		          			 <button class="btn" data-dismiss="modal" aria-hidden="true" contenteditable="true">取消</button>
		          		</td>
						<td width="17%" align="center"  valign="bottom">
		           			<input class="btn btn-primary" type="button" value="保存设置"  onclick="checkEditFinancialInput(<%=FId %>)"/>
		           		</td>
		           	</tr>
		          </table>

		         </div>
		       </div>
		     </div>
		</form>		
		</td>
	</tr>
</table>

<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0" rules=rows>
	<tr>
		<td align="center" width="10%" bgcolor="#DBEAF9"><strong><big>销售收入</big></strong></td>
		<td width="90%">
			<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0">
				<tr align="center" bgcolor="#D5D5D5">
					<td align="center"><p style="color:red;"><strong>收款额(元)</strong></p></td>
					<td align="center"><strong>现&nbsp;金(元)</strong></td>
					<td align="center"><strong>刷&nbsp;卡(元)</strong></td>
					<td align="center"><strong>雅高卡(元)</strong></td>
					<td align="center"><strong>30元券(张)</strong></td>
					<td align="center"><strong>50元券(张)</strong></td>
					<td align="center"><strong>通&nbsp;卡(元)</strong></td>
					<td align="center"><strong>美&nbsp;团(元)</strong></td>
					<td align="center"><strong>糯&nbsp;米(元)</strong></td>
					<td align="center"><strong>点&nbsp;评(元)</strong></td>
					<td align="center"><strong>11元券(张)</strong></td>
				</tr>
				<tr align="center">
					<td align="center"><p style="color:red;"><%=financialAdminDao.Sum %></p></td>
					<td align="center"><%=financialAdminDao.Cash %></td>
					<td align="center"><%=financialAdminDao.ShuaKa %></td>
					<td align="center"><%=financialAdminDao.YaGaoKa %></td>
					<td align="center"><%=financialAdminDao.ThirtyDaiJinQuan %></td>
					<td align="center"><%=financialAdminDao.FiftyDaiJinQuan %></td>
					<td align="center"><%=financialAdminDao.TongKa %></td>
					<td align="center"><%=financialAdminDao.MeiTuan %></td>
					<td align="center"><%=financialAdminDao.NuoMi %></td>
					<td align="center"><%=financialAdminDao.DianPing %></td>
					<td align="center"><%=financialAdminDao.ElevenDaiJinQuan %></td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td align="center" width="10%" bgcolor="#DBEAF9"><strong><big>储蓄核算</big></strong></td>
		<td width="90%">
			<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0">
				<tr align="center" bgcolor="#D5D5D5">
					<td align="center"><p style="color:red;"><strong>会员充值(元)</strong></p></td>
					<td align="center"><strong>会员充现(元)</strong></td>
					<td align="center"><strong>会员充卡(元)</strong></td>
					<td align="center"><p style="color:red;"><strong>通卡充值(元)</strong></p></td>
					<td align="center"><strong>通卡充现(元)</strong></td>
					<td align="center"><strong>通卡刷卡(元)</strong></td>
				</tr>
				<tr align="center">
					<td align="center"><p style="color:red;"><%=financialAdminDao.PreVipRecharge %></p></td>
					<td align="center"><%=financialAdminDao.PreVipCash %></td>
					<td align="center"><%=financialAdminDao.PreVipShuaKa %></td>
					<td align="center"><p style="color:red;"><%=financialAdminDao.PreTongKaRecharge %></p></td>
					<td align="center"><%=financialAdminDao.PreTongKaCash %></td>
					<td align="center"><%=financialAdminDao.PreTongKaShuaKa %></td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td align="center" width="10%" bgcolor="#DBEAF9"><strong><big>财务分析</big></strong></td>
		<td width="90%">
			<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0">
				<tr align="center" bgcolor="#D5D5D5">
					<td align="center"><strong>标准餐位(位)</strong></td>
					<td align="center"><strong>实际餐位(位)</strong></td>
					<td align="center"><p style="color:red;"><strong>翻位率(%)</strong></p></td>
					<td align="center"><strong>标准餐桌(张)</strong></td>
					<td align="center"><strong>实际餐桌(张)</strong></td>
					<td align="center"><p style="color:red;"><strong>翻台率(%)</strong></p></td>
					<td align="center"><strong>0人桌(张)</strong></td>
				</tr>
				<tr align="center">
					<td align="center"><%=financialAdminDao.StandardSeats %></td>
					<td align="center"><%=financialAdminDao.ActualitySeats %></td>
					<td align="center"><p style="color:red;"><%=financialAdminDao.SeatRate %></p></td>
					<td align="center"><%=financialAdminDao.StandardDesks %></td>
					<td align="center"><%=financialAdminDao.ActualityDesks %></td>
					<td align="center"><p style="color:red;"><%=financialAdminDao.DeskRate %></p></td>
					<td align="center"><%=financialAdminDao.NoPeopleDesks %></td>
				</tr>
			</table>
		</td>
	</tr>

</table>

<%} %>
<br>
