<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>

<!DOCTYPE html>
	<html>
		<head>

			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">

			<title>Log In Page</title>
			<base href="/SoftwareHouseWeb/">
			<link rel= "stylesheet" href="css/login_page.css" type="text/css">			
			<script src="javascript/login.js" type="text/javascript"></script>
			
		</head>

		<body>
			
			<div id="container">
			
					<jsp:include page="/includes/navbar.html"></jsp:include>
					
					<img id="logo" alt="logo" src="images/logo.bmp.jpg">
					
					<div id="loginform">
						<div id="form_container">
						<form action="j_security_check" method="post">
						
									<span id="bad_email" class="bad_request">
										Formato email non corretto
									</span>
									<input type ="text" name="j_username" placeholder="Email" class="form" onkeyup="validateMail(this)"><br>
										
									<span id="bad_psw" class="bad_request">
										Password troppo corta e/o con caratteri non validi (min 6 caratteri solo lettere e numeri)
									</span>
									<input type="password" name="j_password" placeholder="Password" class="form" onkeyup="validatePsw(this)"><br>
									
							 		<input id = "login_button" type="submit" value="Login" class="form" disabled><br>
						</form>
							
					</div>
						
					</div>
					<jsp:include page="includes/footer.html"></jsp:include>
				</div>
			</body>
			
	</html>