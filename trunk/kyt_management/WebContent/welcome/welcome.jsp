
<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*"
	pageEncoding="UTF-8"%>


<body>

	<script language='javascript' type='text/javascript'>
	function jumpOut(){
		location.href = '../exit/index.jsp';
	}
	</script>
	
		<div>
			<table align="right" width="100%" style="background: #fee6c2;background: #fee6c2;height: 60px;border-bottom: 1px solid #754401;">
				<tr>
					<td width="100px">
						<img src="../img/kyt.png" style="height: 50px;margin-left: 50px;"/>
					<td>
					<td align="left">
					
						<span style='color: #351515;font-size: 35px;font-family: 华文新魏;'><%=sysName %></span>
					</td>
					<td  align="right" style='color: #351515;font-size:20px;font-family: 华文新魏;'>欢迎&nbsp;,&nbsp;<%=loginedUserName %>!&nbsp;&nbsp;
					</td>
					<td width="120px" align="left"><a class="btn btn-warning" contenteditable="true"
						onclick="jumpOut()">退出</a>&nbsp;</td>
				</tr>
			</table>
		</div>
		<br><br>
	<br>
		<center>
		<div style="width:100%" >
		
		
