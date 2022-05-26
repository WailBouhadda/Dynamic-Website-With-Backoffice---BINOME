package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entities.comment;
import tools.DBconnection;

public class commentDAO {

	public commentDAO() {
		// TODO Auto-generated constructor stub
	}
	
	
	Connection con = DBconnection.connect();
	Statement st;
	ResultSet rs;
	
	
	
	
	public int addComment(comment c) {
		int result = 0;
		
		if(con != null) {
			
			try {
				
				st = con.createStatement();
				
				st.executeUpdate("insert into comments(idposte,owner,comment,email,statut) values("+c.getIdPoste()+",'"+c.getOwner()+"','"+c.getComment()+"','"+c.getEmail()+"',"+-1+")");
				
				rs = st.executeQuery("select nbrComments from poste where idposte = "+c.getIdPoste());
				
				if(rs.next()) {
					
					int nbrcomments = rs.getInt(1);
					
					nbrcomments++;
					
					st.executeUpdate("update poste set nbrComments ="+nbrcomments+" where idposte = "+c.getIdPoste());
				}
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
	
	
	
	
	public ArrayList<comment> getComments(){
		
		ArrayList<comment> comments = new ArrayList<comment>();
		
		if(con != null) {
			
			try {
				st = con.createStatement();
				rs = st.executeQuery("select * from comments order by date desc");
				
				while(rs.next()) {
					
					comment c1 = new comment();
					
					c1.setIdComment(rs.getInt(1));
					c1.setIdPoste(rs.getInt(2));
					c1.setOwner(rs.getString(3));
					c1.setComment(rs.getString(4));
					c1.setEmail(rs.getString(5));
					c1.setStatut(rs.getInt(6));
					c1.setPublishDate(rs.getDate(7));
					
					comments.add(c1);
					
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		
		return comments; 
	}
	
	public ArrayList<comment> getCommentsByIdPoste(int idposte){
		
		ArrayList<comment> comments = new ArrayList<comment>();
		
		if(con != null) {
			
			try {
				st = con.createStatement();
				rs = st.executeQuery("select * from comments where idposte = "+idposte+" order by date desc");
				
				while(rs.next()) {
					
					comment c1 = new comment();
					
					c1.setIdComment(rs.getInt(1));
					c1.setIdPoste(rs.getInt(2));
					c1.setOwner(rs.getString(3));
					c1.setComment(rs.getString(4));
					c1.setEmail(rs.getString(5));
					c1.setStatut(rs.getInt(6));
					c1.setPublishDate(rs.getDate(7));
					
					comments.add(c1);
					
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		
		return comments; 
	}
	
	
	public ArrayList<comment> getCommentsByStatut(int statut){
		
		ArrayList<comment> comments = new ArrayList<comment>();
		
		if(con != null) {
			
			try {
				st = con.createStatement();
				rs = st.executeQuery("select * from comments where statut = "+statut+" order by date desc");
				
				while(rs.next()) {
					
					comment c1 = new comment();
					
					c1.setIdComment(rs.getInt(1));
					c1.setIdPoste(rs.getInt(2));
					c1.setOwner(rs.getString(3));
					c1.setComment(rs.getString(4));
					c1.setEmail(rs.getString(5));
					c1.setStatut(rs.getInt(6));
					c1.setPublishDate(rs.getDate(7));
					
					comments.add(c1);
					
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		
		return comments; 
	}
	
	
	public ArrayList<comment> getCommentsByStatutId(int statut , int idposte){
		
		ArrayList<comment> comments = new ArrayList<comment>();
		
		if(con != null) {
			
			try {
				st = con.createStatement();
				rs = st.executeQuery("select * from comments where statut = "+statut+" and idposte = "+ idposte +" order by date desc");
				
				while(rs.next()) {
					
					comment c1 = new comment();
					
					c1.setIdComment(rs.getInt(1));
					c1.setIdPoste(rs.getInt(2));
					c1.setOwner(rs.getString(3));
					c1.setComment(rs.getString(4));
					c1.setEmail(rs.getString(5));
					c1.setStatut(rs.getInt(6));
					c1.setPublishDate(rs.getDate(7));
					
					comments.add(c1);
					
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		
		return comments; 
	}
	
	public int deleteCommentById(int id) {
		
		int counter = 0;
		
		if(con != null) {
			
			try {
				
				st = con.createStatement();
				rs = st.executeQuery("select idposte from comments where idcomment = "+id);
				if(rs.next()) {
					
					int idposte = rs.getInt(1);
					rs = st.executeQuery("select nbrComments from poste where idposte = "+idposte);
					
					if(rs.next()) {
						
						int nbrcomments = rs.getInt(1);
						
						nbrcomments--;
						
						st.execute("delete from comments where idcomment = "+id);
						
						st.executeUpdate("update poste set nbrComments = "+nbrcomments+" where idposte = "+idposte);
						
						counter = 1;


					}
				}
				
				
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
				counter = -1;
			}
			
		}

		return counter;
	}
	
	
	
	public int acceptCommentById(int id) {
		
		int counter = 0;
		
		if(con != null) {
			
			try {
				
				st = con.createStatement();
				st.execute("update comments set statut = 1 where idcomment = "+id);
				
				counter = 1;
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
				counter = -1;
				
			}
			
			
		}
		
		return counter;
	}
	
	
	
	
	

}
