<%@page import="es.studium.carpetaservlets.ModeloConexionBD"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Comprar Libros</title>
</head>
<body>
	<div class="row">
		<div class="col-md-2 text-center"></div>
		<div class="col-xl-8 offset-xl-2 pt-5 mt-3">
		<h2 class="offset-xl-2 mb-5">Hacer un Pedido</h2>

			<form method="post" action="altaLibro.jsp">
				<div class="col-6  input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Libros</span>
					</div>
					<select name="autor" class="form-control">
						<%@ page import="java.sql.*"%>
						<%
							String idUsuario = session.getAttribute("idUsuario").toString();
							ResultSet rs = ModeloConexionBD.selectBD("SELECT * FROM libros, autores WHERE idAutor = idAutorFK ORDER BY precioLibro");
							while (rs.next()) {
						%>
						<option value="<%=rs.getString("idAutor")%>"><%=rs.getString("tituloLibro")%> - <%=rs.getString("precioLibro")%> € - <%=rs.getString("nombreAutor")%> <%=rs.getString("apellidosAutor")%></option>
						<%
							}
						%>
					</select>
				</div>
				
				<div class="col-2 input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Cantidad</span>
					</div>
					<input name="cantidad" type="number" class="form-control"
						placeholder="00" aria-label="Cantidad"
						aria-describedby="basic-addon1">
				</div>
				<div class="col-12 offset-xl-2 pt-3 pb-4">
					<input type="submit" value="Agregar al carrito" class="btn btn-success">
					<a href="logout" class="btn btn-secondary">Cerrar Sesión</a>
				</div>
			</form>
		</div>

		<!--<%@ page import="java.sql.*"%>
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
			<p id="mensajealerta">¡Autor insertado!</p>
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
		%>-->

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