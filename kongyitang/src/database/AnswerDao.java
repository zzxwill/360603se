package database;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import database.Connections;
import tools.Tools;
//import security.PasswordUtil;

public class AnswerDao {

	int NUM = 1000;
	
	private Statement stmt = null;
	private ResultSet rs = null;
	private Connection conn = null;
	private PreparedStatement ps = null;
	
	public String answers_Given_Patient[]; 
	public String answers_doctor_name_Given_Patient[]; 
	public int answers_doctor_id_Given_Patient[]; 
	public int answers_doctor_department_id_Given_Patient[]; 
	public String answers_doctor_department_Given_Patient[]; 
	public String answers_doctor_introduction_Given_Patient[]; 
	public String answers_doctor_portrait_Given_Patient[]; 
	public int answers_doctor_changguan_id_Given_Patient[]; 
	public String answers_doctor_changguan_Given_Patient[]; 
	public int answers_doctor_visit_fee_Given_Patient[]; 
	public int num_Given_Patient = 0;
	
	
	public String answers_Given_Doctor[]; 
	public int questions_ids_Given_Doctor[];
	public int num_Given_Doctor = 0;
	
	//新建答案
	public void insertAnswer(String answer, int doctor_id, int question_id) {
		
		conn = Connections.getConnection();
		Tools tool = new Tools();

		String sql = "insert into 04answer values(?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			int id = tool.generateID("04answer");
			if (id == -1) {
				return;
			}
			ps.setInt(1, id);
			ps.setString(2, answer);
			ps.setInt(3, doctor_id);
			ps.setInt(4, question_id);
			Timestamp ts = new Timestamp(System.currentTimeMillis());  
			ps.setTimestamp(5, ts);
			ps.setTimestamp(6, ts);

			ps.execute();
			
			ps.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//根据id查询答案
	public String getAnswer(int id) throws SQLException {

		conn = Connections.getConnection();
		String sql = "select * from 04answer where id=" + id;
		String answer= null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				answer = rs.getString("answer");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return answer;
	}
	
	//根据doctorID查询问题列表
	public void getQuestions_Given(int doctor_id) throws SQLException {
		
		answers_Given_Doctor = new String[NUM]; 
		questions_ids_Given_Doctor = new int[NUM];
		
		conn = Connections.getConnection();
		String sql = "select * from 04answer where doctor_id=" + doctor_id;
		try {
			int index = 1;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				questions_ids_Given_Doctor[index] = rs.getInt("question_id");
				answers_Given_Doctor[index] = rs.getString("answer");;
				index++;
			}
			num_Given_Doctor = index-1;
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//根据question_id查询答案
	public void getAnswers_Given(int question_id) throws SQLException {
		
		answers_Given_Patient = new String[NUM];
		answers_doctor_name_Given_Patient = new String[NUM]; 
		answers_doctor_id_Given_Patient = new int[NUM]; 
		answers_doctor_department_Given_Patient = new String[NUM]; 
		answers_doctor_introduction_Given_Patient = new String[NUM];
		answers_doctor_portrait_Given_Patient = new String[NUM];
		answers_doctor_visit_fee_Given_Patient = new int[NUM]; 
		answers_doctor_changguan_Given_Patient = new String[NUM];
		
		//answers_doctor_department_id_Given_Patient = new int[NUM];
		//answers_doctor_changguan_id_Given_Patient = new int[NUM];

		conn = Connections.getConnection();
		//String sql = "select * from 04answer where question_id=" + question_id; 
		/*
		String sql = "select a.answer, a.doctor_id " +
				", ud.name, ud.department, ud.doctor_portrait, ud.introduction, sd.site_id" +
				" from 04answer a" +
				" left join 04user_doctor ud on a.doctor_id = ud.id " +
				" left join 04site_doctor sd on a.doctor_id = sd.doctor_id " +
				" where a.question_id = " + question_id;
		*/
		String sql = "select a.answer, a.doctor_id " +
			", ud.name, ud.department, ud.doctor_portrait, ud.introduction, ud.visit_fee, " +
			" sd.site_id " +
			" from 04answer a" +
			" left join 04user_doctor ud on a.doctor_id = ud.id " +
			" left join 04site_doctor sd on a.doctor_id = sd.doctor_id " +
			" where a.question_id = " + question_id;
		try {
			String tmp_name = null;
			String tmp_department_id = null;
			int tmp_changguan_id = 0;
			int index = 1;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			//System.out.println("setup:"+ "\n");
			DepartmentDao dd = new DepartmentDao();
			ChangGuanDao cgd = new ChangGuanDao();
			int pre = -1;
			while (rs.next()) {
				answers_Given_Patient[index] = rs.getString(1);
				answers_doctor_id_Given_Patient[index] = rs.getInt(2);
				
				tmp_name = rs.getString(3);
				
				if(null==tmp_name || tmp_name.equals("")){
					answers_doctor_name_Given_Patient[index] = "专家";
				}else{
					answers_doctor_name_Given_Patient[index] = tmp_name;
					//answers_doctor_name_Given_Patient[index] = rs.getString(3);
					tmp_department_id = rs.getString(4);
					if(null==tmp_department_id || tmp_department_id.equals("")){
						answers_doctor_department_Given_Patient[index] = null;
					}else{
						answers_doctor_department_Given_Patient[index] = dd.getDepartmentName(Integer.parseInt(tmp_department_id));
					}
					answers_doctor_portrait_Given_Patient[index] = rs.getString(5);
					answers_doctor_introduction_Given_Patient[index] = rs.getString(6);
					answers_doctor_visit_fee_Given_Patient[index] = rs.getInt(7);
					
					tmp_changguan_id  = rs.getInt(8);
					if(tmp_changguan_id==0){
						answers_doctor_changguan_Given_Patient[index] = null;
					}else{
						answers_doctor_changguan_Given_Patient[index] = cgd.getChangGuanName_by_id(tmp_changguan_id);
					}	
					
				}
				if(pre==answers_doctor_id_Given_Patient[index]){
					
				}
				else if(pre==-1||pre!=answers_doctor_id_Given_Patient[index]){
					pre = answers_doctor_id_Given_Patient[index];
					index++;
				}
				//index++;
			}
			num_Given_Patient = index-1;
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/*
	//根据weixinID查询id
	public int getID_By_WeixinID(String weixinID) throws SQLException {

		conn = Connections.getConnection();
		String sql = "select * from 04weixinMapUser where weixinID='" + weixinID + "'";
		int id= 0;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				id = rs.getInt("id");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	
	//根据weixinID查询userID
	public int getUserID_By_WeixinID(String weixinID) throws SQLException {

		conn = Connections.getConnection();
		String sql = "select * from 04weixinMapUser where weixinID='" + weixinID + "'";
		int id= 0;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				id = rs.getInt("userID");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	
	//根据weixinID查询role
	public int getRole_By_WeixinID(String weixinID) throws SQLException {

		conn = Connections.getConnection();
		String sql = "select * from 04weixinMapUser where weixinID='" + weixinID + "'";
		int role= 0;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				role = rs.getInt("role");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return role;
	}
	
	*/
	
	/*

	//用户修改用户信息
	public void modifyUser(int userID, String userPWD, String userTel) throws SQLException {
		
		conn = Connections.getConnection();
		String sql = null;
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 
		
		if(null==userPWD||userPWD.equals("")){
			sql = "update usercharts set userTel = '" + userTel + "'"
				+ " , updateDate = '" + ts + "'" + " where userID = " + userID ;
		}else{
			sql = "update usercharts set userPWD = '" + userPWD + "'"
			 	+ " , userTel = '" + userTel + "'" + " , updateDate = '" + ts + "'" 
			 	+ " where userID = " + userID ;
		}

		try {	
			stmt = conn.createStatement();
			stmt.execute(sql);
			
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//管理员修改用户信息
	public void modifyUserByAdmin(int userID, String userPWD, String userTel, int userGroup, int deleteUser) throws SQLException {
		
		conn = Connections.getConnection();
		String sql = null;
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 
		
		if(null==userPWD||userPWD.equals("")){
			sql = "update usercharts set userTel = '" + userTel + "'"
				+ " , userGroup = '" + userGroup + "'" + " , updateDate = '" + ts + "'"	
				+ " , deleteUser = '" + deleteUser + "'" + " where userID = " + userID ;
		}else{
			sql = "update usercharts set userPWD = '" + userPWD + "'"
				+ " , userTel = '" + userTel + "'" + " , userGroup = '" + userGroup + "'" 
				+ " , updateDate = '" + ts + "'" + " , deleteUser = '" + deleteUser + "'" 
				+ " where userID = " + userID ;
		}

		try {	
			stmt = conn.createStatement();
			stmt.execute(sql);
			
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//删除用户
	public void deleteUser(int userID) throws SQLException {
		
		conn = Connections.getConnection();
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 

		String sql = "update usercharts set updateDate = '" + ts + "'"
		+ " , deleteUser = '" + 1 + "'" + " where userID = " + userID ;

		try {	
			stmt = conn.createStatement();
			stmt.execute(sql);
			
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询用户信息
	public void getUserInfo(int userID) throws SQLException {

		conn = Connections.getConnection();
		String sql = "select * from usercharts where userID=" + userID;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				UserName = rs.getString("userName");
				UserTel = rs.getString("userTel");
				UserGroup = rs.getInt("userGroup");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//查询所有用户名
	public void getAllUserNames() throws SQLException {
		int NUM = 500;
		UserNames = new String[NUM];
		conn = Connections.getConnection();
		String sql = "select * from usercharts";
		//String userName= null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int index = 1;
			while (rs.next()) {
				UserNames[index] = rs.getString("userName");
				index++;
			}
			UserNum = index-1;
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询用户id(根据用户名)
	public int getUserID(String userName) throws SQLException {

		conn = Connections.getConnection();
		String sql = "select * from usercharts where userName = '" + userName + "'";
		int id= 0;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				id = rs.getInt("userID");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	
	
	//查询用户数量
	public int getUserNum() throws SQLException {
		int userNum = 0;
		conn = Connections.getConnection();
		String sql = "select * from usercharts";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				userNum++;
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userNum;
	}
	
	//查询用户是否禁用
	public int IsUserDel(int userID) throws SQLException {
		int flag = 0;
		conn = Connections.getConnection();
		String sql = "select * from usercharts where userID = " + userID;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				flag = rs.getInt("deleteUser");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	//查询用户是否为管理员
	public int IsUserAdmin(String userName) throws SQLException {
		int flag = 0;
		conn = Connections.getConnection();
		String sql = "select * from usercharts where userName = '" + userName + "'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				flag = rs.getInt("userGroup");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

*/
	
}
