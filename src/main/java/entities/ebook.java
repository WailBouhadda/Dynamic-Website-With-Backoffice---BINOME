package entities;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Date;

public class ebook {
	
	
	
	private int idEbook;
	private String title;
	private Blob ebook;
	private InputStream ebookis;
	private Date datePubli;

	public ebook() {
		// TODO Auto-generated constructor stub
	}
	
	
	

	public String getTitle() {
		return title;
	}




	public void setTitle(String title) {
		this.title = title;
	}




	public int getIdEbook() {
		return idEbook;
	}

	public void setIdEbook(int idEbook) {
		this.idEbook = idEbook;
	}

	public Blob getEbook() {
		return ebook;
	}

	public void setEbook(Blob ebook) {
		this.ebook = ebook;
	}

	public InputStream getEbookis() {
		return ebookis;
	}

	public void setEbookis(InputStream ebookis) {
		this.ebookis = ebookis;
	}

	public Date getDatePubli() {
		return datePubli;
	}

	public void setDatePubli(Date datePubli) {
		this.datePubli = datePubli;
	}

	
	
	
	
	
	
	
}
