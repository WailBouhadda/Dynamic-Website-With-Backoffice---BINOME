package entities;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Date;

public class poste {
	
	
	
	private int idposte;
	private Blob image;
	private InputStream imageis;
	private String title;
	private String content;
	private Date publishDate;
	private int nbrLike;
	private int nbrComments;
	private int idCategorie;
	

	public poste() {
		// TODO Auto-generated constructor stub
	}


	public int getId() {
		return idposte;
	}


	public void setId(int id) {
		this.idposte = id;
	}


	public Blob getImage() {
		return image;
	}


	public void setImage(Blob image) {
		this.image = image;
	}

	

	public InputStream getImageis() {
		return imageis;
	}


	public void setImageis(InputStream imageis) {
		this.imageis = imageis;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}
	
	

	public Date getPublishDate() {
		return publishDate;
	}


	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}


	public int getNbrLike() {
		return nbrLike;
	}


	public void setNbrLike(int nbrLike) {
		this.nbrLike = nbrLike;
	}
	
	


	public int getNbrComments() {
		return nbrComments;
	}


	public void setNbrComments(int nbrComments) {
		this.nbrComments = nbrComments;
	}


	public int getIdCategorie() {
		return idCategorie;
	}


	public void setIdCategorie(int idCategorie) {
		this.idCategorie = idCategorie;
	}
	
	
	
	

}
