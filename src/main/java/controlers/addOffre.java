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
import entities.offre;

/**
 * Servlet implementation class addOffre
 */
@MultipartConfig
public class addOffre extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addOffre() {
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
		
		int result = 0;
		
		offre o = new offre();
		
		offreDAO odao = new offreDAO();
		
		String action = request.getParameter("action");
		
		
		
		if(action.equals("AJOUTER")) {
			
			
			
			Part pdf = request.getPart("offrepdf");
			
			if( pdf != null) {
			is = pdf.getInputStream();
			o.setPdfis(is);	
			}
			
			String titre =request.getParameter("titre");
			o.setTitre(titre);
			
			String details = request.getParameter("details");
			o.setDetails(details);
			
			String local = request.getParameter("local");
			o.setLocal(local);
			
			
			
			
			
			result = odao.addoffre(o);
			
			request.getRequestDispatcher("offresEmplois.jsp?result="+result).forward(request, response);
			
		}else if(action.equals("Supprimer")){
			
			
			int idoffre = Integer.parseInt(request.getParameter("id"));
			
			result = odao.deleteOffreById(idoffre);
			
			request.getRequestDispatcher("offresEmplois.jsp?result="+result).forward(request, response);
			

		}else {
			
			result = -1;
			request.getRequestDispatcher("offresEmplois.jsp?result="+result).forward(request, response);
		}
	

	
		
		
	}

}
