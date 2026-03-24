package com.sturtsFormApplication.model;

public class RegisterUser {
	
	private String fullname;
	
	private String password;
	
	private String email;
	
	
	public RegisterUser() {
		
	}
	
	public RegisterUser(String fullname, String password, String email) {
		this.fullname = fullname;
		this.password = password;
		this.email = email;
	}
	
	public String getFullname() {
		return this.fullname;
	}
	
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	
	public String getPassword() {
		return this.password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getEmail() {
		return this.email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}

}
