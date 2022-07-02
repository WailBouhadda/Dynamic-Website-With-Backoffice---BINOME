package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entities.Newsletter;
import entities.ebook;
import entities.poste;
import tools.DBconnection;

public class ebookDAO {

	public ebookDAO() {
		// TODO Auto-generated constructor stub
	}
	
	
	Connection con = DBconnection.connect();
	
	Statement st;
	ResultSet rs;
	
	
	
	
	
	/* --- Start Add poste --- */
	
	public int addEbook(ebook eb) {
		int test = 0;
		String SQL = "insert into ebook(title, ebook) values (?,?)";
		 
		PreparedStatement preparedStatement;

		if(con != null) {	
				
				try {
					
		            preparedStatement = con.prepareStatement(SQL);
		            
		            preparedStatement.setString(1, eb.getTitle());
		            preparedStatement.setBlob(2, eb.getEbookis());
		         
		            
		            preparedStatement.executeUpdate();
		
		
		    		test=1;
		
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					test= -1;
				}
		}else {
			test = -1;
		}
		
		
		return test;
	}
	
	
	
	/* --- End Add poste --- */
	

	

	public ArrayList<ebook> getEbooks(){
		
		ArrayList<ebook> ebooks = new ArrayList<ebook>();
			
		

		if(con != null) {
			
			try {
				st = con.createStatement();
				rs = st.executeQuery("select * from ebook order by date desc");
				
				while(rs.next()) {
					
					ebook c1 = new ebook();
					
					c1.setIdEbook(rs.getInt(1));		
					c1.setTitle(rs.getString(2));
					c1.setEbook(rs.getBlob(3));
					c1.setDatePubli(rs.getDate(4));
					
					ebooks.add(c1);
					
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		
		return ebooks; 
		
	}
	
	

	public ebook getEbookById(int id){
		
		
		ebook c1 = new ebook();

		if(con != null) {
		
			
			try {
				st = con.createStatement();
				rs = st.executeQuery("select * from ebook where idebook = "+id);
				
				if(rs.next()) {
					
					
					
					c1.setIdEbook(rs.getInt(1));		
					c1.setTitle(rs.getString(2));
					c1.setEbook(rs.getBlob(3));
					c1.setDatePubli(rs.getDate(4));
					
					
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		
		return c1; 
		
	}
	
	
	
	public int deletEbook(int id) {
		
			int counter = 0;
					
					if(con != null) {
						
						try {
							
							st = con.createStatement();
						
									
							st.execute("delete from ebook where idebook = "+id);
											
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
