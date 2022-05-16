package controlers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
				s.setAttribute("action", "dislike");
				
				
			}
			else if (action.equals("dislike")){
				
				pdao.like(po);
				s.setAttribute("action", "like");

			}
			
		}
		
		
		
		response.sendRedirect("poste.jsp?p="+po);
		
		
		
		
	}

}
