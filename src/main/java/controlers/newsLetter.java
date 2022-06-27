package controlers;

import java.io.IOException;
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

/**
 * Servlet implementation class newsLetter
 */
public class newsLetter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newsLetter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String action = request.getParameter("action");
		
		

		if(action != null) {
			
			String email = request.getParameter("email");

			
			if(action.equals("S'abonner")) {
				
			
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
					message.setSubject("Binome no-reply");
					message.setText("Merci d'avoir inscriver a notre newsLetter,"
						+ "\n\n No spam to my email, please!"
						+ "Visit binome");
					Transport.send(message);
				} catch (MessagingException e) {
					throw new RuntimeException(e);
				}
			
				
				response.sendRedirect("index.jsp");
				
			}else if(action.equals("ENVOYER")) {
				
				
				String name = request.getParameter("nom");
				String msg = request.getParameter("message");
				
				
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
					InternetAddress.parse("wailbouhadda31@gmail.com"));
					message.setSubject("Binome Contact Form");
					message.setText(" From : "+name
						+"\n\n EMAIL :"+email
						+ "\n\n MESSAGE : \n\n  "+msg);
					Transport.send(message);
				} catch (MessagingException e) {
					throw new RuntimeException(e);
				}
				
				response.sendRedirect("index.jsp");

				
			}
				
		}else {
			response.sendRedirect("index.jsp");

		}
				
	}

}
