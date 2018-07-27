<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Home</title>
	<base href="/SoftwareHouseWeb/">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel= "stylesheet" href="css/home.css" type="text/css">
	<link rel= "stylesheet" href="css/long_page.css" type="text/css">
	<link rel= "stylesheet" href="css/product_content.css" type="text/css">
	<link rel= "stylesheet" href="css/site.css" type="text/css">
	<link rel= "stylesheet" href="includes/navbar.css" type="text/css">
	<link rel= "stylesheet" href="includes/footer.css" type="text/css">
	
	
</head>
<body>
	<div class="container">
		<jsp:include page="/includes/navbar.html"></jsp:include>
		<div id="home_img_container">
			<img id="arrow-sx" src="images/arrow-sx.png" onclick="move_sx()" alt="arrow-sx">
			<a id="link_1" href="products?id=1"><img id="img_prodotto" src="images/webgeartop.jpg" alt="img prodotto"></a>
			<img id="arrow-dx" src="images/arrow-dx.png" onclick="move_dx()" alt="arrow-dx">
			<button class="btn_acq aggiungi" id="btn_1" onclick="acquista(this)" type="button">Aggiungi</button>
			<input id="q_1" class="hidden" type="number" value="1">
		</div>
			
		<div id="prodotto">
			<jsp:include  page="/restricted/product_content.jsp">
				<jsp:param value="1" name="id"/>
				<jsp:param value="webgear.png" name="logo"/>
			</jsp:include>
	
		</div>
		<jsp:include page="/includes/footer.html"></jsp:include>
	</div>
</body>

<script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="javascript/home.js"></script>
<script type="text/javascript" src="javascript/acquista.js"></script>
<script type="text/javascript" src="javascript/product_content.js"></script>		    


</html>