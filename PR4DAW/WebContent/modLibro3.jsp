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

						<li class="nav-item pt-1 pl-5"><a href="logout"
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
			<%
				String idLibro = request.getParameter("idLibro");
				String tituloLibro = request.getParameter("titulo");
				String precioLibro = request.getParameter("precio");
				String cantidadLibro = request.getParameter("cantidad");
				String idAutor = request.getParameter("autor");
				String idEditorial = request.getParameter("editorial");

				String objeto = "libros";
				//String set = " tituloLibro=\""+titulo+"\", precioLibro="+precio+", cantidadStockLibro="+cantidad+", idAutorFK="+autor+", idEditorialFK="+editorial;
				String where = " idLibro=" + idLibro + " ";

				String query = "UPDATE libros SET tituloLibro='" + tituloLibro + "', precioLibro=" + precioLibro
						+ ", cantidadStockLibro=" + cantidadLibro + ", idEditorialFK=" + idEditorial + ", idAutorFK="
						+ idAutor + " WHERE idLibro=" + idLibro;

				if (idLibro != null) {
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
				<p id="mensajealerta">¡Modificación realizada con éxito!</p>
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