<%@page import="es.studium.carpetaservlets.ModeloConexionBD"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
	try {
		String idLibro = request.getParameter("idLibro");
		ResultSet resultSet = ModeloConexionBD.selectBD("SELECT * FROM libros WHERE idLibro=" + idLibro);
		while (resultSet.next()) {
%>
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
<title>Modificando</title>
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
			<div class="col-xl-8 offset-xl-2 pt-3 mt-2">
				<form method="post" action="modLibro3.jsp">
					<%
						String titulo = resultSet.getString("tituloLibro");
								String precio = resultSet.getString("precioLibro");
								String cantidad = resultSet.getString("cantidadStockLibro");
								String autor = resultSet.getString("idAutorFK");
								String editorial = resultSet.getString("idEditorialFK");
					%>
					<div class="input-group mb-3 d-none">
						<input name="idLibro" type="text" class="form-control"
							aria-label="Titulo" aria-describedby="basic-addon1"
							value="<%=idLibro%>">
					</div>

					<div class="col-6 mt-5 input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">Titulo</span>
						</div>
						<input name="titulo" type="text" class="form-control"
							aria-label="Titulo" aria-describedby="basic-addon1"
							value="<%=titulo%>">
					</div>
					<div class="col-6 input-group mb-3">
						<div class=" input-group-prepend">
							<span class="input-group-text" id="basic-addon1">Precio</span>
						</div>
						<input name="precio" type="number" class="form-control"
							placeholder="00.00" aria-label="Precio"
							aria-describedby="basic-addon1" value="<%=precio%>">

						<div class="pl-3 input-group-prepend">
							<span class="input-group-text" id="basic-addon1">Cantidad</span>
						</div>
						<input name="cantidad" type="number" class="form-control"
							placeholder="00" aria-label="Cantidad"
							aria-describedby="basic-addon1" value="<%=cantidad%>">
					</div>
					<div class="col-6 input-group mb-3">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1">Autores</span>
							</div>
							<select name="autor" class="form-control">
								<%@ page import="java.sql.*"%>
								<%
									ResultSet rs = ModeloConexionBD.selectBD("SELECT * FROM autores");
											while (rs.next()) {
												if (autor.contains(rs.getString("idAutor"))) {
													out.print("<option value=\"" + rs.getString("idAutor") + "\" selected=\"selected\">"
															+ rs.getString("nombreAutor") + " " + rs.getString("apellidosAutor") + "</option>");
												} else {
													out.print("<option value=\"" + rs.getString("idAutor") + "\">" + rs.getString("nombreAutor")
															+ " " + rs.getString("apellidosAutor") + "</option>");

												}
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
												if (editorial.contains(rs1.getString("idEditorial"))) {
													out.print("<option value=\"" + rs1.getString("idEditorial") + "\" selected=\"selected\">"
															+ rs1.getString("nombreEditorial") + "</option>");
												} else {
													out.print("<option value=\"" + rs1.getString("idEditorial") + "\" >"
															+ rs1.getString("nombreEditorial") + "</option>");

												}
											}
								%>
							</select>
						</div>
					</div>
					<div class="col-12 offset-xl-2 pt-3">
						<button class="btn btn-success" type="submit">Modificar
							libro</button>
						<a href="modLibro.jsp" class="btn btn-secondary">Volver</a>
					</div>
				</form>
				<%
					}
					} catch (Exception e) {
						out.print("<script>alert(\"" + e + "\");</script>");
					}
				%>
			</div>
		</div>
</body>
</html>