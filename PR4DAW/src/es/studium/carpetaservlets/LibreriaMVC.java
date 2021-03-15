package es.studium.carpetaservlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class LibreriaMVC
{
	static ArrayList<Libro> tabla = new ArrayList<Libro>();
	public static void cargarDatos()
	{
		// Creamos objetos para la conexión
		Connection conn = null;
		Statement stmt = null;
		try 
		{
			ResultSet rs = es.studium.carpetaservlets.ModeloConexionBD.selectBD("SELECT * FROM libros");
			Libro libro;
			while(rs.next())
			{
				libro =  new Libro(rs.getInt("idLibro"), rs.getString("tituloLibro"), rs.getDouble("precioLibro"));
				tabla.add(libro);
			}
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			try
			{
				// Cerramos el resto de recursos
				if(stmt != null)
				{
					stmt.close();
				}
				if(conn != null)
				{
					conn.close();
				}
			}
			catch(Exception ex){
				ex.printStackTrace();
			}
		}
	}
	/**
	 * Devuelve el número de libros obtenidos
	 */
	public static int tamano()
	{
		return tabla.size();
	}
	/**
	 * Devuelve el título del libro identificado con idLibro
	 */
	public static String getTitulo(int idLibro)
	{
		return tabla.get(idLibro).getTitulo();
	}
	/**
	 * Devuelve el precio del libro identificado con idLibro
	 */
	public static double getPrecio(int idLibro)
	{
		return tabla.get(idLibro).getPrecio();
	}
}