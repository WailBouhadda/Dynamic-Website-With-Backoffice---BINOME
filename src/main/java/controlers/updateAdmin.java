package controlers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.adminDAO;
import entities.admin;

/**
 * Servlet implementation class updateAdmin
 */
public class updateAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession s = request.getSession();
		
		adminDAO adao = new adminDAO();
		
		admin a = (admin)s.getAttribute("admin");
		
		
		String action = request.getParameter("Modifier");
		
		int result = 0;
		
		if(action.equals("ModifierUE")) {
			
			String email = request.getParameter("email");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			if(a.getPassword().equals(password)) {
				
				result = adao.updateUserEmail(a, username);
				
				request.getRequestDispatcher("Profile.jsp?result="+result).forward(request, response);

				
			}else {
				
				request.getRequestDispatcher("Profile.jsp?result="+result).forward(request, response);

				
			}
			
			
		}
		
		
	}

}
