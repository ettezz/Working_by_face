package Models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class US001Model {
	
	public US001Model(){
		
	}
	
	public User getUS001_Users(String userId, String passwd) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		User userModel = null;
	    try {
	      String url = "jdbc:mysql://localhost:3306/fp";
	      String user = "root";
	      String password = "ckj0508";
	      String driver = "com.mysql.cj.jdbc.Driver";
	      Class.forName(driver);
	      con = DriverManager.getConnection(url, user, password);
	      String sql = "SELECT USER_ID, USER_NAME, PHONE, ADDRESS, ROLE_TYPE FROM FP_USERS WHERE USER_ID = ? AND PASSWD = ? ";
	      stmt = con.prepareStatement(sql);
	      stmt.setString(1, userId);
	      stmt.setString(2, passwd);
	      rs = stmt.executeQuery();
	      
	      if(rs.next()){
	      	String USER_ID = rs.getString("USER_ID");
	      	String USER_NAME = rs.getString("USER_NAME");
	      	int PHONE = rs.getInt("PHONE");
	      	String ADDRESS = rs.getString("ADDRESS");
	      	String ROLE_TYPE = rs.getString("ROLE_TYPE");
	      	
	      	userModel = new User(USER_ID, USER_NAME, PHONE, ADDRESS, ROLE_TYPE);
	      }
	      return userModel;
	    } catch (Exception ex) {
	    	System.out.println(ex.getMessage());
	      return null;
	    }
		
	}
}
