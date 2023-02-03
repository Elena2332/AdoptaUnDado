package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import javax.servlet.http.HttpSession;


import beans.Usuario;
import conex.ConnectionPoolDB;

/**
 * Servlet implementation class ServletIndex
 */
public class ServletIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	DataSource ds;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		ds = ConnectionPoolDB.getDataSource();
	}
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletIndex() {
        super();
        // TODO Auto-generated constructor stub
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
	
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//SESSION
		HttpSession session = request.getSession(false);
		if(session == null)  //no hay session
		{
			session = request.getSession(true);   //iniciar session
			Usuario usu = new Usuario();
			usu.setRol(-1);   // usuario sin registrar
			session.setAttribute("usuario", usu);
		}
		
		System.out.println(session);
		//ArrayList<Usuario> listaUsu =  UsuarioDAO.getAllUsuarios(ds);      //daos
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	

}
