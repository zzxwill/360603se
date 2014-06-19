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
					<td align="center" width="54%"><a style="color: white;">陈氏太极拳</a></td>
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
							<p style="text-indent:0;text-align: center;"><img src="../images/tj/df.jpg" /></p>
								<p align="left">
	应广大太极爱好者之邀，孔伯华学院精心设计、特邀名师，开设太极文化、太极拳法、中医养生、健康管理四大版块全方位文化养生太极课程。
</p>
<p align="left">
	&nbsp; &nbsp; 走进孔伯华学院，在名师的引领下，让我们一起感受太极文化的魅力！
</p>
<p align="left">
	&nbsp;修习拳法+文化沙龙+中医养生+健康休闲&nbsp;
</p>
<p style="text-indent:0;text-align: center;"><img src="../images/tj/tj.jpg" /></p>
<p align="left">
	&nbsp;
</p>
<p align="left">
	&nbsp;太极拳是国家级非物质文化遗产，它的起源和中国内家拳的发展有密切的关系。拳虽小技，却有着深邃的中国古典哲学内涵，包含了无极与太极、神与意、意与气、气与劲、动与静、开与合、转与承、徐与疾、正与隅、紧与松、里与外、躯与肢、敌与我……等等数之不尽的相对范畴。可以说，太极拳是中国古典思辨哲学在武术技击的结晶之作。太极拳初创于清朝初河南温县陈家沟，成于清中叶，在民国初始盛。中华人民共和国成立后，太极拳得到进一步推广，至今已为全球最广泛接受的中国拳术。
</p>
<p style="text-indent:0;text-align: center;"><img src="../images/tj/1.jpg" /></p>
<p style="text-indent:0;text-align: center;"><img src="../images/tj/2.jpg" /></p>
<p align="left">
	&nbsp;
</p>
<p align="left">
	&nbsp;&nbsp;太极拳含蓄内敛、连绵不断、以柔克刚、急缓相间、行云流水的拳术风格使习练者的意、气、形、神逐渐趋于圆融一体的至高境界，而其对于武德修养的要求也使得习练者在增强体质的同时提高自身素养，提升人与自然、人与社会的融洽与和谐。同时，太极拳也不排斥对身体素质的训练，讲究刚柔并济，而非只柔无刚的表演、健身操。所以，修习太极拳，按目的来说有其最基本三类划分：强身健体类、涵养心性类、竞技搏击类。而除了第三类以外，普通人最适合前两类。
</p>
<p style="text-indent:0;text-align: center;"><img src="../images/tj/6.jpg" /></p>
<p style="text-indent:0;text-align: center;"><img src="../images/tj/7.jpg" /></p>
<p style="text-indent:0;text-align: center;"><img src="../images/tj/8.jpg" /></p>
<p align="left">
	&nbsp;
</p>
<p align="left">
	&nbsp; &nbsp;浸润传统文化中的太极拳修习，在强身健体、涵养心性的同时，运中华文脉于股掌之间，吐纳天地，可收事半功倍之效。所以才有了今天的养生太极。
</p>
<p align="left">
	&nbsp;何谓太极拳？顾名思义，太极拳就是符合太极之理的拳法。何谓太极？王宗岳在《太极拳论》开宗即曰：“太极者，无极而生，阴阳之母也。”何谓阴阳？即中国古人认为这个世界之所以能够存在与运转，全在于这个世界内部存在着的两种相反特征的两种力量，名之曰阴与阳；故而华夏先祖总是从事物相反相成的这两个（阴与阳）角度去理解这个世界，这是中国文化的一大特点。在太极拳中静与动是阴阳，虚与实是阴阳，柔与刚是阴阳；不仅如此，松与紧也是阴阳，轻与重也是阴阳，舍与得还是阴阳，……总而言之，太极拳无处不阴阳！因此，修炼太极拳的第一要领就是知阴阳。
</p>
<p align="left">
	&nbsp;
</p>
<p align="left">
	&nbsp; &nbsp;古人云：“顺为人，逆为仙。”太极由无极而生，故修习拳道的目的在于由有入无，复归无极！“有形有意都是假，拳到无心方见奇。”无神无意、全体透空，方是太极拳修炼者心中仰慕的至高境界。
</p>
<p align="left">
	&nbsp;
</p>
<p align="left">
	【修习主题】文化养生太极
</p>
<p align="left">
	【修习周期】养生太极初段1年度
</p>
<p align="left">
	【修习内容】四大版块，全面提升
</p>
<p align="left">
	*名师亲授：养生太极初段，陈氏太极一路拳法名师引领每月集中修习
</p>
<p align="left">
	*名师解读：养生文化沙龙，《阴阳五行》、《经络气血》、《走进中医学》、《养生智慧与幸福人生》
</p>
<p align="left">
	*休闲交流：养心艺术沙龙，禅茶品茗、听琴畅谈、交流拳法
</p>
<p align="left">
	*健康管理：设立健康档案，专享中医师健康订制，由内而外健康生活
</p>
<p align="left">
	【修习地点】孔医堂望京馆
</p>
<p align="left">
	（北京市朝阳区广顺南大街21号）
</p>
<p align="left">
	&nbsp;
</p>
<p align="left">
	文化太极 &nbsp;阴阳平衡
</p>
<p align="left">
	内外兼修 &nbsp;刚柔相济&nbsp;
</p>
<p align="left">
	儒道哲学 &nbsp;圆融一体&nbsp;
</p>
<p style="text-indent:0;text-align: center;"><img src="../images/tj/xc.jpg" /></p>
<p align="left">
	&nbsp;
