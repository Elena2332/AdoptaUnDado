package servlets;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import beans.Usuario;
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
		
		if (request.getParameter("entrarRegistro") != null) {
			
			String dni = request.getParameter("dni");
			String nombre = request.getParameter("nombre");
			String apellidos = request.getParameter("apellidos");
			String descripcion = request.getParameter("descripcion");
			String direccion = request.getParameter("direccion");
			String cp = request.getParameter("cp");
			String municipio = request.getParameter("municipio");
			String provincia = request.getParameter("provincia");
			String pais = request.getParameter("pais");
			String email = request.getParameter("email");
			String pass = request.getParameter("password");
			String telefono = request.getParameter("telefono");
			
			boolean existeUsuario = UsuarioDAO.existeUsuario(ds, email);
			
			if (existeUsuario) {
				//Si existe usuario, se redirige a la registro.jsp mandando un mensaje de error
				request.setAttribute("mensajeErrorRegistro", "Ya existe una cuenta con este correo!");
				request.getRequestDispatcher("registro.jsp").forward(request, response);
			} else {
				Usuario usuario = new Usuario(dni, nombre, apellidos, pass, descripcion, direccion, provincia, provincia, pais, cp, email, telefono, "", 1, 0);
				boolean usuarioCreado = UsuarioDAO.inserarUsuario(ds, usuario);
				
				if (usuarioCreado) {
					//Faltaría hacer lo del correo de verificación
					request.setAttribute("mensajeVerificado", "Revise su correo para verificarse!");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				} else {
					request.setAttribute("mensajeErrorRegistro", "Error! El usuario no se ha registrado correctamente!");
					request.getRequestDispatcher("registro.jsp").forward(request, response);
				}
			}
		}
		
	}

}
