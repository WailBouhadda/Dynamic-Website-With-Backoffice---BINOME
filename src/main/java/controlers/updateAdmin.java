package controlers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		admin ad = new admin();
		
		String action = request.getParameter("Modifier");
		
		int result = 0;
		
		
		
		if(action.equals("ModifierUE") & a != null) {
			
			String email = request.getParameter("email");
			ad.setEmail(email);
			String username = request.getParameter("username");
			ad.setUsername(username);
			String password = request.getParameter("password");
			ad.setPassword(password);
			
			
				if(password.equals(a.getPassword())) {
					
					result = adao.updateUserEmail(ad, a.getUsername());
					
					a.setEmail(email);
					a.setUsername(username);
					
					s.setAttribute("admin", a);
					
					request.getRequestDispatcher("Profile?result="+result).forward(request, response);
					
						
					
				}else {
					
					result = -1;
					
					request.getRequestDispatcher("Profile?result="+result).forward(request, response);
					
					
				}
			
			
		}else if(action.equals("ModifierMDP") & a != null) {
		
		String Apass = request.getParameter("Apassword");
		String Npass = request.getParameter("Npassword");
		String Cpass = request.getParameter("CNpassword");
		
		
			if(Apass.equals(a.getPassword()) & Npass.equals(Cpass)) {
				
				result = adao.updatepassword(Npass, a.getUsername());
				
				a.setPassword(Npass);
				
				s.setAttribute("admin", a);
				
				request.getRequestDispatcher("Profile?result="+result).forward(request, response);
			}else {
				
				result = -1;
				
				request.getRequestDispatcher("Profile?result="+result).forward(request, response);
				
				
			}
			
		}else {
			
			result = -1;
			
			request.getRequestDispatcher("Profile?result="+result).forward(request, response);
			
			
		}
		
		
	

}
}
