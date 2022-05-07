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



%>
 
			<div class="posts">
		<%
		for(int i = 0 ; i < postes.size() ; i++) {	

			byte[] imgdata = null;

			
			poste p = new poste();
			p = postes.get(i);
			
			String title =  p.getTitle();
			
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
								<span><i class="fa-solid fa-calendar-days"></i><p>Jan 10, 2022</p></span>
								<h5><%=title %></h5>
								<span><i class="fa-solid fa-user"></i><p>Admin</p></span>
							</div>
						</div>
					</a>
			<% } %>
			</div>
			<div class="sideTitle">
				<h2>CATEGORIE</h2>
			</div>
			<div class="categories">
				<a href="#">
					<div class="categorie">
						<i class="fa-solid fa-hashtag"></i>
						<p>Categorie 1<p>
					</div>
				</a>
			</div>
		</div>
		
	</div>

<!--End sidebar -->
