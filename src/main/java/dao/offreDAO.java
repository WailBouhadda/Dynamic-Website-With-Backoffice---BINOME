package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entities.Demande;
import entities.offre;
import entities.poste;
import tools.DBconnection;

public class offreDAO {

	public offreDAO() {
		// TODO Auto-generated constructor stub
	}
	
	
	Connection con = DBconnection.connect();
	
	Statement st;
	ResultSet rs;
	
	
	public int addoffre(offre o) {
		int res=0;
		
		String SQL = "insert into offreemploi(titre, details, local, pdf) values (?,?,?,?)";
		 
		PreparedStatement preparedStatement;

		if(con != null) {	
				
				try {
					
		            preparedStatement = con.prepareStatement(SQL);
		            
		            preparedStatement.setString(1, o.getTitre());
		            preparedStatement.setString(2, o.getDetails());
		            preparedStatement.setString(3, o.getLocal());
		            preparedStatement.setBlob(4, o.getPdfis());
		            
		            
		            preparedStatement.executeUpdate();
		
		
		    		res=1;
		
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					res= -1;
				}
		}else {
			res = -1;
		}
		
		
		return res;
	}
	
	
	/* --- Start Get all postes --- */

	public ArrayList<offre> getOffres(){
		
		ArrayList<offre> offres = new ArrayList<offre>();
		if(con != null) {	
			try {
				
				st = con.createStatement();
				rs = st.executeQuery("select * from offreemploi order by date desc");
				
				while(rs.next()) {
					
					offre o = new offre();
					
					o.setIdoffre(rs.getInt(1));
					o.setTitre(rs.getString(2));
					o.setDetails(rs.getString(3));
					o.setLocal(rs.getString(4));
					o.setPdf(rs.getBlob(5));
					o.setPublishdate(rs.getDate(6));;
				
					
					offres.add(o);
				}
	
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
			}else {
				offres = null;
			}
		return offres;
	}
	
	
	/* --- End Get all offres --- */

	
	
/* --- Start delete offre by id  --- */

	
	public int deleteOffreById(int id) {
		int statut = 0;
		if(con != null) {
			try {
				st = con.createStatement();
				st.execute("delete from offreemploi where idoffre=" + id);
				statut = 1;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				statut = -1;
			}
		}
		
		return statut;
	}

	/* --- End delete offre by id  --- */
	
	
	/* --- Start get offre by id --- */

	
	public offre getoffreById(int id){
		
			offre o = new offre();
	
		if(con != null) {	
			try {
				
				st = con.createStatement();
				rs = st.executeQuery("select * from offreemploi where idoffre = "+id);
				
				if(rs.next()) {
					
					
					o.setIdoffre(rs.getInt(1));
					o.setTitre(rs.getString(2));
					o.setDetails(rs.getString(3));
					o.setLocal(rs.getString(4));
					o.setPdf(rs.getBlob(5));
					o.setPublishdate(rs.getDate(6));;
				
					
				}
	
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
			}else {
				o = null;
			}
		return o;
	}
	
	/* --- End get offre by id --- */

	
	
	/* --- Start add demande --- */


	public int adddemande(Demande o) {
		int res=0;
		
		String SQL = "insert into demandeemploi(nom, prenom, email, cv) values (?,?,?,?)";
		 
		PreparedStatement preparedStatement;

		if(con != null) {	
				
				try {
					
		            preparedStatement = con.prepareStatement(SQL);
		            
		            preparedStatement.setString(1, o.getNom());
		            preparedStatement.setString(2, o.getPrenom());
		            preparedStatement.setString(3, o.getEmail());
		            preparedStatement.setBlob(4, o.getCvis());
		            
		            
		            preparedStatement.executeUpdate();
		
		
		    		res=1;
		
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					res= -1;
				}
		}else {
			res = -1;
		}
		
		
		return res;
	}
	
	/* --- End add demande --- */

	
	
	/* --- Start Get all demandes --- */

	public ArrayList<Demande> geteemandes(){
		
		ArrayList<Demande> demandes = new ArrayList<Demande>();
		if(con != null) {	
			try {
				
				st = con.createStatement();
				rs = st.executeQuery("select * from demandeemploi order by date desc");
				
				while(rs.next()) {
					
					Demande o = new Demande();
					
					o.setIddemande(rs.getInt(1));
					o.setNom(rs.getString(2));
					o.setPrenom(rs.getString(3));
					o.setEmail(rs.getString(4));
					o.setCv(rs.getBlob(5));
					o.setSubmitDate(rs.getDate(6));;
				
					
					demandes.add(o);
				}
	
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
			}else {
				demandes = null;
			}
		return demandes;
	}
	
	
	/* --- End Get all demades --- */
	
	
	/* --- Start Get demande by id --- */

	public Demande geteemandeById( int id){
		
		Demande o = new Demande();

		
		if(con != null) {	
			try {
				
				st = con.createStatement();
				rs = st.executeQuery("select * from demadeemploi where iddemande = "+id);
				
				while(rs.next()) {
					
					
					o.setIddemande(rs.getInt(1));
					o.setNom(rs.getString(2));
					o.setPrenom(rs.getString(3));
					o.setEmail(rs.getString(4));
					o.setCv(rs.getBlob(5));
					o.setSubmitDate(rs.getDate(6));;
				
					
				}
	
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
			}else {
				o = null;
			}
		return o;
	}
	
	
	/* --- End Get demade by id --- */
	
	
	

}
