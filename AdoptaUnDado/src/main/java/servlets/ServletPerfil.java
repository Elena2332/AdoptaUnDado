package servlets;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import beans.Usuario;
import conex.ConnectionPoolDB;
import dao.UsuarioDAO;

/**
 * Servlet implementation class ServletPerfil
 */
@WebServlet("/ServletPerfil")
public class ServletPerfil extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	DataSource ds;
    
    public void init(ServletConfig config) throws ServletException {
    	super.init(config);
    	ds = ConnectionPoolDB.getDataSource();
    }
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletPerfil() {
        super();
        // TODO Auto-generated constructor stub
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

		HttpSession session = request.getSession(true);
		
		if (request.getParameter("guardarCambios") != null) {
			Usuario usuario = new Usuario(request.getParameter("dni"), request.getParameter("nombre"), request.getParameter("apellido"), request.getParameter("password"), request.getParameter("descripcion"), request.getParameter("direccion"), request.getParameter("municipio"), request.getParameter("provincia"), request.getParameter("pais"), request.getParameter("codigopostal"), request.getParameter("email"), request.getParameter("telefono"), request.getParameter("imagen"), 1, 1);
			boolean usuarioActualizado = UsuarioDAO.actualizarUsuario(ds, usuario);
			
			if (usuarioActualizado) {
				request.setAttribute("mensajeActualizacion", "Se han guardado los datos correctamente!");
				request.setAttribute("usuario", usuario);
				request.getRequestDispatcher("perfil.jsp").forward(request, response);
			} else {
				request.setAttribute("mensajeActualizacion", "No se ha podido guardar los cambios!");
				request.getRequestDispatcher("perfil.jsp").forward(request, response);
			}
		}
		
	}

}
