<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registrazione</title>
	<base href="/SoftwareHouseWeb/">
	<link rel= "stylesheet" href="css/signup.css" type="text/css">
	<link rel="stylesheet" href="css/long_page.css" type="text/css">
</head>
<body>

	<jsp:include page="/includes/navbar.html"></jsp:include>
	
<div id="container">

	<h2>SoftwareHouse<a>Web</a></h2>

	<div id="text_container">
		<h1>Registrati ed ottieni lo status di utente registrato:</h1>
		<p>una volta registrato potrai acquistare prodotti</p>
	</div>
	<div id="form_container">
		<form action="addUser">
			
			<div class="tableRow">
			<p>Nome</p>
			<p><input type="text" name="nome" placeholder="Nome"/></p>
			</div>
			
			<div class="tableRow">
			<p>Cognome</p>
			<p><input type="text" name="cognome" placeholder="Cognome" /></p>
			</div>
			
			<div class="tableRow">
			<p>Email</p>
			<p><input type="text" name="email" placeholder="email"></p>
			<p><img alt="user-error" src="images/username-no.jpg"></p>
			</div>
			
			<div class="tableRow">
			<p>Data di nascita</p>
			<p><input type="date" name="data_nascita"></p>
			</div>
			
			<div class="tableRow">
			<p>Password</p>
			<p><input type="password" name="hashed_password"></p>
			</div>
			
			<div>
			<p><input class="btn_acq"id="button"type="submit" value="Iscriviti"/></p>
			</div>
			
		</form>
	</div>
</div>

	<jsp:include page="includes/footer.html"></jsp:include>
	
</body>
</html>