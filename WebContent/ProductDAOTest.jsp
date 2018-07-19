<%@page import="java.util.ArrayList"%>
<%@page import="pattern_dao.SellingProductDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TEST ProductDAO</title>
</head>
<body>
	<%!ArrayList<SellingProductDTO> list;%>
	<%list = (ArrayList<SellingProductDTO>)request.getAttribute("sellingList");%>
	<% if(list != null){%>
	<table>
		<tr>
			<td>id</td>
			<td>nome</td>
			<td>descrizione</td>
			<td>prezzo</td>
			<td>ida</td>
			<td>version</td>
		</tr>
		<%for(SellingProductDTO prod : list) {%>
			<tr>
				<td><%=prod.getId()%></td>
				<td><%=prod.getName()%></td>
				<td><%=prod.getDescriprion()%></td>
				<td><%=prod.getPrice().toPlainString()%></td>
				<td><%=prod.getIdaProgetto()%></td>
				<td><%=prod.getVersion()%></td>
			</tr>
		<%}%>
	</table>
	<%}%>
</body>
</html>