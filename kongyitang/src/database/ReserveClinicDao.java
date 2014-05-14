package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import database.Connections;
import tools.Tools;
//import security.PasswordUtil;

public class ReserveClinicDao {

	private Statement stmt = null;
	private ResultSet rs = null;
	private Connection conn = null;
	private PreparedStatement ps = null;
	
	public String UserName = null;
	public String UserTel = null;
	public int UserGroup = 0;
	
	public int UserNum = 0;
	public String UserNames[];
	
	// 用于切换开发和部署的配置
	String table_prefix = "";
	
	
	//医生信息  Will Zhou  5/13/2014
	public int department_num;
	public int  department_id[];	
	public String  department[];
	
	public int doctor_num;
	public int  doctor_id[];
	public String  name[];
	public String  title[];
	
	private int NUM = 1000;
	

	
	/**
	 * @function: 获取科室
	 * @author:   Will Zhou
	 * @date:     May 13, 2014 10:37:40 PM 
	 */
	public void retrive_deparment() throws SQLException {

		conn = connection.getConnection();
		//String sql = "SELECT d.name as department  ,u.name, u.title FROM " + table_prefix + "`department` d, " + table_prefix + "user_doctor u  WHERE d.id= u.department";
		String sql = "SELECT id as department_id, name as department FROM " + table_prefix + "`department` ";

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int index = 0;
			department = new String[NUM];
			department_id = new int[NUM];
			while (rs.next()) {
				department_id[index] = rs.getInt(1);
				department[index] = rs.getString(2);
				//name[index] = rs.getString(2);
				//title[index] = rs.getString(3);
				
				index++;
				
			}
			department_num = index;
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	//
	public void retrive_doctors_by_deparment(int department_id) throws SQLException {

		conn = connection.getConnection();
		String sql = "SELECT u.id as doctor_id ,u.name, u.title FROM  " + table_prefix + "user_doctor u  WHERE u.department = " + department_id;

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int index = 0;
			doctor_id = new int[NUM];
			name = new String[NUM];
			title = new String[NUM];
			
			
			while (rs.next()) {
				//department[index] = rs.getString(1);
				doctor_id[index] =rs.getInt(1);
				name[index] = rs.getString(2);
				title[index] = rs.getString(3);
				
				index++;
				
			}
			doctor_num = index;
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	
	
}
