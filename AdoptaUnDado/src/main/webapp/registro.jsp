<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <title>Registro</title>
</head>
	<body class="bg-light">
	    <div class="container-fluid">
	        <div class="m-auto bg-white border border-secondary mx-3 my-5 p-3 row">
	            <div class="col-12 col-md-3">
	                <img src="" alt="">
	                <input type="file" name="imagen" id="imagen">
	            </div>
	            <div class="formulario col-12 col-md-9 my-3">
	                <form action="" method="post" class="row g-3">
	                    <div class="parte1 col-12 col-md-6 px-3">
	                        <div class="mb-3 row">
	                            <label for="nombre" class="col-12 col-md-2 col-form-label">Nombre:</label>
	                            <div class="col-10">
	                                <input type="text" name="nombre" id="nombre" class="form-control">
	                            </div>
	                        </div>
	    
	                        <div class="mb-3 row">
	                            <label for="apellidos" class="col-12 col-md-2 form-label">Apellidos:</label>
	                            <div class="col-10">
	                                <input type="text" name="apellidos" id="apellidos" class="form-control">
	                            </div>
	                        </div>
	    
	                        <div class="mb-3 row">
	                            <label for="descripcion" class="col-12 col-md-2 form-label">Descripción:</label>
	                            <div class="col-10 offset-md-1 col-md-9">
	                                <textarea class="form-control" id="descripcion" rows="3"></textarea>
	                            </div>
	                        </div>
	    
	                        <div class="mb-3 row">
	                            <label for="direccion" class="col-12 col-md-2 form-label">Dirección:</label>
	                            <div class="col-10">
	                                <input type="text" name="direccion" id="direccion" class="form-control">
	                            </div>
	                        </div>
	    
	                        <div class="mb-3 row">
	                            <label for="cp" class="col-12 col-md-2 form-label">Código Postal:</label>
	                            <div class="col-10">
	                                <input type="text" name="cp" id="cp" class="form-control">
	                            </div>
	                        </div>
	    
	                        <div class="mb-3 row">
	                            <label for="municipio" class="col-12 col-md-2 form-label">Municipio:</label>
	                            <div class="col-10">
	                                <input type="text" name="municipio" id="municipio" class="form-control">
	                            </div>
	                        </div>
	                    </div>
	                    <div class="parte2 col-12 col-md-6 px-3">
	                        <div class="mb-3 row">
	                            <label for="ciudad" class="col-12 col-md-2 form-label">Ciudad:</label>
	                            <div class="col-10">
	                                <input type="text" name="ciudad" id="ciudad" class="form-control">
	                            </div>
	                        </div>
	    
	                        <div class="mb-3 row">
	                            <label for="pais" class="col-2 form-label">País:</label>
	                            <div class="col-10">
	                                <select name="pais" id="pais">
	                                    <option value="espana">España</option>
	                                    <option value="portugal">Portugal</option>
	                                    <option value="francia">Francia</option>
	                                </select>
	                            </div>
	                        </div>
	    
	                        <div class="mb-3 row">
	                            <label for="email" class="col-12 col-md-2 form-label">Email:</label>
	                            <div class="col-10">
	                                <input type="email" name="email" id="email" class="form-control">
	                            </div>
	                        </div>
	    
	                        <div class="mb-3 row">
	                            <label for="password" class="col-12 col-md-2 form-label">Contraseña:</label>
	                            <div class="col-10 offset-md-1 col-md-9">
	                                <input type="password" name="password" id="password" class="form-control">
	                            </div>
	                        </div>
	    
	                        <div class="mb-3 row">
	                            <label for="telefono" class="col-12 col-md-2 form-label">Teléfono:</label>
	                            <div class="col-10">
	                                <input type="text" name="telefono" id="telefono" class="form-control">
	                            </div>
	                        </div>
	                    </div>
	
	                    <div class="col-12 text-center">
	                        <button type="submit" name="entrar" class="btn btn-primary">ENTRAR</button>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</body>
</html>