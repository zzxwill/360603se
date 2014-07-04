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
	public synchronized void insertUser_Doctor(String userName, int userGender,String department, String userTel, String title, 
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
	public synchronized void  insertUser_Doctor(String userName, int userGender, String userTel, String title, 
			String master, String certified_type, String doctor_portrait,String introduction, 
			int[] site_id, int chuzhen_fee, int fuzhen_fee, int texu_fee, int[] department_id) {
		
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
			//String department
			int visti_fee = chuzhen_fee;
			String department_string = department_id[0] + "";
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
			ps.setString(12, department_string);//只存第一个部门科室
			ps.setString(13, master);
			ps.setInt(14, 1);//auth_submit
			
			PasswordUtil GP = new PasswordUtil();
	    	String pw = userTel;
			pw = GP.generatePassword(pw);
			
			ps.setString(15, pw);
			ps.setInt(16, 1); //validate_flag
			ps.setString(17, "");
			ps.setString(18, doctor_portrait);
			ps.setInt(19, visti_fee);//visti_fee，只存出诊费
			ps.setString(20, introduction);//introduction
			ps.setInt(21, 1);//belong_outpatient_department
			Timestamp ts = new Timestamp(System.currentTimeMillis());  
			ps.setTimestamp(22, ts);
			ps.setTimestamp(23, ts);
			
			ps.execute();
			System.out.println("doctor insert success!");
			
			System.out.println("site_id.length: " + site_id.length + "\n");
			for(int i=1;i<=site_id.length;i++){
				insert_site_doctor(site_id[i],id);
			}
			
			System.out.println("department.length: " + department_id.length + "\n");
			for(int i=1;i<=department_id.length;i++){
				insert_department_doctor(department_id[i],id);
			}
			
			insert_fee_doctor(id, chuzhen_fee, fuzhen_fee, texu_fee);
			
			ps.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//新建医生用户-场馆
	public synchronized void insert_site_doctor(int site_id,int doctor_id) {
		
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
	
	//新建医生用户-科室部门
	public synchronized void insert_department_doctor(int department_id,int doctor_id) {
		
		conn = Connections.getConnection();
		Tools tool = new Tools();

		String sql = "insert into 04department_doctor values(?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			int id = tool.generateID("04department_doctor");
			if (id == -1) {
				return;
			}
			ps.setInt(1, id);
			ps.setInt(2, doctor_id);
			ps.setInt(3, department_id);
			ps.setInt(4, 1);
			
			ps.execute();
			
			System.out.println("04department_doctor insert success!");
			ps.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//新建医生用户-费用
	public synchronized void insert_fee_doctor(int doctor_id, int chuzhen_fee, int fuzhen_fee, int texu_fee) {
		
		conn = Connections.getConnection();
		Tools tool = new Tools();

		String sql = "insert into 04fee_doctor values(?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			int id = tool.generateID("04fee_doctor");
			if (id == -1) {
				return;
			}
			ps.setInt(1, id);
			ps.setInt(2, doctor_id);
			ps.setInt(3, chuzhen_fee);
			ps.setInt(4, fuzhen_fee);
			ps.setInt(5, texu_fee);
			ps.setInt(6, 1);
			
			ps.execute();
			
			System.out.println("04fee_doctor insert success!");
			ps.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
