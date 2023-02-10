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

import beans.Articulo;
import beans.Categoria;
import beans.Usuario;
import conex.ConnectionPoolDB;
import dao.ArticuloDAO;
import dao.CategoriaDAO;

/**
 * Servlet implementation class ServletIndex
 */
public class ServletDetalle extends HttpServlet {
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
    public ServletDetalle() {
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
		if(session == null || session.getAttribute("usuario") == null)  //no hay session
		{
			session = request.getSession(true);   //iniciar session
			Usuario usu = new Usuario();
			usu.setRol(-1);   // usuario sin registrar
			session.setAttribute("usuario", usu);
		}
		

		//ARTICULOS
		if(session.getAttribute("articulo") == null)
		{
			String idAux = request.getParameter("item");
			if(idAux != null)
			{				
				int id = Integer.valueOf(idAux);
				Articulo arti = ArticuloDAO.getArticulo(ds, id);
				session.setAttribute("articulo", arti);     // articulo seleccionado
				//session.setAttribute("categoria", CategoriaDAO.getCategoria(ds, arti.getId_categoria()));
				session.setAttribute("cantidad", 1);
			}
			else
				request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		
		System.out.println(session.getAttribute("cantidad"));

		request.getRequestDispatcher("detalle.jsp").forward(request, response);
	}
	

}
