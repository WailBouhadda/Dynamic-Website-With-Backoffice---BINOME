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
           
           %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modifier Utilisateur</title>

<%

int id = Integer.parseInt(request.getParameter("id"));



HttpSession s = request.getSession();

s.setAttribute("source", "userUpdate.jsp");

UserDao udao = new UserDao();

User u = udao.selectUser(id);

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
				<h2>Modifier Utilisateur</h2>
				<div class="boxpack">
			
					<form action="updateUser" class="formClicked" method="post"  id="UAEF">
					<div class="Apassword">
							<span>ID</span>
							 <input type="text" placeholder="..." name="id" id="id" value="<%=u.getIdUser() %>"  readonly>
							 <span class="eye" >
								 <i class="fa-regular fa-user"></i>
							 </span>
						</div>	
						<div class="Apassword">
							<span>Nom</span>
							 <input type="text" placeholder="..." name="nom" id="nom" value="<%=u.getNom() %>"  required>
							 <span class="eye" >
								 <i class="fa-regular fa-user"></i>
							 </span>
						</div>	
						<div class="Npassword">
							 <span>Prenom</span>
							 <input type="text" placeholder="..." name="prenom" id="prenom" value="<%=u.getPrenom() %>" required>
							 <span class="eye">
								<i class="fa-regular fa-user"></i>
							 </span>
						</div>	
						<div class="CNpassword">
							 <span>Email</span>
							 <input type="email" placeholder="..." name="email" id="email" value="<%=u.getEmail() %>" required>
							  <span class="eye">
								 <i class="fa-regular fa-envelope"></i>
							 </span>
						</div>	
							<div class="CNpassword">
							 <span>Telephone</span>
							 <input type="text" placeholder="..." name="tele" id="tele"  value="<%=u.getTelephone() %>" required>
							  <span class="eye">
								 <i class="fa-solid fa-phone-flip"></i>
							 </span>
						</div>	
						<button type="submit" name="action"  value="Modifier">MODIFIER</button>
					</form>
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