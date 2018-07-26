<%@page import="model.Review"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="model.SellingProductDAO"%>
<%@ page import="model.SellingProductDTO"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="java.sql.SQLException"%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html>

<head>

			<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Descrizione Prodotti</title>
			<base href="/SoftwareHouseWeb/">
			<link rel= "stylesheet" href="css/product_content.css" type="text/css">	
			<link rel= "stylesheet" href="css/site.css" type="text/css">
			<script type="text/javascript" src="javascript/product_content.js"></script>		    
</head>

		<body>
		
		<%  SellingProductDAO sellingProductDAO = null;
		try {
			sellingProductDAO = new SellingProductDAO((DataSource)getServletContext().getAttribute("software_ds"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		SellingProductDTO product = null;
		String logoPath = null;
		int productId = 0;
		if(sellingProductDAO != null){
			try{
				productId = Integer.parseInt(request.getParameter("id"));
				product = sellingProductDAO.getProductById(productId);
			}
			catch(SQLException e){
				e.printStackTrace();
			}catch(NumberFormatException e){
				response.sendError(400);
				return;
			}
		}
		logoPath = request.getParameter("logo");
		if(product != null && logoPath != null){%>
			
			<div id="container">
				
				<div id="descrizione" style="height: 200px;">				
					<p><%=product.getDescriprion()%></p>
				</div>
				
				
				<img id="logo_prodotto" alt="logo_prodotto" src="images/<%=logoPath%>">
				
				
				<div id="recensioni" style="overflow-y:scroll;width:31.2%; height: 220px;">
					<div>
						<%
						boolean status = true;
						ArrayList<Review> recensioni = null;
						float valutazione = 5;
						try{
							recensioni = sellingProductDAO.getRecensioniById(productId);
							valutazione = sellingProductDAO.RateOfId(productId);
						}catch(SQLException e){
							e.printStackTrace();
							status = false;
						}
						if(status){
							%>
							<p><b>Valutazione media:</b> <%=String.format("%.2f", valutazione)%></p>
							<%for(int i = 0; i < recensioni.size(); i++){
								Review recensione = recensioni.get(i);%>
							<p><b>Commento:</b> <%=recensione.getComment()%><br>
							<b>Valutazione:</b> <%=recensione.getStars()%></p>
							<%}
						}else{
						%><p>Non è stato possibile recuperare le recensioni</p>
						<%}
						if(sellingProductDAO != null)
							sellingProductDAO.close();%>
							
					</div>
				</div>
				
				<div id="logo">
					<img id="logo-content" alt="logo" src="images/logo-no-sfondo.png">				
				</div>
				
				<div id="container_aggiungi"style="height: 200px;">
				
						
				
				<div>
						<textarea id="commenta" placeholder="Inserisci qui la tua recensione" style="height: 100px;"></textarea>
						
					<div id="buttons">
						<input id="stars"type="number" min="0" max="5" value="5"><br>		
						<button class="btn_acq" id="button_recensione" type="button" onclick="sendReview(<%=productId%>)">Recensisci</button>
					</div>
						
				</div>
					
				</div>
				
				<%}else{%>
					<p>Ngul nun funzion niente</p>
				<%}%>
				
				<jsp:include page="includes/footer.html"></jsp:include>	
				
			</div>
		</body>	
		
</html>