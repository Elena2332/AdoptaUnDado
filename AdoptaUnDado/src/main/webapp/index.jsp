<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	    <link rel="icon" type="image/x-icon" href="img/placeholder_logo.jpeg"/>
		<link rel="stylesheet" href="css/css.css"/>
		<title>Adopta un Dado</title>
	</head>
	<body>	
		<jsp:include page="menu.jsp"></jsp:include>
		
		<div class="container-fluid">
			<div class="row text-center">
				<c:forEach items="${articulos}" var="articulo">  
				<div class="w-auto m-auto col-4">
					<a href="ServletDetalle?item=${articulo.id}" class=" text-decoration-none text-dark">
						<div class="card" style="width: 18rem;">
							<c:choose>
								<c:when test="${articulo.imagen == null || articulo.imagen.length() < 3}">  <!-- Sin imagen -->						
									<img src="img/SIN-IMAGEN.jpg" class="card-img-top" alt="img_producto :)">
								</c:when>
								<c:otherwise>
									<img class="img-fluid" src="${articulo.imagen}" class="card-img-top" alt="img_producto :)">
								</c:otherwise>
							</c:choose>
							<div class="card-body row">
								<div class="col-12">
									<h2 class="h2">${articulo.nombre}</h2>
									<span class="badge rounded-pill text-bg-secondary">${AritculoDAO.getArticulo(articulo.id_categoria)}</span>
								</div>
								<p class="col">${articulo.precio}&euro;</p>
							</div>
						</div>
					</a>
				</div>  
				</c:forEach>
			</div>
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>