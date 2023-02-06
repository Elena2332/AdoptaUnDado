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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// doGet(request, response);
		
		String correo = "";
		String pass = "";
		
		//Se pincha en el bot�n ENTRAR
		if (request.getParameter("entrar") != null) {
			
			//Comprobaci�n de campos vac�os
			if (request.getParameter("email").equals("") || request.getParameter("password").equals("")) {
				response.sendRedirect("login.jsp");
			} else {
				
				correo = request.getParameter("email");
				pass = request.getParameter("password");
				
				//Comprobaci�n de datos del usuario
				boolean existeUsuario = UsuarioDAO.comprobarUsuario(ds, correo, pass);
				
				if (existeUsuario) {
					//Faltar�a meter al usuario en la sesi�n
					response.sendRedirect("index.jsp");
				} else {
					//Falatar�a mandar un mensaje de error
					response.sendRedirect("login.jsp");
				}
				
			}
			
		}
		
	}

}