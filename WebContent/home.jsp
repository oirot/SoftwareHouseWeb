<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/includes/navbar.html"></jsp:include>
	<div>
		<img id="img_prodotto" src="images/progetto.jpg" alt="img prodotto">
	</div>
		
	<div id="prodotto">
		<jsp:include  page="product_content.jsp">
			<jsp:param value="1" name="id"/>
		</jsp:include>

	</div>
	<jsp:include page="/includes/footer.html"></jsp:include>
</body>
</html>