  <%@page import="java.util.*"%>
  <%@page import="java.io.*"%>
        <%@page import="entities.poste"%>
        <%@page import="entities.categorie"%>
        <%@page import="entities.comment"%>
        <%@page import="dao.posteDAO"%>
        <%@page import="dao.commentDAO"%>
        <%@page import="dao.categorieDAO"%>
        
 <%
 
HttpSession ss = request.getSession();

posteDAO pdao = new posteDAO();

categorieDAO cdao = new categorieDAO();

commentDAO codao = new commentDAO();

int po = Integer.parseInt(request.getParameter("p"));

poste poste = pdao.getPosteById(po);

String action = String.valueOf(ss.getAttribute("action"));

%>
<jsp:include page="navBar.jsp"></jsp:include>


<jsp:include page="header.jsp"></jsp:include>

<div class="pageContainer">

	<div class="container">
		<div class="pageSubject">
			<span>Home</span>
			<span> / </span>
			<span>Blog</span>
			<span> / </span>
			<span><%=poste.getTitle() %></span>
		</div>
		<div class="pageContent">
			<div class="poste" id="poste">
			
				<%
	if(poste != null){	

			byte[] imgdata = null;

						
			int idPoste = poste.getId();
			
			String title =  poste.getTitle();
			
			int nblike = poste.getNbrLike();
			
			int nbcomm = poste.getNbrComments();
			
			 Calendar cal = Calendar.getInstance();
			    cal.setTime(poste.getPublishDate());
			
			int day =  cal.get(Calendar.DAY_OF_MONTH);
			
			String month = null;
			
			int mo =  poste.getPublishDate().getMonth();
			
			month = pdao.getMonth(mo);
			
			String content = poste.getContent(); 
			
			int year =  poste.getPublishDate().getYear() + 1900;
			
			
			byte[] imageBytes=poste.getImage().getBytes(1, (int)poste.getImage().length());
		  	String encodedImage=Base64.getEncoder().encodeToString(imageBytes);
		  	String image = "data:image/jpg;base64,"+encodedImage;
		  	
				%>
				
					<div class="posteTitle">
						<h2><%=title%></h2>
					</div>
					<div class="posteImg">
						<img src="<%=image%>">
					</div>
					<div class="infos">
						<div class="upline">
							<div class="postedate">
								<p><%=day%> <%=month %>, <%=year %> </p>
							</div>
							<div class="reaction">
								<span class="heart">
									<p><%=nblike %></p>
									<%if(!action.equals("null")){
										if(action.equals("like")){%>
										<i id="dislike" onclick="location ='likeDislike?p=<%=po%>&a=dislike';" style="display:none" class="fa-regular fa-heart"></i>
										<i id="like" onclick="location ='likeDislike?p=<%=po%>&a=like';" style="display:block" class="fa-solid fa-heart"></i>
									<%}else if(action.equals("dislike")){%>
										<i id="dislike" onclick="location ='likeDislike?p=<%=po%>&a=dislike';" style="display:block" class="fa-regular fa-heart"></i>
										<i id="like" onclick="location ='likeDislike?p=<%=po%>&a=like';" style="display:none" class="fa-solid fa-heart"></i>
									<%}}else if(action.equals("null")){ %>
										<i id="dislike" onclick="location ='likeDislike?p=<%=po%>&a=dislike';" style="display:block" class="fa-regular fa-heart"></i>
										<i id="like" onclick="location ='likeDislike?p=<%=po%>&a=like';" style="display:none" class="fa-solid fa-heart"></i>
									<%} %>
								</span>
							</div>
						</div>
						<hr>
					</div>
				
					<div class="posteContent">
						<%=content %>
					</div>
										
					
					
					
				<%}else{%>
					
					<p style="color:red;">Un error est servenu, Pas de poste pour le moment !</p>
				<% }%>	
				
				
				<div class="comments">
					<hr>
					<div class="addComment">
						<h3>Ajouter un commentaire</h3>
						<form action="addComment?idp=<%=po%>" method="post">
							<div class="commentInput">
								<input type="text" name="ownerName" placeholder="Nom ou Pseudo..." required>
								<input type="email" name="ownerEmail" placeholder="Email..." required>
							</div>
							 <textarea name="comment" id="" placeholder="Message..." cols="30" rows="10" required></textarea>
							<input type="submit" name="addcomment" value="Ajouter">
						</form>
					</div>
					
					<hr>
					
					<div class="commentListe">
						<%
						ArrayList<comment> comments = codao.getCommentsByStatutId(1,po);
						if(comments.size() >0){
						for(int i = 0 ; i < comments.size() ; i++){
							
							comment cm = comments.get(i);
						
							Calendar cal = Calendar.getInstance();
						    cal.setTime(cm.getPublishDate());
						
						int day =  cal.get(Calendar.DAY_OF_MONTH);
						
						String month = null;
						
						int mo =  poste.getPublishDate().getMonth();
						
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
					</div>
				</div>
				
			</div>
			<jsp:include page="sideBar.jsp"></jsp:include>
		</div>
	</div>

</div>








<jsp:include page="footer.jsp"></jsp:include>