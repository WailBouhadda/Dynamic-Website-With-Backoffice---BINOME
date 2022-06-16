<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    if(session.getAttribute("admin")==null){
    	response.sendRedirect("adminLogin.jsp");
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
			
			
			
		</div>
	
	</div>


	<!-- admin script -->

	<script src="../js/scriptBO.js"></script>

	<!-- admin script -->
	
</body>
</html>