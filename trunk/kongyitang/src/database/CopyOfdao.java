package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import database.Connections;

public class CopyOfdao {
	private Statement statement = null;
	private ResultSet rs = null;
	
	private int NUM = 1000;

	public String message = null;

	//饮料单价
	public double PRICE_OF_KUANGQUANSHUI = 0.0;
	public double PRICE_OF_HONGCHA = 0.0;
	public double PRICE_OF_LVCHA = 0.0;
	public double PRICE_OF_HONGNIU = 0.0;
	public double PRICE_OF_JIADUOBAO = 0.0;
	
	//饮料描述
	public String DE_OF_KUANGQUANSHUI = null;
	public String DE_OF_HONGCHA = null;
	public String DE_OF_LVCHA = null;
	public String DE_OF_HONGNIU = null;
	public String DE_OF_JIADUOBAO = null;
	
	//饮料信息
	public int drinkIds[];
	public String drinkNames[];
	public double drinkPrices[];
	public String descriptions[];
	public String imageNames[];
	public int drinkListNums[];
	public double drinkListPrices[];
	public String drinkUnits[];
	public int drinkNum = 0;
	
	//建筑信息
	public int buildingIds[];
	public String buildingNames[];
	public int buildingNum = 0;
	
	//订单信息
	public String orderList = null;
	public double total = 0.0;
	
	//所有订单信息
	public int orderIDs[];
	public int useIDs[];
	public String orderLists[];
	public Timestamp createTimes[];
	public int informeds[];
	public double totals[];
	public int orderListNums = 0;
	
	//指定用户今日所有已完成订单信息
	public int curOrderIDs[];
	public int curUseIDs[];
	public String curOrderLists[];
	public Timestamp curCreateTimes[];
	public String curDates[];
	public int curInformeds[];
	public double curTotals[];
	public int curOrderListNums = 0;
	
	//用户信息
	public int userID = 0;
	public String weixinID = null;
	public String nickname = null;
	public String telphone = null;
	public int buildingID = 0;
	public String roomNum = null;
	public int score = 0;
	//public Timestamp createTime;
	//public Timestamp editTime;
	//public String remark = null;
	
	//快递员信息
	public int expressID = 0;
	public String expressName = null;
	public String expressTel = null;
	public String expressEmail = null;

