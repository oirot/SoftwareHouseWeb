<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>

<head>	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Information</title>
	<base href="/SoftwareHouseWeb/">
	<link rel= "stylesheet" href="css/information.css" type="text/css">			
	<link rel= "stylesheet" href="includes/navbar.css" type="text/css">
	<link rel= "stylesheet" href="includes/footer.css" type="text/css">
	<link rel= "stylesheet" href="css/site.css" type="text/css">
	
</head>

<body>

	<h1 id="leadership">Leadership:
	
	<img class="leader_foto" id="vitto"  src="images/foto_vitto.jpg" alt="foto_leader_1" height="60%" width="auto">
	<img class="leader_foto" id="raff" src="images/foto_raff.jpg" alt="foto_leader_2" height="60%" width="auto">
	
	</h1>
	

	<jsp:include page="/includes/navbar.html"></jsp:include>

	<div id="container">
	
	<h1 id="frase_effetto">"Non seguire il sentiero: tracciane uno nuovo e lascia la tua impronta da seguire."</h1>
		
	</div>
				
	

	<div class="testo_paragrafo" id="azienda">
 				<h1 id="testo_info1">La nostra azienda</h1> 
 				
						 <p>SoftwareHouseWeb nasce dalla voglia di voler proporre del software innovativo capace di soddisfare un pubblico 
						 di amipia scala. L'azieda negli ultimi anni si è affermata sul mercato sbaragliando la concorrenza sul territorio
						 italiano, grazie alla creazione di prodotti all'avanguardia portati avanti da team giovani e talentuosi.
						 Oggi contiamo più di 60 dipendenti e 4 dipartimenti in continua espansione.</p>
	</div>
	
	
	
	<div class="testo_paragrafo" id="chi_siamo">
	
 				<h1 id="testo_info2">Chi Siamo</h1>
 				
 					<p>Aiello V. e Sansone R. fondarono SoftwareHouseWeb nel lontano 2007 con sede principale in Salerno.
 					Tuttavia grazie alla loro voglia di mettersi in gioco ad oggi l'azienda possiede 5 diverse sedi in tutta Italia
 					e il suo nome è sinonimo di garanzia ed efficienza.</p>
	</div>
	
	
	
	<div class="testo_paragrafo" id="contatti">
	
 				<h1 id="testo_info3">Contatti</h1>
 				
						 <p>Email: info@softwarehouseweb.it<br>
						 	Telefono: 000 4433 777<br>
						 	Fax: 000 6666 2288<br>
						 	Indirizzo: Via delle Percoche,Fisciano (SA)<br></p>
	</div>
							
	<jsp:include page="includes/footer.html"></jsp:include>
			
</body>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript"></script>
</html>