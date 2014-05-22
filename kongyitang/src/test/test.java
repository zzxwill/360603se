package test;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.*; 
import java.text.*;


//import login.Validate;
//import security.PasswordUtil;
import database.*;
import tools.*;
import sendSMS.*;
import security.*;
import login.Validate;
import IP.*;

public class test {

	/**
	 * @param args
	 * @throws SQLException 
	 */
	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		
		/*
		//测试随机数
		Tools tools = new Tools();
		String str_code = tools.GenRandomNum(); 
		System.out.println("str_code:" + str_code + "\n");
		//验证
		System.out.println("rusult:" + tool.validateCode(str_code, tools.RandCode) + "\n");
		*/
		
		/*
		//测试短信
		Tools tools = new Tools();
		String str_code = tool.GenRandomNum();
		SendMsg sendMsg = new SendMsg();
		String tel = "15210983731";
		sendMsg.run(str_code, tel);
		*/
		
		/*
		//添加患者用户
		PasswordUtil GP = new PasswordUtil();
    	String pw = "patient";
		pw = GP.generatePassword(pw);
		UserDaoPatient patient = new UserDaoPatient();
		patient.insertUser_Patient("patient", 0, 20, 0, "222", pw);
		*/
		
		/*
		//添加医生用户
		PasswordUtil GP = new PasswordUtil();
    	String pw = "doctor";
		pw = GP.generatePassword(pw);
		UserDaoDoctor doctor = new UserDaoDoctor();
		doctor.insertUser_Doctor("doctor", 0, 20, 0, "15210983333", "张三丰", "85", 2, "护士" ,pw);
		*/
		
		/*
		//登陆验证
		Validate validate = new Validate();
		if(validate.validate(0, "zhangsan", "zhangsan")){
			System.out.println("validate True!");
		}
		*/
		
		/*
		//根据WeixinID查询用户ID
		WeiXinDao weixinDao = new WeiXinDao();
		int id = 2;
		String weixinID = weixinDao.getWeixinID(id);
		int userID = weixinDao.getUserID_By_WeixinID(weixinID);
		System.out.println("userID:" + userID);
		*/
		
		/*
		//根据添加weixin映射
		WeiXinDao weixinDao = new WeiXinDao();
		String weixinID = "gh_f5c1c22104b0"; 
		//gh_f5c1c22104b0  oDK3oji70nN1CG77qYR_z_thFUBs
		int userID = 2; 
		int role = 1;
		weixinDao.insertWeixin(weixinID, userID, role);
		*/
		
		/*
		//提问
		ASKPatient askPatient = new ASKPatient();
		int userID = 2;
		String content = "挣的钱不够花怎么办？";
		String picture_path  = "http://www.baidu.com";
		int department = 2;
		int gender = 1;
		int age = 20;
		String mobile = "1521098333";
		askPatient.insertQuestion(userID, content, picture_path, department, gender, age, mobile);
		*/
		
		/*
		//新建答案
		AnswerDao answerDao = new AnswerDao();
		String answer = "请前往医院医治";
		int doctor_id = 2;
		int question_id = 2;
		answerDao.insertAnswer(answer, doctor_id, question_id);
		*/
		
		/*
		//加解密：
		try {
			enDecrypt enDe =  new enDecrypt();
			String key = "15210983731";
			String ciphertext = enDe.encrypt(key);
			System.out.println("ciphertext: " + ciphertext + "\n");
			String plaintext = enDe.decrypt(ciphertext);
			System.out.println("plaintext: " + plaintext + "\n");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		
		/*
		//测试连接网络地址：
		GetLocalIpAddress getLocalIpAddress = new GetLocalIpAddress();
		String IP01 = getLocalIpAddress.getLocalIpAddress();
		//String IP012 = getLocalIpAddress.getIP4(request);
		System.out.println("IP01:" + IP01 +"\n");
		*/
		
		/*
		Timestamp ts = new Timestamp(System.currentTimeMillis());  
		System.out.println("ts:" +ts + "\n");
		long longts =  ts.getTime();
		System.out.println("getTime:" +longts + "\n");
		longts =longts - 1000*2;//1000*2为两秒
		Timestamp ts2 =   new Timestamp(longts);
		System.out.println("ts2:" +ts2 + "\n");
		*/
		
		/*
		//IP地址
		IPDao ipDao = new IPDao();
		int userID = 1;//患者为3;;医生为1;;;
		String TMP_IPAdress = "fe80:0:0:0:910:49b1:51b1:b467%11";
		String IPV4 = "192.168.1.107";
		TMP_IPAdress += IPV4;
		ipDao.insertIP(userID, 1, TMP_IPAdress);
		*/
		
		/*
		//查询department
		DepartmentDao departmentDao = new DepartmentDao();
		int id = 2;
		String name  = departmentDao.getDepartmentName(id);
		System.out.println("name:" + name + "\n");
		*/
		
		/*
		//用户登陆注销
		IPDao ipDao = new IPDao();
		int userID = 10;
		int role = 0;
		ipDao.modifyStatus(userID, role);
		*/
		
	}

}
