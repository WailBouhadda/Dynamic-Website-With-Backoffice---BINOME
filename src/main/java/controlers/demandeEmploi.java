package controlers;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.offreDAO;
import entities.Demande;
import entities.offre;

/**
 * Servlet implementation class demandeEmploi
 */
@MultipartConfig


public class demandeEmploi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public demandeEmploi() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		HttpSession s = request.getSession();

		
		InputStream is = null;	
		
		
		Demande o = new Demande();
		
		offreDAO odao = new offreDAO();
		
		String action = request.getParameter("action");
		
		
		
		if(action.equals("AJOUTER")) {
			
			
			
			Part pdf = request.getPart("demandepdf");
			
			if( pdf != null) {
			is = pdf.getInputStream();
			o.setCvis(is);	
			}
			
			String nom =request.getParameter("nom");
			o.setNom(nom);
			
			String prenom = request.getParameter("prenom");
			o.setPrenom(prenom);
			
			String email = request.getParameter("email");
			o.setEmail(email);
			
			
			
			
			
			 odao.adddemande(o);
			
			request.getRequestDispatcher("Recrutement").forward(request, response);
			

		}else {
			
		
			request.getRequestDispatcher("Recrutement").forward(request, response);
		}
	
		
		
		
	}

}
