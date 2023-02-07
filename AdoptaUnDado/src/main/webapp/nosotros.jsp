<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Nosotros</title>
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
</head>
<body class="h-100 m-0">
	<jsp:include page="menu.jsp" />
	<div class="container">
		<header class="text-center">
			<h1>¿Quienes somos?</h1>
		</header>
		<section class="lh-lg">
			<p>Adopta un Dado nace como una idea de 3 estudiantes enamorados
				de los juegos de rol clásicos y de mesa, que vieron una oportunidad
				de crear y diseñar dados y accesorios de todo tipo para que las
				partidas de rol no pierdan la magia. Desde dados de hechos resina
				epoxy con diseños coloridos únicos hasta de madera artesanales
				temáticos, ¡los hay de todos los tipos y colores!</p>
			<p>Además, por cada pedido damos la oportunidad de adoptar un
				dado defectuoso por un precio reducido, porque el que tenga
				problemas e imperfecciones no significa que no se merezca un hogar
				digno :)</p>
		</section>
		<div class="">
			<hr>

			<form action="ServletNosotros" method="post"
				class="m-auto bg-white border border-secondary mx-3 my-5 p-3 row">
				<h4 class="text-center">¿Tienes alguna sugerencia?</h4>
				<div class="mb-3 row">
					<label for="txtCorreo" class="col-12 col-md-4 form-label">Correo Electrónico:</label> 
						
						<input name="txtCorreo"
						placeholder="correo@ejemplo.com"
						class="col-8 col-md-12 form-control" />
				</div>

				<div class="mb-3 row">
					<label for="txtNombre" class="col-12 col-md-4 form-label">Nombre:</label> 
					<input name="txtNombre"
						placeholder="Nombre"
						class="col-8 col-md-12 form-control" />
				</div>
				<div class="mb-3 row">
					<textarea class="form-control col-8 col-md-12" placeholder="Deja tu comentario aquí"></textarea>
				</div>
				<div class="mb-3 row d-flex justify-content-center">
					<button type="button" name="btnEnviar" data-bs-toggle="modal" data-bs-target="#modalContacto" class="btn btn-success w-25">Enviar</button>
				</div>
				
				<div class="modal fade" id="modalContacto"  tabindex="-1" aria-labelledby="modalContacto" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5">¡Comentario enviado!</h1>
							</div>
							<div class="modal-body">
								<p>Gracias por tus comentarios. ¡Recibirás una respuesta pronto!</p>
							</div>
							<div class="modal-footer">
								<button class="btn btn-primary" type="submit" data-bs-dismiss="modal">Aceptar</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			
		</div>
	</div>
	<div class="position-relative">
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>