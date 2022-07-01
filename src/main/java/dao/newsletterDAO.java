package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entities.Newsletter;
import entities.comment;
import tools.DBconnection;

public class newsletterDAO {

	public newsletterDAO() {
		// TODO Auto-generated constructor stub
	}
	
	Connection con = DBconnection.connect();
	
	Statement st;
	ResultSet rs;
	
	
	public int addNewsletterMembre(Newsletter n) {
		int result = 0;
		
		if(con != null) {
			
			try {
				
				st = con.createStatement();
				
				st.executeUpdate("insert into newsletter(email) values('"+n.getEmail()+"')");
				
				result = 1;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				result = -1;

			}
			}else {
				result = -1;

			}
		
		
		return result;
		
	}
	
	public ArrayList<Newsletter> getInscrits(){
		
		ArrayList<Newsletter> inscrits = new ArrayList<Newsletter>();
			
		

		if(con != null) {
			
			try {
				st = con.createStatement();
				rs = st.executeQuery("select * from newsletter order by date desc");
				
				while(rs.next()) {
					
					Newsletter c1 = new Newsletter();
					
					c1.setIdNewsletter(rs.getInt(1));;		
					c1.setEmail(rs.getString(2));;
					c1.setDateInscrp(rs.getDate(3));
					
					inscrits.add(c1);
					
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		
		return inscrits; 
		
	}
	
	
	
	public int deletInscrit(int id) {
		
			int counter = 0;
					
					if(con != null) {
						
						try {
							
							st = con.createStatement();
						
									
							st.execute("delete from newsletter where idNewsletter = "+id);
											
							counter = 1;
					
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
							
							counter = -1;
						}
						
					}else {
						counter = -1;

					}
			
					return counter;
	}
	

}
