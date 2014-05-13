package test;

import java.sql.SQLException;
import java.util.*; 
import java.text.*;


//import login.Validate;
//import security.PasswordUtil;
import database.*;
import tools.*;
import sendSMS.*;
import security.*;
import login.Validate;

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
    	String pw = "zhangsan";
		pw = GP.generatePassword(pw);
		UserDaoPatient patient = new UserDaoPatient();
		patient.insertUser_Patient("zhangsan", 0, 20, 0, "15210983333", pw);
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
		
	}

}
