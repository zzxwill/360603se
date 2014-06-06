package sendSMS;
//使用中国网建提供的SMS短信平台（申请账号地址：http://sms.webchinese.cn/default.shtml）

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import java.sql.*;


//import jsonProcess.*;
import database.*;
import tools.*;

public class SendMsg {

	private static String Uid = "kongyitang"; //kongyitang
	private static String Key = "3ce1c090dc6ce05cb740";
	private static String CompanyName = "【孔医堂】";

	public static void SendMsgProces(String message,String tel) throws Exception {
		HttpClient client = new HttpClient();
		PostMethod post = new PostMethod("http://utf8.sms.webchinese.cn"); 
		
		client.getHttpConnectionManager().getParams().setConnectionTimeout(30000);
		client.getHttpConnectionManager().getParams().setSoTimeout(30000);
		
		post.addRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=utf8");//在头文件中设置转码
		NameValuePair[] data ={ new NameValuePair("Uid", Uid),
				new NameValuePair("Key", Key),
				new NameValuePair("smsMob",tel),
				new NameValuePair("smsText",message)};
		post.setRequestBody(data);

		client.executeMethod(post);
		Header[] headers = post.getResponseHeaders();
		int statusCode = post.getStatusCode();
		//System.out.println("statusCode:"+statusCode + "\n");
		for(Header h : headers)
		{
			//System.out.println("h.toString()" + h.toString() + "\n");
		}
		String result = new String(post.getResponseBodyAsString().getBytes("utf-8")); 
		//System.out.println("result:" + result + "\n");

		post.releaseConnection();
	}
	
	//@Override
    public void run(String str_code, String tel) {
		String message = null;
		//String tel = null;		
		try {
			Timestamp ts = new Timestamp(System.currentTimeMillis());  
			//tel = "15210983731";
			//Tool tool = new Tool();
			//String str_code = tool.GenRandomNum(); 
			message = "您的验证码是：" + str_code + " " + ",三十分钟内有效！";
			SendMsgProces(message,tel);
			System.out.println("在" + ts + "时刻: 验证码【" + str_code + "】发送成功。\n");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
