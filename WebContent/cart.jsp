<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.catalina.Session"%>
<%@page import="utility.Cart"%>
<%@page import="pattern_dao.CartProduct"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Carello</title>
</head>
<body>
	<jsp:include page="includes/navbar.html"></jsp:include>
	<%Cart cart = (Cart)session.getAttribute("cart");
	Iterator<CartProduct> cartIter = null;
	if(cart != null){
	 cartIter = cart.getElements();
	}
	CartProduct cartProduct;%>
	<div id="container">
		<h1>Carello</h1>
		<%if(cart != null && cartIter != null){%>	
		<div id="info_prod">
			<table>
				<tr>
					<th>Nome</th>
					<th>Descrizione</th>
					<th>Costo Unitario</th>
					<th>Totale</th>		
				</tr>
			<%
			while(cartIter.hasNext()){
				cartProduct = cartIter.next();
			%>
				<tr>
					<th><%=cartProduct.getName()%></th>
					<th><%=cartProduct.getDescriprion()%></th>
					<th><%=cartProduct.getPrice().toString()%></th>
					<th><%=cartProduct.getPrice().multiply(new BigDecimal(cartProduct.getQuantity())).toString()%></th>		
				</tr>
			<%}%>	
			</table>
		</div>
	<%}else{%>
		<div>
			<h2>
				Nessun prodotto selezionato
			</h2>
			<div id="please-buy">
				<p>
					Non hai nessun prodotto nel carrello, vai <a href="products">qui</a> per
					ottenere una lista comprensiva dei prodotti offerti
				</p>
			</div>
		</div>	

	<%}%>
	</div>
	<jsp:include page="includes/footer.html"></jsp:include>
	
</body>
</html>