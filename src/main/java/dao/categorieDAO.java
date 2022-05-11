package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.cj.protocol.Resultset;

import entities.categorie;
import tools.DBconnection;

public class categorieDAO {

	public categorieDAO() {
		// TODO Auto-generated constructor stub
	}
	
	Connection con = DBconnection.connect();
	Statement st;
	ResultSet rs;
	
	
	
	public int addcategorie(categorie c) {
		
		int statut = 0;
		
		if(con != null) {	
				try {
					st = con.createStatement();
					st.executeUpdate("insert into categorie(nomcategorie) values ('"+c.getNomcategorie()+"')");
				statut = 1;
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					statut = -1;
					
				}
		}else {
			statut = -1;
		}
		
		return statut;
	}
	
	
	
	
	
	public ArrayList<categorie> getcategories(){
		
		ArrayList<categorie> c = new ArrayList<categorie>();
		if(con != null) {		
				try {
					st = con.createStatement();
					rs = st.executeQuery("select * from categorie");
					
					while(rs.next()) {
						categorie cn = new categorie();
						
						cn.setIdcategorie(rs.getInt(1));
						cn.setNomcategorie(rs.getString(2));
						
						c.add(cn);
					}
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}else {
			c = null;
		}
		
		return c;
	}
	
	
	
	public categorie getcategorieById(int id){
		
		categorie c = new categorie();
		if(con != null) {
				try {
					st = con.createStatement();
					rs = st.executeQuery("select * from categorie where idcategorie = "+id);
					
					if(rs.next()) {
						
						c.setIdcategorie(rs.getInt(1));
						c.setNomcategorie(rs.getString(2));
						
						return c;
					}
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}else {
			c = null;
		}
		
		
		return c;
	}
	
	
	public int deleteCategorieById(int id) {
		int statut = 0;
		
		try {
			st = con.createStatement();
			st.execute("delete from categorie where idcategorie =" + id);
			statut = 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			statut = -1;
		}
		
		return statut;
	}

	
	
	

}
