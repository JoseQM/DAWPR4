package es.studium.carpetaservlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LogoutServlet
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try
		{
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");    
			out.println("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">");
			out.println("<title>Logout</title>");
			out.println("</head>");
			out.println("<body>");
			
			HttpSession session = request.getSession(false);
			if(session == null)
			{
				out.println("<div class='container mt-4 text-center'>");
				out.println("<div class='row'>");
				out.println("<div class='col-xl-8 offset-xl-2 text-center'>");
				out.println("<h3 class='mb-3 pb-3'>No has iniciado sesión</h3>");
				out.println("<p><a class='btn btn-primary' href='Login.html'>Volver al Login</a></p>");
			}
			else
			{
				session.invalidate();
				out.println("<div class='container mt-4 text-center'>");
				out.println("<div class='row'>");
				out.println("<div class='col-xl-8 offset-xl-2 text-center'>");
				out.println("<h3 class='mb-3 pb-3'>Has cerrado sesión</h3>");
				out.println("<p><a class='btn btn-primary' href='Login.html'>Volver al Login</a></p>");
			}
			out.println("</div>");
			out.println("</div>");
			out.println("</div>");
			out.println("</body>");
			out.println("</html>");
		}
		finally
		{
			// Cerramos objetos
			out.close();
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
}

