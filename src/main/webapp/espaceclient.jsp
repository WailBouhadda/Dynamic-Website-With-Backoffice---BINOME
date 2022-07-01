  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="java.util.*"%>
  <%@page import="java.io.*"%>
  <%@page import="dao.posteDAO"%>
           <%@page import="entities.ebook"%>
         <%@page import="dao.ebookDAO"%>
       
<jsp:include page="navBar.jsp"></jsp:include>
<%


HttpSession s = request.getSession();

s.setAttribute("source", "EspaceClient");

 
posteDAO pdao = new posteDAO();

ebookDAO ebdao = new ebookDAO();




ArrayList<ebook> ebooks = ebdao.getEbooks();


%>


<jsp:include page="header.jsp"></jsp:include>

<div class="pageContainer">

	<div class="container">
		<div class="pageSubject">
			<span>Home</span>
			<span> / </span>
			<span>Espace client</span>
		</div>
		<div class="pageContent">
			<div class="blog" id="blog">
				<div class="espaceclient">
				<% 
					
				if(session.getAttribute("user") == null){
				
				%>
					<form action="userLogin" method="post">
								<div class="userlogin">
									<h1>Authentification</h1>
									<div class="mailInput">
										<i class="fa fa-envelope"></i>
										 <input type="email" name="email" placeholder="E-mail..." required>
									</div>
									<div class="passwordInput">
										<i class="fa fa-key"></i>
										 <input type="password" placeholder="Mot de passe..." name="password" id="password" required>
										 <span class="eye" onclick="showPassword('password')">
										 <i id="eyeShowpassword" style="display:none;" class="fa fa-eye"></i>
										 <i id="eyeHidepassword"  style="display:block;" class="fa fa-eye-slash"></i>
										 </span>
									</div>
									<button type="submit" class="loginBtn">S'authentifier</button> 
						<% String LoFai = (String)request.getAttribute("Failed");
							
							if(LoFai != null){
								if(LoFai.equals("true")){
								
							%>
								<p style="color:red; text-align:center;"><i style="margin-right:10px;" class="fa-solid fa-triangle-exclamation"></i> Email ou Mot de passe est incorrect !</p>
								<% 
							}else if(LoFai.equals("false")){%>
								<p style="color:red; display:none; text-align:center;"><i style="margin-right:10px;" class="fa-solid fa-triangle-exclamation"></i>Email ou Mot de passe est incorrect !</p>
							<% }
								}
							%>
								</div>
						</form>	
					<%}else{
							
									
				
							
				if(ebooks != null){			
					for(int i = 0 ; i < ebooks.size() ; i++) {	
			
						
						ebook e = new ebook();
						e = ebooks.get(i);
						
						int idoffre = e.getIdEbook();
						
						String title =  e.getTitle();
										
						
						
						
						 Calendar cal = Calendar.getInstance();
						    cal.setTime(e.getDatePubli());
						
						int day =  cal.get(Calendar.DAY_OF_MONTH);
						
						String month = null;
						
						int mo =  e.getDatePubli().getMonth();
						
						int year =  e.getDatePubli().getYear() + 1900;
						
						month = pdao.getMonth(mo);
						
	 
			  	
					%>
				<a href="">
					<div class="ebook">
						<span><%=title %></span>
						<span><%=day%>,<%=month%> <%=year%></span>
						
					</div>
				</a>				
					
					<%}}else{%>
					
					
					<%}} %>
				</div>
			</div>
			<jsp:include page="sideBar.jsp"></jsp:include>
		</div>
	</div>

</div>








<jsp:include page="footer.jsp"></jsp:include>
