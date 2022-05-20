package Models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class US001Model {
	
	public US001Model(){
		
	}
	
	public User getUS001_Users(String userId, String passwd) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		User userModel = null;
	    try {
		    //connect mysql
		    String url = "jdbc:mysql://140.134.24.157:53306/FP";
		    String user = "root";
		    String password = "fjusedia";
		    String driver = "com.mysql.cj.jdbc.Driver";
		    Class.forName(driver);
		    con = DriverManager.getConnection(url, user, password);
		    String sql = "SELECT USER_ID, USER_NAME, PHONE, ADDRESS, ROLE_TYPE, DEPARTMENT FROM FP_USERS WHERE USER_ID = ? AND PASSWD = ? ";
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
		      	String DEPARTMENT = rs.getString("DEPARTMENT");
		      	
		      	userModel = new User(USER_ID, USER_NAME, PHONE, ADDRESS, ROLE_TYPE, DEPARTMENT);
		    }
		    return userModel;
	    } catch (Exception ex) {
	    	System.out.println("connect mysql exception: " + ex.getMessage());
	        return null;
	    }
		
	}
}
