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
	
	
	
	
	
	
	public boolean adminLogin(admin a) {
		boolean statut=false;
		
		
		try {
			con = DBconnection.connect();
			st = con.createStatement();
			rs = st.executeQuery("select * from admin where username = '"+a.getUsername()+"' and password = '"+a.getPassword()+"'");
			
			
			if(rs.next()) {
				
				statut = true;
			}else {
				statut = false;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return statut;
		
		
	}

	
	
	

}
