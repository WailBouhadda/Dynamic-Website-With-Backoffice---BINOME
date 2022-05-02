<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Start Style -->
    <link rel="stylesheet" href="style/style.css">
    <!-- End Style -->
    
    <!-- FontAwseme icons -->
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
    
<title>BINOME</title>
<link rel="icon" href="images/logo.png">
</head>
<body>

<!-- start navigation Bar -->
<div class="navBar">

	<div class="container">
		<!-- start top navigation Bar -->
		
		<div class="topBar">
				
				<div class="loc_mail">
					<div class="loc">
						<i class="green fa-solid fa-location-dot"></i>
						<p>Avenue Yacoub el Mansour – 28810 Mohammedia</p>
					</div>
					<div class="mail">
						<i class="green fa-solid fa-envelope"></i>
						<p>i.deschamps@binome.ma</p>
					</div>
				</div>
				
				<div class="social_phone">
					<div class="social">
						<a href="https://www.facebook.com/"><i class="fa-brands fa-facebook-f"></i></a>
						<a href="https://m.youtube.com/"><i class="fa-brands fa-instagram"></i></a>
						<a href="https://twitter.com/"><i class="fa-brands fa-twitter"></i></a>
					</div>	
					<div class="phone">
						<i class="green fa-solid fa-phone"></i>
						<p>+212661494028</p>
					</div>
				</div>
		</div>
		<!-- end top navigation Bar -->
		
		<!-- start navigation list -->
		<div class="navList">
		
			<div class="logo">
				<img class="logo" src="images/logo.png">
			</div>
			<div class="list">
				<i class="fa-solid fa-bars" id="burger"></i>
				<ul class="test" id="Nlist">
					<li><a href="#accueil">ACCUEIL</a></li>
					<li><a href="#cabinetBinome">CABINET BINOME</a> <i class="fa-solid fa-caret-down"></i>
						<ul>
							<li><a href="#biographie">BIOGRAPHIE</a></li>
							<li><a href="#savoirFaire">SAVOIR FAIRE</a></li>
							<li><a href="#nosServices">NOS SERVICES</a></li>
						</ul>
					</li>
					<li><a href="#formation">FORMATION</a><i class="fa-solid fa-caret-down"></i></li>
					<li><a href="#blog">BLOG</a></li>
					<li><a href="#contact">CONTACT</a></li>
					<li><a href="#plus">PLUS</a><i class="fa-solid fa-caret-down" onclick="dropDown()"></i>
						<ul>
							<li><a href="#espaceClient">ESPACE CLIENT</a></li>
							<li><a href="#recrutement">RECRUTEMENT</a></li>
							<li><a href="#nosReferences">NOS REFERENCES</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<div class="profile_search">
				<div class="profile">
					<i class="fa-solid fa-user"></i>
				</div>
				<div class="search">
					<i class="se fa-solid fa-magnifying-glass" id="SE"></i>
					<input class="SIH" type="text" placeholder="search..." id="si">
				</div>
			</div>
		
		</div>
		<!-- end navigation list -->
		
	</div>


</div>

<!-- end navigation Bar -->
