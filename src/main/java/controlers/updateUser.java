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
 * Servlet implementation class updateUser
 */
public class updateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
HttpSession s = request.getSession();

		
		User u = new User();
		UserDao udao = new UserDao();

		String source = (String) s.getAttribute("source");
		
		String action = request.getParameter("action");
		
		
		int  delete=0;
		
		if(action != null) {	
			
			
			
							
			if(action.equals("Modifier")) {
				
				int res = 0;
				
				int id = Integer.parseInt(request.getParameter("id"));
				u.setIdUser(id);
				
				String nom = request.getParameter("nom");
				u.setNom(nom);
				
				String prenom = request.getParameter("prenom");
				u.setPrenom(prenom);
				
				String email = request.getParameter("email");
				u.setEmail(email);
				
				String tele = request.getParameter("tele");
				u.setTelephone(tele);
				
				try {
					res = udao.updateUser(u);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					res =-1;
				}
				
				request.getRequestDispatcher("Utilisateurs.jsp?result="+res).forward(request, response);
				
								

			}
		
	}

	}}
