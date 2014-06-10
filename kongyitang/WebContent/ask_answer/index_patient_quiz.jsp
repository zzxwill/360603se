<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
  	
  	<form method="post" name="ASKForm" id="ASKForm" action="AskResult.jsp" encType="multipart/form-data" >
	      <fieldset data-role="fieldcontain">
	      
	 <link rel="stylesheet" href="../css/ask.css" />
	<script src="../js/ask.js"></script>
	<center>
	<div>请详细描述您的病情、症状、发病时间、治疗情况:</div><br>
	<textarea style="min-height:120px;width:90%" name="QuestionText" id="QuestionText" wrap=virtual 
		placeholder=" ">
	</textarea>
	<br>

	<table width="100%">
		<tr>
			<td width="50%" align="center"><div style="width:95%" id="ASKSelect" onclick="UploadPhoto();">上传照片</div></td>
			<td width="50%" align="center"><div  style="width:95%" id="ASKSelect" onclick="SelectKeShi();">选择科室</div></td>
		</tr>
	</table>
	
	<div id="UploadPhoto" class="UploadPhoto" >
		<div><big>上传照片</big></div><br>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="100%"> <div id="ASKPhoto">拍&nbsp;&nbsp;照</div></td>
			</tr>
			<tr><td><hr></td></tr>
			<tr>
				<td align="center" width="100%">			
				
<!--				<input type="file" id="uploadImage" name="uploadImage" onchange="checkImg();"  value="从相册中选择"/>-->
				<div id="ASKPhoto" style="position:relative;">从相册中选择
					<input style="position:absolute;left:0;top:-35;width:100%;height:100%;opacity:0;" type="file" id="uploadImage" name="uploadImage" onchange="checkImg();" />
				</div>

				</td>
			</tr>
			<tr><td><hr color="<%=sysFontColor %>"></td></tr>
			<tr>
				<td align="center">
					<div id="msgImg"></div>
					<div id="UploadPhotoCancel" onclick="UploadPhotoCancel()">取&nbsp;&nbsp;消</div>
				</td>
			</tr>
		</table>
	</div>
	
	<div id="SelectKeShi" class="SelectKeShi" >
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">中医内科</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKKeShi" id="ASKKeShi" value="1">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">中医外科</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKKeShi" id="ASKKeShi" value="2">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">妇&nbsp;&nbsp;科</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKKeShi" id="ASKKeShi" value="3">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">儿&nbsp;&nbsp;科</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKKeShi" id="ASKKeShi" value="4">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr></td></tr></table>
		<table width="100%" cellpadding="0" cellspacing="0px"  >
			<tr>
				<td align="center" width="70%">针推科</td>
				<td valign="middle" align="left" width="30%">
					<input type="radio" name="ASKKeShi" id="ASKKeShi" value="5">
				</td>
			</tr>
		</table>
		<table width="100%"><tr><td><hr color="<%=sysFontColor %>"></td></tr></table>
		<table width="100%">
			<tr>
				<td width="50%" align="center">
					<div id="SelectKeshiCertain" onclick="SelectKeshiCertain()">确&nbsp;&nbsp;认</div>
				</td>
				<td align="center">
					<div id="SelectKeshiCancel" onclick="SelectKeshiCancel()">取&nbsp;&nbsp;消</div>
				</td>
			</tr>
		</table>
	</div>
	
	<br>
	<table width="95%" cellpadding="0" cellspacing="1"  border="0">
		<tr>
			<td width="30" align="center"><div id="ASKInput">性&nbsp;&nbsp;别</div></td>
<!--			<td width="70%"><input id="ASKGender" name="ASKGender" type="text" value="" /></td>-->
			<td width="70%"><div id="InputBorderASK">
   				<table width="100%">
   					<tr>
   						<td valign="middle" align="right" width="15%">
   							<input type="radio" checked name="ASKGender" id="ASKGender" value="1">
   						</td>
   						<td align="left" width="35%">&nbsp;&nbsp;男</td>
   						 
   						<td valign="middle" align="right" width="15%">
   							<input type="radio" name="ASKGender" id="ASKGender" value="0">
   						<td align="left" width="35%">&nbsp;&nbsp;女</td>
   					</tr>
				</table></div>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td width="30" align="center"><div id="ASKInput">年&nbsp;&nbsp;龄</div></td>
			<td width="70%"><input id="ASKAge" name="ASKAge" type="text" value="" /></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td width="30" align="center"><div id="ASKInput">联系方式</div></td>
			<td width="70%"><input id="ASKTel" name="ASKTel" type="text" value="" /></td>
		</tr>
	</table>
	
	<br>
	<div id="msgASK"></div>
	<div id="ASKSubmit" style="width:95%" onclick="ASKSubmit()"><big>提&nbsp;&nbsp;交</big></div>
	<div id="ASKWaiting" style="width:95%;display:none;" ><div id="SubmitButton"><big>正在提交，请稍后...</big></div></div>
				
	</center>
		</fieldset>
	</form>
