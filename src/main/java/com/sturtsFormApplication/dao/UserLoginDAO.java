package com.sturtsFormApplication.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sturtsFormApplication.model.LoginUser;

public class UserLoginDAO {
	
	private static final String DB_URL = "jdbc:mysql://localhost:3306/struts_user_register";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "Meher@147";

    public String[] validateUser(LoginUser loginUser) {
        String[] userDetails = null;
        Connection con = null;
        PreparedStatement prst = null;
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
            
            String query = "SELECT fullname, role FROM RegisterUser WHERE email = ? AND user_password = ?";
            
            prst = con.prepareStatement(query);
            prst.setString(1, loginUser.getEmail());
            prst.setString(2, loginUser.getPassword());
            
            rs = prst.executeQuery();
            
            if (rs.next()) {
            		userDetails = new String[2];
            		userDetails[0] = rs.getString("fullname");
            		userDetails[1] = rs.getString("role");
            }
        } catch(Exception e) {
            System.out.println("Error validating login: " + e.getMessage());
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (prst != null) try { prst.close(); } catch (SQLException ignore) {}
            if (con != null) try { con.close(); } catch (SQLException ignore) {}
        }
        
        return userDetails;
    }
    
    
    public List<Map<String, String>> getAllStandardUsers() {
        List<Map<String, String>> userList = new ArrayList<>();
        Connection con = null;
        PreparedStatement prst = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

            String query = "SELECT fullname, email, user_password, role FROM RegisterUser WHERE role = 'USER'";
            
            prst = con.prepareStatement(query);
            rs = prst.executeQuery();

            while (rs.next()) {
                Map<String, String> user = new HashMap<>();
                user.put("fullname", rs.getString("fullname"));
                user.put("email", rs.getString("email"));
                user.put("password", rs.getString("user_password"));
                user.put("role", rs.getString("role"));
                userList.add(user);
            }
        } catch(Exception e) {
            System.out.println("Error fetching standard users: " + e.getMessage());
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (prst != null) try { prst.close(); } catch (SQLException ignore) {}
            if (con != null) try { con.close(); } catch (SQLException ignore) {}
        }
        
        return userList;
    }

}
