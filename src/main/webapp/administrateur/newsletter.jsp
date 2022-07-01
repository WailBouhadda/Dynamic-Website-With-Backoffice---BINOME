 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@page import="java.util.*"%>
  <%@page import="java.io.*"%>
        <%@page import="entities.poste"%>
        <%@page import="entities.Newsletter"%>
        <%@page import="dao.posteDAO"%>
        <%@page import="dao.newsletterDAO"%>
        
        
           <%
    if(session.getAttribute("admin")==null){
    	response.sendRedirect("Login");
    	
    	
    }
    
    
    
    int result;

    if(request.getParameter("result") != null){
    	
    	result = Integer.parseInt(request.getParameter("result"));
    	
    }else{
    	
    	result = 0;
    }
    %>
    
    
    <%
 
HttpSession s = request.getSession();

s.setAttribute("source", "NewsLetter");

posteDAO pdao = new posteDAO();

newsletterDAO nldao = new newsletterDAO();

ArrayList<Newsletter> inscrits = nldao.getInscrits();


%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NewsLetter</title>

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
			
			<div id="alert" class="alertG" >
				
			</div>
			
			<h2>Envoyer une NewsLetter</h2>
			<div class="boxpack">	
			<form action="actionNewsLetter" method="post" >
			
				<div class="blogInfos">
					
					
					<div class="posteTitle">
						<label for="blogTitle">SUJET : </label>
						<input type="text" name="sujet" placeholder="Ajouter le sujet ici..." required>
					</div>
					
				</div>
				
				<div class="blogContent">
				
					<textarea name="contenu" id="article" required></textarea>
				
				</div>
				
				<div class="decision">
					<input type="submit" name="action" value="ENVOYER">
					<input type="reset" name="decision" value="ANNULER">
				</div>
			
				</form>
					</div>

			<h2>Liste Des Inscrits</h2>
																
					<div class="cat">
					<div class="boxpack">
					<div class="catFilt">
					
					
					
						<div class="filter"><input id="filterCategorie" type="text" name="search" placeholder="Search ..."> <i class="fa-solid fa-magnifying-glass"></i></div>
						
					
						<table class="table" id="tableCategorie">
						<thead>
						
						<tr>
						<th>ID</th>
						<th>EMAIL</th>
						<th>DATE D'INSCRIPTION</th>
						</tr>
						
						</thead>
						
						<tbody>
						
					
						<% 
						if(inscrits != null){		
						for(int i = 0 ; i < inscrits.size() ; i++){
											Newsletter c = new Newsletter();
											c = inscrits.get(i);
											
											int idinscrits = c.getIdNewsletter();
											String email = c.getEmail();
											
											
											 Calendar cal = Calendar.getInstance();
											    cal.setTime(c.getDateInscrp());
											
											int day =  cal.get(Calendar.DAY_OF_MONTH);
											
											String month = null;
											
											int mo =  c.getDateInscrp().getMonth();
											
											int year =  c.getDateInscrp().getYear() + 1900;
											
											month = pdao.getMonth(mo);
											
											
						%>
						<tr class="<%=idinscrits%>"> 
							<form action="actionNewsLetter" method="post">
							
							<td><input class="<%=idinscrits%>" type="text" name="id" value="<%=idinscrits%>" readonly></td>
							<td><input class="<%=idinscrits%>" type="text" name="title" value="<%=email%>" disabled></td>
							<td><input class="<%=idinscrits%>" type="text" name="nbpostes" value="<%=day%>,<%=month%> <%=year%>" disabled></td>
							<td class="action"><input  class="<%=idinscrits%>" id="supprimer" type="submit" name="action" value="SUPPRIMER"></td>
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
	

	</div>

	
	<!-- admin script -->

	<script src="../js/ckeditor/ckeditor.js"></script>
	
	<script>
		CKEDITOR.replace('article');
	</script>

	<script src="../js/scriptBO.js"></script>
	
	
	<script>
		
		alert(<%=result%>);
		
	</script>
	
	<!-- admin script -->
	
</body>
</html>