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
			
				<jsp:include page="/includes/navbar.html"></jsp:include>
				<h2>Prodotti</h2>
					
				<%ArrayList<SellingProductDTO> prodotti = (ArrayList<SellingProductDTO>)request.getAttribute("sellingList"); 
				//boolean isMod = (boolean)request.getAttribute("isMod");	
				boolean isMod = true;
				if(prodotti == null || prodotti.isEmpty() ) {%>
				
					<p>"Non ci sono prodotti disponibile nel carrello."</p>
					
				<%} else {%>
				
				<table>
				
				  <tr>
				  
				    <th>Nome</th>
				    <th>Descrizione</th>
				    <th>Id Progetto</th>
				    <th>Versione</th>
				    <th>Prezzo</th>
				    <th></th>
				    
				  </tr>
				  <%if(isMod){%>
				    <tr>
				 	  	<td><input id="add_name" type="text"></td>
				 	  	<td><input id="add_desc" type="text"></td>
				 	  	<td><input id="add_ida" type="text"></td>
				 	  	<td><input id="add_vers" type="text"></td>
				 	  	<td><input id="add_prez" type="number"></td>
				 	  	<td><button type="button" onclick="add()">Aggiungi</button></td>

				 	  </tr>
				  
				  <%}
				  for(int i = 0; i < prodotti.size(); i++){
					  SellingProductDTO productToFormat = prodotti.get(i);
					  int currentId = productToFormat.getId();%>
				  
				  
				 	  <%if(isMod){%>
   				 	 <tr id="tr_<%=currentId%>">
				 	  
					 	  <td id="name_<%=currentId%>" ondblclick="modify(this)"><%=productToFormat.getName()%></td>
					 	  <td id="description_<%=currentId%>" ondblclick="modify(this)"><%=productToFormat.getDescriprion()%></td>
					 	  <td id="ida_<%=currentId%>" ondblclick="=modify(this)"><%=productToFormat.getIdaProgetto()%></td>
					 	  <td id="version_<%=currentId%>" ondblclick="modify(this)"><%=productToFormat.getVersion()%></td>
					      
					 	  <td id="price_<%=currentId%>" ondblclick="modify(this)"><%=productToFormat.getPrice()%></td>
				
					 	  <td><button id="save_<%=currentId%>" type="button" onclick="save(this)" disabled>Salva</button></td>
					 </tr>
				   	  <%}else{%>
				   	  <tr>
					   	  <td><%=productToFormat.getName()%></td>
					 	  <td><%=productToFormat.getDescriprion()%></td>
					 	  <td><%=productToFormat.getIdaProgetto() %></td>
					 	  <td><%=productToFormat.getVersion()%></td>
					 	  <td><%=productToFormat.getPrice()%></td>
					   	  <td>
					   	  	<button id="btn_<%=productToFormat.getId()%>" onclick="acquista(this)">Acquista</button>
					   	  	<input class="input_quantity" id="q_<%=productToFormat.getId()%>"type="number" name="quantity" min="1" max="1000" value="1">
					   	  </td>
 				   	</tr>
					  <%}%>
				   	
				  <%}%>
				  
				 <%}%>
				</table>
			<script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript"></script>
			<script src="javascript/prodotti.js" type="text/javascript"></script>
			</body>
</html>