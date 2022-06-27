package controlers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.commentDAO;
import entities.comment;

/**
 * Servlet implementation class addComment
 */
public class addComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addComment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		comment c1 = new comment();
		commentDAO c1dao = new commentDAO();
		
		String action = request.getParameter("addcomment");
		
		int idposte = Integer.parseInt(request.getParameter("idp"));
		c1.setIdPoste(idposte);
		
		String name = request.getParameter("ownerName");
		c1.setOwner(name);
		
		String email = request.getParameter("ownerEmail");
		c1.setEmail(email);
		
		String comment = request.getParameter("comment");
		c1.setComment(comment);
		
		if(action != null) {
		
		c1dao.addComment(c1);
		response.sendRedirect("poste.jsp?p="+idposte);
		
		
		}
	}

}
