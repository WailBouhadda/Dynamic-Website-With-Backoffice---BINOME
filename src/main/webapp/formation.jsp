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
			<span>Formations</span>
		</div>
		<div class="pageContent">
			<div class="blog" id="blog">
				<div class="formations">
					<div class="formation" id="Gestionduquotidien">
						<img src="images/formation1.jpg">
							<h3>Gestion du quotidien</h3>
								<div class="FD">
									<span>•	Rôle de l’assistante dans l’entreprise </span>
									<span>•	Les techniques d’accueil </span>
										<p>•	Dimensions comportementales </p>
										<p>•	Communication verbale  Téléphone </p>
									<span>•	Organisation de son travail et de celui des autres collaborateurs </span>
										<p>•	Méthodes et outils (bureautique) </p>
										<p>•	Gestion des priorités </p>
										<p>•	Identification des activités chronophages </p>
										<p>•	Organisation des déplacements et des manifestations </p>
										<p>•	Gestion du stress </p>
									<span>•	Gestion de l’information </span>
										<p>•	Mise en place d’un classement efficace </p>
										<p>•	Traitement de l’information </p>
									<span>•	Communication écrite professionnelle </span>
								</div>	
					</div>
					
					<div class="formation" id="Developpementpersonnel">
						<img src="images/formation2.jpg">
							<h3>Développement personnel</h3>
								<div class="FD">
									<span>•	Adopter la « business attitude » . Confidentialité  </span>
										<p>•	Maîtrise des règles du savoir-vivre professionnel  </p>
										<p>•	Réseautage </p>
									<span>•	Cultiver l’excellence relationnelle </span>
										<p>•	Affirmation de soi  </p>
										<p>•	Argumentation et négociation  </p>
										<p>•	Gestion des situations difficiles (savoir dire non, faire face à la critique et aux conflits)  </p>
										<p>•	Développer ses capacités relationnelles </p>
									<span>•	Coopérer avec les équipes  </span>
										<p>•	Circulation de l’information  </p>
										<p>•	Organisation du travail  </p>
										<p>•	Suivi des missions transverses  </p>
								</div>	
					</div>
						
					<div class="formation" id="Binomeassistante/manager">
						<img src="images/formation3.jpg">
							<h3>Binôme assistante / manager</h3>
								<div class="FD">
									<span>•	Optimiser la relation avec son patron  </span>
									<span>•	Développer la relation de confiance  </span>
									<span>•	Bien collaborer en fonction de la personnalité du manager </span>
									<span>•	Donner / redonner au poste d'Assistante toute sa dimension et toute sa valeur  </span>
								</div>	
					</div>
					
					
				</div>
			</div>
			<jsp:include page="sideBar.jsp"></jsp:include>
		</div>
	</div>

</div>








<jsp:include page="footer.jsp"></jsp:include>
