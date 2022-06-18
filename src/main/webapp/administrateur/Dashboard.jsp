<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <%@page import="java.util.*"%>
  		<%@page import="java.io.*"%>
        <%@page import="entities.poste"%>
        <%@page import="entities.categorie"%>
        <%@page import="dao.posteDAO"%>
        <%@page import="dao.categorieDAO"%>  
        <%@page import="entities.comment"%>
        <%@page import="dao.commentDAO"%>
   
    
    <%
    if(session.getAttribute("admin")==null){
    	response.sendRedirect("adminLogin.jsp");
    }
    
    %>
<!DOCTYPE html>


<html>

<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Tableau de board</title>

    <!-- Style File -->
		
	<link rel="stylesheet" href="../css/styleBO.css">

	<!-- Style File -->
	
	

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/adminlte.css">

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
		
		<%
 
HttpSession s = request.getSession();


posteDAO pdao = new posteDAO();

categorieDAO cdao = new categorieDAO();

commentDAO codao = new commentDAO();

int nbrlikes = pdao.totalLikes();
int nbrcomments = pdao.totalComments();
int nbrpostes = pdao.totalPostes();

ArrayList<poste> postes = pdao.getPostes();

ArrayList<categorie> categos = cdao.getcategories();

%>
		
		
		
		
		
		<div class="dashboard">
			<div style="margin-top:0;"" class="boxpack">
        
           <div class="row">
          <div class="col-md-3 col-sm-6 col-12">
            <div class="info-box bg-info">
              <span class="info-box-icon"><i class="far fa-bookmark"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">PUBLICATIONS</span>
                <span class="info-box-number"><%=nbrpostes %></span>

                <div class="progress">
                  <div class="progress-bar" style="width: 70%"></div>
                </div>
                <span class="progress-description">
                   <a style="color:white;" href="posteListe.jsp"> Voir plus <i class="fa-solid fa-circle-plus"></i></a>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-md-3 col-sm-6 col-12">
            <div class="info-box bg-success">
              <span class="info-box-icon"><i class="far fa-thumbs-up"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">J'AIME</span>
                <span class="info-box-number"><%=nbrlikes %></span>

                <div class="progress">
                  <div class="progress-bar" style="width: 70%"></div>
                </div>
                <span class="progress-description">
                 <a style="color:white;" href="posteListe.jsp"> Voir plus  <i class="fa-solid fa-circle-plus"></i></a>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-md-3 col-sm-6 col-12">
            <div class="info-box bg-warning">
              <span style="color:white;" class="info-box-icon"><i class="fa-solid fa-book"></i></i></span>

              <div class="info-box-content">
                <span style="color:white;" class="info-box-text">EBOOKS</span>
                <span style="color:white;" class="info-box-number">41,410</span>

                <div class="progress">
                  <div class="progress-bar" style="width: 70%"></div>
                </div>
                <span class="progress-description">
                  <a style="color:white;" href="commentaires.jsp"> Voir plus <i class="fa-solid fa-circle-plus"></i></a>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-md-3 col-sm-6 col-12">
            <div class="info-box bg-danger">
              <span class="info-box-icon"><i class="fas fa-comments"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">COMMENTAIRES</span>
                <span class="info-box-number"><%=nbrcomments %></span>

                <div class="progress">
                  <div class="progress-bar" style="width: 70%"></div>
                </div>
                <span class="progress-description">
                   <a style="color:white;" href="commentaires.jsp"> Voir plus <i class="fa-solid fa-circle-plus"></i></a>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
        </div>
			
			</div>
			
			
			<div class="boxpackContainer">
			
				<div class="semiboxpack">
					
					<h3>Publications Récents</h3>
					
						<%
	if(postes != null){	
		
		int size = 0; 
		
		if(postes.size() > 3){
			
			size = 3;
		}else{
			size = postes.size();
		}
		
		
		for(int i = 0 ; i < size ; i++) {	

			byte[] imgdata = null;

			
			poste p = new poste();
			p = postes.get(i);
			
			int idPoste = p.getId();

			
			String title =  p.getTitle();
			
			
			 Calendar cal = Calendar.getInstance();
			    cal.setTime(p.getPublishDate());
			
			int day =  cal.get(Calendar.DAY_OF_MONTH);
			
			String month = null;
			
			int mo =  p.getPublishDate().getMonth();
			
			int year =  p.getPublishDate().getYear() + 1900;
			
			month = pdao.getMonth(mo);
			
			String content = p.getContent(); 
			
			byte[] imageBytes=p.getImage().getBytes(1, (int)p.getImage().length());
		  	String encodedImage=Base64.getEncoder().encodeToString(imageBytes);
		  	String image = "data:image/jpg;base64,"+encodedImage;
		  	
		%>
				
					
						<div class="postrec">
							<div class="image">
								<img src="<%=image%>">
							</div>
							<div class="postInfo">
								<span><i class="fa-solid fa-calendar-days"></i><p><%=month %> <%=day %>, <%=year %></p></span>
								<h5><%=title %></h5>
							</div>
						</div>
					
			<% }}else{ %>
				<p style="color:red;"><i class="fa-solid fa-hexagon-exclamation"> Une erreur est servenu, Pas de poste pour le moment</p>
			<%} %>
				<a href="posteListe.jsp">Voir Plus <i class="fa-solid fa-circle-chevron-right"></i></a>	
				</div>
				<div class="semiboxpack">
					
					<h3>Commentaires Récents </h3>
				
					<%
						ArrayList<comment> comments = codao.getComments();
						if(comments.size() >0){
							
							int size = 0; 
							
							if(comments.size() > 3){
								
								size = 3;
							}else{
								size = comments.size();
							}
							
						for(int i = 0 ; i < size ; i++){
							
							comment cm = comments.get(i);
						
							Calendar cal = Calendar.getInstance();
						    cal.setTime(cm.getPublishDate());
						
						int day =  cal.get(Calendar.DAY_OF_MONTH);
						
						String month = null;
						
						int mo =  cm.getPublishDate().getMonth();
						
						month = pdao.getMonth(mo);
						
						int year =  cm.getPublishDate().getYear() + 1900;
						%>
						<div class="comment">
							<div class="dateIcon">
								<i class="fa-solid fa-circle-user"></i>	
								<p><%=day%> <%=month %>, <%=year %> </p>
							</div>
							<div class="com">
								<p><%=cm.getOwner() %></p>
								<p><%=cm.getComment() %></p>
							</div>
						
						</div>
						
						<%}}else{ %>
							<p style="color:red;"> <i class="fa-solid fa-hexagon-exclamation"></i> PAS DE COMMENTAIRE</p>
						<%} %>
						
					<a href="commentaires.jsp">Voir Plus <i class="fa-solid fa-circle-chevron-right"></i></a>	
				</div>
				
				</div>
			
			
			<div class="boxpackContainer">
			
				<div class="boxpack">
				
					<h3>Ebooks Récents</h3>
				
				</div>
				
				<div class="boxpack">
				
					<h3>Utilisateurs</h3>
				
				</div>
			</div>
			
			</div>
	</div>
	</div>


	<!-- admin script -->

	<script src="../js/scriptBO.js"></script>

	<!-- admin script -->
	
</body>
</html>