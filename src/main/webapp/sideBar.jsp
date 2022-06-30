  <%@page import="java.util.*"%>
  <%@page import="java.io.*"%>
        <%@page import="entities.poste"%>
        <%@page import="entities.categorie"%>
        <%@page import="dao.posteDAO"%>
        <%@page import="dao.categorieDAO"%>
        

<!--Start sidebar -->

	<div class=sideBar>
		<div class="sideSearch">
			<input type="text" placeholder="Rechercher..." id="SBI">
			<i class="fa-solid fa-magnifying-glass"></i>
			<ul class="sidesearchNC" id="SBul">
							<li style="display:none;" ><a href="Biographie">BIOGRAPHIE</a></li>
							<li style="display:none;"><a href="SavoirFaire">SAVOIR FAIRE</a></li>
							<li style="display:none;"><a href="Home#services">NOS SERVICES</a></li>
							<li style="display:none;"><a href="EspaceClient">ESPACE CLIENT</a></li>
							<li style="display:none;"><a href="Recrutement">RECRUTEMENT</a></li>
							<li style="display:none;"><a href="Recrutement">OFFRES EMPLOI</a></li>
							<li style="display:none;"><a href="Recrutement">DEPOSER CV</a></li>
							<li style="display:none;"><a href="Home#nosReferences">NOS REFERENCES</a></li>
							<li style="display:none;"><a href="Formations">FORMATION</a></li>
							<li style="display:none;"><a href="Formations">GESTION DU QUOTIDIEN</a></li>
							<li style="display:none;"><a href="Formations">DEVELOPPEMENT PERSONNEL</a></li>
							<li style="display:none;"><a href="Formations">BINOME ASSISTANTE / MANAGER</a></li>
							<li style="display:none;"><a href="Blog">BLOG</a></li>
							<li style="display:none;"><a href="Home#contact">CONTACT</a></li>
							<li style="display:none;"><a href="Home#cabinetBinome">CABINET BINOME</a></i>
						</ul>
		</div>
		<div class="postRecent">
			<div class="sideTitle">
				<h2>ARTICLES RÉCENTS</h2>
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
		
		int size = 0; 
		
		if(postes.size() > 5){
			
			size = 5;
		}else{
			size = postes.size();
		}
		
		
		for(int i = 0 ; i < size ; i++) {	

			byte[] imgdata = null;

			
			poste p = new poste();
			p = postes.get(i);
			
			int idPoste = p.getId();

			
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
				
					<a href="Article?p=<%=idPoste%>">
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
				<p style="color:red;"><i style="margin-right:10px;" class="fa-solid fa-triangle-exclamation"></i>UNE ERREUR EST SURVENUE, PAS D'ARTICLE POUR LE MOMENT </p>
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
										
										int idcategorie = c.getIdcategorie();
										String nomcat = c.getNomcategorie();
			%>
				<a href="Categorie?c=<%=idcategorie%>">
					<div class="categorie">
						<i class="fa-solid fa-hashtag"></i>
						<p><%=nomcat%><p>
					</div>
				</a>
			<%}}else{ %>
					<p style="color:red;"><i style="margin-right:10px;" class="fa-solid fa-triangle-exclamation"></i>UNE ERREUR EST SURVENUE</p>
			<%} %>
			</div>
		</div>
		
	</div>

<!--End sidebar -->
