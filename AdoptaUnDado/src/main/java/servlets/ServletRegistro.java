package servlets;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import conex.ConnectionPoolDB;
import dao.UsuarioDAO;

/**
 * Servlet implementation class ServletRegistro
 */
@WebServlet("/ServletRegistro")
public class ServletRegistro extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    DataSource ds;
    
    public void init(ServletConfig config) throws ServletException {
    	super.init(config);
    	ds = ConnectionPoolDB.getDataSource();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("entrar") != null) {
			
			String nombre = request.getParameter("nombre");
			String apellidos = request.getParameter("apellidos");
			String descripcion = request.getParameter("descripcion");
			String direccion = request.getParameter("direccion");
			String cp = request.getParameter("cp");
			String municipio = request.getParameter("municipio");
			String ciudad = request.getParameter("ciudad");
			String pais = request.getParameter("pais");
			String email = request.getParameter("email");
			String pass = request.getParameter("password");
			String telefono = request.getParameter("telefono");
			
			/*boolean existeUsuario = UsuarioDAO.existeUsuario(ds, email);
			
			if (existeUsuario) {
				//Faltaría mandar un mensaje de error
				response.sendRedirect("registro.jsp");
			} else {
				
			}*/
		}
		
	}

}
