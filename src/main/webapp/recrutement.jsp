  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="java.util.*"%>
  <%@page import="java.io.*"%>
       <%@page import="entities.User"%>
         <%@page import="entities.admin"%>
        <%@page import="dao.UserDao"%>
  		 <%@page import="dao.offreDAO"%>
         <%@page import="entities.offre"%>
         <%@page import="dao.posteDAO"%>
       
<jsp:include page="navBar.jsp"></jsp:include>


<jsp:include page="header.jsp"></jsp:include>


<%
 
posteDAO pdao = new posteDAO();


offreDAO odao = new offreDAO();


ArrayList<offre> offres = odao.getOffres();


%>


<div class="pageContainer">

	<div class="container">
		<div class="pageSubject">
			<span>Home</span>
			<span> / </span>
			<span>Recrutement</span>
		</div>
		<div class="pageContent">
			<div class="blog" id="blog">
				<div class="recrutement">
				
					<div class="demandeemploi">
							<h3>DEPOSER VOTRE CV </h3>
							<form class="addoffre" action="demandeEmploi" method="post" enctype="multipart/form-data">
								<div class="jobtop">
									<div class="pdf">
										<label for="offrepdf">Ajouter votre CV :  <span style="color:red;">MAX:1mo!</span></label>
										<input type="file" name="demandepdf" required>
									</div>
									<input type="text" name="nom" placeholder="Votre nom..." required>
									<input type="text" name="prenom" placeholder="Votre Prenom..." required>
									
								</div>
								<div class="jobdown">
									
									<input type="email" name="email" placeholder="Votre Email..." required>
								</div>
								<input type="submit" name="action" value="AJOUTER">
					</form>
					</div>
					
					<div class="offresemplois">
					
					<h3>OFFRES D'EMPLOI</h3>
					
					<%
					if(offres != null){
						if(offres.size() > 0){	
							for(int i = 0 ; i < offres.size() ; i++) {	
	
								
								offre p = new offre();
								p = offres.get(i);
								int id = p.getIdoffre();
								
								
								String title =  p.getTitre();
								
								String local = p.getLocal();
								
								String details = p.getDetails();
								
								
								 Calendar cal = Calendar.getInstance();
								    cal.setTime(p.getPublishdate());
								
								int day =  cal.get(Calendar.DAY_OF_MONTH);
								
								String month = null;
								
								int mo =  p.getPublishdate().getMonth();
								
								int year =  p.getPublishdate().getYear() + 1900;
								
								month = pdao.getMonth(mo);
								
								
						
						%>
						
						
							<a href="offrepdf?id=<%=id%>">
								<div class="offre">
									
									<div class="left">
										<span> <%=title %></span>
										<div class="infos">
											<span><%=day%>,<%=month%> <%=year%> | </span>
											<i class="fa-solid fa-location-dot"></i>
											<span><%=local %></span>
										</div>
										<span><%=details %></span>
										
									</div >
									<div class="right">
										<i class="fa-solid fa-file-arrow-down"></i>
									</div>
									
								</div>
							</a>
						
						<%}}else{ %>
									<p style="color:red;"> <i style="margin-right:10px;" class="fa-solid fa-circle-exclamation"></i> PAS D'OFFRE POUR LE MOMENT</p>
						<%}}else{ %>
									<p style="color:red;"> <i style="margin-right:10px;" class="fa-solid fa-triangle-exclamation"></i>UNE ERREUR EST SURVENUE, PAS D'OFFRE POUR LE MOMENT</p>
						<%} %>
					</div>
					
				</div>
			</div>
			<jsp:include page="sideBar.jsp"></jsp:include>
		</div>
	</div>

</div>








<jsp:include page="footer.jsp"></jsp:include>
