package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import entities.admin;
import tools.DBconnection;

public class adminDAO {

	public adminDAO() {
		// TODO Auto-generated constructor stub
	}
	
	
	Connection con;	
	Statement st;
	ResultSet rs;
	
	
	
	
	
	
	public admin adminLogin(String email, String password) {
		
		admin a = new admin();
		
		try {
			con = DBconnection.connect();
			st = con.createStatement();
			rs = st.executeQuery("select * from admin where email = '"+email+"' and password = '"+password+"'");
			
			
			if(rs.next()) {
				
				a.setId(rs.getInt(1));
				a.setEmail(rs.getString(2));
				a.setUsername(rs.getString(3));
				a.setPassword(rs.getString(4));
				
			}else {
				
				a = null;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return a;
		
		
	}
	
	
	public int updateUserEmail(admin a, String username) {
		
		int statut = 0;
		
		try {
			
			con = DBconnection.connect();
			st = con.createStatement();
			
			statut	= st.executeUpdate("update table admin set email = '"+a.getEmail()+"', username = '"+a.getUsername()+"' where username = '"+username+"'");
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			statut = 0;
		}
		
		
		return statut;
		
	}

	
	
	

}
