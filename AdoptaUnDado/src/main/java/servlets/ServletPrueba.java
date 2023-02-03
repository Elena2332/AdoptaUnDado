package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
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
 * Servlet implementation class ServletLogin
 */

public class ServletPrueba extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//desde aqui patri
	DataSource ds;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		ds = ConnectionPoolDB.getDataSource();
	}
    //hasta aqui patri :D
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession(false);
		
		ArrayList<Usuario> listaUsu =  UsuarioDAO.getAllUsuarios(ds);
		
		request.getSession().setAttribute("listaUsu", listaUsu);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
