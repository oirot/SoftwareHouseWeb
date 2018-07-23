<%@ page import="pattern_dao.SellingProductDAO"%>
<%@ page import="pattern_dao.SellingProductDTO"%>
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
		if(sellingProductDAO != null){
			try{
				product = sellingProductDAO.getProductById(Integer.parseInt(request.getParameter("id")));
			}
			catch(SQLException e){
				e.printStackTrace();
			}catch(NumberFormatException e){
				response.sendError(400);
				return;
			}
		}
		if(product != null){%>
			
			<div id="container">
				
				<div id="descrizione">				
					<p><%=product.getDescriprion()%></p>
				</div>
				
				<div id="recensioni" style="overflow-y:scroll;width:31.2%; height:120px;">
				
					descrizione prod...<br />
					descrizione prod...<br />
					descrizione prod...<br />
					descrizione prod...<br />
					descrizione prod...<br />
					descrizione prod...<br />
					descrizione prod...<br />
				
				</div>
				
				<div id="logo">
				
				<h2>SoftwareHouse<a>Web</a></h2>
				
				</div>
				
				<div id="container_aggiungi">
				
					<p>descrizione prod...</p>
					<p>descrizione prod...</p>
					<p>descrizione prod...</p>
					<textarea rows="10" cols="1"></textarea>
					<button id="commenta" type="button">Commenta</button>
					<button id="aggiungi" type="button">Aggiungi</button>
					
				</div>
				
				<%}else{%>
					<p>Ngul nun funzion niente</p>
				<%}%>
				
				<jsp:include page="includes/footer.html"></jsp:include>	
				
			</div>
		</body>	
		
</html>