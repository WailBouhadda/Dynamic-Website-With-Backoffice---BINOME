<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@page import="java.util.*"%>
  <%@page import="java.io.*"%>
        <%@page import="entities.poste"%>
        <%@page import="entities.categorie"%>
        <%@page import="dao.posteDAO"%>
        <%@page import="dao.categorieDAO"%>
        
     <% 
           if(session.getAttribute("admin")==null){
    	response.sendRedirect("adminLogin.jsp");
    	
    	
    }
     
     %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modifier Poste</title>

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
			<h2>Modifier Poste	</h2>
			<div class="boxpack">
			
			 <%
categorieDAO cdao = new categorieDAO();
posteDAO pdao = new posteDAO();						  
						  
int idposte = Integer.parseInt(request.getParameter("id"));
						  
poste p = pdao.getPosteById(idposte);

categorie ca = cdao.getcategorieById(p.getIdCategorie());

ArrayList<categorie> categos = cdao.getcategories();

HttpSession s = request.getSession();





%>
			
			<form action="updateposte" method="post" enctype="multipart/form-data">
			
			<input type="text" name="id" style="display:none" value="<%=idposte%>">
				<div class="blogInfos">
					
					<div class="imgCate">
						<div class="img">
							<label for="blogImage">Image : </label>
							<input type="file" name="blogImage" required>
						</div>
						 <div class="cat">

							 <label for="categorie">Categorie : </label>
								  <select name="categorie" id="categorie" required>
								   <option value="<%=p.getIdCategorie()%>"><%=ca.getNomcategorie() %></option>
								  <%if(categos != null){ 
								  for(int i = 0 ; i < categos.size() ; i++){
										categorie c = new categorie();
										c = categos.get(i);
										
										int idcat = c.getIdcategorie();
										String nomcat = c.getNomcategorie();
								   %>
								    <option value="<%=idcat%>"><%=nomcat %></option>
								  <% }} %>
								  	
								  </select>
						</div>
					</div>
					<div class="posteTitle">
						<label for="blogTitle">Titre : </label>
						<input type="text" name="blogTitle" placeholder="Ajouter un titre ici..." value="<%=p.getTitle() %>" required>
					</div>
					
				</div>
				
				<div class="blogContent">
				
					<textarea name="article" id="article" value="<%=p.getContent() %>" required></textarea>
				
				</div>
				
				<div class="decision">
					<input type="submit" name="decision" value="Valider">
					<input type="button" name="decision" value="Annuler" onclick="location.href='posteListe.jsp';">
				</div>
			
				</form>
	</div>
			</div>
	

	</div>

	
	<!-- admin script -->

	<script src="../js/ckeditor/ckeditor.js"></script>
	
	<script>
		CKEDITOR.replace('article');
	</script>
	<script src="../js/scriptBO.js"></script>

	<!-- admin script -->
	
</body>
</html>