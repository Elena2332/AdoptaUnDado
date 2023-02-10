<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Perfil</title>
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous">
	</script>
	<script src="https://kit.fontawesome.com/d2bdcf2612.js"
		crossorigin="anonymous">
	</script>
	<link rel="stylesheet" href="css/css.css"/>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="container" style="margin: auto; width: 50%;">
		<h2 style="text-align: center; background: #ffdc76;">PERFIL DEL USUARIO</h2>
		<form action="ServletPerfil" method="post">
			<p><c:out value="${mensajeActualizacion}" /></p>
			<table style="margin: auto; border: 1px solid #ffdc76; margin-bottom: 15px">
				<tr>
					<td style="border: 1px solid #ffdc76"><label>DNI</label></td>
					<td style="border: 1px solid #ffdc76"><input type="text" name="dni" value="${usuario.getDni()}"></td>
				</tr>
				<tr>
					<td style="border: 1px solid #ffdc76"><label>Nombre</label></td>
					<td style="border: 1px solid #ffdc76"><input type="text" name="nombre" value="${usuario.getNombre()}"></td>
				</tr>
				<tr>
					<td style="border: 1px solid #ffdc76"><label>Apellido</label></td>
					<td style="border: 1px solid #ffdc76"><input type="text" name="apellido" value="${usuario.getApellido()}"></td>
				</tr>
				<tr>
					<td style="border: 1px solid #ffdc76"><label>Email</label></td>
					<td style="border: 1px solid #ffdc76"><input type="email" name="email" value="${usuario.getEmail()}" disabled></td>
				</tr>
				<tr>
					<td style="border: 1px solid #ffdc76"><label>Password</label></td>
					<td style="border: 1px solid #ffdc76"><input type="password" name="password" value="${usuario.getPassword()}"></td>
				</tr>
				<tr>
					<td style="border: 1px solid #ffdc76"><label>Descripción</label></td>
					<td style="border: 1px solid #ffdc76"><textarea name="descripcion" value="${usuario.getDescripcion()}"></textarea></td>
				</tr>
				<tr>
					<td style="border: 1px solid #ffdc76"><label>Direccion</label></td>
					<td style="border: 1px solid #ffdc76"><input type="text" name="direccion" value="${usuario.getDireccion()}"></td>
				</tr>
				<tr>
					<td style="border: 1px solid #ffdc76"><label>Municipio</label></td>
					<td style="border: 1px solid #ffdc76"><input type="text" name="municipio" value="${usuario.getMunicipio()}"></td>
				</tr>
				<tr>
					<td style="border: 1px solid #ffdc76"><label>Provincia</label></td>
					<td style="border: 1px solid #ffdc76"><input type="text" name="provincia" value="${usuario.getProvincia()}"></td>
				</tr>
				<tr>
					<td style="border: 1px solid #ffdc76"><label>Pais</label></td>
					<td style="border: 1px solid #ffdc76"><input type="text" name="pais" value="${usuario.getPais()}"></td>
				</tr>
				<tr>
					<td style="border: 1px solid #ffdc76"><label>Código postal</label></td>
					<td style="border: 1px solid #ffdc76"><input type="text" name="codigopostal" value="${usuario.getCodigopostal()}"></td>
				</tr>
				<tr>
					<td style="border: 1px solid #ffdc76"><label>Teléfono</label></td>
					<td style="border: 1px solid #ffdc76"><input type="tel" name="telefono" value="${usuario.getTelefono()}"></td>
				</tr>
				<tr>
					<td style="border: 1px solid #ffdc76"><label>Imagen</label></td>
					<td style="border: 1px solid #ffdc76"><input type="file" accept="image/*" name="imagen" value="${usuario.getImagen()}"></td>
				</tr>
				<tr>
					<td><button type="submit" name="guardarCambios">Guardar Cambios</button></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="position-relative">
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>