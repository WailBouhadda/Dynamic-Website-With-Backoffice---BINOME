package controlers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.adminDAO;
import entities.admin;



/**
 * 
 * Servlet implementation class adminLogin
 */
public class adminLoginS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminLoginS()  {
        super();
        // TODO Auto-generated constructor stub
    }

    
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
			
			HttpSession session=request.getSession();
			session.setAttribute("login", pass);
			session.setAttribute("user", user);
			
			
			
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
