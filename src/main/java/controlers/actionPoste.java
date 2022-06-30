package controlers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import dao.categorieDAO;
import dao.posteDAO;
import entities.categorie;
import entities.poste;

/**
 * Servlet implementation class actionPoste
 */
public class actionPoste extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public actionPoste() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	
		HttpSession s = request.getSession();

		
		poste p1 = new poste();
		posteDAO pdao= new posteDAO();

		String source = (String) s.getAttribute("source");
		
		String action = request.getParameter("action");
		
		String type = request.getParameter("type");
		
		int  delete=0;
		
		if(action != null) {	
			
			int id = Integer.parseInt(request.getParameter("id"));
			
			
							
			if(action.equals("Supprimer")) {
				
				  delete = pdao.deletePosteById(id);
				
				s.setAttribute("result", delete);				
				
				request.getRequestDispatcher(source+"?result="+delete).forward(request, response);
				

			}else if(action.equals("Modifier")) {
				
				
				response.sendRedirect("ModifierArticle?id="+id);
				
			}else {
				
				request.getRequestDispatcher(source+"?result="+delete).forward(request, response);
				
			}
			}
		
	
		
	}

}
