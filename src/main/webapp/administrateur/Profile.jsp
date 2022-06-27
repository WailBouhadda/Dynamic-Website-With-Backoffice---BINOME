<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@page import="entities.admin"%>
    

<!DOCTYPE html>


<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
   
   

   response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate") ;%>
 
	<div class="container">
	
		<jsp:include page="adminSideBar.jsp"></jsp:include>

		<div class="content" id="content">
		
			<div id="alert" class="alertG" >
				
			</div>
			
			<div class="profile">
				<h2>Profile</h2>
				<div class="profileDetails">
					<i class="fa-solid fa-circle-user"></i>
					<div class="userMail">
					
						<div><span>Nom d'utilisateur</span><p><%=a.getUsername() %></p></div>
						<div><span>Email</span><p><%=a.getEmail() %></p></div>
						
					</div>
				</div>
				
				<div class="boxpack">
					<div class="headBar" id="UAE">
						<span>
							<i class="fa-solid fa-key"></i>
							<p>Modifier Nom d'utilisateur et Email</p>
						</span>
						<i class="fa-solid fa-caret-down normal" id="UAEi"></i>
					</div>
					<form action="updateAdmin" class="form" method="post" id="UAEF">
						<div class="Apassword">
							<span>Nom d'utilisateur</span>
							 <input type="text" placeholder="..." name="username" id="username" required>
							 <span class="eye" >
								 <i class="fa-regular fa-user"></i>
							 </span>
						</div>	
						<div class="Npassword">
							 <span>Email</span>
							 <input type="email" placeholder="..." name="email" id="email" required>
							 <span class="eye">
								 <i class="fa-regular fa-envelope"></i>
							 </span>
						</div>	
						<div class="CNpassword">
							 <span>Mot de passe</span>
							 <input type="password" placeholder="..." name="password" id="password" required>
							 <span class="eye" onclick="showPassword('password')">
								 <i id="eyeShowpassword" style="display:none;" class="fa fa-eye"></i>
								 <i id="eyeHidepassword" style="display:block;" class="fa fa-eye-slash"></i>
							 </span>
						</div>	
						<button type="submit" name="Modifier"  value="ModifierUE">MODIFIER</button>
					</form>
				</div>
				
				<div class="boxpack">
					<div class="headBar" id="UAP">
						<span>
							<i class="fa-solid fa-key"></i>
							<p>Modifier Mot De Passe </p>
						</span>
						<i class="fa-solid fa-caret-down normale" id="UAPi"></i>
					</div>
					<form action="updateAdmin" class="form" method="post" id="UAPF">
						<div class="Apassword">
							<span>Ancienne mot de passe</span>
							 <input type="password" placeholder="..." name="Apassword" id="Apassword" required>
							 <span class="eye" onclick="showPassword('Apassword')">
								 <i id="eyeShowApassword" style="display:none;" class="fa fa-eye"></i>
								 <i id="eyeHideApassword" style="display:block;" class="fa fa-eye-slash"></i>
							 </span>
						</div>	
						<div class="Npassword">
							 <span>Nouveau mot de passe</span>
							 <input type="password" placeholder="..." name="Npassword" id="Npassword" required>
							 <span class="eye" onclick="showPassword('Npassword')">
								 <i id="eyeShowNpassword" style="display:none;" class="fa fa-eye"></i>
								 <i id="eyeHideNpassword" style="display:block;" class="fa fa-eye-slash"></i>
							 </span>
						</div>	
						<div class="CNpassword">
							 <span>Confirmation de mot de passe</span>
							 <input type="password" placeholder="..." name="CNpassword" id="CNpassword" onkeyup="confirmpass()" required>
							 <span class="eye" onclick="showPassword('CNpassword')">
								 <i id="eyeShowCNpassword" style="display:none;" class="fa fa-eye"></i>
								 <i id="eyeHideCNpassword" style="display:block;" class="fa fa-eye-slash"></i>
							 </span>
						</div>	
						<button type="submit" name="Modifier"  value="ModifierMDP" id="BMDP">MODIFIER</button>
					</form>
				</div>
				
				
				
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