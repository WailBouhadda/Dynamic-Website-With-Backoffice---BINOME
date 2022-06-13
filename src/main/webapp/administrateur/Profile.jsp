<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String user= null;
    if(session.getAttribute("login")==null){
    	response.sendRedirect("adminLogin.jsp");
    	
    	
    }else{
    	
    	 user = (String)session.getAttribute("login");
    }
    
    %>
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
<% response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate") ;%>
	<div class="container">
	
		<jsp:include page="adminSideBar.jsp"></jsp:include>

		<div class="content" id="content">
			
			<div class="profile">
				<h2>Profile</h2>
				<div class="profileDetails">
					<i class="fa-solid fa-circle-user"></i>
					<p><%=user %></p>
				</div>
				<div class="updatePassword">
					<form action="updateAdmin.java" method="post">
						<div class="Apassword">
							 <input type="password" placeholder="Ancien mot de passe..." name="password" id="Apassword">
							 <span class="eye" onclick="showPassword('Apassword')">
								 <i id="eyeShowApassword" class="fa fa-eye"></i>
								 <i id="eyeHideApassword" class="fa fa-eye-slash"></i>
							 </span>
						</div>	
						<div class="Npassword">
							 <input type="password" placeholder="Nouveau mot de passe..." name="password" id="Npassword">
							 <span class="eye" onclick="showPassword('Npassword')">
								 <i id="eyeShowNpassword" class="fa fa-eye"></i>
								 <i id="eyeHideNpassword" class="fa fa-eye-slash"></i>
							 </span>
						</div>	
						<div class="CNpassword">
							 <input type="password" placeholder="Confirmation mot de passe..." name="password" id="CNpassword">
							 <span class="eye" onclick="showPassword('CNpassword')">
								 <i id="eyeShowCNpassword" class="fa fa-eye"></i>
								 <i id="eyeHideCNpassword" class="fa fa-eye-slash"></i>
							 </span>
						</div>	
						<input type="submit" name="Modifier"  value="Modifier">
					</form>
				</div>
				
			</div>
			
		</div>
	
	</div>


	<!-- admin script -->

	<script src="../js/scriptBO.js"></script>

	<!-- admin script -->
	
</body>
</html>