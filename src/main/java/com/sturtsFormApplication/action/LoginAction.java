package com.sturtsFormApplication.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ActionSupport;
import org.apache.struts2.interceptor.parameter.StrutsParameter;

import com.sturtsFormApplication.dao.UserLoginDAO;
import com.sturtsFormApplication.model.LoginUser;

public class LoginAction extends ActionSupport {

    private String email;
    private String password;
    private String fullname;
    private String role;
    private List<Map<String, String>> userList;

    @Override
    public String execute() {
        UserLoginDAO dao = new UserLoginDAO();
        
        try {
            LoginUser loginUser = new LoginUser(email, password);
            String[] userDetails = dao.validateUser(loginUser);
            
            if (userDetails != null) {
            		this.fullname = userDetails[0];
            		this.role = userDetails[1];
            		
            		if("ADMIN".equalsIgnoreCase(this.role)) {
            			this.userList = dao.getAllStandardUsers();
            			return "admin";
            		} else {
            			return SUCCESS; 
            		}
            } else {
                addActionError("Invalid username or password.");
                return INPUT;
            }
        } catch (Exception e) {
            e.printStackTrace();
            addActionError("A system error occurred: " + e.getMessage());
            return ERROR;
        }
    }

    public String getEmail() { return email; }
    
    @StrutsParameter
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    
    @StrutsParameter
    public void setPassword(String password) { this.password = password; }

	public String getFullname() {
		return fullname;
	}
	
	public String getRole() {
		return role;
	}
	
	public List<Map<String, String>> getUserList() {
	    return userList;
	}
    
}

