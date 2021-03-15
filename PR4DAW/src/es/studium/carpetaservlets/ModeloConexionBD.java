
package es.studium.carpetaservlets;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.sql.DataSource;

// Clase creada para crear consultas
public class ModeloConexionBD {
	
	private static DataSource pool;


	
	public static ResultSet selectBD(String query) throws ServletException, SQLException {
		try {
			// Crea un contexto para poder luego buscar el recurso DataSource
			InitialContext ctx = new InitialContext();
			// Busca el recurso DataSource en el contexto
			pool = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql_tiendalibros");
			if(pool == null) {
				throw new ServletException("DataSource desconocida 'mysql_tiendalibros' ");
			}
		}
		catch(NamingException ex){}
		
		Connection conn = null;
		Statement stmt = null;
		

		conn = pool.getConnection();
		stmt = conn.createStatement();
		StringBuilder sqlStr = new StringBuilder();

		sqlStr.append(query);
		
		System.out.println(sqlStr.toString());
		ResultSet rset = stmt.executeQuery(sqlStr.toString());
		return rset;
	}
	
	
	public static void insertarLibro(String query) throws ServletException, SQLException {
		try {
			// Crea un contexto para poder luego buscar el recurso DataSource
			InitialContext ctx = new InitialContext();
			// Busca el recurso DataSource en el contexto
			pool = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql_tiendalibros");
			if(pool == null) {
				throw new ServletException("DataSource desconocida 'mysql_tiendalibros' ");
			}
		}
		catch(NamingException ex){}
		
		Connection conn = null;
		Statement stmt = null;

		conn = pool.getConnection();
		stmt = conn.createStatement();

		System.out.println(query);
		stmt.executeUpdate(query);
	}
	
	public static void actualizarLibro(String query) throws ServletException, SQLException {
		try {
			// Crea un contexto para poder luego buscar el recurso DataSource
			InitialContext ctx = new InitialContext();
			// Busca el recurso DataSource en el contexto
			pool = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql_tiendalibros");
			if(pool == null) {
				throw new ServletException("DataSource desconocida 'mysql_tiendalibros' ");
			}
		}
		catch(NamingException ex){}
		
		Connection conn = null;
		Statement stmt = null;

		conn = pool.getConnection();
		stmt = conn.createStatement();
		StringBuilder sqlStr = new StringBuilder();

		sqlStr.append(query);
		System.out.println(sqlStr.toString());
		stmt.executeUpdate(sqlStr.toString());
	}
}
