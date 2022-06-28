package entities;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Date;

public class Demande {
	
	
	private int iddemande;
	private String nom;
	private String prenom;
	private String email;
	private Date submitDate;
	private Blob cv;
	private InputStream cvis;
	

	public Demande() {
		// TODO Auto-generated constructor stub
	}


	public int getIddemande() {
		return iddemande;
	}


	public void setIddemande(int iddemande) {
		this.iddemande = iddemande;
	}


	public String getNom() {
		return nom;
	}


	public void setNom(String nom) {
		this.nom = nom;
	}


	public String getPrenom() {
		return prenom;
	}


	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Date getSubmitDate() {
		return submitDate;
	}


	public void setSubmitDate(Date submitDate) {
		this.submitDate = submitDate;
	}


	public Blob getCv() {
		return cv;
	}


	public void setCv(Blob cv) {
		this.cv = cv;
	}


	public InputStream getCvis() {
		return cvis;
	}


	public void setCvis(InputStream cvis) {
		this.cvis = cvis;
	}
	
	
	
	
	

}
