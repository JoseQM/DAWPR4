<%-- Página de confirmación del pedido --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"
	import="java.util.*, es.studium.carpetaservlets.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="javax.servlet.http.HttpSession "%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Confirmación</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-xl-2 mt-4 mb-4 offset-xl-10">
				<a href="logout" class="btn btn-warning btn-sm">Cerrar Sesión</a>
			</div>
			<div class="col-xl-8 mt-4 offset-xl-2 text-center">
				<p>
					<strong>Has comprado los siguientes libros:</strong>
				</p>
				<table class="table table-light table-striped "
					style="text-align: left;">
					<caption>Resumen del Pedido</caption>
					<thead class="thead-dark">
						<tr>
							<th>Título</th>
							<th>Precio</th>
							<th>Cantidad</th>
						</tr>
					</thead>

					<%
						String idUsuario = session.getAttribute("idUsuario").toString();
						String idPedido;
						System.out.print("IDsession " + idUsuario);

						LocalDate fechaEnvio = java.time.LocalDate.now();
						java.sql.Date sqlDate = java.sql.Date.valueOf(fechaEnvio);

						String query = "INSERT INTO pedidos (fechaPedido, idUsuarioFK, pedidoEnviado) values ('" + sqlDate + "', "
								+ idUsuario + ", 0)";
						System.out.print("QUERYPEDIDOS: " + query);

						ModeloConexionBD.insertarLibro(query);

						ResultSet rsetPedido = ModeloConexionBD.selectBD("SELECT * FROM pedidos ORDER BY idPedido desc");

						rsetPedido.next();
						idPedido = rsetPedido.getString("idPedido");

						String query1 = "";
						int idLibro = 0;
						int cantidadLibro = 0;

						// Muestra los elementos del carrito
						ArrayList<ElementoPedido> cesta = (ArrayList<ElementoPedido>) session.getAttribute("carrito");
						for (ElementoPedido libro : cesta) {

							idLibro = libro.getIdLibro();
							cantidadLibro = libro.getCantidad();

							query1 = "INSERT INTO lineapedidos (idPedidoFK, idLibroFK, cantidadLibro) values (" + idPedido + ", "
									+ idLibro + ", " + cantidadLibro + ")";
							ModeloConexionBD.insertarLibro(query1);
					%>
					<tr>
						<td><%=libro.getTitulo()%></td>
						<td align="right"><%=libro.getPrecio()%> €</td>
						<td align="right"><%=libro.getCantidad()%></td>
					</tr>
					<%
						}
						session.invalidate();
					%>
					<tr>
						<td align="right" colspan="2"><strong>Total</strong></td>
						<td align="right"><strong><%=request.getAttribute("precioTotal")%></strong></td>
					</tr>
				</table>
			</div>
			<div class="col-xl-8 mt-4 offset-xl-2 text-center">
				<a href="shopping" class="btn btn-secondary mt-3">Pulsa aquí
					para realizar otro pedido</a>
			</div>
		</div>
	</div>
</body>
</html>
