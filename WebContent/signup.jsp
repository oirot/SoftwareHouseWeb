<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registrazione</title>
	<base href="/SoftwareHouseWeb/">
	<link rel= "stylesheet" href="css/signup.css" type="text/css">
	<link rel= "stylesheet" href="css/site.css" type="text/css">
	<link rel="stylesheet" href="css/long_page.css" type="text/css">
	<link rel= "stylesheet" href="includes/navbar.css" type="text/css">
	<link rel= "stylesheet" href="includes/footer.css" type="text/css">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	
	<style>
		#mail_img, #psw_img{
			position: relative;
			left: -25px;
		}
	</style>
	
</head>
<body>

	<jsp:include page="/includes/navbar.html"></jsp:include>
	
<div id="container">

	<img id="logo" alt="logo" src="images/logo-no-sfondo.png">

	<div id="text_container">
		<h1>Registrati ed ottieni lo status di utente registrato:</h1>
		<p>una volta registrato potrai acquistare prodotti</p>
	</div>
	<div id="form_container">
		<form action="addUser">
			
			<div class="tableRow">
			<p>Nome</p>
			<p><input id="nome_input" type="text" name="nome" placeholder="Nome" onkeypress="testButton()" required/></p>
			</div>
			
			<div class="tableRow">
			<p>Cognome</p>
			<p><input id="cognome_input" type="text" name="cognome" placeholder="Cognome" onkeypress="testButton()" required/></p>
			</div>
			
			<div class="tableRow">
			<p>Email</p>
			<p><input onchange="isMailValid()" id="mail_input" type="text" name="email" placeholder="email" required autocomplete="off"></p>
			<p><img id="mail_img" alt="user-error" width="25px" height="25px" src="images/red-cross.png"></p>
			</div>
			
			<div class="tableRow">
			<p>Data di nascita</p>
			<p><input id="date_input" type="date" name="data_nascita" onchange="testButton()" required></p>
			</div>
			
			<div class="tableRow">
			<p>Password</p>
			<p><input id="psw_input" type="password" name="hashed_password" onkeyup="validatePsw()" required autocomplete="off"></p>
			<p><img id="psw_img" alt="user-error" width="25px" height="25px" src="images/red-cross.png"></p>
			
			</div>
			
			<div>
			<p><input id="create_btn" class="btn_acq"id="button"type="submit" value="Iscriviti" autocomplete="off" disabled/></p>
			</div>
			
		</form>
	</div>
</div>

	<jsp:include page="includes/footer.html"></jsp:include>
	
</body>

<script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="javascript/signup.js"></script>

</html>