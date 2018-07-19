<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
	<html>
	
		<head>
		
			<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
			<meta name="viewport" content="width=device-width, initial=1.0">
			<title>Information</title>
			<base href="/SoftwareHouseWeb/">
			<link rel= "stylesheet" href="css/information.css" type="text/css">			
			<script src="javascript/information.js" type="text/javascript"></script>
			
			<script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript">
			</script>
			
			
			
			</head>
		
			<body>
			
				<h1 id="leadership">Leadership:</h1>
				
				
			
			<jsp:include page="/includes/navbar.html"></jsp:include>
			
				<div id="container">
				
				<h1 id="frase_effetto">"Non seguire il sentiero: tracciane uno nuovo e lascia la tua impronta da seguire."</h1>
					
				</div>
							
				
			
				<div class="testo_paragrafo" id="azienda">
    				<h1>La nostra azienda</h1> 
    				
   						 <p>SoftwareHouseWeb nasce dalla voglia di voler proporre del software innovativo capace di soddisfare un pubblico 
   						 di amipia scala. L'azieda negli ultimi anni si è affermata sul mercato sbaragliando la concorrenza sul territorio
   						 italiano, grazie alla creazione di prodotti all'avanguardia portati avanti da team giovani e talentuosi.
   						 Oggi contiamo più di 60 dipendenti e 4 dipartimenti in continua espansione.</p>
				</div>
				
				
				
				<div class="testo_paragrafo" id="chi_siamo">
				
    				<h1>Chi Siamo</h1>
    				
    					<p>Aiello V. e Sansone R. fondarono SoftwareHouseWeb nel lontano 2007 con sede principale in Salerno.
    					Tuttavia grazie alla loro voglia di mettersi in gioco ad oggi l'azienda possiede 5 diverse sedi in tutta Italia
    					e il suo nome è sinonimo di garanzia ed efficienza.</p>
				</div>
				
				
				
				<div class="testo_paragrafo" id="contatti">
				
    				<h1>Contatti</h1>
    				
   						 <p>Email: info@softwarehouseweb.it<br>
   						 	Telefono: 000 4433 777<br>
   						 	Fax: 000 6666 2288<br>
   						 	Indirizzo: Via delle Percoche,Fisciano (SA)<br></p>
				</div>
				
		<script type="text/javascript">		
				
			var handleText = function(e) {
		   
		    	 e = e || window.event
		    	 
		   		 h1 = e.target || e.srcElement
		    
		    	p = h1.nextElementSibling
		    
		   		 if(p.style.display == 'none')
		   		 
		       		 p.style.display = 'block'
		    	else
		        	 p.style.display = 'none'
		}

		document.getElementById("azienda").children[0].onclick = handleText
		document.getElementById("chi_siamo").children[0].onclick = handleText
		document.getElementById("contatti").children[0].onclick = handleText
		
		</script>
			
			<jsp:include page="includes/footer.html"></jsp:include>
	
			</body>
	</html>