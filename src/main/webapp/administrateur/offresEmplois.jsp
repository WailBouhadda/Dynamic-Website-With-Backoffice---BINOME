<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@page import="java.util.*"%>
  		<%@page import="java.io.*"%>
        <%@page import="entities.User"%>
         <%@page import="entities.admin"%>
        <%@page import="dao.UserDao"%>
  		 <%@page import="dao.offreDAO"%>
         <%@page import="entities.offre"%>
          <%@page import="entities.Demande"%>
         <%@page import="dao.posteDAO"%>
         
           <%
 
           admin a= new admin();
           if(session.getAttribute("admin")==null){
           	response.sendRedirect("Login");
           	
           	
           }else{
           	
           	 a = (admin)session.getAttribute("admin");
           }
           
           
           
           
           
           int result;

           if(request.getParameter("result") != null){
           	
           	result = Integer.parseInt(request.getParameter("result"));
           	
           }else{
           	
           	result = 0;
           }
           
           %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Offres d'emplois</title>


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
 
posteDAO pdao = new posteDAO();


offreDAO odao = new offreDAO();


ArrayList<offre> offres = odao.getOffres();

ArrayList<Demande> demandes = odao.geteemandes();

%>


<div class="container" >

		<jsp:include page="adminSideBar.jsp"></jsp:include>
		
		
			<div class="content" id="content">
			
				<div id="alert" class="alertG" >
				
				</div>
				
				
				<div class="offres">			
				<h2>Ajouter offre d'emploi</h2>
				<div class="boxpack">
					
					<form class="addoffre" action="addOffre" method="post" enctype="multipart/form-data">
						<div class="jobtop">
							<div class="pdf">
								<label for="offrepdf">Ajouter un pdf : </label>
								<input type="file" name="offrepdf" >
							</div>
							<input type="text" name="titre" placeholder="Titre d'offre..." required>
							<input type="text" name="local" placeholder="Localisation..." required>
						</div>
						<div class="jobdown">
							
							<textarea rows="5" name="details"  placeholder="Details d'offre..." required></textarea>
						</div>
						<input type="submit" name="action" value="AJOUTER">
					</form>
					
				</div>
				
				<div class="posteTable">			
				<h2>Offres d'emploi</h2>
					<div class="boxpack">
					<div class="filter"><input id="filterPoste" type="text" name="search" placeholder="Search ..."> <i class="fa-solid fa-magnifying-glass"></i></div>
					
					<table class="table" id="tablePoste">
					<thead>
					
					<tr>
					<th>ID</th>
					<th>TITRE</th>
					<th>DATE DE PUBLICATION</th>
					<th>LOCALISATION</th>
					</tr>
					
					</thead>
					
					<tbody>
					
				
					<%
		if(offres != null){			
			for(int i = 0 ; i < offres.size() ; i++) {	
	
				
				offre p = new offre();
				p = offres.get(i);
				
				int idoffre = p.getIdoffre();
				
				String title =  p.getTitre();
				
				String local = p.getLocal();
				
				
				
				
				 Calendar cal = Calendar.getInstance();
				    cal.setTime(p.getPublishdate());
				
				int day =  cal.get(Calendar.DAY_OF_MONTH);
				
				String month = null;
				
				int mo =  p.getPublishdate().getMonth();
				
				int year =  p.getPublishdate().getYear() + 1900;
				
				month = pdao.getMonth(mo);
				
	 
			  	
					%>
					
					
						<tr class="<%=idoffre%>"> 
						<form action="addOffre" method="post">
						
						<td><input class="<%=idoffre%>" type="text" name="id" value="<%=idoffre%>" readonly></td>
						<td><input class="<%=idoffre%>" type="text" name="title" value="<%=title%>" disabled></td>
						<td><input class="<%=idoffre%>" type="text" name="date" value="<%=day%>,<%=month%> <%=year%>" disabled></td> 
						<td><input class="<%=idoffre%>" type="text" name="nblike" value="<%=local%>" disabled></td> 
						<td class="action"><input  class="<%=idoffre%>" id="supprimer" type="submit" name="action" value="Supprimer"></td>
						</form>
						</tr>
						
						<%}}else{ %>
							<p style="color:red;">Un error est servenu, Pas de poste pour le moment !</p>
						<%} %>
						</tbody>
						</table>
				</div>
				</div>
					
				<div class="demandes">			
				<h2>Demandes d'emploi</h2>
				<div class="boxpack">
					<div class="demandesliste">
						<%
					if(demandes != null){
						for(int i = 0 ; i < demandes.size() ; i++) {	


							
							Demande d = new Demande();
							d = demandes.get(i);
							
							int iddemande = d.getIddemande();
							
							
							String nom =  d.getNom();
							
							String prenom = d.getPrenom();
							
							String email = d.getEmail();
							
							
							 Calendar cal = Calendar.getInstance();
							    cal.setTime(d.getSubmitDate());
							
							int day =  cal.get(Calendar.DAY_OF_MONTH);
							
							String month = null;
							
							int mo =  d.getSubmitDate().getMonth();
							
							int year =  d.getSubmitDate().getYear() + 1900;
							
							month = pdao.getMonth(mo);
							
							
					
					%>
					
					
							<a href="demandepdf?id=<%=iddemande%>">
								<div class="demande">
									
									<div class="name">
										<span><%=nom %></span>
										<span> <%=prenom %></span>
									</div>
									<div class="date">
										<i class="fa-solid fa-calendar-days"></i>
										<span><%=day%>,<%=month%> <%=year%></span>
									</div>
									<div class="email">
										<span><%=email %></span>
									</div>
									<div class="plus">
										<i class="fa-solid fa-file-arrow-down"></i>
									</div>
									
								</div>
							</a>
					
					
					<%}} %>
				
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