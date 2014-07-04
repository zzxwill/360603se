package database;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.*;
import java.net.URL;

import database.Connections;
//import security.PasswordUtil;


public class UserDao {
	
	int NUM = 1000;

	private Statement stmt = null;
	private ResultSet rs = null;
	private ResultSet rs2 = null;
	private Connection conn = null;
	private PreparedStatement ps = null;
	
	public String UserName = null;
	public String UserTel = null;
	public int UserGroup = 0;
	public int DeleteUser = 0;
	
	public int UserNum = 0;
	public String UserNames[];
	
	public int UserNum_ChangGuan = 0;
	public int UserIDs_ChangGuan[];
	public String UserNames_ChangGuan[];
	public String UserTels_ChangGuan[];
	public int UserGroups_ChangGuan[];
	public int DeleteUsers_ChangGuan[];
	
	public int UserID_Common;
	public String UserName_Common;
	public String UserTel_Common;
	public int UserGroup_Common;
	public int DeleteUser_Common;
	
	String table_prefix = "04";
	
	
	//医生信息  Will Zhou  5/13/2014
	public ArrayList<Integer> doctor_id = new ArrayList<Integer>();
	public ArrayList<String> doctor_name = new ArrayList<String>();
	public ArrayList<String> doctor_gender = new ArrayList<String>();
	public ArrayList<Integer> doctor_age = new ArrayList<Integer>();
	public ArrayList<String> doctor_mobile = new ArrayList<String>();
	public ArrayList<String> doctor_master = new ArrayList<String>();
	public ArrayList<String> doctor_doctor_criteria = new ArrayList<String>();
	public ArrayList<String> doctor_department = new ArrayList<String>();
	public ArrayList<String> doctor_title = new ArrayList<String>();
	public ArrayList<String> doctor_validate_flag = new ArrayList<String>();
	public ArrayList<Long> site_id = new ArrayList<Long>();
	public ArrayList<String> site_name = new ArrayList<String>();
	
	
	
	
	//医生证件照、头像
	public ArrayList<String> doctor_criteria_photo = new ArrayList<String>();
	public ArrayList<String> doctor_portrait = new ArrayList<String>();

	
	
	
		
		
	
	/**
	 * @function: 展示医生列表 
	 * @author:   Will Zhou
	 * @date:     11:09:54 PM
	 */
	public void retrive_doctors(String user_role) throws SQLException {
		//request.setCharacterEncoding("utf-8");
	    //String checkedName = (String)session.getAttribute("loginedUserName");
		
		int GROUP_INTERVAL = 100;
		int site_id = 0;
		site_id = Integer.parseInt(user_role);
		
		conn = Connections.getConnection();
		
		//String sql = "SELECT d.id, `name`, (case when `gender`=0  then '男' else '女' end) as gender, `age`,  `mobile`, `master`, `doctor_criteria`, `department`, `title`,  (case when validate_flag=0  then '否' else '是' end) as validate_flag , `doctor_criteria_photo`, `doctor_portrait`  FROM `04user_doctor` d  ";
		String sql = "SELECT d.id, `name`, (case when `gender`=0  then '男' else '女' end) as gender, `age`,  `mobile`, `master`, `doctor_criteria`, `department`, `title`,  (case when validate_flag=0  then '否' else '是' end) as validate_flag , `doctor_criteria_photo`, `doctor_portrait` , GROUP_CONCAT(sd.site_name) FROM `04user_doctor` d left join (select s.id, s.name as site_name,doctor_id from 04site_doctor left join 04site s on site_id = s.id ) sd on d.id = sd.doctor_id group by d.id ";
		
		if(site_id > GROUP_INTERVAL){
			site_id = site_id - GROUP_INTERVAL;
			//sql += ",04site_doctor s where s.site_id = " + site_id +" and s.doctor_id = d.id";
			sql = "SELECT d.id, `name`, (case when `gender`=0 then '男' else '女' end) as gender, `age`, `mobile`, `master`, `doctor_criteria`, `department`, `title`, (case when validate_flag=0 then '否' else '是' end) as validate_flag , `doctor_criteria_photo`, `doctor_portrait` , sd.site_name FROM `04user_doctor` d left join (select s.id, s.name as site_name,doctor_id from 04site_doctor left join 04site s on site_id = s.id ) sd on d.id = sd.doctor_id where sd.id =" + site_id;
		}
		
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);	
			
