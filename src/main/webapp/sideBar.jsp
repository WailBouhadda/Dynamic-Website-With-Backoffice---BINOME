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
		for(int i = 0 ; i < 4 ; i++) {	

			byte[] imgdata = null;

			
			poste p = new poste();
			p = postes.get(i);
			
			String title =  p.getTitle();
			
			int day = p.getPublishDate().getDay();
			
			String month = null;
			
			int mo =  p.getPublishDate().getMonth();
			
			int year =  p.getPublishDate().getYear() + 1900;
			
			switch(mo){
			case 0:
				month = "Jan";
				break;
			case 1:
				month = "Fev";
				break;
			case 2:
				month = "Mar";
				break;
			case 3:
				month = "Avr";
				break;
			case 4:
				month = "Mai";
				break;
			case 5:
				month = "Jun";
				break;
			case 6:
				month = "Jul";
				break;
			case 7:
				month = "Aou";
				break;
			case 8:
				month = "Sep";
				break;
			case 9:
				month = "Oct";
				break;
			case 10:
				month = "Nov";
				break;
			case 11:
				month = "Dec";
				break;
			 default:
				 month = "";
				
			}
			
			
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
			<% } %>
			</div>
			<div class="sideTitle">
				<h2>CATEGORIE</h2>
			</div>
			<div class="categories">
			<% for(int i = 0 ; i < categos.size() ; i++){
										categorie c = new categorie();
										c = categos.get(i);
										
										int idcat = c.getIdcategorie();
										String nomcat = c.getNomcategorie();
			%>
				<a href="#">
					<div class="categorie">
						<i class="fa-solid fa-hashtag"></i>
						<p><%=nomcat %><p>
					</div>
				</a>
			<%} %>
			</div>
		</div>
		
	</div>

<!--End sidebar -->
