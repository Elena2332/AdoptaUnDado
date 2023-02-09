<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <nav class="navbar w-100">
        <ul class="list-group list-group-horizontal w-100">
            <li class="list-group-item border-0 col-2 my-auto"><a href="index.jsp"><img class="logo" src="img/placeholder_logo.jpeg" alt="Logo"></a></li>
            <li class="list-group-item border-0 col-2 my-auto"><a href="index.jsp">Inicio</a></li>
            <li class="list-group-item border-0 col-2 my-auto"><a href="nosotros.jsp">Nosotros</a></li>
            <c:choose>
                <c:when test="${usuario == null}">	
                    <jsp:forward page="ServletIndex"/>
                </c:when>
                <c:otherwise>
					<c:choose>
                		<c:when test="${usuario.rol < 0}">	  
	                		<!-- usuario sin registrar -->
				            <li class="list-group-item border-0 col-6 row text-end my-auto">
								<a class="col-6" href="login.jsp">Login</a>
								<a class="col-6" href="registro.jsp">Registrar</a>
							</li>       
                		</c:when>
                		<c:otherwise>
                			<!-- admins -->
				            <li class="list-group-item border-0 col-4 row my-auto">
				            	<c:if test="${usuario.rol == 0}">
									<a class="col-6" href="proveedores.jsp">Proveedores</a>
									<a class="col-6" href="administracion.jsp">Administracion</a>
								</c:if>
							</li>                			
	                		<!-- usuario registrado -->
				            <li class="list-group-item border-0 col-2 my-auto" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				            	<img src="" alt="${usuario.nombre}">
								<ul class="dropdown-menu">
									<li class="list-group-item" ><a href="carrito.jsp">Mi carrito</a></li>
									<li class="list-group-item" ><a href="perfil.jsp">Mi Perfil</a></li>
									<li class="list-group-item" ><a href="historial.jsp">Mi Historial</a></li>
								</ul>
							</li>
						</c:otherwise>
               		</c:choose>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>
