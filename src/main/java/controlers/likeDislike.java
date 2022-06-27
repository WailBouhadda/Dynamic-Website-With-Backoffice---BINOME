package controlers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import dao.posteDAO;

/**
 * Servlet implementation class likeDislike
 */
public class likeDislike extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public likeDislike() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession s = request.getSession();
		posteDAO pdao = new posteDAO();
		
		int po = Integer.parseInt(request.getParameter("p"));
		String action =  request.getParameter("a");
		
		if(action != null) {
			if(action.equals("like")) {
				
				pdao.disLike(po);
				
				request.setAttribute("action", "dislike");
				
				request.getRequestDispatcher("poste.jsp?p="+po).forward(request, response);

				
			}
			else if (action.equals("dislike")){
				
				pdao.like(po);
			

				request.setAttribute("action", "like");
				
				request.getRequestDispatcher("poste.jsp?p="+po).forward(request, response);
				
			}
			
		}else {
			
			response.sendRedirect("poste.jsp?p="+po);

			
		}
		
		
		
		
		
		
		
	}

}
