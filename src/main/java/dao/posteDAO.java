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
	
	
	
	/* --- Ajouter un poste --- */
	
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
	
	
	
	/* --- Ajouter un poste --- */

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

	
	
	
	public int deletePosteById(int id) {
		int statut = 0;
		
		try {
			st = con.createStatement();
			st.execute("delete from poste where idposte=" + id);
			statut = 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			statut = -1;
		}
		
		return statut;
	}

	
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
}
