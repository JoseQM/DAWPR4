package es.studium.carpetaservlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(
		name = "LoginServlet",
		urlPatterns = {"/login"})

public class LoginServlet extends HttpServlet 

{
	private static final long serialVersionUID = 1L;
	// Pool de conexiones a la base de datos
	private DataSource pool;
	public LoginServlet() 
	{
		super();
	}

	public void init(ServletConfig config) throws ServletException
	{
		try
		{
			// Crea un contexto para poder luego buscar el recurso DataSource
			InitialContext ctx = new InitialContext();
			// Busca el recurso DataSource en el contexto
			pool = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql_tiendalibros");
			if(pool == null)
			{
				throw new ServletException("DataSource desconocida 'mysql_tiendalibros'");
			}
		}
		catch(NamingException ex){}
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		Connection conn = null;
		Statement stmt = null;
		try
		
		{
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Login</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h2>Login</h2>");
			// Obtener una conexi�n del pool
			conn = pool.getConnection();
			stmt = conn.createStatement();
			// Recuperar los par�metros usuario y password de la petici�n request
			String usuario = request.getParameter("usuario");
			out.println(usuario);
			String password = request.getParameter("password");
			// Validar los par�metros de la petici�n request
			if(usuario.length()==0)
			{
				out.println("<h3>Debes introducir tu usuario</h3>");
			}
			else if(password.length()==0)
			{
				out.println("<h3>Debes introducir tu contrase�a</h3>");
			}
			else
			{
				// Verificar que existe el usuario y su correspondiente clave
				StringBuilder sqlStr = new StringBuilder();
				sqlStr.append("SELECT * FROM usuarios WHERE ");
				sqlStr.append("STRCMP(usuarios.nombreUsuario, '").append(usuario).append("') = 0");
				sqlStr.append(" AND STRCMP(usuarios.claveUsuario, MD5('").append(password).append("')) = 0");
				//out.println("<p>"+sqlStr.toString()+"</p>");
				ResultSet rset = stmt.executeQuery(sqlStr.toString());
				if(!rset.next())
				{
					// Si el resultset no est� vac�o
					out.println("<h3>Nombre de usuario o contrase�a incorrectos</h3>");
					out.println("<p><a href='Login.html'>Volver a Login</a></p>");
				}
				else
				{

					int tipoUsuario = rset.getInt("tipoUsuario");
					String id = rset.getString("idUsuario");
					System.out.println("TIPO" + tipoUsuario);
					System.out.println("ID: " + id);
					// Si los datos introducidos son correctos
					// Crear una sesi�n nueva y guardar el usuario como variable de sesi�n
					// Primero, invalida la sesi�n si ya existe 

					HttpSession session = request.getSession(false);
					if(session != null)
					{
						session.invalidate();
					}
					else {
						session = request.getSession(true);
						
						synchronized(session) {
							session.setAttribute("usuario", usuario);
							session.setAttribute("idUsuario", id);
							System.out.print("idUser " + rset.getString("idUsuario"));
						}
					}


					if (tipoUsuario == 0)
					{
						out.print("<a href='administrador.jsp'><h3><b>Pulsa aqu� para abrir el Panel de control</b></h2></a>");

					} else {

						out.print("<a href='shopping'><h3><b>Usuario</b></h2></a>");
					}
					out.println("<p>Hola, " + usuario + "!</p>");
				}
			}
			out.println("</body>");
			out.println("</html>");
		}
		catch(SQLException ex)
		{
			out.println("<p>Servicio no disponible:</p>");
			out.println("<p>"+ex.getMessage()+"</p>");
			out.println("</body>");
			out.println("</html>");
		}
		finally
		{
			// Cerramos objetos
			out.close();
			try
			{
				if(stmt != null)
				{
					stmt.close();
				}
				if(conn != null)
				{
					// Esto devolver�a la conexi�n al pool
					conn.close();
				}
			}
			catch(SQLException ex){}
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
} 
