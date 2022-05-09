  <%@page import="java.util.*"%>
  <%@page import="java.io.*"%>
        <%@page import="entities.poste"%>
        <%@page import="entities.categorie"%>
        <%@page import="dao.posteDAO"%>
        <%@page import="dao.categorieDAO"%>
        

<!--Start sidebar -->

	<div class=sideBar>
		<div class="sideSearch">
			<input type="text" placeholder="Search...">
			<i class="fa-solid fa-magnifying-glass"></i>
		</div>
		<div class="postRecent">
			<div class="sideTitle">
				<h2>POST RÉCENT</h2>
			</div>
			<% 		      
HttpSession ss = request.getSession();

posteDAO pdao = new posteDAO();

categorieDAO cdao = new categorieDAO();

ArrayList<poste> postes = pdao.getPostes();

ArrayList<categorie> categos = cdao.getcategories();



%>
 
			<div class="posts">
		<%
	if(postes != null){	
		for(int i = 0 ; i < postes.size() ; i++) {	

			byte[] imgdata = null;

			
			poste p = new poste();
			p = postes.get(i);
			
			String title =  p.getTitle();
			
			
			 Calendar cal = Calendar.getInstance();
			    cal.setTime(p.getPublishDate());
			
			int day =  cal.get(Calendar.DAY_OF_MONTH);
			
			String month = null;
			
			int mo =  p.getPublishDate().getMonth();
			
			int year =  p.getPublishDate().getYear() + 1900;
			
			month = pdao.getMonth(mo);
			
			String content = p.getContent(); 
			
			byte[] imageBytes=p.getImage().getBytes(1, (int)p.getImage().length());
		  	String encodedImage=Base64.getEncoder().encodeToString(imageBytes);
		  	String image = "data:image/jpg;base64,"+encodedImage;
		  	
		%>
				
					<a href="#">
						<div class="post">
							<div class="image">
								<img src="<%=image%>">
							</div>
							<div class="postInfo">
								<span><i class="fa-solid fa-calendar-days"></i><p><%=month %> <%=day %>, <%=year %></p></span>
								<h5><%=title %></h5>
								<span><i class="fa-solid fa-user"></i><p>Admin</p></span>
							</div>
						</div>
					</a>
			<% }}else{ %>
				<p style="color:red;">Un error est servenu, Pas de poste pour le moment !</p>
			<%} %>
			</div>
			<div class="sideTitle">
				<h2>CATEGORIE</h2>
			</div>
			<div class="categories">
			<%
		if(categos != null){	
			for(int i = 0 ; i < categos.size() ; i++){
										categorie c = new categorie();
										c = categos.get(i);
										
										String nomcat = c.getNomcategorie();
			%>
				<a href="#">
					<div class="categorie">
						<i class="fa-solid fa-hashtag"></i>
						<p><%=nomcat%><p>
					</div>
				</a>
			<%}}else{ %>
					<p style="color:red;">Un error est servenu, Pas de poste pour le moment !</p>
			<%} %>
			</div>
		</div>
		
	</div>

<!--End sidebar -->
