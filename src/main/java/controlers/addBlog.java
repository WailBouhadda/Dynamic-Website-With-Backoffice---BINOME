package controlers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import tools.DBconnection;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Servlet implementation class addBlog
 */

@MultipartConfig
public class addBlog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addBlog() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Part blogImage = request.getPart("blogImage");
		
		String imageFileName = blogImage.getSubmittedFileName();
		
		Statement st;
		
		
		
		
		

		
		
		
		
		
		
		PrintWriter out = response.getWriter();
		
		
		InputStream is = null;
		
		 if (blogImage != null) {
			  
	            // Prints out some information
	            // for debugging
	            System.out.println(
	            		blogImage.getName());
	            System.out.println(
	            		blogImage.getSize());
	            System.out.println(
	            		blogImage.getContentType());
	  
	            // Obtains input stream of the upload file
	    		 is = blogImage.getInputStream();
	        }
	  
	        // Sends the statement to the
	        // database server
		 try {
				st = DBconnection.connect().createStatement();
				
				st.executeUpdate("insert into blogimages values("+is+")");
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		
		
		
		
		
		
	}

}
