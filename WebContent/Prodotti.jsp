<%@page import="pattern_dao.SellingProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
			<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
			<link rel= "stylesheet" href="css/prodotti.css" type="text/css">
			<title>Prodotti</title>
	</head>
			<body>
			
				
				<h2>Prodotti</h2>
				
				<%ArrayList<SellingProductDTO> prodotti = (ArrayList)request.getAttribute("sellingList"); 
				
				if(prodotti == null || prodotti.isEmpty() ) {%>
				
					<p>"Non ci sono prodotti disponibile nel carrello."</p>
					
				<%} else {%>
				
				<table>
				
				  <tr>
				  
				    <th>Nome</th>
				    <th>Rilascio</th>
				    <th>Valutazione</th>
				    <th>Prezzo</th>
				    
				  </tr>
				  
				  <%for(int i = 0; i < prodotti.size(); i++){ %>
				  
				  
				 	 <tr>
				 	 
				 	  <td><%=prodotti.get(i).getName()%></td>
				 	  <td><%=prodotti.get(i).getDescriprion()%></td>
				      
				 	  <td><%=prodotti.get(i).getPrice()%></td>
				 	 
				   	  <td id="btn_<%=prodotti.get(i).getId()%>"><button>Acquista</button></td>
				   	  
				   	</tr>
				   	
				  <%}%>
				  
				 <%}%>
				</table>
				
			</body>
</html>