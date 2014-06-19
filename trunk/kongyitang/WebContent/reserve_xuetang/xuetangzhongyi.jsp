<%@ page language="java" import="java.util.*,java.net.URL,java.sql.*"
	pageEncoding="UTF-8"%>

<%@ include file="../include/package.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><%=sysName%></title>

<%@ include file="../include/meta.jsp"%>
<%@ include file="../include/cssJS.jsp"%>
<%@ include file="../include/SpecificssJS.jsp"%>
  
<link rel="stylesheet" href="../css/screen.css" />
<link rel="stylesheet" href="../css/reservation_xuetang.css" />


<style type="text/css">
#verifyForm label.error {
	margin-left: 10px;
	width: auto;
	display: inline;
}
.ui-content
{
	padding:0px;
}

</style>

</head>

<body>
	<div data-role="page">
		<div data-role="header">

			<table width="100%">
				<tr>
					<td width="23%">
						<!-- <div id="backButton" style="width: 60px;"
							onclick="return_to_wechat_main()"></div> -->
							<div id="backButton" style="width: 60px;">
							<a id="return_link" onclick="window.location.href='../reserve_xuetang/index.jsp'"></a>
						</div>
							
					</td>
					<td align="center" width="54%"><a style="color: white;">中医师承教育</a></td>
					<td width="23%">&nbsp;&nbsp;</td>
				</tr>
			</table>

		</div>

		<div data-role="content" style="margin-bottom: 20px;">
			<form name="verifyForm" id="verifyForm" method="post"
				action="submit_reserve_xuetang.jsp">

				<!-- 预约的学堂 -->
				<input id="xuetang" name="xuetang" type="hidden">
				<!-- 预约的科室 -->
				<!-- <input id="department" name="department" type="hidden"> -->
				<!-- 预约的医生id -->
				<!-- <input id="doctorid" name="doctorid" type="hidden"> -->
				<!-- 预约的门诊id(2014-05-01 星期四 上午 普通门诊) -->
				<!-- <input id="outpatientid" name="outpatientid" type="hidden"> -->





				<!-- 预约孔医堂首页 -->
				<div id="xuetang_reservation_index" style="display:">

					<table width="100%"  cellspacing="0"
						cellpadding="0" class="Introtable">

						<!-- <tr bgColor="#000000">
							<td align="left" style="width: 20%"><button type="button"></button></td>
							<td align="center" style="color: white;">预约孔医堂</td>

						</tr> -->

						<tr>
							<td>
							<div style="margin-bottom: 20px" >
							<div style="border:none;padding:0cm 0cm 8.0pt 0cm;">
	<p align="left">
		【国医学堂】孔伯华学院特设中医药师承教育学习
	</p>
</div>
<p style="text-indent:0;text-align: center;"><img src="../images/zy/zy1.jpg" /></p>
<p align="left">
	孔伯华学院·国医学堂依托北京中医药薪火传承3+3工程项目“孔伯华名家研究室”及孔伯华中医世家非物质文化遗产项目，组织建立的以中医药基础和临证教学为主的传统国医学堂。国医学堂汇聚了众多具实践临床经验的中医药学专家，注重理论基础与临床实际操作相结合，尤其注重中医学传统文化之教育精神，本之于己，本之于社会，本之于以往经验积累，首在育人。
</p>
<p align="left">
	师承教育就是要培养医德好、医术高的中医把师承工作开展下去，为更多的年青中医提供学习途径和交流平台，不断壮大中医药人才队伍，振兴中医药事业。为此，国医学堂特别开设师承教育学习，本期计划招收10名学员，跟随医师临证实战学习，不但可以夯实自己的理论基础，还可以深入借鉴，进一步丰富临床实践经验。
</p>
<p align="left">
	灵活的学习方式，全年进行一对一实践教学。
</p>
<p align="left">
	&nbsp;
</p>
<p align="left">
	入学基本要求：中医专业大专以上学历，中医药从业者以及热爱中医药事业并且有意加入该行业者。现任医师优先。入学前统一安排指导老师进行面试审核。
</p>
<p style="text-indent:0;text-align: center;"><img src="../images/zy/zy2.jpg" /></p>
<p align="left">
	本期教学医师由孔门传人孔令诩、孔令誉、阮劲平、潘竹立等老师进行指导！
</p>
<p align="left">
	&nbsp;
</p>
<p align="left">
	指导老师——
</p>
<p align="left">
	&nbsp;
</p>
<p align="left">
	孔令诩：男，原中国中医科学院养生研究室主任。主任医师、博士生导师，全国500位名老专家之一。擅治：肿瘤及术后调理，急慢性肾炎，病毒性肝炎、肝硬化、胆囊及胰腺疾病、感冒、咳嗽、哮喘、气管炎、高血压、冠心病脑梗及其后遗症、老年脑功能减退。
</p>
<p align="left">
	&nbsp;
</p>
<p align="left">
	孔令誉：男，中医世家，中医临床、教学和科研工作30余年。中医学和现代医学相结合，具有丰富的理论和临床经验。擅治内科常见病,尤擅心血管和消化系统疾病,对疑难杂病有良好的疗效。
</p>
<p align="left">
	&nbsp;
</p>
<p align="left">
	阮劲平：男，孔少华先生弟子。主治内儿妇皮各科常见病、疑难病：四时发热、无名高热、咳喘、肝胆肾病、类风湿性关节炎、痛风、颈肩腰腿痛、失眠、月经不调、更年期综合征、肿瘤保守治疗及术后恢复、控制发展及小儿发热、咳喘、厌食、腹泻等。
</p>
<p align="left">
	&nbsp;
</p>
<p align="left">
	潘竹立：男，中医主任医师，孔伯华先生再传弟子，北京疑难病研究会副会长。擅治：各种内、妇科疾病，如：痛经、闭经、月经不调、乳腺增生、卵巢囊肿、子宫肌瘤、不孕症、抑郁、心脑血管疾病、呼吸系统疾病及消化系统疾病等。
</p>
<p align="left">
	&nbsp;
</p>
							</div>
							</td>

						</tr>
					</table>

				

				</div>


		

			
				<div data-role="footer" data-id="myfooter" data-position="fixed">
				</div>
				</form>
		



		
	</div>
	</div>
</body>
</html>