<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <nav class="navbar w-100">
        <ul class="list-group list-group-horizontal w-100">
            <li class="list-group-item border-0 col-2"><a href="index.jsp"><img src="" alt="Logo"></a></li>
            <li class="list-group-item border-0 col-2"><a href="index.jsp">Inicio</a></li>
            <li class="list-group-item border-0 col-2"><a href="nosotros.jsp">Nosotros</a></li>
            <c:choose>
                <c:when test="${usuario == null}">	
                    <jsp:forward page="ServletIndex"/>
                </c:when>
                <c:otherwise>
					<c:choose>
                		<c:when test="${usuario.rol < 0}">	  
	                		<!-- usuario sin registrar -->
				            <li class="list-group-item border-0 col-6 row">
								<a class="col-6" href="login.jsp">Login</a>
								<a class="col-6" href="registro.jsp">Registrar</a>
							</li>       
                		</c:when>
                		<c:otherwise>
                			<c:if test="${usuario.rol == 0}">
		                		<!-- admins -->
					            <li class="list-group-item border-0 col-5 row">
									<a class="col-6" href="proveedores.jsp">Proveedores</a>
									<a class="col-6" href="administracion.jsp">Administracion</a>
								</li>
                			</c:if>
	                		<!-- usuario registrado -->
				            <li class="list-group-item border-0 col-2" role="button" data-bs-toggle="dropdown" aria-expanded="false"><img src="" alt="usuario"></li>
				            <ul class="dropdown-menu">
				                <li class="list-group-item ><a href="carrito.jsp">Mi carrito</a></li>
				                <li class="list-group-item ><a href="perfil.jsp">Mi Perfil</a></li>
				                <li class="list-group-item ><a href="historial.jsp">Mi Historial</a></li>
				            </ul>
						</c:otherwise>
               		</c:choose>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>
