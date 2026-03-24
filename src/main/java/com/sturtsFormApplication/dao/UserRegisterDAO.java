package com.sturtsFormApplication.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.sturtsFormApplication.model.RegisterUser;

public class UserRegisterDAO {
	
	private static final String DB_URL = "jdbc:mysql://localhost:3306/struts_user_register";
	
	private static final String DB_USERNAME = "root";
	
	private static final String DB_PASSWORD = "Meher@147";
	
	public UserRegisterDAO() {
		createTableIfNotExists();
	}
	
	// --- NEW METHOD: Creates the table if it doesn't already exist ---
    private void createTableIfNotExists() {
        Connection con = null;
        Statement stmt = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
            stmt = con.createStatement();
            
            // SQL command to safely create the table only if it is missing
            String createTableSQL = "CREATE TABLE IF NOT EXISTS RegisterUser ("
                    + "id INT AUTO_INCREMENT PRIMARY KEY, "
                    + "username VARCHAR(50) NOT NULL, "
                    + "user_password VARCHAR(30) NOT NULL, "
                    + "email VARCHAR(100) NOT NULL"
                    + ")";
            
            // Using executeUpdate() for a DDL (Data Definition Language) command
            stmt.executeUpdate(createTableSQL);
            
        } catch (Exception e) {
            System.out.println("Error creating table: " + e.getMessage());
        } finally {
            // Clean up resources
            if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
            if (con != null) try { con.close(); } catch (SQLException ignore) {}
        }
    }
	
	// --- NEW METHOD: Checks if email already exists ---
    public boolean isEmailExists(String email) {
        boolean exists = false;
        Connection con = null;
        PreparedStatement prst = null;
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
            
            // Check if any row has this email
            String query = "SELECT email FROM RegisterUser WHERE email = ?";
            
            prst = con.prepareStatement(query);
            prst.setString(1, email);
            
            rs = prst.executeQuery();
            
            // If the result set has at least one row, the email exists
            if (rs.next()) {
                exists = true;
            }
        } catch(Exception e) {
            System.out.println("Error checking email: " + e.getMessage());
        } finally {
            // Clean up resources securely
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (prst != null) try { prst.close(); } catch (SQLException ignore) {}
            if (con != null) try { con.close(); } catch (SQLException ignore) {}
        }
        
        return exists;
    }
	
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
