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
		
		return test;
	}
	
	
	
	/* --- Ajouter un poste --- */

	public ArrayList<poste> getPostes(){
		
		ArrayList<poste> postes = new ArrayList<poste>();
		
		try {
			
			st = con.createStatement();
			rs = st.executeQuery("select * from poste");
			
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
		
		
		
		return postes;
	}

}
