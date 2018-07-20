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
<meta charset="UTF-8">
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
					<th>Quantità</th>
					<th>Totale</th>		
				</tr>
			<%
			BigDecimal totalPrice = new BigDecimal("0");
			while(cartIter.hasNext()){
				cartProduct = cartIter.next();
				BigDecimal itemsPrice = cartProduct.getPrice().multiply(new BigDecimal(cartProduct.getQuantity()));
				totalPrice = totalPrice.add(itemsPrice);
			%>
				<tr>
					<td><%=cartProduct.getName()%></td>
					<td><%=cartProduct.getDescriprion()%></td>
					<td><%=cartProduct.getPrice().toString()%></td>
					<td><%=cartProduct.getQuantity()%></td>
					<th><%=itemsPrice.toString()%></th>		
				</tr>
			<%}%>	
			</table>
			<p>Totale: <%=totalPrice%></p>
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