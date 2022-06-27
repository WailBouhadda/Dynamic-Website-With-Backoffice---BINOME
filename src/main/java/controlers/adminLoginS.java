package controlers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		String email = request.getParameter("email");
	
		String pass= request.getParameter("password");
	
			admin adm = adao.adminLogin(email,pass);
			
		if(adm != null) {
			
			HttpSession session=request.getSession();
			session.setAttribute("admin", adm);
			
			
			
			
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
