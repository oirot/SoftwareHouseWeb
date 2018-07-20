<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registrazione</title>
</head>
<body>
<div>
	<div>
		<h1>Registrati ed ottieni lo status di utente registrato:</h1>
		<p>una volta registrato potrai acquistare prodotti</p>
	</div>
	<div>
		<form action="addUser">
		<fieldset>
			<legend>Inscriviti</legend>
			<label>Nome<input type="text" name="nome" placeholder="Nome"/></label><br>
			<label>Cognome<input type="text" name="cognome" placeholder="Cognome" /></label><br>
			<label>Email<input type="text" name="email" placeholder="email" /></label><img alt="user-error" src="images/username-no.jpg"><br>
			<label>Data di nascita<input type="date" name="data_nascita"></label><br>
			<label>Password<input type="password" name="hashed_password"></label><br>
			<input type="submit" value="Iscriviti"/>
		</fieldset>
		</form>
	</div>
</div>
</body>
</html>