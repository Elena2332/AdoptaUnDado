<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	    <script src="https://kit.fontawesome.com/d2bdcf2612.js" crossorigin="anonymous"></script>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	    <title>Login</title>
	</head>
	<body class="bg-light">
	    <div class="container-fluid">
	        <div class="w-75 m-auto">
	            <div class="formulario bg-white border border-secondary my-5 p-3">
	                <img src="" alt="" class=""><p>Logotipo</p>
	                <%
	                	if (request.getParameter("entrar") != null) {
	                		out.print(request.getAttribute("mensajeError"));
	                	}
	                %>
	                <form action="ServletLogin" method="post" class="row g-3">
	                    <div class="offset-1 col-8 w-75">
	                        <label for="email" class="form-label">Correo electrónico</label>
	                        <input type="email" name="email" id="email" class="form-control">
	                    </div>
	
	                    <div class="offset-1 col-8 w-75">
	                        <label for="password" class="form-label">Contraseña</label>
	                        <input type="password" name="password" id="password" class="form-control">
	                    </div>
	
	                    <div class="col-12">
	                        <p class="offset-4 col-6 text-end"><a href="">¿Olvidaste la contraseña?</a></p>
	                    </div>
	
	                    <div class="col-12 text-center">
	                        <button type="submit" name="entrar" class="btn btn-primary">ENTRAR</button>
	                    </div>
	                </form>
	            </div>
	
	            <div class="registro bg-white border border-secondary my-5 py-3">
	                <p class="text-center">¿No tienes una cuenta? <a href="registro.jsp">Regístrate</a></p>
	            </div>
	        </div>
	    </div>
	    <div class="position-relative">
	    	<jsp:include page="footer.jsp" />
	    </div>
	    
	</body>
</html>