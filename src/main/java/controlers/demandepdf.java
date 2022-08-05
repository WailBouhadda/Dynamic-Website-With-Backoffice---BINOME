package controlers;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.offreDAO;
import entities.Demande;
import entities.offre;

/**
 * Servlet implementation class demandepdf
 */
public class demandepdf extends HttpServlet {
	
	private static final int BUFFER_SIZE = 4096;

	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public demandepdf() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	
		int result = 0;
		
		InputStream input = null;
	    FileOutputStream output = null;
		
		
		if(request.getParameter("id") != null) {
			
			int id  = Integer.parseInt(request.getParameter("id"));

			
			offreDAO odao = new offreDAO();
			
			Demande o = odao.getedemandeById(id);
			
			
		    String fileName = o.getEmail()+".pdf";
            Blob blob =  o.getCv();
            InputStream inputStream = null;
			try {
				inputStream = blob.getBinaryStream();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            int fileLength = inputStream.available();
             

            ServletContext context = getServletContext();

            // sets MIME type for the file download
            String mimeType = context.getMimeType(fileName);
            if (mimeType == null) {        
                mimeType = "application/octet-stream";
            }              
             
            // set content properties and header attributes for the response
            response.setContentType(mimeType);
            response.setContentLength(fileLength);
            String headerKey = "Content-Disposition";
            String headerValue = String.format("attachment; filename=\"%s\"", fileName);
            response.setHeader(headerKey, headerValue);

            // writes the file to the client
            OutputStream outStream = response.getOutputStream();
             
            byte[] buffer = new byte[BUFFER_SIZE];
            int bytesRead = -1;
             
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outStream.write(buffer, 0, bytesRead);
            }
             
            inputStream.close();
            outStream.close();     
            
            result = 1;
            
  			response.sendRedirect("OffresEmploi?Result="+result);

              
		}else {
			
			result = -1;
			
			response.sendRedirect("OffresEmploi?Result="+result);
		}
		
		
		
	
	}

}