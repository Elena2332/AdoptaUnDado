<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${ articulo.nombre }</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/d2bdcf2612.js"
	crossorigin="anonymous"></script>
		<link rel="stylesheet" href="css/css.css"/>
</head>
<body class="vh-100 p-5 m-0">
	<jsp:include page="menu.jsp" />
	
	<div class="container-fluid row  h-75">
		<div class="col-5"> 
			<img src="${articulo.imagen}" alt="${articulo.nombre}" class="w-100 h-100">
		</div>
		<div class="col-7 ">
			<h2 class="my-5">${articulo.nombre}</h2>
			<div class="my-5">${articulo.precio}&euro;</div>
			<div class="border-1 rounded row ">
				<a href="ServletDetalle?cant=${ cantidad-1 }" class="border-0 rounded-start bg-primary opacity-75 text-light text-decoration-none text-center col-1">-</a>
				<input type="number" class="border-0 col-3 text-center" id="inpCantidad" value="${ cantidad }">
				<a href="ServletDetalle?cant=${ cantidad+1 }" class="border-0 rounded-end bg-primary opacity-75 text-light text-decoration-none text-center col-1">+</a>
			</div>
			<button id="btnAniadir" class="border-primary rounded bg-primary opacity-75 text-light col-5 my-1">Meter al carrito</button>
		</div>
	</div>
	
	<div class="position-relative">
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>