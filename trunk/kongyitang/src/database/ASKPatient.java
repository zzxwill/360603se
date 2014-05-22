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

public class ASKPatient {
	
	int NUM = 1000;

	private Statement stmt = null;
	private ResultSet rs = null;
	private Connection conn = null;
	private PreparedStatement ps = null;
	
	public int id = 0;
	public int userID = 0;
	public String content = null;
	public String picture_path = null;
	public int department = 0;
	public int answered_flag = 0;
	public Timestamp createDate = null;
	
	public int ids[];
	public int userIDs[];
	public String contents[];
	public String picture_paths[];
	public int departments[];
	public int answered_flags[]; 
	public Timestamp createDates[];
	public int num = 0;
	
	//查询指定用户所有问题
	public int ids_Given[];
	//public int userIDs[];
	public String contents_Given[];
	public String picture_paths_Given[];
	public int departments_Given[];
	public int answered_flags_Given[]; 
	public Timestamp createDates_Given[];
	public int num_Given = 0;
	
	//查询指定条件的所有问题
	public int ids_Condition[];
	//public int userIDs_Condition[];
	public String contents_Condition[];
	public String picture_paths_Condition[];
	public int departments_Condition[];
	public int answered_flags_Condition[]; 
	public Timestamp createDates_Condition[];
	public int num_Condition = 0;
	
	
	//新建问题
	public void insertQuestion(int userID, String content, String picture_path, int department, int gender, int age, String mobile) {
		
		conn = Connections.getConnection();
		Tools tool = new Tools();

		String sql = "insert into 04question values(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			int id = tool.generateID("04question");
			if (id == -1) {
				return;
			}
			ps.setInt(1, id);
			ps.setInt(2, userID);
			ps.setString(3, content);
			ps.setString(4, picture_path);
			ps.setInt(5, department);
			ps.setInt(6, gender);
			ps.setInt(7, age);
			ps.setString(8, mobile);
			ps.setInt(9, 0);
			Timestamp ts = new Timestamp(System.currentTimeMillis());  
			ps.setTimestamp(10, ts);
			ps.setTimestamp(11, ts);

			ps.execute();
			
			ps.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//修改问题回答标志
	public void modifyQuestion(int id) throws SQLException {
		
		conn = Connections.getConnection();
		String sql = null;
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 

		sql = "update 04question set answered_flag = '" + 1 + "'"
		 	+ " , updateDate = '" + ts + "'" 
		 	+ " where id = " + id ;

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
	
	//修改问题所属科室
	public void modifyQuestionDepartment(int id, int department) throws SQLException {
		
		conn = Connections.getConnection();
		String sql = null;
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 

		sql = "update 04question set department = '" + department + "'"
		 	+ " , updateDate = '" + ts + "'" 
		 	+ " where id = " + id ;

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
	
	//查询问题数量
	public int getQuestionNum() throws SQLException {
		int questionNum = 0;
		conn = Connections.getConnection();
		String sql = "select * from 04question";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				questionNum++;
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return questionNum;
	}
	
	//查询具体问题信息
	public void getQuestionInfo(int id) throws SQLException {

		conn = Connections.getConnection();
		String sql = "select * from 04question where id=" + id;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				
				userID = rs.getInt("userID");
				content = rs.getString("content");
				picture_path = rs.getString("picture_path");
				department = rs.getInt("department");
				answered_flag = rs.getInt("answered_flag");
				createDate = rs.getTimestamp("createDate");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询所有问题
	public void getAllQuestionInfos() throws SQLException {

		ids = new int[NUM];
		userIDs = new int[NUM];
		contents = new String[NUM];
		picture_paths = new String[NUM];
		departments = new int[NUM];
		answered_flags = new int[NUM];
		createDates = new Timestamp[NUM];

		conn = Connections.getConnection();
		String sql = "select * from 04question";
		//String userName= null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int index = 1;
			while (rs.next()) {
				ids[index] = rs.getInt("id");
				userIDs[index] = rs.getInt("userID");
				contents[index] = rs.getString("content");
				picture_paths[index] = rs.getString("picture_path");
				departments[index] = rs.getInt("department");
				answered_flags[index] = rs.getInt("answered_flag");
				createDates[index] = rs.getTimestamp("createDate");
				index++;
			}
			num = index-1;
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询指定用户所有问题
	public void getAllQuestionInfos_Given(int userID) throws SQLException {

		ids_Given = new int[NUM];
		contents_Given = new String[NUM];
		picture_paths_Given = new String[NUM];
		departments_Given = new int[NUM];
		answered_flags_Given = new int[NUM];
		createDates_Given = new Timestamp[NUM];

		conn = Connections.getConnection();
		String sql = "select * from 04question where userID= '" + userID + "'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int index = 1;
			while (rs.next()) {
				ids_Given[index] = rs.getInt("id");
				//userIDs[index] = rs.getInt("userID");
				contents_Given[index] = rs.getString("content");
				picture_paths_Given[index] = rs.getString("picture_path");
				departments_Given[index] = rs.getInt("department");
				answered_flags_Given[index] = rs.getInt("answered_flag");
				createDates_Given[index] = rs.getTimestamp("createDate");
				index++;
			}
			num_Given = index-1;
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询指定条件的所有问题
	public void getAllQuestionInfos_Condition(int answered_flag, int department) throws SQLException {

		ids_Condition = new int[NUM];
		contents_Condition = new String[NUM];
		picture_paths_Condition = new String[NUM];
		departments_Condition = new int[NUM];
		answered_flags_Condition = new int[NUM];
		createDates_Condition = new Timestamp[NUM];

		conn = Connections.getConnection();
		String sql = null;
		if((answered_flag==-1)&&(department==0)){//无任何限制
			sql = "select * from 04question";
		}else if((answered_flag==-1)&&(department>0)){//无回答标志限制，且，搜索相关部分部门
			sql = "select * from 04question where department= '" + department + "'";
		}else if((answered_flag>-1)&&(department==0)){//搜索相关回答，且，无部门限制
			sql = "select * from 04question where answered_flag= '" + answered_flag + "'";
		}else if((answered_flag>-1)&&(department>0)){//搜索相关回答，且，搜索相关部分部门
			sql = "select * from 04question where answered_flag= '" + answered_flag + "'"
				+ " and department = '" + department + "'";
		}
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int index = 1;
			while (rs.next()) {
				ids_Condition[index] = rs.getInt("id");
				//userIDs_Condition[index] = rs.getInt("userID");
				contents_Condition[index] = rs.getString("content");
				picture_paths_Condition[index] = rs.getString("picture_path");
				departments_Condition[index] = rs.getInt("department");
				answered_flags_Condition[index] = rs.getInt("answered_flag");
				createDates_Condition[index] = rs.getTimestamp("createDate");
				index++;
			}
			num_Condition = index-1;
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
