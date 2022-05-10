  <%@page import="java.util.*"%>
  <%@page import="java.io.*"%>
        <%@page import="entities.poste"%>
        <%@page import="entities.categorie"%>
        <%@page import="dao.posteDAO"%>
        <%@page import="dao.categorieDAO"%>
        
 <%
 
HttpSession ss = request.getSession();

posteDAO pdao = new posteDAO();

categorieDAO cdao = new categorieDAO();

int po = Integer.parseInt(request.getParameter("p"));

poste poste = pdao.getPosteById(po);


%>
<jsp:include page="navBar.jsp"></jsp:include>


<jsp:include page="header.jsp"></jsp:include>

<div class="pageContainer">

	<div class="container">
		<div class="pageSubject">
			<span>Home</span>
			<span> / </span>
			<span>Blog</span>
			<span> / </span>
			<span>Poste <%=po %></span>
		</div>
		<div class="pageContent">
			<div class="poste" id="poste">
			
				<%
	if(poste != null){	

			byte[] imgdata = null;

						
			int idPoste = poste.getId();
			
			String title =  poste.getTitle();
			
			int nblike = poste.getNbrLike();
			
			int nbcomm = poste.getNbrComments();
			
			 Calendar cal = Calendar.getInstance();
			    cal.setTime(poste.getPublishDate());
			
			int day =  cal.get(Calendar.DAY_OF_MONTH);
			
			String month = null;
			
			int mo =  poste.getPublishDate().getMonth();
			
			month = pdao.getMonth(mo);
			
			String content = poste.getContent(); 
			
			
			byte[] imageBytes=poste.getImage().getBytes(1, (int)poste.getImage().length());
		  	String encodedImage=Base64.getEncoder().encodeToString(imageBytes);
		  	String image = "data:image/jpg;base64,"+encodedImage;
		  	
				%>
				
					<div class="posteImg">
						<img src="<%=image%>">
					</div>
					<div class="posteTitle">
						<h2><%=title%></h2>
					</div>
					<div class="posteContent">
						<%=content %>
					</div>
										
					
					
					
				<%}else{%>
					
					<p style="color:red;">Un error est servenu, Pas de poste pour le moment !</p>
				<% }%>		
			</div>
			<jsp:include page="sideBar.jsp"></jsp:include>
		</div>
	</div>

</div>








<jsp:include page="footer.jsp"></jsp:include>