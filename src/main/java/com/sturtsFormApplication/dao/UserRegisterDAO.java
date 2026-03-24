package com.sturtsFormApplication.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.sturtsFormApplication.model.RegisterUser;

public class UserRegisterDAO {
	
	private static final String DB_URL = "jdbc:mysql://localhost:3306/struts_user_register";
	
	private static final String DB_USERNAME = "root";
	
	private static final String DB_PASSWORD = "Meher@147";
	
	public boolean userRegisterDAO(RegisterUser registerUser){
		
		boolean isSuccess = false;
		
		Connection con = null;
		
		PreparedStatement prst = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
			
			String query = "INSERT INTO RegisterUser (username, user_password, email) VALUES (?, ?, ?)";
			
			prst = con.prepareStatement(query);
			prst.setString(1, registerUser.getUsername());
			prst.setString(2, registerUser.getPassword());
			prst.setString(3, registerUser.getEmail());
			
			int rowsAffected = prst.executeUpdate();
			if(rowsAffected > 0) {
				isSuccess = true;
			}
		}catch(Exception e) {
			System.out.println("Error :"+e.getMessage());
		} finally {
            // Clean up resources
			if (prst != null) try { prst.close(); } catch (SQLException ignore) {}
            if (con != null) try { con.close(); } catch (SQLException ignore) {}
        }
		
		return isSuccess;
		
	}

}
