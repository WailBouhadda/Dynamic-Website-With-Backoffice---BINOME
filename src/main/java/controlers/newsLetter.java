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
import javax.servlet.http.HttpSession;

import dao.newsletterDAO;
import entities.Newsletter;

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
		

		HttpSession s = request.getSession();

		String source = (String) s.getAttribute("source");


		

		if(action != null) {
			
			String email = request.getParameter("email");

			
			if(action.equals("S'abonner")) {
				
				
				Newsletter NL = new Newsletter();
				
				newsletterDAO nldao = new newsletterDAO();
				
				NL.setEmail(email);
				
				nldao.addNewsletterMembre(NL);
				
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
					message.setSubject("Binome no-Reply");
					
					message.setContent("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n"
							+ "<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\r\n"
							+ "<head>\r\n"
							+ "<!--[if gte mso 9]>\r\n"
							+ "<xml>\r\n"
							+ "  <o:OfficeDocumentSettings>\r\n"
							+ "    <o:AllowPNG/>\r\n"
							+ "    <o:PixelsPerInch>96</o:PixelsPerInch>\r\n"
							+ "  </o:OfficeDocumentSettings>\r\n"
							+ "</xml>\r\n"
							+ "<![endif]-->\r\n"
							+ "  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n"
							+ "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n"
							+ "  <meta name=\"x-apple-disable-message-reformatting\">\r\n"
							+ "  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->\r\n"
							+ "  <title></title>\r\n"
							+ "  \r\n"
							+ "    <style type=\"text/css\">\r\n"
							+ "      @media only screen and (min-width: 520px) {\r\n"
							+ "  .u-row {\r\n"
							+ "    width: 500px !important;\r\n"
							+ "  }\r\n"
							+ "  .u-row .u-col {\r\n"
							+ "    vertical-align: top;\r\n"
							+ "  }\r\n"
							+ "\r\n"
							+ "  .u-row .u-col-100 {\r\n"
							+ "    width: 500px !important;\r\n"
							+ "  }\r\n"
							+ "\r\n"
							+ "}\r\n"
							+ "\r\n"
							+ "@media (max-width: 520px) {\r\n"
							+ "  .u-row-container {\r\n"
							+ "    max-width: 100% !important;\r\n"
							+ "    padding-left: 0px !important;\r\n"
							+ "    padding-right: 0px !important;\r\n"
							+ "  }\r\n"
							+ "  .u-row .u-col {\r\n"
							+ "    min-width: 320px !important;\r\n"
							+ "    max-width: 100% !important;\r\n"
							+ "    display: block !important;\r\n"
							+ "  }\r\n"
							+ "  .u-row {\r\n"
							+ "    width: calc(100% - 40px) !important;\r\n"
							+ "  }\r\n"
							+ "  .u-col {\r\n"
							+ "    width: 100% !important;\r\n"
							+ "  }\r\n"
							+ "  .u-col > div {\r\n"
							+ "    margin: 0 auto;\r\n"
							+ "  }\r\n"
							+ "}\r\n"
							+ "body {\r\n"
							+ "  margin: 0;\r\n"
							+ "  padding: 0;\r\n"
							+ "}\r\n"
							+ "\r\n"
							+ "table,\r\n"
							+ "tr,\r\n"
							+ "td {\r\n"
							+ "  vertical-align: top;\r\n"
							+ "  border-collapse: collapse;\r\n"
							+ "}\r\n"
							+ "\r\n"
							+ ".ie-container table,\r\n"
							+ ".mso-container table {\r\n"
							+ "  table-layout: fixed;\r\n"
							+ "}\r\n"
							+ "\r\n"
							+ "* {\r\n"
							+ "  line-height: inherit;\r\n"
							+ "}\r\n"
							+ "\r\n"
							+ "a[x-apple-data-detectors='true'] {\r\n"
							+ "  color: inherit !important;\r\n"
							+ "  text-decoration: none !important;\r\n"
							+ "}\r\n"
							+ "\r\n"
							+ "table, td { color: #000000; } </style>\r\n"
							+ "  \r\n"
							+ "  \r\n"
							+ "\r\n"
							+ "</head>\r\n"
							+ "\r\n"
							+ "<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">\r\n"
							+ "  <!--[if IE]><div class=\"ie-container\"><![endif]-->\r\n"
							+ "  <!--[if mso]><div class=\"mso-container\"><![endif]-->\r\n"
							+ "  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">\r\n"
							+ "  <tbody>\r\n"
							+ "  <tr style=\"vertical-align: top\">\r\n"
							+ "    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\r\n"
							+ "    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->\r\n"
							+ "    \r\n"
							+ "\r\n"
							+ "<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\r\n"
							+ "  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 500px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">\r\n"
							+ "    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color: transparent;\">\r\n"
							+ "      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:500px;\"><tr style=\"background-color: transparent;\"><![endif]-->\r\n"
							+ "      \r\n"
							+ "<!--[if (mso)|(IE)]><td align=\"center\" width=\"500\" style=\"width: 500px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\r\n"
							+ "<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 500px;display: table-cell;vertical-align: top;\">\r\n"
							+ "  <div style=\"width: 100% !important;\">\r\n"
							+ "  <!--[if (!mso)&(!IE)]><!--><div style=\"padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\r\n"
							+ "  \r\n"
							+ "<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n"
							+ "  <tbody>\r\n"
							+ "    <tr>\r\n"
							+ "      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\r\n"
							+ "        \r\n"
							+ "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\r\n"
							+ "  <tr>\r\n"
							+ "    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">\r\n"
							+ "      \r\n"
							+ "      <img align=\"center\" border=\"0\" src=\"https://images.unlayer.com/projects/0/1656680113976-Artboard 1.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>\r\n"
							+ "      \r\n"
							+ "    </td>\r\n"
							+ "  </tr>\r\n"
							+ "</table>\r\n"
							+ "\r\n"
							+ "      </td>\r\n"
							+ "    </tr>\r\n"
							+ "  </tbody>\r\n"
							+ "</table>\r\n"
							+ "\r\n"
							+ "<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n"
							+ "  <tbody>\r\n"
							+ "    <tr>\r\n"
							+ "      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\r\n"
							+ "        \r\n"
							+ "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\r\n"
							+ "  <tr>\r\n"
							+ "    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">\r\n"
							+ "      \r\n"
							+ "      <img align=\"center\" border=\"0\" src=\"https://images.unlayer.com/projects/0/1656680144553-Artboard 2.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>\r\n"
							+ "      \r\n"
							+ "    </td>\r\n"
							+ "  </tr>\r\n"
							+ "</table>\r\n"
							+ "\r\n"
							+ "      </td>\r\n"
							+ "    </tr>\r\n"
							+ "  </tbody>\r\n"
							+ "</table>\r\n"
							+ "\r\n"
							+ "<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n"
							+ "  <tbody>\r\n"
							+ "    <tr>\r\n"
							+ "      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\r\n"
							+ "        \r\n"
							+ "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\r\n"
							+ "  <tr>\r\n"
							+ "    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">\r\n"
							+ "      \r\n"
							+ "      <img align=\"center\" border=\"0\" src=\"https://images.unlayer.com/projects/0/1656680155627-Artboard 3.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>\r\n"
							+ "      \r\n"
							+ "    </td>\r\n"
							+ "  </tr>\r\n"
							+ "</table>\r\n"
							+ "\r\n"
							+ "      </td>\r\n"
							+ "    </tr>\r\n"
							+ "  </tbody>\r\n"
							+ "</table>\r\n"
							+ "\r\n"
							+ "<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n"
							+ "  <tbody>\r\n"
							+ "    <tr>\r\n"
							+ "      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\r\n"
							+ "        \r\n"
							+ "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\r\n"
							+ "  <tr>\r\n"
							+ "    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">\r\n"
							+ "      \r\n"
							+ "      <img align=\"center\" border=\"0\" src=\"https://images.unlayer.com/projects/0/1656680163007-Artboard 4.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>\r\n"
							+ "      \r\n"
							+ "    </td>\r\n"
							+ "  </tr>\r\n"
							+ "</table>\r\n"
							+ "\r\n"
							+ "      </td>\r\n"
							+ "    </tr>\r\n"
							+ "  </tbody>\r\n"
							+ "</table>\r\n"
							+ "\r\n"
							+ "<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n"
							+ "  <tbody>\r\n"
							+ "    <tr>\r\n"
							+ "      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\r\n"
							+ "        \r\n"
							+ "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\r\n"
							+ "  <tr>\r\n"
							+ "    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">\r\n"
							+ "      \r\n"
							+ "      <img align=\"center\" border=\"0\" src=\"https://images.unlayer.com/projects/0/1656680170791-Artboard 5.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>\r\n"
							+ "      \r\n"
							+ "    </td>\r\n"
							+ "  </tr>\r\n"
							+ "</table>\r\n"
							+ "\r\n"
							+ "      </td>\r\n"
							+ "    </tr>\r\n"
							+ "  </tbody>\r\n"
							+ "</table>\r\n"
							+ "\r\n"
							+ "<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n"
							+ "  <tbody>\r\n"
							+ "    <tr>\r\n"
							+ "      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\r\n"
							+ "        \r\n"
							+ "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\r\n"
							+ "  <tr>\r\n"
							+ "    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">\r\n"
							+ "      \r\n"
							+ "      <img align=\"center\" border=\"0\" src=\"https://images.unlayer.com/projects/0/1656680177608-Artboard 6.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>\r\n"
							+ "      \r\n"
							+ "    </td>\r\n"
							+ "  </tr>\r\n"
							+ "</table>\r\n"
							+ "\r\n"
							+ "      </td>\r\n"
							+ "    </tr>\r\n"
							+ "  </tbody>\r\n"
							+ "</table>\r\n"
							+ "\r\n"
							+ "<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n"
							+ "  <tbody>\r\n"
							+ "    <tr>\r\n"
							+ "      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\r\n"
							+ "        \r\n"
							+ "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\r\n"
							+ "  <tr>\r\n"
							+ "    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">\r\n"
							+ "      \r\n"
							+ "      <img align=\"center\" border=\"0\" src=\"https://images.unlayer.com/projects/0/1656680183460-Artboard 7.png\" alt=\"\" title=\"\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 480px;\" width=\"480\"/>\r\n"
							+ "      \r\n"
							+ "    </td>\r\n"
							+ "  </tr>\r\n"
							+ "</table>\r\n"
							+ "\r\n"
							+ "      </td>\r\n"
							+ "    </tr>\r\n"
							+ "  </tbody>\r\n"
							+ "</table>\r\n"
							+ "\r\n"
							+ "  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\r\n"
							+ "  </div>\r\n"
							+ "</div>\r\n"
							+ "<!--[if (mso)|(IE)]></td><![endif]-->\r\n"
							+ "      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\r\n"
							+ "    </div>\r\n"
							+ "  </div>\r\n"
							+ "</div>\r\n"
							+ "\r\n"
							+ "\r\n"
							+ "    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->\r\n"
							+ "    </td>\r\n"
							+ "  </tr>\r\n"
							+ "  </tbody>\r\n"
							+ "  </table>\r\n"
							+ "  <!--[if mso]></div><![endif]-->\r\n"
							+ "  <!--[if IE]></div><![endif]-->\r\n"
							+ "</body>\r\n"
							+ "\r\n"
							+ "</html>\r\n", "text/html");
					
					
					Transport.send(message);
				} catch (MessagingException e) {
					throw new RuntimeException(e);
				}
			
				
				response.sendRedirect(source);
				
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
					message.setSubject("Binome SiteWeb Contact Form");
					message.setText(" From : "+name
						+"\n\n EMAIL :"+email
						+ "\n\n MESSAGE : \n\n  "+msg);
					Transport.send(message);
				} catch (MessagingException e) {
					throw new RuntimeException(e);
				}
				
				response.sendRedirect(source);

				
			}
				
		}else {
			response.sendRedirect(source);

		}
				
	}

}
