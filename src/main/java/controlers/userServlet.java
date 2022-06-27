package controlers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import dao.UserDao;
import entities.User;

/**
 * Servlet implementation class userServlet
 */
public class userServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		
		HttpSession s = request.getSession();

		
		User u = new User();
		UserDao udao = new UserDao();

		String source = (String) s.getAttribute("source");
		
		String action = request.getParameter("action");
		
		
		int  delete=0;
		
		if(action != null) {	
			
			
			
							
			if(action.equals("Supprimer")) {
				
				int id = Integer.parseInt(request.getParameter("id"));

				
				  try {
					delete = udao.deleteUser(id);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					delete = -1;
				}
				
				s.setAttribute("result", delete);				
				
				request.getRequestDispatcher(source+"?result="+delete).forward(request, response);
				

			}else if(action.equals("Modifier")) {
				
				
				
				int id = Integer.parseInt(request.getParameter("id"));

				response.sendRedirect("updateUser.jsp?id="+id);
				
				
				
			}else if(action.equals("Ajouter")){
				
				
				int res = 0;
				
					String nom = request.getParameter("nom");
					u.setNom(nom);
					
					String prenom = request.getParameter("prenom");
					u.setPrenom(prenom);
					
					String email = request.getParameter("email");
					u.setEmail(email);
					
					String tele = request.getParameter("tele");
					u.setTelephone(tele);
					
					try {
						res = udao.insertUser(u);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						res =-1;
					}
					
					request.getRequestDispatcher(source+"?result="+res).forward(request, response);
				
			}
			
			}else {
				
				int res = -1;
				request.getRequestDispatcher(source+"?result="+res).forward(request, response);
			}
		
	
		
		
		
		// TODO Auto-generated method stub
	}

}
