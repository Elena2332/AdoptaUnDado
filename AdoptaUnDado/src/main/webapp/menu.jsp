<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <nav class="navbar w-100">
        <ul class="list-group list-group-horizontal w-100">
            <li class="list-group-item border-0 col-2 my-auto"><a href="index.jsp"><img class="logo" src="img/placeholder_logo.jpeg" alt="Logo"></a></li>
            <li class="list-group-item border-0 col-2 my-auto"><a href="index.jsp" class="text-decoration-none">Inicio</a></li>
            <li class="list-group-item border-0 col-2 my-auto"><a href="nosotros.jsp" class="text-decoration-none">Nosotros</a></li>
            <c:choose>
                <c:when test="${usuario == null}">	
                    <jsp:forward page="ServletIndex"/>
                </c:when>
                <c:otherwise>
					<c:choose>
                		<c:when test="${usuario.rol < 0}">	  
	                		<!-- usuario sin registrar -->
				            <li class="list-group-item border-0 col-6 row text-end my-auto">
								<a class="col-6 text-decoration-none" href="login.jsp">Login</a>
								<a class="col-6 text-decoration-none" href="registro.jsp">Registrar</a>
							</li>       
                		</c:when>
                		<c:otherwise>
                			<!-- admins -->
				            <li class="list-group-item border-0 col-4 my-auto">
				            	<c:if test="${usuario.rol == 0}">
									<div class="row">
										<a class="col-6 text-decoration-none" href="proveedores.jsp">Proveedores</a>
										<a class="col-6 text-decoration-none" href="administracion.jsp">Administracion</a>
									</div>
								</c:if>
							</li>
							
	                		<!-- usuario registrado -->
				            <li class="list-group-item border-0 col-2 my-auto" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				            	<img src="img/usuario_def.png" alt="${usuario.nombre}" class="logo"> 
								<ul class="dropdown-menu">
									<li class="list-group-item" ><a href="carrito.jsp" class="w-100 text-decoration-none">Mi carrito</a></li>
									<li class="list-group-item" ><a href="perfil.jsp" class="w-100 text-decoration-none">Mi Perfil</a></li>
									<li class="list-group-item" ><a href="historial.jsp" class="w-100 text-decoration-none">Mi Historial</a></li>
									<li class="list-group-item"><a href="ServletCerrarSesion" class="w-100 text-decoration-none">Cerrar Sesión</a></li>
								</ul>
							</li>
						</c:otherwise>
               		</c:choose>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>
