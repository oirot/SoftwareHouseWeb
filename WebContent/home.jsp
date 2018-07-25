<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel= "stylesheet" href="css/home.css" type="text/css">
</head>
<body>
	<div class="container">
		<jsp:include page="/includes/navbar.html"></jsp:include>
		<div id="home_img_container">
			<img id="arrow-sx" src="images/arrow-sx.png" alt="arrow-sx">
			<img id="img_prodotto" src="images/WebGear.jpg" alt="img prodotto">
			<img id="arrow-dx" src="images/arrow-dx.png" alt="arrow-dx">
			
		</div>
			
		<div id="prodotto">
			<jsp:include  page="product_content.jsp">
				<jsp:param value="61" name="id"/>
			</jsp:include>
	
		</div>
		<jsp:include page="/includes/footer.html"></jsp:include>
	</div>
</body>
</html>