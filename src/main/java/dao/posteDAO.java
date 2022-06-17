package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entities.poste;
import tools.DBconnection;

public class posteDAO {

	public posteDAO() {
		// TODO Auto-generated constructor stub
	}
	
	Connection con = DBconnection.connect();
	
	Statement st;
	ResultSet rs;
	
	
	
	/* --- Start Add poste --- */
	
	public int addPoste(poste p) {
		int test = 0;
		String SQL = "insert into poste(title, image, content, nbrLike, nbrComments, idcategorie) values (?,?,?,?,?,?)";
		 
		PreparedStatement preparedStatement;

		if(con != null) {	
				
				try {
					
		            preparedStatement = con.prepareStatement(SQL);
		            
		            preparedStatement.setString(1, p.getTitle());
		            preparedStatement.setBlob(2, p.getImageis());
		            preparedStatement.setString(3, p.getContent());
		            preparedStatement.setInt(4, p.getNbrLike());
		            preparedStatement.setInt(5, p.getNbrComments());
		            preparedStatement.setInt(6, p.getIdCategorie());
		            
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
	
	
	/* --- Start Get all postes --- */

	public ArrayList<poste> getPostes(){
		
		ArrayList<poste> postes = new ArrayList<poste>();
		if(con != null) {	
			try {
				
				st = con.createStatement();
				rs = st.executeQuery("select * from poste order by date desc");
				
				while(rs.next()) {
					
					poste p = new poste();
					
					p.setId(rs.getInt(1));
					p.setTitle(rs.getString(2));
					p.setImage(rs.getBlob(3));
					p.setContent(rs.getString(4));
					p.setPublishDate(rs.getDate(5));
					p.setNbrLike(rs.getInt(6));
					p.setNbrComments(rs.getInt(7));
					p.setIdCategorie(rs.getInt(8));
					
					postes.add(p);
				}
	
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
			}else {
				postes = null;
			}
		return postes;
	}
	
	
	/* --- End Get all postes --- */


	/* --- Start Get poste by id --- */

	
public poste getPosteById(int id){
		
	
		poste p = new poste();

		if(con != null) {	
			try {
				
				st = con.createStatement();
				rs = st.executeQuery("select * from poste where idposte = "+id);
				
				if(rs.next()) {
					
					
					
					p.setId(rs.getInt(1));
					p.setTitle(rs.getString(2));
					p.setImage(rs.getBlob(3));
					p.setContent(rs.getString(4));
					p.setPublishDate(rs.getDate(5));
					p.setNbrLike(rs.getInt(6));
					p.setNbrComments(rs.getInt(7));
					p.setIdCategorie(rs.getInt(8));
					
				}
	
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
			}else {
				p = null;
			}
		return p;
	}
	
	/* --- End Get poste by id --- */

	
	/* --- Start Get  postes by id categorie --- */


public ArrayList<poste> getPostesByIdCategorie(int id){
	
	ArrayList<poste> postes = new ArrayList<poste>();
	if(con != null) {	
		try {
			
			st = con.createStatement();
			rs = st.executeQuery("select * from poste where idcategorie = "+id);
			
			while(rs.next()) {
				
				poste p = new poste();
				
				p.setId(rs.getInt(1));
				p.setTitle(rs.getString(2));
				p.setImage(rs.getBlob(3));
				p.setContent(rs.getString(4));
				p.setPublishDate(rs.getDate(5));
				p.setNbrLike(rs.getInt(6));
				p.setNbrComments(rs.getInt(7));
				p.setIdCategorie(rs.getInt(8));
				
				postes.add(p);
			}

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		}else {
			postes = null;
		}
	return postes;
}

/* --- End Get  postes by id categorie --- */


/* --- Start delete poste by id  --- */

	
	public int deletePosteById(int id) {
		int statut = 0;
		if(con != null) {
			try {
				st = con.createStatement();
				st.execute("delete from poste where idposte=" + id);
				statut = 1;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				statut = -1;
			}
		}
		
		return statut;
	}

	/* --- End delete poste by id  --- */
	
	
	
	/* --- Start Like  --- */

	public void like(int id) {
		
		if(con != null) {
			try {
				st = con.createStatement();
				
				rs = st.executeQuery("select nbrlike from poste where idposte = "+id);
				
				if(rs.next()) {
	
					int likes = rs.getInt(1) + 1;
					st.execute("update poste set nbrlike = "+likes+" where idposte=" + id);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	/* --- End Like  --- */

	
	
	/* --- Start Like  --- */

	public void disLike(int id) {
		
		if(con != null) {
			try {
				st = con.createStatement();
				
				rs = st.executeQuery("select nbrlike from poste where idposte = "+id);
				
				if(rs.next()) {
	
					int likes = rs.getInt(1) - 1;
					st.execute("update poste set nbrlike = "+likes+" where idposte=" + id);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	/* --- End Like  --- */
	
	

	/* --- Start update poste  --- */
	
	public int updatePoste(poste p) {
		
		int test = 0;
		String SQL = "update poste set title =?,image =?, content =?, idcategorie=? where idposte =?";
		 
		PreparedStatement preparedStatement;

		if(con != null) {	
				
				try {
					
		            preparedStatement = con.prepareStatement(SQL);
		            
		            preparedStatement.setString(1, p.getTitle());
		            preparedStatement.setBlob(2, p.getImageis());
		            preparedStatement.setString(3, p.getContent());
		            preparedStatement.setInt(4, p.getIdCategorie());
		            preparedStatement.setInt(5, p.getId());
		            
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
		
	

	/* --- End update poste  --- */
	
	
	
	
	/* --- Start number of likes --- */
	

	public int totalLikes() {
		
		int counter = 0;
		

		if(con != null) {
			try {
				st = con.createStatement();
				
				rs = st.executeQuery("select nbrlike from poste ");
				
				while(rs.next()) {
	
					int likes = rs.getInt(1);
					
					counter += likes;
					
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		return counter;
	}
	
	
	/* --- End number of likes --- */
	

	/* --- Start number of comments --- */
	

	public int totalComments() {
		
		int counter = 0;
		

		if(con != null) {
			try {
				st = con.createStatement();
				
				rs = st.executeQuery("select nbrComments from poste ");
				
				while(rs.next()) {
	
					int comments = rs.getInt(1);
					
					counter += comments;
					
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		return counter;
	}
	
	
	/* --- End number of comments --- */
	

	
	/* --- Start number of postes --- */
	

	public int totalPostes() {
		
		int counter = 0;
		

		if(con != null) {
			try {
				st = con.createStatement();
				
				rs = st.executeQuery("select count(*) from poste ");
				
				if(rs.next()) {
	
					counter = rs.getInt(1);
					
					
					
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		return counter;
	}
	
	
	/* --- End number of postes --- */
	

	
	

	/* --- Start get month  --- */

	public String getMonth(int mo) {
		String month = null;
		
		
		switch(mo){
		case 0:
			month = "Jan";
			break;
		case 1:
			month = "Fev";
			break;
		case 2:
			month = "Mar";
			break;
		case 3:
			month = "Avr";
			break;
		case 4:
			month = "Mai";
			break;
		case 5:
			month = "Jun";
			break;
		case 6:
			month = "Jul";
			break;
		case 7:
			month = "Aou";
			break;
		case 8:
			month = "Sep";
			break;
		case 9:
			month = "Oct";
			break;
		case 10:
			month = "Nov";
			break;
		case 11:
			month = "Dec";
			break;
		 default:
			 month = "";
			
		}
		
		return month;
	}
	
	/* --- End get month  --- */

}
