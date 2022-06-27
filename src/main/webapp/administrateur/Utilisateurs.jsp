<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@page import="java.util.*"%>
  		<%@page import="java.io.*"%>
        <%@page import="entities.User"%>
         <%@page import="entities.admin"%>
        <%@page import="dao.UserDao"%>
  
        
           <%
 
           admin a= new admin();
           if(session.getAttribute("admin")==null){
           	response.sendRedirect("adminLogin.jsp");
           	
           	
           }else{
           	
           	 a = (admin)session.getAttribute("admin");
           }
           
           
           
           
           
           int result;

           if(request.getParameter("result") != null){
           	
           	result = Integer.parseInt(request.getParameter("result"));
           	
           }else{
           	
           	result = 0;
           }
           
           response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate") ;
           
           %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Utilisateurs</title>

<%
 
HttpSession s = request.getSession();

s.setAttribute("source", "Utilisateurs.jsp");

UserDao udao = new UserDao();


ArrayList<User> users = (ArrayList<User>)udao.selectAllUsers();

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
			
				<div id="alert" class="alertG" >
				
				</div>
				
				
				<div class="profile">			
				
				<div class="boxpack">
					<div class="headBar" id="UAE">
						<span>
							<i class="fa-solid fa-key"></i>
							<p>Ajouter un utilisateur</p>
						</span>
						<i class="fa-solid fa-caret-down normal" id="UAEi"></i>
					</div>
					<form action="userServlet" class="form" method="post" id="UAEF">
						<div class="Apassword">
							<span>Nom</span>
							 <input type="text" placeholder="..." name="nom" id="nom" required>
							 <span class="eye" >
								 <i class="fa-regular fa-user"></i>
							 </span>
						</div>	
						<div class="Npassword">
							 <span>Prenom</span>
							 <input type="text" placeholder="..." name="prenom" id="prenom" required>
							 <span class="eye">
								<i class="fa-regular fa-user"></i>
							 </span>
						</div>	
						<div class="CNpassword">
							 <span>Email</span>
							 <input type="email" placeholder="..." name="email" id="email" required>
							  <span class="eye">
								 <i class="fa-regular fa-envelope"></i>
							 </span>
						</div>	
							<div class="CNpassword">
							 <span>Telephone</span>
							 <input type="text" placeholder="..." name="tele" id="tele" required>
							  <span class="eye">
								 <i class="fa-solid fa-phone-flip"></i>
							 </span>
						</div>	
						<button type="submit" name="action"  value="Ajouter">AJOUTER</button>
					</form>
				</div>
			
				<div class="posteTable">
				<h2>UTILISATEURS</h2>
					<div class="boxpack">
					<div class="filter"><input id="filterPoste" type="text" name="search" placeholder="Search ..."> <i class="fa-solid fa-magnifying-glass"></i></div>
					
					<table class="table" id="tablePoste">
					<thead>
					
					<tr>
					<th>ID</th>
					<th>PRENOM</th>
					<th>NOM</th>
					<th>EMAIL</th>
					<th>TELEPHONE</th>
					</tr>
					
					</thead>
					
					<tbody>
					
				
					<%
		if(users != null){			
			for(int i = 0 ; i < users.size() ; i++) {	
	
				
				User u = new User();
				u = users.get(i);
				
				int idUser = u.getIdUser();
				
				String prenom =  u.getPrenom();
				
				String nom = u.getNom();
				
				String email = u.getEmail();
				
				String tele = u.getTelephone();
				
	 
			  	
					%>
					
					
						<tr class="<%=idUser%>"> 
						<form action="userServlet" method="post">
						
						<td><input class="<%=idUser%>" type="text" name="id" value="<%=idUser%>" readonly></td>
						<td><input class="<%=idUser%>" type="text" name="title" value="<%=prenom%>" disabled></td>
						<td><input class="<%=idUser%>" type="text" name="nblike" value="<%=nom%>" disabled></td> 
						<td><input class="<%=idUser%>" type="text" name="nbcomment" value="<%=email%>" disabled></td>
						<td><input class="<%=idUser%>" type="text" name="categorie" value="<%=tele%>" disabled></td>
						<td class="action"><input  class="<%=idUser%>" id="supprimer" type="submit" name="action" value="Supprimer"><input class="<%=idUser%>" id="modifier" type="submit" name="action" value="Modifier"></td>
						</form>
						</tr>
						
						<%}}else{ %>
							<p style="color:red;">Un error est servenu, Pas de Utilisateurs pour le moment !</p>
						<%} %>
						</tbody>
						</table>
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