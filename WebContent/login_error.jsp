<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false" isErrorPage="true"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Log In Error</title>
		<link rel= "stylesheet" href="css/login.css" type="text/css">
	</head>
			<body>
				<div id="container">
					<jsp:include page="includes/navbar.html"></jsp:include>
					<h1>SoftwareHouse<a>Web</a></h1>
					<p>
						Opss! C'è stato un errore durante il login. Riprova
					</p>	
					<jsp:include page="includes/footer.html"></jsp:include>
				</div>			
			</body>
</html>