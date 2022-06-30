package controlers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import dao.adminDAO;
import entities.User;
import entities.admin;

/**
 * Servlet implementation class userLogin
 */

public class userLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		UserDao adao = new UserDao();
		User u = new User();
		
		String LoginFailed = "";
		
		String email = request.getParameter("email");
	
		String pass= request.getParameter("password");
	
			User user = adao.userLogin(email,pass);
			
		if(user != null) {
			
			HttpSession session=request.getSession();
			session.setAttribute("user", user);
			
			
			
			
			response.sendRedirect("EspaceClient");
			LoginFailed = "false";
			request.setAttribute("Failed", LoginFailed);
			

		}else {
		
			LoginFailed = "true";
			
			request.setAttribute("Failed", LoginFailed);
			request.getRequestDispatcher("EspaceClient").forward(request, response);

		}
		
		
		
		
		
	}

}