			while (rs.next()) {
				//department[index] = rs.getString(1);
				doctor_id.add(rs.getInt(1));
				doctor_name.add(rs.getString(2));
				doctor_gender.add(rs.getString(3));
				doctor_age.add(rs.getInt(4));
				doctor_mobile.add(rs.getString(5));
				doctor_master.add(rs.getString(6));
				doctor_doctor_criteria.add(rs.getString(7));
				
				doctor_department.add(rs.getString(8));
				
				doctor_title.add(rs.getString(9));
				doctor_validate_flag.add(rs.getString(10));
				//医生证件照、头像
				doctor_criteria_photo.add(rs.getString(11));
				doctor_portrait.add(rs.getString(12));
				site_name.add(rs.getString(13));
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	
	public void retrive_patients() throws SQLException {

		conn = Connections.getConnection();
		String sql = "SELECT `id`, `name`, (case when `gender`=0  then '男' else '女' end) as gender, `age`,  `mobile` FROM `04user`  ";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);	
			while (rs.next()) {
				//department[index] = rs.getString(1);
				doctor_id.add(rs.getInt(1));
				doctor_name.add(rs.getString(2));
				doctor_gender.add(rs.getString(3));
				doctor_age.add(rs.getInt(4));
				doctor_mobile.add(rs.getString(5));
			
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	

	//审核医生  Will 6/8/2014
		public void approve_doctor(HashMap hm,int flag) throws SQLException {
			long dcotor_id = (Long) hm.get("doctor_id");
			
			
			conn = Connections.getConnection();
			String sql = "update `04user_doctor` set validate_flag = '"+ flag + "' where id = " + dcotor_id;
			
			
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
		
		
		/**
		 * @function: 给医生分配场馆
		 * @author:   Will Zhou
		 * @date:     Jun 16, 2014 11:59:58 AM 
		 */
	public void assign_site_for_doctor(HashMap hm) throws SQLException {
		long dcotor_id = (Long) hm.get("doctor_id");
		String site_list = (String) hm.get("site_list");
		String site_id_list[] = site_list.split(";");
		
		String sql = "delete FROM `04site_doctor` WHERE doctor_id ="
				+ dcotor_id;
		// sql = "SELECT id FROM `04outpatient_info` WHERE day ='" +
		// day_list[i] + "' and ampm = '" + ampm_list[i] + "' and time ='"+
		// time_list[i] + "'";
		conn = Connections.getConnection();
		stmt = conn.createStatement();
		stmt.execute(sql);
		

		for (int i = 0; (i < site_id_list.length)&&(site_id_list[i]!=null); i++) {

			//long site_doctor_id = 0;
			
		
				sql = "INSERT INTO `04site_doctor`(`site_id`, `doctor_id`) VALUES ("
						+ site_id_list[i] + "," + dcotor_id + ")";
				stmt.execute(sql);

			
				/*
				 * sql = "select max(id) as id  from 04outpatient_info"; stmt =
				 * conn.createStatement(); rs2 = stmt.executeQuery(sql);
				 * if(rs2.next()){ site_doctor_id = rs2.getLong("id"); }
				 */
			
/*
			sql = "update `04site_doctor` set site_id=" + site_id
					+ " where id=" + site_doctor_id;
			stmt = conn.createStatement();
			stmt.execute(sql);*/
		}

		stmt.close();
		conn.close();

	}
		
	
	
	
	//新建用户
	public void insertUser(String userName, String userPWD, String userTel, int userGroup) {
		
		conn = Connections.getConnection();
		Tools tool = new Tools();

		String sql = "insert into usercharts values(?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			int userID = tool.generateID("usercharts");
			if (userID == -1) {
				return;
			}
			ps.setInt(1, userID);
			ps.setString(2, userName);
			ps.setString(3, userPWD);
			ps.setString(4, userTel);
			ps.setInt(5, userGroup);
			Timestamp ts = new Timestamp(System.currentTimeMillis());  
			ps.setTimestamp(6, ts);
			ps.setTimestamp(7, ts);
			ps.setInt(8, 0);

			ps.execute();
			
			ps.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//新建调理师用户
	public void insertTiaoLiShiUser(String userName, int changguan_id, String userTel, String introduction) {
		
		conn = Connections.getConnection();
		Tools tool = new Tools();
		//System.out.println(name + "," + changguan_id + "," + userTel + ","  + introduction );
		String sql = "insert into 04tiaolishi values(?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			int id = tool.generateID("04tiaolishi");
			if (id == -1) {
				return;
			}
			ps.setInt(1, id);
			ps.setString(2, userName);
			ps.setString(3, userName);
			ps.setInt(4, changguan_id);
			ps.setString(5, userTel);
			ps.setString(6, introduction);
			Timestamp ts = new Timestamp(System.currentTimeMillis());  
			ps.setTimestamp(7, ts);
			ps.setTimestamp(8, ts);
			ps.setInt(9, 0);
			
			System.out.println("insert Tiaolioshi : " + userName + "\n");
			
			ps.execute();
			
			ps.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//删除调理师用户
	public void deleteTiaoLiShiUser(String userName) throws SQLException {
		
		conn = Connections.getConnection();
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 

		String sql = "update 04tiaolishi set updateDate = '" + ts + "'"
		+ " , delete_tiaolishi = '" + 1 + "'" + " where userName = '" + userName + "'";

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
	
	//管理员修改调理师用户信息
	public void modifyTiaoLiShiUserByAdmin(String userName, int changguan_id, String userTel, int delete_tiaolishi) throws SQLException {
		
		conn = Connections.getConnection();
		String sql = null;
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 
		
		sql = "update 04tiaolishi set userTel = '" + userTel + "'"
			+ " , changguan_id = '" + changguan_id + "'" + " , updateDate = '" + ts + "'"	
			+ " , delete_tiaolishi = '" + delete_tiaolishi + "'" + " where userName = '" + userName + "'" ;

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
		String sql = "select * from usercharts where userID ='" + userID + "'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				UserName = rs.getString("userName");
				UserTel = rs.getString("userTel");
				UserGroup = rs.getInt("userGroup");
				DeleteUser = rs.getInt("deleteUser");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询用户名
	public String getUserName(int userID) throws SQLException {

		conn = Connections.getConnection();
		String sql = "select * from usercharts where userID=" + userID;
		String userName= null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				userName = rs.getString("userName");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userName;
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
	
	//查询指定场馆用户信息
	public void getChangGuanUserInfo(int changguan_id) throws SQLException {
		
		int GROUP_INTERVAL = 100;

		UserIDs_ChangGuan = new int[NUM];
		UserNames_ChangGuan = new String[NUM];
		UserTels_ChangGuan = new String[NUM];
		UserGroups_ChangGuan = new int[NUM];;
		DeleteUsers_ChangGuan = new int[NUM];

		int userGroup = 0;
		
		conn = Connections.getConnection();
		String sql = "select * from usercharts where userGroup >= '" + 2*GROUP_INTERVAL + "'";
		try {
			int index = 1;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				userGroup = rs.getInt("userGroup");
				if(userGroup%GROUP_INTERVAL==changguan_id){
					UserIDs_ChangGuan[index] = rs.getInt("userID");
					UserNames_ChangGuan[index] = rs.getString("userName");
					UserTels_ChangGuan[index] = rs.getString("userTel");
					UserNames_ChangGuan[index] = rs.getString("userName");
					UserGroups_ChangGuan[index] = rs.getInt("userGroup");
					DeleteUsers_ChangGuan[index] = rs.getInt("deleteUser");
					index++;
				}
			}
			UserNum_ChangGuan = index-1;
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询指定客服用户信息
	public void getCommonUserInfo(String userName) throws SQLException {
		
		conn = Connections.getConnection();
		String sql = "select * from usercharts where userName = '" + userName + "'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				UserID_Common = rs.getInt("userID");
				UserName_Common = rs.getString("userName");
				UserTel_Common = rs.getString("userTel");
				UserName_Common = rs.getString("userName");
				UserGroup_Common = rs.getInt("userGroup");
				DeleteUser_Common = rs.getInt("deleteUser");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
	
	//查询用户角色
		public int check_user_role(String userName) throws SQLException {
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
		
		//查询用户角色
		public int check_user_role(int userID) throws SQLException {
			int flag = 0;
			conn = Connections.getConnection();
			String sql = "select * from usercharts where userID = '" + userID + "'";
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

}
