package controlers;

import java.io.IOException;
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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.newsletterDAO;
import entities.Newsletter;

/**
 * Servlet implementation class actionNewsLetter
 */
public class actionNewsLetter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public actionNewsLetter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		newsletterDAO nldao = new newsletterDAO();

		ArrayList<Newsletter> inscrits = nldao.getInscrits();
		
		String action = request.getParameter("action");
		
		
		int  delete=0;
		
		if(action != null) {	
						
			
							
			if(action.equals("ENVOYER")) {
				
				
				String sujet = request.getParameter("sujet");
				String contenu = request.getParameter("contenu");
				
				
				
				
				if(inscrits != null){		
					for(int i = 0 ; i < inscrits.size() ; i++){
										Newsletter c = new Newsletter();
										c = inscrits.get(i);
										
										String email = c.getEmail();
						
					
						
						final String username = "wailbouhadda31@gmail.com";
						final String password = "gjsazcsikdddiimc";
						Properties props = new Properties();
						
						props.put("mail.smtp.auth", "true");
						props.put("mail.smtp.ssl.trust", "*");
						props.put("mail.smtp.starttls.enable", "true");
						props.put("mail.smtp.host", "smtp.gmail.com");
						props.put("mail.smtp.port", "587");
						Session session = Session.getInstance(props,
						  new javax.mail.Authenticator() {
							protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(username, password);
							}
						  });
						try {
							Message message = new MimeMessage(session);
							message.setFrom(new InternetAddress("wailbouhadda31@gmail.com"));
							message.setRecipients(Message.RecipientType.TO,
							InternetAddress.parse(email));
							message.setSubject(sujet);
							message.setContent(contenu,"text/html");
							Transport.send(message);
							delete=1;
						} catch (MessagingException e) {
							delete= -1;
							throw new RuntimeException(e);
						}
						
				}
					
					
					request.getRequestDispatcher("NewsLetter?result="+delete).forward(request, response);

				
						
				}else {
					
					delete = -1;
					
					request.getRequestDispatcher("NewsLetter?result="+delete).forward(request, response);

					
				}
				
				

			}else if(action.equals("SUPPRIMER")) {
				
				
				
				int idNL = Integer.parseInt(request.getParameter("id"));
				
				delete = nldao.deletInscrit(idNL);
				
				request.getRequestDispatcher("NewsLetter?result="+delete).forward(request, response);

				
				
			}else {
				
				delete = -1;
				
				request.getRequestDispatcher("NewsLetter?result="+delete).forward(request, response);
				
			}
			}
		
		
	}

}
