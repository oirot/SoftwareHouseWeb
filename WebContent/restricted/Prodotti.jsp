<%@page import="model.SellingProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
			<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
			<link rel= "stylesheet" href="css/prodotti.css" type="text/css">
			<link rel= "stylesheet" href="css/long_page.css" type="text/css">
			
			<title>Prodotti</title>
	</head>
			<body>
			
				<jsp:include page="/includes/navbar.html"></jsp:include>
				<h2>Prodotti</h2>
				<%ArrayList<SellingProductDTO> prodotti = (ArrayList<SellingProductDTO>)request.getAttribute("sellingList");
				if(prodotti == null || prodotti.isEmpty() ) {%>
				
					<p>"Non ci sono prodotti disponibile nel carrello."</p>
					
				<%} else {%>
				
				<table>
				
				  <tr>
				  	<th>Id</th>
				    <th>Nome</th>
				    <th>Descrizione</th>
				    <th>Id Progetto</th>
				    <th>Versione</th>
				    <th>Prezzo</th>	
  				    <th>Quantià</th>			    			    
					<th></th>
				  </tr>
				  <%for(int i = 0; i < prodotti.size(); i++){
					  SellingProductDTO productToFormat = prodotti.get(i);
					  int currentId = productToFormat.getId();%>
					  
					  
				   	  <tr>
				   	  	  <td><%=productToFormat.getId()%></td>
					   	  <td><%=productToFormat.getName()%></td>
					 	  <td><%=productToFormat.getDescriprion()%></td>
					 	  <td><%=productToFormat.getIdaProgetto() %></td>
					 	  <td><%=productToFormat.getVersion()%></td>
					 	  <td><%=productToFormat.getPrice()%></td>
					   	  <td>
					   	  	<input class="input_quantity" id="q_<%=productToFormat.getId()%>" type="number" name="quantity" min="1" max="1000" size="4" value="1">
					   	  </td>
					   	  <td>
						   	  <div class="btn_container">
						   	  	<button id="btn_<%=productToFormat.getId()%>" class="btn_acq" onclick="acquista(this)">Acquista</button>
						   	  </div>
					   	  </td>
 				   	</tr>
				 <%}%>
			 <%}%>
			</table>
			
			<jsp:include page="/includes/footer.html"></jsp:include>
			
			<script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript"></script>
			<script src="javascript/prodotti.js" type="text/javascript"></script>
			<script src="javascript/acquista.js" type="text/javascript"></script>

			</body>
</html>