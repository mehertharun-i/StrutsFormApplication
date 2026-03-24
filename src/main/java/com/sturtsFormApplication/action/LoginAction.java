package com.sturtsFormApplication.action;

import org.apache.struts2.ActionSupport;
import org.apache.struts2.interceptor.parameter.StrutsParameter;

import com.sturtsFormApplication.dao.UserLoginDAO;
import com.sturtsFormApplication.model.LoginUser;

public class LoginAction extends ActionSupport {

    private String email;
    private String password;

    @Override
    public String execute() {
        UserLoginDAO dao = new UserLoginDAO();
        
        try {
            LoginUser loginUser = new LoginUser(email, password);
            boolean isValid = dao.validateUser(loginUser);
            
            if (isValid) {
                return SUCCESS; 
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
}
