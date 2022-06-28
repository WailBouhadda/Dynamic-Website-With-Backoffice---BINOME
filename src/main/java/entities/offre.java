package entities;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Date;

public class offre {
	
	
	private int idoffre;
	private String titre;
	private String details;
	private Date publishdate;
	private String local;
	private Blob pdf;
	private InputStream pdfis;
	

	public offre() {
		// TODO Auto-generated constructor stub
	}


	public int getIdoffre() {
		return idoffre;
	}


	public void setIdoffre(int idoffre) {
		this.idoffre = idoffre;
	}


	public String getTitre() {
		return titre;
	}


	public void setTitre(String titre) {
		this.titre = titre;
	}


	public String getDetails() {
		return details;
	}


	public void setDetails(String details) {
		this.details = details;
	}


	public Date getPublishdate() {
		return publishdate;
	}


	public void setPublishdate(Date publishdate) {
		this.publishdate = publishdate;
	}


	public Blob getPdf() {
		return pdf;
	}


	public void setPdf(Blob pdf) {
		this.pdf = pdf;
	}


	public InputStream getPdfis() {
		return pdfis;
	}


	public void setPdfis(InputStream pdfis) {
		this.pdfis = pdfis;
	}


	public String getLocal() {
		return local;
	}


	public void setLocal(String local) {
		this.local = local;
	}

	
	
	
	
	
	
}
