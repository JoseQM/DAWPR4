<%@page import="es.studium.carpetaservlets.ModeloConexionBD"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
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
<title>Alta Libro</title>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container mt-4">

			<div class="row">
				<div class="col-12 offset-xl-5 pb-4">
					<ul class="navbar-nav mr-auto">
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
		<div class="col-xl-8 offset-xl-2 pt-5 mt-3">

			<form method="post" action="altaLibro.jsp">
				<div class="col-6  input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Titulo</span>
					</div>
					<input name="titulo" type="text" class="form-control"
						aria-label="Titulo" aria-describedby="basic-addon1">
				</div>
				<div class="col-6  input-group mb-3">
					<div class=" input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Precio</span>
					</div>
					<input name="precio" type="number" class="form-control"
						placeholder="00.00" aria-label="Precio"
						aria-describedby="basic-addon1">

					<div class="pl-3 input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Cantidad</span>
					</div>
					<input name="cantidad" type="number" class="form-control"
						placeholder="00" aria-label="Cantidad"
						aria-describedby="basic-addon1">
				</div>
				<div class="col-6  input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Autores</span>
					</div>
					<select name="autor" class="form-control">
						<%@ page import="java.sql.*"%>
						<%
							ResultSet rs = ModeloConexionBD.selectBD("SELECT * FROM autores");
							while (rs.next()) {
						%>
						<option value="<%=rs.getString("idAutor")%>"><%=rs.getString("nombreAutor")%>
							<%=rs.getString("apellidosAutor")%></option>
						<%
							}
						%>
					</select>

					<div class="pl-3 input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Editoriales</span>
					</div>
					<select name="editorial" class="form-control">
						<%@ page import="java.sql.*"%>
						<%
							ResultSet rs1 = ModeloConexionBD.selectBD("SELECT * FROM editoriales");
							while (rs1.next()) {
						%>
						<option value="<%=rs1.getString("idEditorial")%>">
							<%=rs1.getString("nombreEditorial")%>
						</option>
						<%
							}
						%>
					</select>
				</div>
				<div class="col-12 offset-xl-2 pt-3 pb-4">
					<input type="submit" value="Dar de Alta" class="btn btn-success">
					<a href="administrador.jsp" class="btn btn-secondary">Volver</a>
				</div>
			</form>
		</div>

		<%@ page import="java.sql.*"%>
		<%
			String titulo = request.getParameter("titulo");
			String precio = request.getParameter("precio");
			String cantidad = request.getParameter("cantidad");
			String autor = request.getParameter("autor");
			String editorial = request.getParameter("editorial");

			if ((titulo != null && titulo != "") && (precio != null && precio != "")
					&& (cantidad != null && cantidad != "")) {

				try {
					String query = "INSERT INTO libros (tituloLibro, precioLibro, cantidadStockLibro, idAutorFK ,idEditorialFK) values('"
							+ titulo + "'," + precio + "," + cantidad + "," + autor + "," + editorial + ")";
					ModeloConexionBD.insertarLibro(query);

				} catch (Exception e) {
					System.out.print(e);
					e.printStackTrace();
				}
		%>
		<div
			class="col-xl-2 offset-xl-5 alert alert-success alert-dismissible mt-2"
			role="alert" id="alerta">
			<p id="mensajealerta">¡Libro insertado!</p>
		</div>
		<%
			} else if (titulo == "" || precio == "" || cantidad == "") {
		%>
		<div
			class="col-xl-2 offset-xl-5 alert alert-danger alert-dismissible mt-2"
			role="alert" id="alerta">
			<p id="mensajealerta">Rellene todos los campos, por favor.</p>
		</div>
		<%
			}
		%>

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