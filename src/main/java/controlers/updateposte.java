package controlers;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;

import dao.categorieDAO;
import dao.posteDAO;
import entities.categorie;
import entities.poste;

/**
 * Servlet implementation class updateposte
 */



@MultipartConfig
public class updateposte extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateposte() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
HttpSession s = request.getSession();

		
		InputStream is = null;	
		
		int result = 0;
		
		poste p1 = new poste();
		posteDAO pdao= new posteDAO();
		
		categorie c1 = new categorie();
		categorieDAO cdao = new categorieDAO();
		
		String decision = request.getParameter("decision");
		

		
		int id = Integer.parseInt(request.getParameter("id"));
		
		
		if(decision != null) {
			
			
			if(decision.equals("Valider")) {
				
				
		
				
				Part blogImage = request.getPart("blogImage");
				
				
				if( request.getPart("blogImage") != null) {
					
					
					p1.setId(id);	
					is = blogImage.getInputStream();
					p1.setImageis(is);	
					
					int idcategorie = Integer.parseInt(request.getParameter("categorie"));
					p1.setIdCategorie(idcategorie);
					
					String title = request.getParameter("blogTitle");
					p1.setTitle(title);
					
					String content = request.getParameter("article");
					p1.setContent(content);
					
					
	
					result = pdao.updatePoste(p1);
					
					request.getRequestDispatcher("posteListe.jsp?result="+result).forward(request, response);
					
				
				}
				
			
		
			
				
			}else {
			

				
				result = 0;
				request.getRequestDispatcher("updatePoste.jsp?result="+result).forward(request, response);

			}
		
}else {
			
	
			result = -1;
			request.getRequestDispatcher("updatePoste.jsp?result="+result).forward(request, response);

}		
	
		
	}

}

