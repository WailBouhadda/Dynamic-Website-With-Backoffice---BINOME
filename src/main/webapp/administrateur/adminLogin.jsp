<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset= "UTF-8" />
	<title>S'dentifier</title>
	<link rel="stylesheet" href="../css/styleBO.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
   <body>


<div class="loginPage">   
	<div class="adminLogin">
		<h1>Authentification</h1>
		<div class="mailInput">
			<i class="fa fa-envelope"></i>
			 <input type="email" placeholder="E-mail...">
		</div>
		<div class="passwordInput">
			<i class="fa fa-key"></i>
			 <input type="password" placeholder="Mot de passe..." id="password">
			 <span class="eye" onclick="showPassword()">
			 <i id="eyeShow" class="fa fa-eye"></i>
			 <i id="eyeHide" class="fa fa-eye-slash"></i>
			 </span>
		</div>
		<button type="button" class="loginBtn">S'authentifier</button> 
	</div>
</div>
		<script src="../js/scriptBO.js"></script>




	</body>
</html>