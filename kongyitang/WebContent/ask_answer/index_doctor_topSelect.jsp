<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>

<%@page import="database.*" %> 
	
	 <link rel="stylesheet" href="../css/ask_doctor.css" />
  	<script src="../js/ask_doctor.js"></script>
	
  	<table width="100%">
  		<tr>
			<td align="center" width="50%"> 
  			<div id="InputBorderHH" align="center" onclick="SelectStatusTop()">
				<div id="SelectedStatusTop" style="display:none"></div>
				<div id="SelectStatusAttentionTop">&nbsp;&nbsp;&nbsp;&nbsp;全部问题&nbsp;&nbsp;
				<img src="../images/down.png" border = "0px"  width="20px"/></div>
	    	</div>
			</td>
			<td align="center" width="50%"> 
			<div id="InputBorderHH" align="center" onclick="SelectKeShiTop()">
				<div id="SelectedKeShiTop" style="display:none"></div>
				<div id="SelectKeShiAttentionTop">&nbsp;&nbsp;&nbsp;&nbsp;全部科室&nbsp;&nbsp;
				<img src="../images/down.png" border = "0px"  width="20px"/></div>
	    	</div>
			</td>
		</tr>
	</table>

	
	<div id="SelectKeShiTop" class="SelectKeShiTop" >
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">全部科室</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKKeShiTop" id="ASKKeShiTop" value="0" onclick="KeshiChanged();">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">中医内科</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKKeShiTop" id="ASKKeShiTop" value="1" onclick="KeshiChanged();">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">中医外科</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKKeShiTop" id="ASKKeShiTop" value="2" onclick="KeshiChanged();">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">妇&nbsp;&nbsp;科</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKKeShiTop" id="ASKKeShiTop" value="3" onclick="KeshiChanged();">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">儿&nbsp;&nbsp;科</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKKeShiTop" id="ASKKeShiTop" value="4" onclick="KeshiChanged();">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">针推科</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKKeShiTop" id="ASKKeShiTop" value="5" onclick="KeshiChanged();">
				</td>
			</tr>
		</table>
	</div>
		
	<div id="SelectStatusTop" class="SelectStatusTop" >
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">全部问题</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKStatusTop" id="ASKStatusTop" value="-1" onclick="StatusChanged();" >
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">已回答</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKStatusTop" id="ASKStatusTop" value="1" onclick="StatusChanged();" >
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">未回答</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKStatusTop" id="ASKStatusTop" value="0" onclick="StatusChanged();">
				</td>
			</tr>
		</table>
	</div>
	