package com.sturtsFormApplication.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sturtsFormApplication.model.LoginUser;

public class UserLoginDAO {
	
	private static final String DB_URL = "jdbc:mysql://localhost:3306/struts_user_register";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "Meher@147";

    public boolean validateUser(LoginUser loginUser) {
        boolean isValid = false;
        Connection con = null;
        PreparedStatement prst = null;
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
            
            String query = "SELECT id FROM RegisterUser WHERE email = ? AND user_password = ?";
            
            prst = con.prepareStatement(query);
            prst.setString(1, loginUser.getEmail());
            prst.setString(2, loginUser.getPassword());
            
            rs = prst.executeQuery();
            
            if (rs.next()) {
                isValid = true;
            }
        } catch(Exception e) {
            System.out.println("Error validating login: " + e.getMessage());
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (prst != null) try { prst.close(); } catch (SQLException ignore) {}
            if (con != null) try { con.close(); } catch (SQLException ignore) {}
        }
        
        return isValid;
    }

}