	//查询所有建筑信息
	public void getBuildingAll() throws SQLException {
		Connection conn = Connections.getConnection();
		statement = conn.createStatement();
		int index = 1;
		buildingIds = new int[NUM];
		buildingNames = new String[NUM];
		String sql = "select * from building";
		rs = statement.executeQuery(sql);
		try {
			while (rs.next()) {
				buildingIds[index] = rs.getInt(1);
				buildingNames[index] = rs.getString(2);
				index++;
			}
			buildingNum = index-1;
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//根据id查询建筑名字
	public String getBuildingName(int id) throws SQLException {
		String buildingName = null;
		Connection conn = Connections.getConnection();
		statement = conn.createStatement();
		String sql = "select * from building where buildingID=" + id;
		rs = statement.executeQuery(sql);
		try {
			if (rs.next()) {
				buildingName = rs.getString("buildingName");
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return buildingName;
	}
	
	//根据id查询单价
	public double getPrice(int id) throws SQLException {
		double price = 0.0;
		Connection conn = Connections.getConnection();
		statement = conn.createStatement();
		String sql = "select * from price where drinkID=" + id;
		rs = statement.executeQuery(sql);
		try {
			if (rs.next()) {
				price = rs.getDouble("drinkPrice");
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return price;
	}
	
	//根据id查询饮料描述
	public String getDecription(int id) throws SQLException {
		String decription = null;
		Connection conn = Connections.getConnection();
		statement = conn.createStatement();
		String sql = "select * from price where drinkID=" + id;
		rs = statement.executeQuery(sql);
		try {
			if (rs.next()) {
				decription = rs.getString("description");
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return decription;
	}
	
	//查询所有饮料信息
	public void getDrinkAll() throws SQLException {
		Connection conn = Connections.getConnection();
		statement = conn.createStatement();
		int index = 1;
		drinkIds = new int[NUM];
		drinkNames = new String[NUM];
		drinkPrices = new double[NUM];
		descriptions = new String[NUM];
		imageNames = new String[NUM];
		drinkListNums = new int[NUM];
		drinkListPrices = new double[NUM];
		drinkUnits = new String[NUM];
		String sql = "select * from price";
		rs = statement.executeQuery(sql);
		try {
			while (rs.next()) {
				drinkIds[index] = rs.getInt(1);
				drinkNames[index] = rs.getString(2);
				drinkPrices[index] = rs.getDouble(3);
				descriptions[index] = rs.getString(4);
				imageNames[index] = rs.getString(5);
				//drinkListNums[index] = 0;
				//drinkListPrices[index] = 0.0;
				drinkUnits[index] = rs.getString(6);
				index++;
				//System.out.println("\nPRICE_OF_KUANGQUANSHUI:" + PRICE_OF_KUANGQUANSHUI);
			}
			drinkNum = index-1;
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询所有饮料单价
	public void getPriceAll() throws SQLException {
		Connection conn = Connections.getConnection();
		statement = conn.createStatement();
		String sql = "select * from price";
		rs = statement.executeQuery(sql);
		try {
			if (rs.next()) {
				PRICE_OF_KUANGQUANSHUI = getPrice(1);
				PRICE_OF_HONGCHA = getPrice(2);
				PRICE_OF_LVCHA = getPrice(3);
				PRICE_OF_HONGNIU = getPrice(4);
				PRICE_OF_JIADUOBAO = getPrice(5);
				//System.out.println("\nPRICE_OF_KUANGQUANSHUI:" + PRICE_OF_KUANGQUANSHUI);
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询所有饮料描述
	public void getDecriptionAll() throws SQLException {
		Connection conn = Connections.getConnection();
		statement = conn.createStatement();
		String sql = "select * from price";
		rs = statement.executeQuery(sql);
		try {
			if (rs.next()) {
				DE_OF_KUANGQUANSHUI = getDecription(1);
				DE_OF_HONGCHA = getDecription(2);
				DE_OF_LVCHA = getDecription(3);
				DE_OF_HONGNIU = getDecription(4);
				DE_OF_JIADUOBAO = getDecription(5);
				//System.out.println("\nPRICE_OF_KUANGQUANSHUI:" + PRICE_OF_KUANGQUANSHUI);
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//新建订单信息
	public void insertOrder(String weixinID, String orderList, double total) {
		Connection conn = Connections.getConnection();

		String sql = "insert into orderlist values(?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			int orderID = generateID("orderlist");
			//System.out.println("\norderID:" + orderID);
			if (orderID == -1) {
				return;
			}
			ps.setInt(1, orderID);
			int userID = getUserID(weixinID);
			ps.setInt(2, userID);
			ps.setString(3, orderList);
			Timestamp ts = new Timestamp(System.currentTimeMillis());  
			//System.out.println("ts:" + ts + "\n");
			ps.setTimestamp(4, ts);
			Date currentTime = new Date();  
			DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String dateString = dateFormat.format(currentTime);
			ps.setString(5,dateString);
			ps.setInt(6, 0);
			ps.setDouble(7, total);

			ps.execute();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询指定用户今日所有已完成订单信息
	public void getCurOrderList(int ID) throws SQLException {
		Connection conn = Connections.getConnection();
		statement = conn.createStatement();
		int index = 1;
		
		curOrderIDs = new int[NUM];
		curUseIDs = new int[NUM];
		curOrderLists = new String[NUM];
		curCreateTimes = new Timestamp[NUM];
		curDates = new String[NUM];
		curInformeds = new int[NUM];
		curTotals = new double[NUM];
		//curOrderListNums = 0;
		Date currentTime = new Date();  
		DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = dateFormat.format(currentTime);
		
		String sql = "select * from orderlist where userID =" + ID + 
			" and date ='" + dateString + "'";
		rs = statement.executeQuery(sql);
		try {
			while (rs.next()) {
				curOrderIDs[index] = rs.getInt(1);
				curUseIDs[index] = rs.getInt(2);
				curOrderLists[index] = rs.getString(3);
				curCreateTimes[index] = rs.getTimestamp(4);
				//curDates[index] = rs.getString(5);
				curInformeds[index] = rs.getInt(6);
				curTotals[index] = rs.getDouble(7);
				index++;
			}
			curOrderListNums = index-1;
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//根据状态informed是否发送，查询所有订单信息
	public void getOrderListInformed(int informed) throws SQLException {
		Connection conn = Connections.getConnection();
		statement = conn.createStatement();
		int index = 1;
		orderIDs = new int[NUM];
		useIDs = new int[NUM];
		orderLists = new String[NUM];
		createTimes = new Timestamp[NUM];
		informeds = new int[NUM];
		totals = new double[NUM];
		String sql = "select * from orderlist where informed =" + informed;
		rs = statement.executeQuery(sql);
		try {
			while (rs.next()) {
				orderIDs[index] = rs.getInt(1);
				useIDs[index] = rs.getInt(2);
				orderLists[index] = rs.getString(3);
				//createTimes[index] = rs.getTimestamp(4);
				//informeds[index] = rs.getInt(6);
				totals[index] = rs.getDouble(7);
				index++;
			}
			orderListNums = index-1;
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//修改订单informed状态
	public void modifyOrderInformed(int orderID, int informed) throws SQLException {
		Connection conn = Connections.getConnection();
		statement = conn.createStatement();
		String sql = "update orderlist set informed =" + informed + " where orderID =" + orderID;
		
		//System.out.println("sql:" + sql +"\n");
		statement.execute(sql);
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//新建用户信息
	public void insertUserInfo(String weixinID, String nickname, String telephone, int buildingID, String roomNum) {
		Connection conn = Connections.getConnection();

		String sql = "insert into userinfo values(?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			int userID = generateID("userinfo");
			if (userID == -1) {
				return;
			}
			//System.out.println("\nuserID:" + userID);
			ps.setInt(1, userID);
			ps.setString(2, weixinID);
			ps.setString(3, nickname);
			ps.setString(4, telephone);
			ps.setInt(5, buildingID);
			ps.setString(6, roomNum);
			ps.setInt(7, 0);
			Timestamp ts = new Timestamp(System.currentTimeMillis());  
			ps.setTimestamp(8, ts);
			ps.setTimestamp(9, ts);
			ps.setString(10, "");

			ps.execute();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 判断用户是否已经存在。
	public boolean isExist(String weixinID) {
		boolean flag = false;
		Connection conn = Connections.getConnection();

		// String sql = "select * from users where weixinID='" + weixinID + "'";
		String sql = "select * from userinfo where weixinID=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, weixinID);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				flag = true;
			}
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	// 判断临时订单是否已经存在。
	public boolean isExistTmpOrder(String weixinID) {
		boolean flag = false;
		Connection conn = Connections.getConnection();

		// String sql = "select * from users where weixinID='" + weixinID + "'";
		String sql = "select * from tmporder where weixinID=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, weixinID);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				flag = true;
			}
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	//根据微信ID查询用户ID
	public int getUserID(String weixinID) throws SQLException {
		int userID = 0;
		Connection conn = Connections.getConnection();
		statement = conn.createStatement();
		String sql = "select * from userinfo where weixinID='" + weixinID + "'";
		rs = statement.executeQuery(sql);
		try {
			if (rs.next()) {
				userID = rs.getInt("userID");
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userID;
	}
	
	//修改用户信息
	public void modifyUserInfo(int userID, String telephone, int buildingID, String roomNum) throws SQLException {
		Connection conn = Connections.getConnection();
		statement = conn.createStatement();
		Timestamp ts = new Timestamp(System.currentTimeMillis());  
		String sql = "update userinfo set telephone = '" + telephone + "'"
			+ " , buildingID = '" + buildingID + "'" + " , roomNum = '" + roomNum + "'" 
			+ " , editTime = '" + ts + "'" + " where userID = " + userID;
		
		// System.out.println("sql:" + sql +"\n");
		statement.execute(sql);
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询用户积分
	public int getUserScore(int userID) throws SQLException {
		int score = 0;
		Connection conn = Connections.getConnection();
		statement = conn.createStatement();
		String sql = "select * from userinfo where userID=" + userID;
		rs = statement.executeQuery(sql);
		try {
			if (rs.next()) {
				score = rs.getInt("score");
			}
			//conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return score;
	}
	
	//修改用户积分
	public void modifyUserScoreInfo(int userID, int score) throws SQLException {
		Connection conn = Connections.getConnection();
		statement = conn.createStatement();
		int oldScore = 0;
		oldScore = getUserScore(userID);
		int newScore = oldScore + score;
		String sql = "update userinfo set score = " + newScore + " where userID = " + userID;
		// System.out.println("sql:" + sql +"\n");
		statement.execute(sql);
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//根据微信号查询指定用户信息
	public void getUserInfoAll(String WXID) throws SQLException {
		Connection conn = Connections.getConnection();
		statement = conn.createStatement();
		String sql = "select * from userinfo where weixinID = '" + WXID + "'";
		rs = statement.executeQuery(sql);
		try {
			if (rs.next()) {
				userID = rs.getInt(1);
				weixinID = rs.getString(2);
				nickname = rs.getString(3);
				telphone = rs.getString(4);
				buildingID = rs.getInt(5);
				roomNum = rs.getString(6);
				score = rs.getInt(7);
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//根据用户ID查询指定用户信息
	public void getUserInfoAll(int userID) throws SQLException {
		Connection conn = Connections.getConnection();
		statement = conn.createStatement();
		String sql = "select * from userinfo where userID =" + userID;
		rs = statement.executeQuery(sql);
		try {
			if (rs.next()) {
				//userID = rs.getInt(1);
				weixinID = rs.getString(2);
				nickname = rs.getString(3);
				telphone = rs.getString(4);
				buildingID = rs.getInt(5);
				roomNum = rs.getString(6);
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//新建临时订单信息
	public void insertTmpOrder(String weixinID, String orderList, double total) {
		Connection conn = Connections.getConnection();

		String sql = "insert into tmporder values(?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			int orderID = generateID("tmporder");
			if (orderID == -1) {
				return;
			}
			//System.out.println("\nuserID:" + userID);
			ps.setInt(1, orderID);
			ps.setString(2, weixinID);
			ps.setString(3, orderList);
			Timestamp ts = new Timestamp(System.currentTimeMillis());  
			//System.out.println("ts:" + ts + "\n");
			ps.setTimestamp(4, ts);
			ps.setDouble(5, total);
			//System.out.println("ps2:" + ps + "\n");
			ps.execute();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//根据微信ID查询临时订单ID
	public int getTmpOrderID(String weixinID) throws SQLException {
		int orderID = 0;
		Connection conn = Connections.getConnection();
		statement = conn.createStatement();
		String sql = "select * from tmporder where weixinID='" + weixinID + "'";
		rs = statement.executeQuery(sql);
		try {
			while (rs.next()) {
				orderID = rs.getInt("orderID");
				//System.out.println("ID:" + orderID + "\n");
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orderID;
	}
	
	//修改临时订单信息
	public void modifyTmpOrder(int orderID, String orderList, double total) throws SQLException {
		Connection conn = Connections.getConnection();
		statement = conn.createStatement();
		Timestamp ts = new Timestamp(System.currentTimeMillis()); 
		
		String sql = "update tmporder set orderList = '" + orderList + "'"
			+ " , total = '" + total + "'" + " where orderID = " + orderID;
		
		// System.out.println("sql:" + sql +"\n");
		statement.execute(sql);
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//根据id查询临时订单信息
	public void getTmpOrder(int id) throws SQLException {
		Connection conn = Connections.getConnection();
		statement = conn.createStatement();
		String sql = "select * from tmporder where orderID=" + id;
		rs = statement.executeQuery(sql);
		try {
			if (rs.next()) {
				orderList = rs.getString("orderList");
				total = rs.getDouble("total");
				//System.out.println("****orderList:" + orderList + "\n");
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//删除临时订单信息
	public void deleteTmpOrder(String weixinID) throws SQLException{
		Connection conn = Connections.getConnection();
		statement = conn.createStatement();
		// String sql = "select * from users where userID=" + id;
		String sql = "delete from tmporder where weixinID = '" + weixinID + "'";
		statement.execute(sql);
		try {
			//System.out.println("删除微信号为：" + weixinID + "的临时订单成功！\n");
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//查询指定快递员信息
	public void getExpressInfo(int id) throws SQLException {
		Connection conn = Connections.getConnection();
		statement = conn.createStatement();
		String sql = "select * from expressinfo where expressID = '" + id + "'";
		rs = statement.executeQuery(sql);
		try {
			if (rs.next()) {
				expressID = rs.getInt(1);
				expressName = rs.getString(2);
				expressTel = rs.getString(3);
				expressEmail = rs.getString(4);
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
/*
	// 删除用户
	public void deleteUser(int id) throws SQLException{
		Connection conn = connection.getConnection();
		statement = conn.createStatement();
		// String sql = "select * from users where userID=" + id;
		String sql = "delete from users where userID = '" + id + "'";
		statement.execute(sql);
		try {
			System.out.println("删除成功！！");
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

*/

	// 生成下一个用户的ID。下一个用户的ID值=数据库中已有的最大ID值+1
	public int generateID(String flag) {
		int id = -1;
		String sql = null;
		Connection conn = Connections.getConnection();
		if(flag.equals("userinfo")){
			sql = "select max(userID) as userID from userinfo";
		}
		else if(flag.equals("orderlist")){
			sql = "select max(orderID) as orderID from orderlist";
		}
		else if(flag.equals("tmporder")){
			sql = "select max(orderID) as orderID from tmporder";
		}
			
		//System.out.println(sql);
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			//System.out.println(rs);
			if (rs.next()) {
				if(flag.equals("userinfo")){
					id = rs.getInt("userID");
				}
				else if(flag.equals("orderlist")){
					id = rs.getInt("orderID");
				}
				else if(flag.equals("tmporder")){
					id = rs.getInt("orderID");
				}
				id++;
			}
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}

	// 判断字符串的编码
	public static String getEncoding(String str) {
		String encode = "GB2312";
		try {
			if (str.equals(new String(str.getBytes(encode), encode))) {
				String s = encode;
				//System.out.println(encode);
				return s;
			}
		} catch (Exception exception) {
		}
		encode = "ISO-8859-1";
		try {
			if (str.equals(new String(str.getBytes(encode), encode))) {
				String s1 = encode;
				//System.out.println(encode);
				return s1;
			}
		} catch (Exception exception1) {
		}
		encode = "UTF-8";
		try {
			if (str.equals(new String(str.getBytes(encode), encode))) {
				String s2 = encode;
				//System.out.println(encode);
				return s2;
			}
		} catch (Exception exception2) {
		}
		encode = "GBK";
		try {
			if (str.equals(new String(str.getBytes(encode), encode))) {
				String s3 = encode;
				//System.out.println(encode);
				return s3;
			}
		} catch (Exception exception3) {
		}
		return "";
	}

}

