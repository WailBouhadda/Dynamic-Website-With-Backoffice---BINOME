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
 * Servlet implementation class actionCategorie
 */
public class actionCategorie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public actionCategorie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	

		HttpSession s = request.getSession();

		categorie c1 = new categorie();
		categorieDAO cdao = new categorieDAO();
		
		String source = (String) s.getAttribute("source");
		
		String action = request.getParameter("action");
				
		int result = 0;
		
		if(action != null) {	
			
			int id = Integer.parseInt(request.getParameter("id"));
			
			if(action.equals("Supprimer")) {
				
				int  delete = cdao.deleteCategorieById(id);
				
				s.setAttribute("result", delete);
				
				result = delete;
				
				request.getRequestDispatcher(source+"?result="+result).forward(request, response);
				

			}else{
				
				response.sendRedirect(source);
				
			}
		}
	
	}

}
