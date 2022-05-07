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
	
	
	
	
	
	
	public ArrayList<categorie> getcategories(){
		
		ArrayList<categorie> c = new ArrayList<categorie>();
		
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
		
		return c;
	}
	
	
	
	public categorie getcategorieById(int id){
		
		categorie c = new categorie();
		
		try {
			st = con.createStatement();
			rs = st.executeQuery("select * from categorie where id = "+id);
			
			if(rs.next()) {
				
				c.setIdcategorie(rs.getInt(1));
				c.setNomcategorie(rs.getString(2));
				
				return c;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return c;
	}
	
	
	

}
