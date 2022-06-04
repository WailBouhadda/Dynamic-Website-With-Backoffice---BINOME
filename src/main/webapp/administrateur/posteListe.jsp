<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@page import="java.util.*"%>
  		<%@page import="java.io.*"%>
        <%@page import="entities.poste"%>
        <%@page import="entities.categorie"%>
        <%@page import="dao.posteDAO"%>
        <%@page import="dao.categorieDAO"%>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
 
HttpSession s = request.getSession();

s.setAttribute("source", "posteListe.jsp");

posteDAO pdao = new posteDAO();

categorieDAO cdao = new categorieDAO();

ArrayList<poste> postes = pdao.getPostes();

ArrayList<categorie> categos = cdao.getcategories();

%>

    <!-- Style File -->
		
	<link rel="stylesheet" href="../css/styleBO.css">

	<!-- Style File -->
	

    <!-- FontAwseme icons -->
    <meta name="description" content="particles.js is a lightweight JavaScript library for creating particles.">
  	<meta name="author" content="Vincent Garreau" />
  	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <script src="https://kit.fontawesome.com/e2991dfebd.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet"> 
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;600;800&family=Fredoka:wght@300;400;500;600&family=Noto+Sans:wght@400;700&display=swap" rel="stylesheet">
    <!-- FontAwseme icons -->




</head>
<body>


<div class="container" >

		<jsp:include page="adminSideBar.jsp"></jsp:include>
		
		
			<div class="content" id="content">
			
				<div class="posteTable">
				<h2>POSTE</h2>
					
					<div class="filter"><input id="filterPoste" type="text" name="search" placeholder="Search ..."> <i class="fa-solid fa-magnifying-glass"></i></div>
					
					<table class="table" id="tablePoste">
					<thead>
					
					<tr>
					<th>ID</th>
					<th>TITRE</th>
					<th>DATE DE PUBLICATION</th>
					<th>NB J'AIME</th>
					<th>NB COMMENTAIRE</th>
					<th>CATEGORIE</th>
					</tr>
					
					</thead>
					
					<tbody>
					
				
					<%
		if(postes != null){			
			for(int i = 0 ; i < postes.size() ; i++) {	
	
				
				poste p = new poste();
				p = postes.get(i);
				
				int idPoste = p.getId();
				
				String title =  p.getTitle();
				
				int nblike = p.getNbrLike();
				
				int nbcomm = p.getNbrComments();
				
				int idcat = p.getIdCategorie();
				
				categorie c = cdao.getcategorieById(idcat);

				String nomcat = c.getNomcategorie();
				
				
				int day = p.getPublishDate().getDay();
				
				String month = null;
				
				int mo =  p.getPublishDate().getMonth();
				
				int year =  p.getPublishDate().getYear() + 1900;
				
				month = pdao.getMonth(mo);
				
	 
			  	
					%>
					
					
						<tr class="<%=idPoste%>"> 
						<form action="actionPoste" method="get">
						
						<td><input class="<%=idPoste%>" type="text" name="id" value="<%=idPoste%>" readonly></td>
						<td><input class="<%=idPoste%>" type="text" name="title" value="<%=title%>" disabled></td>
						<td><input class="<%=idPoste%>" type="text" name="date" value="<%=day%>,<%=month%> <%=year%>" disabled></td> 
						<td><input class="<%=idPoste%>" type="text" name="nblike" value="<%=nblike%>" disabled></td> 
						<td><input class="<%=idPoste%>" type="text" name="nbcomment" value="<%=nbcomm%>" disabled></td>
						<td><input class="<%=idPoste%>" type="text" name="categorie" value="<%=nomcat%>" disabled></td>
						<td class="action"><input  class="<%=idPoste%>" id="supprimer" type="submit" name="action" value="Supprimer"><input class="<%=idPoste%>" id="modifier" type="submit" name="action" value="Modifier"></td>
						</form>
						</tr>
						
						<%}}else{ %>
							<p style="color:red;">Un error est servenu, Pas de poste pour le moment !</p>
						<%} %>
						</tbody>
						</table>
				</div>
				<div class="categorieTable">
					<h2>CATEGORIE</h2>
					<div class="cat">
					<div class="catFilt">
					
					
					
						<div class="filter"><input id="filterCategorie" type="text" name="search" placeholder="Search ..."> <i class="fa-solid fa-magnifying-glass"></i></div>
						
					
						<table class="table" id="tableCategorie">
						<thead>
						
						<tr>
						<th>ID</th>
						<th>CATEGORIE</th>
						<th>NB POSTES</th>
						</tr>
						
						</thead>
						
						<tbody>
						
					
						<% 
						if(categos != null){		
						for(int i = 0 ; i < categos.size() ; i++){
											categorie c = new categorie();
											c = categos.get(i);
											
											int idcat = c.getIdcategorie();
											String nomcat = c.getNomcategorie();
											
											ArrayList<poste> po = pdao.getPostesByIdCategorie(idcat);
											
											int nbposte = po.size();
											
						%>
						<tr class="<%=idcat%>"> 
							<form action="actionCategorie" method="get">
							
							<td><input class="<%=idcat%>" type="text" name="id" value="<%=idcat%>" readonly></td>
							<td><input class="<%=idcat%>" type="text" name="title" value="<%=nomcat%>" disabled></td>
							<td><input class="<%=idcat%>" type="text" name="nbpostes" value="<%=nbposte%>" disabled></td>
							<td class="action"><input  class="<%=idcat%>" id="supprimer" type="submit" name="action" value="Supprimer"></td>
							</form>
						
						</tr>
						<%}}else{ %>
								<p style="color:red;">Un error est servenu, Pas de categorie pour le moment !</p>
						<%} %>
						</tbody>
						</table>
					</div>	
					<div class="addCate">
						<form  action="addBlog" method="post" enctype="multipart/form-data">
							<div class="addcategorie" >
								<label for="addcat">Ajouter categorie : </label>
								<input type="text" name="addcat" placeholder="Ajouter une categorie...">
								<input type="submit" name="decision" value="Ajouter">
							</div>
						</form>
										
						
					</div>
					</div>
				</div>
			</div>
</div>	


		<script src="../js/scriptBO.js"></script>


</body>
</html>