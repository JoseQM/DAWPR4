<%@page import="es.studium.carpetaservlets.ModeloConexionBD"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
<title>Modificar libro</title>

</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark text-center">
		<div class="container mt-4 ">
			<div class="row">
				<div class="col-12 offset-xl-5 pb-4">
					<ul class="navbar-nav justify-content-center">

						<li class="nav-item"><a href="altaLibro.jsp" class="nav-link">Alta
								de Libro</a></li>

						<li class="nav-item"><a class="nav-link" href="modLibro.jsp"
							class="nav-link">Modificación de Libro</a></li>

						<li class="nav-item"><a href="autores.jsp" class="nav-link">Autores</a>
						</li>

						<li class="nav-item"><a href="editoriales.jsp"
							class="nav-link">Editoriales</a></li>
						<li class="nav-item"><a href="pedidos.jsp" class="nav-link">Pedidos</a>
						</li>

						<li class="nav-item pt-1 pl-5"><a href="logout.html"
							class="btn btn-warning btn-sm">Cerrar Sesión</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>

	<div class="row">
		<div class="col-md-2 text-center"></div>
		<div class="col-md-8">
			<%@ page import="java.sql.*"%>
			<%@ page import="java.util.Date"%>
			<%@ page import="java.time.LocalDate"%>
			<%
				String idPedido = request.getParameter("idPedido");
				System.out.print("idPedido " + idPedido + "\n");
				System.out.print(java.time.LocalDate.now() + "\n");
				LocalDate fechaEnvio = java.time.LocalDate.now();
				java.sql.Date sqlDate = java.sql.Date.valueOf(fechaEnvio);
				
				Date date = new Date(System.currentTimeMillis());
				System.out.print("DATEBUENA?: " + sqlDate + "\n");

				String query = "UPDATE pedidos SET pedidoEnviado = 1, fechaEnvioPedido='" + sqlDate + "' WHERE idPedido=" + idPedido;

				if (idPedido != null) {
					try {
						ModeloConexionBD.actualizarLibro(query);

					} catch (Exception e) {
						out.print("<script>alert(\"" + e + "\");</script>");

					}
				}
			%>
			<div
				class="col-xl-4 offset-xl-4 mb-5 mt-5 alert alert-success alert-dismissible text-center"
				role="alert" id="alerta">
				<p id="mensajealerta">¡Pedido Enviado!</p>
			</div>
			<div class="col-xl-4 offset-xl-4 text-center">
				<a href="administrador.jsp" class="btn btn-secondary">Volver</a>
			</div>


		</div>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

</body>
</html>