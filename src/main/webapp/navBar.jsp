 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Start Style -->
    <link rel="stylesheet" href="css/style.css">
    <!-- End Style -->
    
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
				<img onclick="window.location.href = 'Home';" class="logo" src="images/logo.png">
			</div>
			<div class="list">
				<i class="fa-solid fa-bars" id="burger"></i>
				<ul class="test" id="Nlist">
					<li><a href="Home#accueil">ACCUEIL</a></li>
					<li><a href="Home#cabinetBinome">CABINET BINOME</a> <i class="fa-solid fa-caret-down"></i>
						<ul>
							<li><a href="Biographie">BIOGRAPHIE</a></li>
							<li><a href="SavoirFaire">SAVOIR FAIRE</a></li>
							<li><a href="Home#services">NOS SERVICES</a></li>
						</ul>
					</li>
					<li><a href="Formations">FORMATION</a></li>
					<li><a href="Blog">BLOG</a></li>
					<li><a href="Home#contact">CONTACT</a></li>
					<li><a href="#plus">PLUS</a><i class="fa-solid fa-caret-down" onclick="dropDown()"></i>
						<ul>
							<li><a href="EspaceClient">ESPACE CLIENT</a></li>
							<li><a href="Recrutement">RECRUTEMENT</a></li>
							<li><a href="Home#nosReferences">NOS REFERENCES</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<div class="profile_search">
				<div class="profile">
					<i onclick="window.location.href = 'EspaceClient';" class="fa-solid fa-user"></i>
				</div>
				<div class="search" id="searchNB">
					<i class="se fa-solid fa-magnifying-glass" id="SE"></i>
					<input class="SIH" type="text" placeholder="search..." id="si">
					
						<ul class="searchlistNC" id="siul">
							<li style="display:none;" ><a href="Biographie">BIOGRAPHIE</a></li>
							<li style="display:none;"><a href="SavoirFaire">SAVOIR FAIRE</a></li>
							<li style="display:none;"><a href="Home#services">NOS SERVICES</a></li>
							<li style="display:none;"><a href="EspaceClient">ESPACE CLIENT</a></li>
							<li style="display:none;"><a href="Recrutement">RECRUTEMENT</a></li>
							<li style="display:none;"><a href="Recrutement">OFFRES EMPLOI</a></li>
							<li style="display:none;"><a href="Recrutement">DEPOSER CV</a></li>
							<li style="display:none;"><a href="Home#nosReferences">NOS REFERENCES</a></li>
							<li style="display:none;"><a href="Formations">FORMATION</a></li>
							<li style="display:none;"><a href="Formations">GESTION DU QUOTIDIEN</a></li>
							<li style="display:none;"><a href="Formations">DEVELOPPEMENT PERSONNEL</a></li>
							<li style="display:none;"><a href="Formations">BINOME ASSISTANTE / MANAGER</a></li>
							<li style="display:none;"><a href="Blog">BLOG</a></li>
							<li style="display:none;"><a href="Home#contact">CONTACT</a></li>
							<li style="display:none;"><a href="Home#cabinetBinome">CABINET BINOME</a></li>
						</ul>
				
				</div>
			</div>
		
		</div>
		<!-- end navigation list -->
		
	</div>


</div>

<!-- end navigation Bar -->
