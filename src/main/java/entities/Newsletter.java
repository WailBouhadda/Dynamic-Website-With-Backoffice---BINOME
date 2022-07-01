package entities;

import java.sql.Date;

public class Newsletter {
	
	
	
	private int idNewsletter;
	private String email;
	private Date dateInscrp;
	
	

	public Newsletter() {
		// TODO Auto-generated constructor stub
	}



	public int getIdNewsletter() {
		return idNewsletter;
	}



	public void setIdNewsletter(int idNewsletter) {
		this.idNewsletter = idNewsletter;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public Date getDateInscrp() {
		return dateInscrp;
	}



	public void setDateInscrp(Date dateInscrp) {
		this.dateInscrp = dateInscrp;
	}
	
	

}
