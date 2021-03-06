<%@page import="model.Review"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="model.SellingProductDAO"%>
<%@ page import="model.SellingProductDTO"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="java.sql.SQLException"%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 



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
		
		
		<aside>
			<div id="img_container">
				<img id="logo_prodotto" alt="logo_prodotto" src="images/<%=logoPath%>"><br>
			</div>
			
			<div id="recensioni" style="overflow-y:scroll;">
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
					%><p>Non � stato possibile recuperare le recensioni</p>
					<%}%>
						
				</div>
			</div><br>
			
		
			<div id="container_aggiungi">
				<textarea id="commenta" placeholder="Inserisci qui la tua recensione" style="height: 100px;"></textarea>
					
				<div id="buttons">
					<input id="stars"type="number" min="0" max="5" value="5"><br>		
					<button class="btn_acq" id="button_recensione" type="button" onclick="sendReview(<%=productId%>)">Recensisci</button>
				</div>	
			</div>
		</aside>
		
		<div id="descrizione" style="height: 200px;">				
			<p><%=product.getDescriprion()%></p>
		</div>
		
		<div id="logo">
			<img id="logo-content" alt="logo" src="images/logo-no-sfondo.png">				
		</div>
			
		
	</div>
		
<%}else{%>
	<p>Ngul nun funzion niente</p>
<%}
if(sellingProductDAO != null)
	sellingProductDAO.close();%>	
