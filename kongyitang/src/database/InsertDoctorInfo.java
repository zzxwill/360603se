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
import security.PasswordUtil;

public class InsertDoctorInfo {

	private Statement stmt = null;
	private ResultSet rs = null;
	private Connection conn = null;
	private PreparedStatement ps = null;
	
	
	//新建医生用户
	public void insertUser_Doctor(String userName, int userGender,String department, String userTel, String title, 
			String master, String certified_type, String doctor_portrait,int visti_fee,String introduction, 
			int site_id) {
		
		conn = Connections.getConnection();
		Tools tool = new Tools();

		String sql = "insert into 04user_doctor values(" +
				"?,?,?,?,?," +
				"?,?,?,?,?," +
				"?,?,?,?,?," +
				"?,?,?,?,?," +
				"?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			int id = tool.generateID("04user_doctor");
			if (id == -1) {
				return;
			}
			ps.setInt(1, id);
			ps.setString(2, userName);
			ps.setInt(3, userGender);
			ps.setInt(4, 0);
			ps.setInt(5, 1);
			ps.setString(6, userTel);
			ps.setString(7, "");
			ps.setString(8, "");
			ps.setString(9, certified_type);
			ps.setString(10, title);
			ps.setString(11, "");
			ps.setString(12, department);
			ps.setString(13, master);
			ps.setInt(14, 1);//auth_submit
			
			PasswordUtil GP = new PasswordUtil();
	    	String pw = userTel;
			pw = GP.generatePassword(pw);
			
			ps.setString(15, pw);
			ps.setInt(16, 1); //validate_flag
			ps.setString(17, "");
			ps.setString(18, doctor_portrait);
			ps.setInt(19, visti_fee);//visti_fee
			ps.setString(20, introduction);//introduction
			ps.setInt(21, 1);//belong_outpatient_department
			Timestamp ts = new Timestamp(System.currentTimeMillis());  
			ps.setTimestamp(22, ts);
			ps.setTimestamp(23, ts);
			
			ps.execute();
			System.out.println("doctor insert success!");
			insert_site_doctor(site_id,id);
			ps.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//新建医生用户
	public void insert_site_doctor(int site_id,int doctor_id) {
		
		conn = Connections.getConnection();
		Tools tool = new Tools();

		String sql = "insert into 04site_doctor values(?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			int id = tool.generateID("04site_doctor");
			if (id == -1) {
				return;
			}
			ps.setInt(1, id);
			ps.setInt(2, site_id);
			ps.setString(3, "");
			ps.setInt(4, doctor_id);
			ps.setInt(5, 1);
			
			ps.execute();
			
			System.out.println("04site_doctor insert success!");
			ps.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
