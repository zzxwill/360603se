package servlet;

/**
 * @Author: liming
 * */

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.jdom.JDOMException;

import com.github.x0001.weixin.WeiXin;
import com.github.x0001.weixin.vo.recv.WxRecvEventMsg;
import com.github.x0001.weixin.vo.recv.WxRecvGeoMsg;
import com.github.x0001.weixin.vo.recv.WxRecvMsg;
import com.github.x0001.weixin.vo.recv.WxRecvTextMsg;
import com.github.x0001.weixin.vo.send.WxSendMsg;
import com.github.x0001.weixin.vo.send.WxSendNewsMsg;
import com.github.x0001.weixin.vo.send.WxSendNewsMsgItem;
import com.github.x0001.weixin.vo.send.WxSendTextMsg;

import database.*;

/**
 * Servlet implementation class WinxinInterface
 */
public class WeixinInterface extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public WeixinInterface() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		final String TOKEN = "weixin";
		String signature = request.getParameter("signature");
		String timestamp = request.getParameter("timestamp");
		String nonce = request.getParameter("nonce");
		String echostr = request.getParameter("echostr");

		/*
		 * if (null != timestamp && null != nonce && null != echostr && null !=
		 * signature) { if (WeiXin.access(TOKEN, signature, timestamp, nonce)) {
		 * response.getWriter().write(echostr); return; } return; }
		 */
		response.getWriter().write(echostr);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		WxRecvMsg msg = null;
		
