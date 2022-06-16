package entities;

import java.sql.SQLException;

public class admin {
	
	
	private int id;
	private String email;
	private String username;
	private String password;
	

	public admin() {
		email="";
		username="";
		password="";
	}
	
	
	
	
	
	public int getId() {
		return id;
	}





	public void setId(int id) {
		this.id = id;
	}





	public String getEmail() {
		return email;
	}





	public void setEmail(String email) {
		this.email = email;
	}





	public String getUsername() {
		return username;
	}





	public void setUsername(String username) {
		this.username = username;
	}





	public String getPassword() {
		return password;
	}





	public void setPassword(String password) {
		this.password = password;
	}






}
