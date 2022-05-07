<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import="java.util.ArrayList"%>
        <%@page import="entities.poste"%>
        <%@page import="dao.posteDAO"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 		      
HttpSession ss = request.getSession();

posteDAO pdao = new posteDAO();

ArrayList<poste> postes = pdao.getPostes();

String img = null;




for(int i = 0 ; i < postes.size() ; i++) {	

	
	poste p = new poste();
	p = postes.get(i);
	String title =  p.getTitle();
	String content = p.getContent();
	
	%>
	 <p><%=title %></p>
	 <div><%=content %></div>
<% 
}
 %>
 
 

</body>
</html>