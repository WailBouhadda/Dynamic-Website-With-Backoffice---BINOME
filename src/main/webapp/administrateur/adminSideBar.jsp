<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/styleBO.css">



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


<div class="adminSideBar" id="adminSideBar">

	<div class="admin">
		<li><i class="fa-solid fa-bars" id="burger"></i><span class="showSpan">wail</span></li>
	</div>
	<div class="list">
		<ul class="mainList">
			<li><a href="#"><i class="fa-solid fa-house-chimney"></i><span class="showSpan">TABLEAU DE BOARD</span></a></li>
			<li class="li" id="blogli">
				<div class="dropDown" id="blog"><i class="fa-solid fa-newspaper"></i><span class="showSpan">BLOG<i class="fa-solid fa-caret-down"></i></span></div>
				<ul class="subList" id="blogul">
					<li><a href="#"><i class="fa-solid fa-plus"></i><span class="showSpan">AJOUTER BLOG</span></a></li>
					<li><a href="#"><i class="fa-solid fa-list"></i><span class="showSpan">BLOGs</span></a></li>
				</ul>
			</li>
			<li><a href="#"><i class="fa-regular fa-comments"></i><span class="showSpan">COMMENTAIRES</span></a></li>
			<li class="li" id="ebookli">
				<div class="dropDown" id="ebook"><i class="fa-solid fa-book"></i><span class="showSpan">E-BOOK<i class="fa-solid fa-caret-down"></i></span></div>
				<ul class="subList" id="ebookul">
					<li><a href="#"><i class="fa-solid fa-plus"></i><span class="showSpan">AJOUTER E-BOOK</span></a></li>
					<li><a href="#"><i class="fa-solid fa-list"></i><span class="showSpan">E-BOOKs</span></a></li>
				</ul>
			</li>
			<li><a href="#"><i class="fa-solid fa-users"></i></i><span class="showSpan">UTILISATEURS</span></a></li>
			<li><a href="#"><i class="fa-solid fa-user"></i><span class="showSpan">PROFILE</span></a></li>
		</ul>
	</div>
	<div class="logout">
		<li><a href="#"><i class="fa-solid fa-power-off"></i><span class="showSpan">DECONNECTION</span></a></li>
	</div>
</div>

		<script src="../js/scriptBO.js"></script>


</body>
</html>