<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset= "UTF-8" />
	<title>S'dentifier</title>
	<link rel="stylesheet" href="css/styleBackoffice.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
   <body>
<div class="form-box">
	<h1>S'dentifier</h1>
	<div class="input-box">
		<i class="fa fa-envelope"></i>
		 <input type="email" placeholder="E-mail">
	</div>
	<div class="input-box">
		<i class="fa fa-key"></i>
		 <input type="password" placeholder="Mot de passe" id="myInput">
		 <span class="eye" onclick="myFunction()">
		 <i id="hide1" class="fa fa-eye"></i>
		 <i id="hide2" class="fa fa-eye-slash"></i>
		 </span>
	</div>
	<button type="button" class="login-btn">S'dentifier</button> 
</div>


		<script>
			function myFunction(){
				var x = document.getElementById("myInput");
				var y = document.getElementById("hide1");
				var z = document.getElementById("hide2");


					if(x.type === 'password'){
						x.type = "text"
						y.style.display = "block";
						z.style.display = "none";
					}
					else{
						x.type = "password"
						y.style.display = "none";
						z.style.display = "block";
					}
			}
		</script>




	</body>
</html>