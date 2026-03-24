package com.sturtsFormApplication.action;

import org.apache.struts2.ActionSupport;
import org.apache.struts2.interceptor.parameter.StrutsParameter;

import com.sturtsFormApplication.dao.UserRegisterDAO;
import com.sturtsFormApplication.model.RegisterUser;

public class RegisterAction extends ActionSupport {

	// Form inputs automatically mapped by Struts
    private String fullname;
    private String password;
    private String email;

    @Override
    public String execute() {

    		UserRegisterDAO dao = new UserRegisterDAO();
        
        try {
        	
        		if(dao.isEmailExists(email)) {
        			addActionError("Email is already exists.");
        			return INPUT;
        		}

        		RegisterUser newUser = new RegisterUser(fullname, password, email);
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
    public String getFullname() { return fullname; }
    
    @StrutsParameter
    public void setFullname(String fullname) { this.fullname = fullname; }

    public String getPassword() { return password; }
    
    @StrutsParameter
    public void setPassword(String password) { this.password = password; }

    public String getEmail() { return email; }
    
    @StrutsParameter
    public void setEmail(String email) { this.email = email; }

	
}