</p>
<p align="left">
	师资介绍
</p>
<p align="left">
	&nbsp;
</p>
<p align="left">
	张玉海
</p>
<p align="left">
	&nbsp; &nbsp; 自幼习武，先后师从陈式太极名家田秀臣先生和冯志强先生。四十年如一日，功夫娴熟，功力深厚，中国武术六段，为陈式混元太极代表性传人之一。现任中国武术协会会员，北京武术协会教练，中国武术段位指导员和考评员。香港混元太极拳研究会名誉主席，深圳马广禄陈式混元太极拳社名誉社长。&nbsp;
</p>
<p align="left">
	&nbsp;
</p>
<p align="left">
	刘树春
</p>
<p align="left">
	&nbsp; &nbsp; 孙式内家拳名家，北京武术协会形意拳研究会会长。孙式内家拳包含形意、八卦、太极三大拳种，由孙禄堂先生创立。刘树春自幼随孙禄堂先生爱女孙剑云老师习武，是孙剑云老师的早期弟子，也是孙门弟子中掌握内容最为丰富、功力最高的代表人物之一，多年来为推广孙式内家武学做出了重大贡献。
</p>
<p align="left">
	&nbsp;
</p>
<p align="left">
	芦&nbsp;春
</p>
<p align="left">
	&nbsp; &nbsp; 陈式太极拳第十九代传人，八极拳第十代传人，混元太极第二代传人，自幼练习传统武术。先后师于中国散打创史人梅惠志，八极拳第九代传人张旭初先生，陈式太极十八代传人冯志强先生。精习中华传统文化，领悟并体证儒、释、道思想精髓。在中医、养生、传统武学等方面的传承与研究均造诣深厚。
</p>
<p align="left">
	&nbsp;
</p>
<p align="left">
	&nbsp;
</p>
<p align="left">
	孔令谦
</p>
<p align="left">
	&nbsp; &nbsp;&nbsp;四大名医之一孔伯华先生之孙，孔医堂创始人，孔伯华中医世家非物质文化遗产代表性传承人。现任孔医堂董事长，孔伯华学院院长，孔伯华名家研究室主任，北京市中医药师承工作委员会副主任委员，知识共享中国大陆组织国际委员会委员。作为儒家思想和中医文化的积极传播者，应邀在中央电视台、北京电视台、湖南卫视等多家媒体及众多IT、金融等企业和机关院校，传授儒家思想、中医文化和健康养生知识等。获全国中医药科学普及金话筒奖，北京市非物质文化遗产保护贡献奖。其倡导的中医开放式教育理念，被收录在联合国教科文组织编写的《中国开放教育资源报告》一书中。著有《孔伯华中医世家医学传习录》、《孔少华临证经验纂要》等著作。
</p>
<p align="left">
	&nbsp;
</p>
<p align="left">
	陈生
</p>
<p align="left">
	&nbsp; &nbsp; 中医世家，其祖父为伤寒派著名中医大家陈慎吾先生。北京中医药大学伤寒教研室教授、首任主任，自幼随父陈大启先生临诊，耳濡目染，受到家庭的启蒙教育，大学毕业后又拜京城名医陈文伯教授为师。曾多次受邀到新加坡、印度尼西亚等地治病讲学，为许多海外患者解除病痛，传播中医药文化。
</p>
<p align="left">
	&nbsp;
</p>
<p align="left">
	私人医师
</p>
<p align="left">
	&nbsp;
</p>
<p align="left">
	孙立彬
</p>
<p align="left">
	&nbsp; &nbsp; 四大名医孔伯华先生学术传人，师从名医孔少华先生，主治医师，孔医堂上工坊专职健康评估团队医师。任北京中医药学会事师承工作委员会委员，北京市中医药薪火传承工程项目“孔伯华名家研究室”研究员。著有
《黄帝内经体质养生》、《女性气血养生经》等著作。
</p>
<p align="left">
	&nbsp;
</p>
<p align="left">
	肖 &nbsp;强
</p>
<p align="left">
	&nbsp; &nbsp; 中医主治医师，毕业于北京中医药大学。师从皮肤病、自身免疫病专家魏雅川教授。擅治：感冒、发热、咳嗽、消化系统等内科病，自身免疫病、皮科（牛皮癣、干燥综合征、过敏性紫癜、痤疮、湿疹、带状疱疹、斑秃），经前紧张、更年期烦躁症。
</p>
<p align="left">
	&nbsp;
</p>
<p align="left">
	郭培杰
</p>
<p align="left">
	&nbsp; &nbsp; 北京中医药大学博士，擅以整体思维指导临床辨证，采用针药并行进行治疗。擅长治疗心脑血管、消化系统、呼吸系统疾病。包括小儿发热、咳嗽、冠心病、心律失常、抑郁证、胃肠病、肝胆病、多汗证、便秘、内分泌紊乱、慢性疲劳综合症、亚健康状态、内科杂病及各种痛症（如颈、肩、腰、腿疼及不明原因疼痛）等。
</p>
<p align="left">
	&nbsp;
</p>
<p align="left">
	王 &nbsp;倩
</p>
<p align="left">
	&nbsp; &nbsp; 医学博士，孔医堂上工坊专职健康评估团队医师。毕业于北京中医药大学，原于中国中医科学院广安门医院从事临床医疗工作。擅长内分泌系统疾病、亚健康状态的诊治与调理。辅助研修心理学，具国家二级心理咨询师资格认证。
</p>
<p align="left">
	&nbsp;
</p>
<p>
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