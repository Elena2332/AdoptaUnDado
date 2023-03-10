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
    <title>Registro</title>
</head>
	<body class="bg-light">
	    <div class="container-fluid">
	        <div class="m-auto bg-white border border-secondary mx-3 my-5 p-3 row">
	            <div class="formulario col-12 my-3">
	            	<p>
	            		<%
	            			if (request.getParameter("entrarRegistro") != null) {
	            				out.print(request.getAttribute("mensajeErrorRegistro"));
	            			}
	            		%>
	            	</p>
	                <form action="ServletRegistro" method="post" class="row g-3">
	                    <div class="parte1 col-12 col-md-6 px-3">
	                    	<div class="mb-3 row">
	                            <label for="dni" class="col-12 col-md-2 form-label">DNI:</label>
	                            <div class="col-10">
	                                <input type="text" name="dni" id="dni" class="form-control" placeholder="Introduce el DNI" required>
	                            </div>
	                        </div>
	                        
	                        <div class="mb-3 row">
	                            <label for="nombre" class="col-12 col-md-2 col-form-label">Nombre:</label>
	                            <div class="col-10">
	                                <input type="text" name="nombre" id="nombre" class="form-control" placeholder="Introduce tu nombre" required>
	                            </div>
	                        </div>
	    
	                        <div class="mb-3 row">
	                            <label for="apellidos" class="col-12 col-md-2 form-label">Apellidos:</label>
	                            <div class="col-10">
	                                <input type="text" name="apellidos" id="apellidos" class="form-control" placeholder="Introduce tus apellidos" required>
	                            </div>
	                        </div>
	    
	                        <div class="mb-3 row">
	                            <label for="descripcion" class="col-12 col-md-2 form-label">Descripci?n:</label>
	                            <div class="col-10 offset-md-1 col-md-9">
	                                <textarea class="form-control" id="descripcion" rows="3" name="descripcion" placeholder="Escribe una peque?a descripci?n..."></textarea>
	                            </div>
	                        </div>
	    
	                        <div class="mb-3 row">
	                            <label for="direccion" class="col-12 col-md-2 form-label">Direcci?n:</label>
	                            <div class="col-10">
	                                <input type="text" name="direccion" id="direccion" class="form-control"  placeholder="Introduce una direcci?n" required>
	                            </div>
	                        </div>
	    
	                        <div class="mb-3 row">
	                            <label for="cp" class="col-12 col-md-2 form-label">C?digo Postal:</label>
	                            <div class="col-10">
	                                <input type="text" name="cp" id="cp" class="form-control"  placeholder="Introduce c?digo postal" required>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="parte2 col-12 col-md-6 px-3">
	                    	<div class="mb-3 row">
	                            <label for="provincia" class="col-12 col-md-2 form-label">Provincia:</label>
	                            <div class="col-10">
	                                <input type="text" name="provincia" id="provincia" class="form-control" placeholder="Introduce una provincia" required>
	                            </div>
	                        </div>
	                        
	                        <div class="mb-3 row">
	                            <label for="ciudad" class="col-12 col-md-2 form-label">Ciudad:</label>
	                            <div class="col-10">
	                                <input type="text" name="ciudad" id="ciudad" class="form-control" placeholder="Introduce una ciudad" required>
	                            </div>
	                        </div>
	    
	                        <div class="mb-3 row">
	                            <label for="pais" class="col-2 form-label">Pa?s:</label>
	                            <div class="col-10">
	                                <select name="pais" id="pais">
	                                    <option value="espana">Espa?a</option>
	                                    <option value="portugal">Portugal</option>
	                                    <option value="francia">Francia</option>
	                                </select>
	                            </div>
	                        </div>
	    
	                        <div class="mb-3 row">
	                            <label for="email" class="col-12 col-md-2 form-label">Email:</label>
	                            <div class="col-10">
	                                <input type="email" name="email" id="email" class="form-control" placeholder="example@gmail.com" required>
	                            </div>
	                        </div>
	    
	                        <div class="mb-3 row">
	                            <label for="password" class="col-12 col-md-2 form-label">Contrase?a:</label>
	                            <div class="col-10 offset-md-1 col-md-9">
	                                <input type="password" name="password" id="password" class="form-control" placeholder="Introduce una contrase?a" required>
	                            </div>
	                        </div>
	    
	                        <div class="mb-3 row">
	                            <label for="telefono" class="col-12 col-md-2 form-label">Tel?fono:</label>
	                            <div class="col-10">
	                                <input type="text" name="telefono" id="telefono" class="form-control" placeholder="Introduce un n?mero de tel?fono" required>
	                            </div>
	                        </div>
	                    </div>
	
	                    <div class="col-12 text-center">
	                        <button type="submit" name="entrarRegistro" class="btn btn-primary">ENTRAR</button>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	    <div class="position-relative">
	    	<jsp:include page="footer.jsp" />
	    </div>
	</body>
</html>