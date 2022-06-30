<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@page import="java.util.*"%>
  		<%@page import="java.io.*"%>
        <%@page import="entities.comment"%>
        <%@page import="dao.commentDAO"%>
        <%@page import="entities.poste"%>
        <%@page import="entities.categorie"%>
        <%@page import="entities.comment"%>
        <%@page import="dao.posteDAO"%>
        <%@page import="dao.commentDAO"%>
        <%@page import="dao.categorieDAO"%>
        
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Tableau de board</title>
	
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




   <%
    if(session.getAttribute("admin")==null){
    	response.sendRedirect("Login");
    	
    	
    }
 
 
commentDAO cmdao = new commentDAO();

ArrayList<comment> commentsNA = cmdao.getCommentsByStatut(-1);

ArrayList<comment> commentsA = cmdao.getCommentsByStatut(1);

posteDAO pdao = new posteDAO();

int result;

if(request.getParameter("result") != null){
	
	result = Integer.parseInt(request.getParameter("result"));
	
}else{
	
	result = 0;
}
%>


	<div class="container" >
	
		<jsp:include page="adminSideBar.jsp"></jsp:include>
		
		<div class="content" id="content">
			
			<div id="alert" class="alertG" >
				
			</div>
			
			
			<div class="commentNA">
				<h2>COMMENTAIRES NON ACCEPTE</h2>
					<div class="boxpack">
					<div class="filter"><input id="filtercommentNA" type="text" name="search" placeholder="Search ..."> <i class="fa-solid fa-magnifying-glass"></i></div>
					
					<table class="table" id="tableCommentNA">
					<thead>
					
					<tr>
					<th>ID</th>
					<th>AUTEUR(E)</th>
					<th>COMMENTAIRE</th>
					<th>DATE DE PUBLICATION</th>
					<th>ID POSTE</th>
					<th>TITRE POSTE</th>
					</tr>
					
					</thead>
					
					<tbody>
					
				
					<%
		if(commentsNA != null){			
			for(int i = 0 ; i < commentsNA.size() ; i++) {	
				
				comment cm = new comment();
												
				cm = commentsNA.get(i);
				
				poste poste = pdao.getPosteById(cm.getIdPoste());
				
				int idcomment = cm.getIdComment();
				
				String auteur =  cm.getOwner();
				
				String comment = cm.getComment();
				
				int idposte = cm.getIdPoste();	
				
				String title = poste.getTitle();
				
				Calendar cal = Calendar.getInstance();
			    cal.setTime(cm.getPublishDate());
			
				int day =  cal.get(Calendar.DAY_OF_MONTH);
			
				String month = null;
			
				int mo =  cm.getPublishDate().getMonth();
			
				month = pdao.getMonth(mo);
			
				int year =  cm.getPublishDate().getYear() + 1900;
				

	 
			  	
					%>
					
					
						<tr class="<%=idcomment%>"> 
						<form action="actionComment" method="get">
						
						<td><input class="<%=idcomment%>" type="text" name="id" value="<%=idcomment%>" readonly></td>
						<td><input class="<%=idcomment%>" type="text" name="auteur" value="<%=auteur%>" disabled></td>
						<td><input class="<%=idcomment%>" type="text" name="comment" value="<%=comment%>" disabled></td>
						<td><input class="<%=idcomment%>" type="text" name="date" value="<%=day%>,<%=month%> <%=year%>" disabled></td> 
						<td><input class="<%=idcomment%>" type="text" name="idposte" value="<%=idposte%>" disabled></td> 
						<td><input class="<%=idcomment%>" type="text" name="title" value="<%=title%>" disabled></td>
						<td class="action"><input  class="<%=idcomment%>" id="supprimer" type="submit" name="action" value="Supprimer"><input class="<%=idcomment%>" id="modifier" type="submit" name="action" value="Accepter"></td>
						</form>
						</tr>
						
						<%}}else{ %>
							<p style="color:red;"> <i style="margin-right:10px;" class="fa-solid fa-triangle-exclamation"></i>UNE ERREUR EST SURVENUE</p>
						<%} %>
						</tbody>
						</table>
				</div>
				</div>
				
				
				<div class="commentA">
				<h2>COMMENTAIRES ACCEPTE</h2>
					<div class="boxpack">
					<div class="filter"><input id="filtercommentA" type="text" name="search" placeholder="Search ..."> <i class="fa-solid fa-magnifying-glass"></i></div>
					
					<table class="table" id="tableCommentA">
					<thead>
					
					<tr>
					<th>ID</th>
					<th>AUTEUR(E)</th>
					<th>COMMENTAIRE</th>
					<th>DATE DE PUBLICATION</th>
					<th>ID POSTE</th>
					<th>TITRE POSTE</th>
					</tr>
					
					</thead>
					
					<tbody>
					
				
					<%
		if(commentsA != null){			
			for(int i = 0 ; i < commentsA.size() ; i++) {	
				
				comment cm = new comment();
								
				cm = commentsA.get(i);
				
				poste poste = pdao.getPosteById(cm.getIdPoste());

				int idcomment = cm.getIdComment();
				
				String auteur =  cm.getOwner();
				
				String comment = cm.getComment();
				
				int idposte = cm.getIdPoste();	
				
				String title = poste.getTitle();
				
				Calendar cal = Calendar.getInstance();
			    cal.setTime(cm.getPublishDate());
			
				int day =  cal.get(Calendar.DAY_OF_MONTH);
			
				String month = null;
			
				int mo =  cm.getPublishDate().getMonth();
			
				month = pdao.getMonth(mo);
			
				int year =  cm.getPublishDate().getYear() + 1900;
				

	 
			  	
					%>
					
					
						<tr class="<%=idcomment%>"> 
						<form action="actionComment" method="get">
						
						<td><input class="<%=idcomment%>" type="text" name="id" value="<%=idcomment%>" readonly></td>
						<td><input class="<%=idcomment%>" type="text" name="auteur" value="<%=auteur%>" disabled></td>
						<td><input class="<%=idcomment%>" type="text" name="comment" value="<%=comment%>" disabled></td>
						<td><input class="<%=idcomment%>" type="text" name="date" value="<%=day%>,<%=month%> <%=year%>" disabled></td> 
						<td><input class="<%=idcomment%>" type="text" name="idposte" value="<%=idposte%>" disabled></td> 
						<td><input class="<%=idcomment%>" type="text" name="title" value="<%=title%>" disabled></td>
						<td class="action"><input  class="<%=idcomment%>" id="supprimer" type="submit" name="action" value="Supprimer"></td>
						</form>
						</tr>
						
						<%}}else{ %>
							<p style="color:red;"> <i style="margin-right:10px;" class="fa-solid fa-triangle-exclamation"></i>UNE ERREUR EST SURVENUE</p>
						<%} %>
						</tbody>
						</table>
				</div>
			
			
			</div>
			
			
			
		</div>
	
	</div>


	<!-- admin script -->

	<script src="../js/scriptBO.js"></script>
	
	
	<script>
		
		alert(<%=result%>);
		
	</script>
	
	<!-- admin script -->
	
</body>
</html>