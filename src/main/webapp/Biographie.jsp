  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="java.util.*"%>
  <%@page import="java.io.*"%>
       
<jsp:include page="navBar.jsp"></jsp:include>


<jsp:include page="header.jsp"></jsp:include>

<div class="pageContainer">

	<div class="container">
		<div class="pageSubject">
			<span>Home</span>
			<span> / </span>
			<span>Biographie</span>
		</div>
		<div class="pageContent">
			<div class="blog" id="blog">
				<div class="biographie">
					<div class="logoBio">
						<img src="images/logo.png">
					</div>
					<div class="titleBio">
						<h4>L’expérience et l’expertise dans son domaine d’intervention !</h4>
					</div>
					<div class="bioBio">
						<p>Après un début de carrière d’assistante de direction trilingue à Paris, j’ai choisi de m’installer au Maroc avec sa famille.  J’ai d’abord rejoint un holding familial spécialisé dans le transport et la logistique, avant d’être appelée auprès de la direction générale de la SAMIR, puis auprès de la présidence de Maroc Telecom.  En 2007, je me suis mise au service du PDG de HPS, et l’ai assisté dans sa double mission à la direction de l’entreprise et à la présidence de la CGEM. </p>
						<p><br>En 2012, en parallèle de ma carrière chez HPS, j’ai créé binÔme Sarl afin de répondre aux besoins de formation des assistantes de direction.  </p>
						<p><br>Je suis impliquée dans l’associatif, ce qui me permet de partager mes connaissances et mes passions.</p>
					</div>
				</div>
			</div>
			<jsp:include page="sideBar.jsp"></jsp:include>
		</div>
	</div>

</div>








<jsp:include page="footer.jsp"></jsp:include>
