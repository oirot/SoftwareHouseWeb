<%@page import="model.SellingProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<base href="/SoftwareHouseWeb/">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel= "stylesheet" href="/SoftwareHouseWeb/css/prodotti.css" type="text/css">
		<link rel= "stylesheet" href="/SoftwareHouseWeb/css/long_page.css" type="text/css">
		<link rel= "stylesheet" href="includes/navbar.css" type="text/css">
		<link rel= "stylesheet" href="includes/footer.css" type="text/css">
		<link rel= "stylesheet" href="css/site.css" type="text/css">
			
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<title>Prodotti</title>
</head>
<body>
<div id="container">
	<jsp:include page="/includes/navbar.html"></jsp:include>
	<h2>Prodotti</h2>
					
		<%ArrayList<SellingProductDTO> prodotti = (ArrayList<SellingProductDTO>)request.getAttribute("sellingList");
		if(prodotti == null || prodotti.isEmpty() ) {%>
			<p>"Non ci sono prodotti disponibile nel carrello."</p>
		<%}else{%>
		
		<table>
		  <tr>
		  	<th>Id</th>
		    <th>Nome</th>
		    <th>Descrizione</th>
		    <th>Id Progetto</th>
		    <th>Versione</th>
		    <th>Prezzo</th>
		    <th></th>
		  </tr>
		  <tr>
	    	<td></td>
	 	  	<td><input id="add_name" type="text"></td>
	 	  	<td><textarea id="add_desc"></textarea></td>
	 	  	<td><input id="add_ida" type="text"></td>
	 	  	<td><input id="add_vers" type="text"></td>
	 	  	<td><input id="add_prez" class="input_price" min="1" type="number"></td>
			<td><button type="button" class="btn_acq" onclick="add()">Aggiungi</button></td>
	 	  </tr>
	 	  <%
	 		  for(int i = 0; i < prodotti.size(); i++){
			  SellingProductDTO productToFormat = prodotti.get(i);
			  int currentId = productToFormat.getId();%>
			   <tr id="tr_<%=currentId%>">
				 	  	  <td id="id_<%=currentId%>"><%=productToFormat.getId()%></td>
					 	  <td id="name_<%=currentId%>" class="modify" ondblclick="modify(this)"><%=productToFormat.getName()%></td>
					 	  <td id="description_<%=currentId%>" class="modify" ondblclick="modify(this)"><%=productToFormat.getDescriprion()%></td>
					 	  <td id="ida_<%=currentId%>" class="modify" ondblclick="modify(this)"><%=productToFormat.getIdaProgetto()%></td>
					 	  <td id="version_<%=currentId%>" class="modify" ondblclick="modify(this)"><%=productToFormat.getVersion()%></td>
					      
					 	  <td id="price_<%=currentId%>" class="modify" ondblclick="modify(this)"><%=productToFormat.getPrice()%></td>
				
					 	  <td><button id="save_<%=currentId%>" type="button" class="btn_acq" onclick="save(this)" autocomplete="off" disabled>Salva</button></td>
					 </tr>
		 	<%}
		 }%>
	</table>
	<jsp:include page="/includes/footer.html"></jsp:include>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="javascript/prodotti.js" type="text/javascript"></script>
	
</body>
</html>