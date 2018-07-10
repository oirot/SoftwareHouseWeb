<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
	<html>
	
		<head>
		
			<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
			<title>Information</title>
			<base href="/SoftwareHouseWeb/">
			<link rel= "stylesheet" href="css/information.css" type="text/css">			
			<script src="javascript/information.js" type="text/javascript"></script>
			
			</head>
		
			<body>
			
				<h1 id="leadership">Leadership:</h1>
				
				
			
			<jsp:include page="/includes/navbar.html"></jsp:include>
			
				<div id="form_container">
				
				<h1 id="frase_effetto">"Non seguire il sentiero: tracciane uno nuovo e lascia la tua impronta da seguire."</h1>
				
					<form action="j_security_check" method="post">
				
					</form>	
					
				</div>
				
				<h1 id="azienda">La Nostra Azienda</h1>
				<h1 id="chi_siamo">Chi Siamo</h1>
				<h1 id="contatti">Contatti</h1>
			
			<jsp:include page="includes/footer.html"></jsp:include>
	
			</body>
	</html>