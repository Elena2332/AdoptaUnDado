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
 * Servlet implementation class ServletLogin
 */
@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
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
	
		if (request.getParameter("olvidar") != null) {
			
			
		}
		
		if (request.getParameter("perfil") != null) {
			request.getRequestDispatcher("perfil.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// doGet(request, response);
		
		String correo = "";
		String pass = "";
		
		//Se pincha en el botón ENTRAR
		if (request.getParameter("entrarLogin") != null) {
			
			//Comprobación de campos vacíos
			if (request.getParameter("email").equals("") || request.getParameter("password").equals("")) {
				response.sendRedirect("login.jsp");
			} else {
				
				correo = request.getParameter("email");
				pass = request.getParameter("password");
				
				//Comprobación de datos del usuario
				boolean existeUsuario = UsuarioDAO.comprobarUsuario(ds, correo, pass);
				
				if (existeUsuario) {
					//Si existe usuario, se guarda en la sesión y se redirige a index.jsp
					HttpSession session = request.getSession(true);
					session.setAttribute("usuario",UsuarioDAO.getUsuario(ds, UsuarioDAO.sacarDniUsuario(ds, correo)));
					request.getRequestDispatcher("index.jsp").forward(request, response);
				} else {
					//Si no existe usuario o no está verificado, se redirige a login.jsp con un mensaje de error
					request.setAttribute("mensajeError", "Usuario no encontrado/verificado!");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
				
			}
			
		}
		
	}

}