//		String WeiXinUrl = "http://drinkmarket.duapp.com/";
		//String WeiXinUrl = "http://drinkmarket-liming.aliapp.com/";
		String WeiXinUrl = "http://localhost:8080/kongyitang/";
		String ImageUrl = "http://limingbuaa.oss-cn-hangzhou.aliyuncs.com/kongyitang/";
		//http://limingbuaa.oss-cn-hangzhou.aliyuncs.com/kongyitang/ask_answer__Gray_320_160.jpg
		
		try {
			msg = WeiXin.recv(request.getInputStream());
			String fromUser = msg.getFromUser();
			System.out.println("fromUser:" + fromUser + "\n");
			String toUser = msg.getToUser();
			//session
			//HttpSession session = request.getSession();
			//session.setAttribute("weixinID",fromUser);
       	 	//session.setMaxInactiveInterval(60*20);
		} catch (JDOMException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String fromUser = msg.getFromUser();
		String toUser = msg.getToUser();
		//session
		//HttpSession session = request.getSession();
		//session.setAttribute("weixinID",fromUser);
   	 	//session.setMaxInactiveInterval(60*20);
		WxSendMsg sendMsg = WeiXin.builderSendByRecv(msg);
		System.out.println(msg);
		// 微信事件消息, 关注/取消关注/菜单...
		if (msg instanceof WxRecvEventMsg) {
			WxRecvEventMsg m = (WxRecvEventMsg) msg;
			String event = m.getEvent();
			// 有人关注微信帐号
			if ("subscribe".equals(event)) {
		     	String content = "欢迎关注孔医堂，请查看底部菜单获取相关帮助！\n";
				// 构建文本消息进行发送
				sendMsg = new WxSendTextMsg(sendMsg, content);
				// 发送回微信
				try {
					WeiXin.send(sendMsg, response.getOutputStream());
				} catch (JDOMException e) {
					e.printStackTrace();
				}
			} else if ("CLICK".equals(event)) {
				String key = m.getEventKey();
				// 预约.门诊预约	
				if (key.equals("V1001_reserve_clinic")) {
					sendMsg = new WxSendNewsMsg(sendMsg);
					WxSendNewsMsgItem msgItem = new WxSendNewsMsgItem(
							"门诊预约",
							"欢迎来到孔医堂,门诊预约！",
							ImageUrl + "reserve_clinic__Gray_320_160.jpg",
							WeiXinUrl + "reserve_clinic/index.jsp?sid=" + fromUser);
					ArrayList<WxSendNewsMsgItem> itemList = new ArrayList<WxSendNewsMsgItem>();
					itemList.add(msgItem);
					((WxSendNewsMsg) sendMsg).setItems(itemList);
					try {
						WeiXin.send(sendMsg, response.getOutputStream());
					} catch (JDOMException e) {
						e.printStackTrace();
					}
				}
				// 预约.健康服务
				else if (key.equals("V1001_reserve_health")) {
					sendMsg = new WxSendNewsMsg(sendMsg);
					WxSendNewsMsgItem msgItem = new WxSendNewsMsgItem(
							"健康服务",
							"欢迎来到孔医堂,健康服务！",
							ImageUrl + "reserve_health__Gray_320_160.jpg",
							WeiXinUrl + "reserve_health/index.jsp?sid=" + fromUser);
					ArrayList<WxSendNewsMsgItem> itemList = new ArrayList<WxSendNewsMsgItem>();
					itemList.add(msgItem);
					((WxSendNewsMsg) sendMsg).setItems(itemList);
					try {
						WeiXin.send(sendMsg, response.getOutputStream());
					} catch (JDOMException e) {
						e.printStackTrace();
					}
				}
				// 预约.招生在线
				else if (key.equals("V1001_reserve_enrol")) {
					sendMsg = new WxSendNewsMsg(sendMsg);
					WxSendNewsMsgItem msgItem = new WxSendNewsMsgItem(
							"招生在线",
							"欢迎来到孔医堂,招生在线！",
							ImageUrl + "reserve_enrol__Gray_320_160.jpg",
							WeiXinUrl + "reserve_enrol/index.jsp?sid=" + fromUser);
					ArrayList<WxSendNewsMsgItem> itemList = new ArrayList<WxSendNewsMsgItem>();
					itemList.add(msgItem);
					((WxSendNewsMsg) sendMsg).setItems(itemList);
					try {
						WeiXin.send(sendMsg, response.getOutputStream());
					} catch (JDOMException e) {
						e.printStackTrace();
					}
				}
				// 预约.产品展示
				else if (key.equals("V1001_reserve_product")) {
					sendMsg = new WxSendNewsMsg(sendMsg);
					WxSendNewsMsgItem msgItem = new WxSendNewsMsgItem(
							"产品展示",
							"欢迎来到孔医堂,产品展示！",
							ImageUrl + "reserve_product__Gray_320_160.jpg",
							WeiXinUrl + "reserve_product/index.jsp?sid=" + fromUser);
					ArrayList<WxSendNewsMsgItem> itemList = new ArrayList<WxSendNewsMsgItem>();
					itemList.add(msgItem);
					((WxSendNewsMsg) sendMsg).setItems(itemList);
					try {
						WeiXin.send(sendMsg, response.getOutputStream());
					} catch (JDOMException e) {
						e.printStackTrace();
					}
				}
				//提问
				else if (key.equals("V2001_ask_answer")) {
					sendMsg = new WxSendNewsMsg(sendMsg);
					WxSendNewsMsgItem msgItem = new WxSendNewsMsgItem(
							"提问",
							"欢迎来到喝喝订水,提问！",
							ImageUrl + "ask_answer__Gray_320_160.jpg",
							WeiXinUrl + "ask_answer/index.jsp?sid=" + fromUser);
					ArrayList<WxSendNewsMsgItem> itemList = new ArrayList<WxSendNewsMsgItem>();
					itemList.add(msgItem);
					((WxSendNewsMsg) sendMsg).setItems(itemList);
					try {
						WeiXin.send(sendMsg, response.getOutputStream());
					} catch (JDOMException e) {
						e.printStackTrace();
					}
				}
				// 我的.会员中心
				else if (key.equals("V3001_my_member")) {
					sendMsg = new WxSendNewsMsg(sendMsg);
					WxSendNewsMsgItem msgItem = new WxSendNewsMsgItem(
							"会员中心",
							"欢迎来到孔医堂,会员中心！",
							ImageUrl + "my_member__Gray_320_160.jpg",
							WeiXinUrl + "my_member/index.jsp?sid=" + fromUser);
					ArrayList<WxSendNewsMsgItem> itemList = new ArrayList<WxSendNewsMsgItem>();
					itemList.add(msgItem);
					((WxSendNewsMsg) sendMsg).setItems(itemList);
					try {
						WeiXin.send(sendMsg, response.getOutputStream());
					} catch (JDOMException e) {
						e.printStackTrace();
					}
				}
				// 我的.我的问题
				else if (key.equals("V3001_my_question")) {
					sendMsg = new WxSendNewsMsg(sendMsg);
					WxSendNewsMsgItem msgItem = new WxSendNewsMsgItem(
							"我的问题",
							"欢迎来到孔医堂,我的问题！",
							ImageUrl + "my_question__Gray_320_160.jpg",
							WeiXinUrl + "my_question/index.jsp?sid=" + fromUser);
					ArrayList<WxSendNewsMsgItem> itemList = new ArrayList<WxSendNewsMsgItem>();
					itemList.add(msgItem);
					((WxSendNewsMsg) sendMsg).setItems(itemList);
					try {
						WeiXin.send(sendMsg, response.getOutputStream());
					} catch (JDOMException e) {
						e.printStackTrace();
					}
				}
				// 我的.健康自测
				else if (key.equals("V3001_my_health")) {
					sendMsg = new WxSendNewsMsg(sendMsg);
					WxSendNewsMsgItem msgItem = new WxSendNewsMsgItem(
							"健康自测",
							"欢迎来到孔医堂,健康自测！",
							ImageUrl + "my_health__Gray_320_160.jpg",
							WeiXinUrl + "my_health/index.jsp?sid=" + fromUser);
					ArrayList<WxSendNewsMsgItem> itemList = new ArrayList<WxSendNewsMsgItem>();
					itemList.add(msgItem);
					((WxSendNewsMsg) sendMsg).setItems(itemList);
					try {
						WeiXin.send(sendMsg, response.getOutputStream());
					} catch (JDOMException e) {
						e.printStackTrace();
					}
				}
				// 我的.消费记录
				else if (key.equals("V3001_my_consume")) {
					sendMsg = new WxSendNewsMsg(sendMsg);
					WxSendNewsMsgItem msgItem = new WxSendNewsMsgItem(
							"消费记录",
							"欢迎来到孔医堂,消费记录！",
							ImageUrl + "my_consume__Gray_320_160.jpg",
							WeiXinUrl + "my_consume/index.jsp?sid=" + fromUser);
					ArrayList<WxSendNewsMsgItem> itemList = new ArrayList<WxSendNewsMsgItem>();
					itemList.add(msgItem);
					((WxSendNewsMsg) sendMsg).setItems(itemList);
					try {
						WeiXin.send(sendMsg, response.getOutputStream());
					} catch (JDOMException e) {
						e.printStackTrace();
					}
				}
			}
			return;
		}
		// 文本消息..,目前支持的消息有(WxRecvEventMsg/事件消息,WxRecvGeoMsg/地理位置消息,WxRecvLinkMsg/连接消息,WxRecvPicMsg/图片消息)
		if (msg instanceof WxRecvTextMsg) {
			// 文本消息
			// 发送消息构建
			// WxSendMsg sendMsg = WeiXin.builderSendByRecv(msg);
			// 将收到的消息转为发送消息(交换了sendUser和fromUser)
			
			String recvContent = ((WxRecvTextMsg) msg).getContent();
			String sendContent = null;
			if (recvContent == null || recvContent.equals("")) {
				// 接受消息为空
				return;
			} else {
				// 非空
				sendContent = "你的问题是：" + recvContent + "!\n欢迎关注孔医堂，请查看底部菜单获取相关帮助！";
				//sendContent = "fromeUser:" + fromUser;
				sendMsg = new WxSendTextMsg(sendMsg, sendContent);
				//回复消息给发送者
				/*
				String responseXML = " <xml> "+
					 "<ToUserName><![CDATA[oDK3oji70nN1CG77qYR_z_thFUBs]]></ToUserName>"+
					"<FromUserName><![CDATA[gh_f5c1c22104b0]]></FromUserName>"+
					"<CreateTime>12345678</CreateTime>"+
					"<MsgType><![CDATA[text]]></MsgType>"+
					"<Content><![CDATA[hello ,thank you to call me01]]></Content>"+
					"<FuncFlag>1</FuncFlag>"+
					"</xml>";
				response.getWriter().println(responseXML);
				*/
				try {
					WeiXin.send(sendMsg, response.getOutputStream());
				} catch (JDOMException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return;
		}
	}
}
