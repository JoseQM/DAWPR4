<%@page import="es.studium.carpetaservlets.ModeloConexionBD"%>
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
<title>Pedidos</title>
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
	<div class="container mt-4 ">
		<div class="row">
			<div class="col-12 pb-4">
				<%@ page import="java.sql.*"%>
				<%
					//ResultSet rs = ModeloConexionBD.selectBD(
							//"SELECT idPedido, DATE_FORMAT(fechaPedido, '%d/%m/%Y') as fechaPedido, tituloLibro, cantidadLibro*precioLibro as precioTotal, cantidadLibro, precioLibro, pedidoEnviado, nombreUsuario, DATE_FORMAT(fechaEnvioPedido, '%d/%m/%Y') as fechaEnvioPedido FROM lineapedidos, pedidos, libros, usuarios WHERE idLibro = idLibroFK AND idUsuario = idUsuarioFK AND idPedido = idPedidoFK ORDER BY idPedido;");
				ResultSet rs = ModeloConexionBD.selectBD("SELECT * FROM usuarios, pedidos WHERE idUsuario = idUsuarioFK");
				%>
				<table class="table table-light table-striped"
					style="text-align: left;">
					<thead class="thead-dark">
						<tr>
							<th>ID</th>
							<th>Fecha Pedido</th>
							<th>Fecha de Envio</th>
							<th>¿Enviado?</th>
							<th>Opciones</th>
						</tr>
					</thead>
					<%
						while (rs.next()) {
							String enviado = "";
							String disabled = "";
							String fechaEnvioPedido = rs.getString("fechaEnvioPedido");

							int pedidoEnviado = rs.getInt("pedidoEnviado");

							if (pedidoEnviado == 0) {
								enviado = "No";
								disabled = "";
							} else {
								enviado = "Si";
								disabled = "disabled";
							}

							if (fechaEnvioPedido == null) {
								fechaEnvioPedido = "N/A";
							}
					%>
					<tr>
						<td><%=rs.getString("idPedido")%></td>
						<td><%=rs.getString("fechaPedido")%></td>
						<td><%=fechaEnvioPedido%></td>
						<td><%=enviado%></td>
						<td><a class="btn btn-info btn-xs mr-2 <%=disabled%>"
							href="enviarpedido.jsp?idPedido=<%=rs.getString("idPedido")%>">Enviar</a>
							<a class="btn btn-primary btn-xs"
							href="detallesPedido.jsp?idPedido=<%=rs.getString("idPedido")%>">Detalles</a>
						</td>
					</tr>
					<%
						}
					%>
				</table>
				<%
					// Cierre de recursos
					rs.close();
				%>
				<div class="col-12 pt-4 mt-4 text-center">
					<a href="administrador.jsp"><button class="btn btn-secondary ">Volver</button></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>