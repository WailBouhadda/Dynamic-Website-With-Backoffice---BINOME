package controlers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.adminDAO;
import entities.admin;

/**
 * Servlet implementation class adminLogin
 */
public class adminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		adminDAO adao = new adminDAO();
		admin a = new admin();
		String LoginFailed = "";
		
		String user = request.getParameter("username");
		a.setUsername(user);
		String pass= request.getParameter("password");
		a.setPassword(pass);
			
		if(adao.adminLogin(a)) {
			
			response.sendRedirect("Dashboard.jsp");
			LoginFailed = "false";
			request.setAttribute("Failed", LoginFailed);

		}else {
		
			LoginFailed = "true";
			
			request.setAttribute("Failed", LoginFailed);
			request.getRequestDispatcher("adminLogin.jsp").forward(request, response);

		}
		
	}

}
