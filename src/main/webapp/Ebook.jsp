  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="java.util.*"%>
  <%@page import="java.io.*"%>
  <%@page import="dao.posteDAO"%>
           <%@page import="entities.ebook"%>
         <%@page import="dao.ebookDAO"%>
          <%@page import="dao.offreDAO"%>
           <%@page import="entities.User"%>
         <%@page import="entities.offre"%>
         <%@page import="nl.siegmann.epublib.epub.EpubReader"%>
         <%@page import="nl.siegmann.epublib.epub.EpubWriter"%>
       
<jsp:include page="navBar.jsp"></jsp:include>
<%


HttpSession s = request.getSession();

s.setAttribute("source", "EspaceClient");

 
posteDAO pdao = new posteDAO();

ebookDAO ebdao = new ebookDAO();




ArrayList<ebook> ebooks = ebdao.getEbooks();


%>



<jsp:include page="header.jsp"></jsp:include>

<div class="pageContainer">

	<div class="container">
		<div class="pageSubject">
			<span>Home</span>
			<span> / </span>
			<span>Espace client</span>
		</div>
		<div class="pageContent">
			<div class="blog" id="blog">
				<div class="espaceclient">
				
				
				
				<% 
					
				if(session.getAttribute("user") == null){
					
					response.sendRedirect("EspaceClient");
				
				%>
					
					<%}else{
						
						
				User u = (User)session.getAttribute("user");
						
						String nom = u.getNom();
						String prenom = u.getPrenom();
									
				%>
				
						<div class=userprofile>
					<div class="UNP">
							<span>Bonjour </span>
							<span><%=prenom %></span>
							<span><%=nom %></span>
					</div>
					<button onclick="window.location.href='Deconnection'">SE DECONNECTER</button>
				</div>	
				
				
				
				<% 
						
				int ide = Integer.parseInt(request.getParameter("e"));
									
				
							
				if(ebdao.getEbookById(ide) != null){			
					
					ebook e = ebdao.getEbookById(ide);
			
						byte[] imgdata = null;
						
					
						
						int idoffre = e.getIdEbook();
						
						String title =  e.getTitle();
										
						
						
						
						 Calendar cal = Calendar.getInstance();
						    cal.setTime(e.getDatePubli());
						
						int day =  cal.get(Calendar.DAY_OF_MONTH);
						
						String month = null;
						
						int mo =  e.getDatePubli().getMonth();
						
						int year =  e.getDatePubli().getYear() + 1900;
						
						month = pdao.getMonth(mo);
						
						
						byte[] ebookdata = null;
						
						byte[] ebookBytes=e.getEbook().getBytes(1, (int)e.getEbook().length());
					  	String encodedEbook=Base64.getEncoder().encodeToString(ebookBytes);
					  	String ebook = "data:application/pdf;base64,"+encodedEbook;;
						
					
					%>
				
					<h2 style="margin-top:30px; margin-bottom: 30px;"><%=title %></h2>
					
					
				
					<div style="width:100%; height: 900px;">

						<iframe src="<%=ebook %>#toolbar=0"   style="width:100%; height: 100%;" ></iframe>


					</div>
				

				
				
					<%}else{%>
					
					<p style="color:red;"><i style="margin-right:10px;" class="fa-solid fa-triangle-exclamation"></i>UNE ERREUR EST SURVENUE, PAS D'EBOOK POUR LE MOMENT</p>
					
					<%}} %>
				
	
			
				</div>
			</div>
			<jsp:include page="sideBar.jsp"></jsp:include>
		</div>
	</div>

</div>







<jsp:include page="footer.jsp"></jsp:include>




