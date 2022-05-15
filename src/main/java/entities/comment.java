package entities;

import java.sql.Date;

public class comment {
	
	
	
	private int idComment;
	private int idPoste;
	private String owner;
	private String comment;
	private String email;
	private int statut;
	private Date publishDate;
	
	

	public comment() {
		// TODO Auto-generated constructor stub
	}



	public int getIdComment() {
		return idComment;
	}



	public void setIdComment(int idComment) {
		this.idComment = idComment;
	}



	public int getIdPoste() {
		return idPoste;
	}



	public void setIdPoste(int idPoste) {
		this.idPoste = idPoste;
	}



	public String getOwner() {
		return owner;
	}



	public void setOwner(String owner) {
		this.owner = owner;
	}



	public String getComment() {
		return comment;
	}



	public void setComment(String comment) {
		this.comment = comment;
	}

	


	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public int getStatut() {
		return statut;
	}



	public void setStatut(int statut) {
		this.statut = statut;
	}



	public Date getPublishDate() {
		return publishDate;
	}



	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	
	
	

	
	
}
