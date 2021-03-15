<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Administrador</title>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark text-center">
		<div class="container mt-4 ">
			<div class="row">
				<div class="col-12 offset-xl-5 pb-4">
					<ul class="navbar-nav justify-content-center">
					
						<li class="nav-item"><a href="altaLibro.jsp"
							class="nav-link">Alta de Libro</a></li>
							
						<li class="nav-item"><a class="nav-link"
							href="modLibro.jsp" class="nav-link">Modificación de
								Libro</a></li>
								
						<li class="nav-item"><a href="autores.jsp" class="nav-link">Autores</a>
						</li>
						
						<li class="nav-item"><a href="editoriales.jsp"
							class="nav-link">Editoriales</a></li>
						<li class="nav-item"><a href="pedidos.jsp" class="nav-link">Pedidos</a>
						</li>
						
						<li class="nav-item pt-1 pl-5"><a href="logout"
							class="btn btn-warning btn-sm">Cerrar Sesión</a></li>
							
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<div class="col-12 mt-5 text-center">
		<h2>Panel de control - Administrador</h2>
	</div>
</body>
</html>