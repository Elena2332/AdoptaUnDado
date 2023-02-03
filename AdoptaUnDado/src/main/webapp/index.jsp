<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${listaUsu == null}">
		<jsp:forward page="ServletPrueba"></jsp:forward>
	</c:if>
	
	<jsp:include page="menu.jsp"></jsp:include>
	
	<ul>
	<c:forEach items="${listaUsu}" var="usu">
					<li>${usu.nombre}</li>
				
			</c:forEach>
			</ul>
</body>
</html>