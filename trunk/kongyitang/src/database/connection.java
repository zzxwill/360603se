package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 
public class connection {
 
    public static Connection getConnection(){
        Connection conn = null;
        try {
        	
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/confuciusmedicine?characterEncoding=utf8","root","");
            //conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/zzxwill_kongyitang?characterEncoding=utf8","zzxwill_kyt","d8nCfMeX");
            
        } catch (InstantiationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
         
        return conn;
         
    }
}