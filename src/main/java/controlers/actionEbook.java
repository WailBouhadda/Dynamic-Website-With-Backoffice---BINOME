package controlers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.ebookDAO;
import dao.newsletterDAO;
import entities.Newsletter;
import entities.ebook;




/**
 * Servlet implementation class actionEbook
 */



@MultipartConfig
public class actionEbook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public actionEbook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		

		ebookDAO ebdao = new ebookDAO();

		
		ebook eb = new ebook();
		
		String action = request.getParameter("action");
		
		InputStream is = null;	
		
		int  delete=0;
		
		if(action != null) {	
						
			
							
			if(action.equals("AJOUTER")) {
				
				Part ebook = request.getPart("ebook");
				
				if( ebook != null) {
				is = ebook.getInputStream();
				eb.setEbookis(is);	
				}
				
	
				String title = request.getParameter("titre");
				eb.setTitle(title);
				
		
				delete = ebdao.addEbook(eb);
				

				request.getRequestDispatcher("Ebook?result="+delete).forward(request, response);

			}else if(action.equals("SUPPRIMER")) {
				
				
				
				int id = Integer.parseInt(request.getParameter("id"));
				
				delete = ebdao.deletEbook(id);
				
				request.getRequestDispatcher("Ebook?result="+delete).forward(request, response);

				
				
			}else {
				
				delete = -1;
				
				request.getRequestDispatcher("NewsLetter?result="+delete).forward(request, response);
				
			}
			}
		
		
	}
	
	

}
