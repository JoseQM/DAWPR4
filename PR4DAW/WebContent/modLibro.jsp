<%@page import="es.studium.carpetaservlets.ModeloConexionBD"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Modificación Libro</title>
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
	<div class="container mt-4">
		<div class="row">
			<div class="col-8 offset-xl-2 mt-3 text-center">

				<h1 class="pb-3">Listado de Libros</h1>
				<table class="table table-light table-striped" style="text-align: left;">
					<thead class="thead-dark">
						<tr>
							<th>Titulo</th>
							<th>Precio</th>
							<th>Cantidad</th>
							<th>Editorial</th>
							<th>Autor</th>
							<th>Actualizar</th>
						</tr>
					</thead>
					<tbody>
						<%@ page import="java.sql.*"%>
						<%
							ResultSet rs = ModeloConexionBD.selectBD(
									"SELECT idLibro, tituloLibro, precioLibro, cantidadStockLibro, nombreAutor, apellidosAutor, nombreEditorial FROM libros, editoriales, autores WHERE idAutor = idAutorFK and idEditorial = idEditorialFK ");
							while (rs.next()) {
						%>

						<tr>

							<td><%=rs.getString("tituloLibro")%></td>
							<td><%=rs.getString("precioLibro")%></td>
							<td><%=rs.getString("cantidadStockLibro")%></td>
							<td><%=rs.getString("nombreEditorial")%></td>
							<td><%=rs.getString("nombreAutor")%> <%=rs.getString("apellidosAutor")%></td>
							<td><a class="btn btn-info"
								href="modLibro2.jsp?idLibro=<%=rs.getString("idLibro")%>">Modificar</a></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>

				<a href="administrador.jsp"><button class="btn btn-secondary">Volver</button></a>
			</div>
		</div>
	</div>
</body>
</html>