package com.sturtsFormApplication.action;

import org.apache.struts2.ActionSupport;
import org.apache.struts2.interceptor.parameter.StrutsParameter;

import com.sturtsFormApplication.dao.UserRegisterDAO;
import com.sturtsFormApplication.model.RegisterUser;

public class RegisterAction extends ActionSupport {

	// Form inputs automatically mapped by Struts
    private String username;
    private String password;
    private String email;

    @Override
    public String execute() {
        // 1. Package the form data into our Model object
        RegisterUser newUser = new RegisterUser(username, password, email);
        
        // 2. Instantiate our Database Access Object
        UserRegisterDAO dao = new UserRegisterDAO();

        try {
            // 3. Attempt to save the user
            boolean isSaved = dao.userRegisterDAO(newUser);
            
            if (isSaved) {
                return SUCCESS; 
            } else {
                addActionError("Registration failed. Please try again.");
                return ERROR;
            }
        } catch (Exception e) {
            e.printStackTrace();
            addActionError("A system error occurred: " + e.getMessage());
            return ERROR;
        }
    }

    // Getters and Setters required by Struts to read the JSP form
    public String getUsername() { return username; }
    
    @StrutsParameter
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    
    @StrutsParameter
    public void setPassword(String password) { this.password = password; }

    public String getEmail() { return email; }
    
    @StrutsParameter
    public void setEmail(String email) { this.email = email; }

	
}