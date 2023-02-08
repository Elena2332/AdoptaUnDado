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
		
		<div class="d-flex flex-row justify-content-evenly">
			<c:forEach items="${articulos}" var="item">    
				<a href="ServletDetalle?item=${item.id}">
					<div class="card" style="width: 18rem;">
						<c:choose>
	                		<c:when test="${item.img == null}">						
								<div class="bg-secondary opacity-50 w-100 h-100">
									<p class="text-dark">NO FOTO</p>
								</div>
							</c:when>
							<c:otherwise>
								<img src="" class="card-img-top" alt="img_producto :)">
							</c:otherwise>
						</c:choose>
						<div class="card-body ">
					    	<h2 class="h2">${item.nombre}</h2>
					    	<span class=" badge rounded-pill text-bg-secondary">${item.categoria}</span>
					    	<p>${item.precio}</p>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>