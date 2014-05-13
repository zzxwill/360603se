package login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import database.Connections;

import security.PasswordUtil;

public class Validate {
	
	private Statement stmt = null;
	private ResultSet rs = null;
	private Connection conn = null;
	private PreparedStatement ps = null;
	
	public String message = null;

	
	//密码已加密验证：
	public boolean validate(int role, String userName, String userPWD) throws SQLException {
		boolean flag = false;
		conn = Connections.getConnection();
		String sql = null;
		if(role==0){//patient
			sql = "select * from 04user where name = '" + userName + "'" ;
		}else if(role==1){
			sql = "select * from 04user_doctor where name = '" + userName + "'" ;
		}
		 
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()){
				String md5 = rs.getString("password");
				PasswordUtil GP = new PasswordUtil();
				if(GP.verify(userPWD, md5)){
					flag = true;
				}
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	//密码未加密验证：
	/*
	public boolean validate(String userName, String userPWD) throws SQLException {
		boolean flag = false;
		conn = Connections.getConnection();
		//String sql = "select * from usercharts where userName = '" + userName + "'";
		 String sql = "select * from usercharts where userName = '" + userName + "'" 
		 	+ " and userPWD = '" + userPWD + "'" + " and deleteUser = '" + 0 + "'";
		 
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()){
				flag = true;
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
