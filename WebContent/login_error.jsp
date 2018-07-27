<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false" isErrorPage="true"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Log In Error</title>
		<base href="/SoftwareHouseWeb/">
		<link rel= "stylesheet" href="css/login_error.css" type="text/css">
		<link rel= "stylesheet" href="includes/navbar.css" type="text/css">
		<link rel= "stylesheet" href="includes/footer.css" type="text/css">
		<link rel= "stylesheet" href="css/site.css" type="text/css">
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
	</head>
			<body>
			
			<jsp:include page="includes/navbar.html"></jsp:include>
			
				<div id="container">
					
					<img id="logo" alt="logo" src="images/logo-no-sfondo.png"><br>
					
					<p>
						Opss! C'� stato un errore durante il login. Riprova
					</p>	
					
				</div>	
				
			<jsp:include page="includes/footer.html"></jsp:include>
						
			</body>
</html>