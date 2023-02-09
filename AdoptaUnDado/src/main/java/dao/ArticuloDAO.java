package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import beans.Articulo;
import beans.Usuario;

public class ArticuloDAO {
	// Método para coger todos los articulos
		public static ArrayList<Articulo> getAllArticulos(DataSource ds) {

			ArrayList<Articulo> arrArticulo = new ArrayList<Articulo>();

			try {
				Connection con = ds.getConnection();
				String sql = "SELECT id, nombre, idCategoria, precio, stock FROM articulo";
				Statement st = con.createStatement();

				ResultSet rs = st.executeQuery(sql);

				while (rs.next()) {
					Articulo articulo = new Articulo(rs.getInt("id"), rs.getString("nombre"), rs.getInt("idCategoria"),
							rs.getDouble("precio"), rs.getInt("stock"));

					arrArticulo.add(articulo);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return arrArticulo;
		}

		// Método para coger un articulo
		public static Articulo getArticulo(DataSource ds, int id) {

			Articulo articulo = null;

			try {
				Connection con = ds.getConnection();
				String sql = "SELECT id, nombre, idCategoria, precio, stock FROM articulo where id = ?";
				PreparedStatement st = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				st.setInt(1, id);

				ResultSet rs = st.executeQuery(sql);

				if (rs.next()) {
					articulo  = new Articulo(rs.getInt("id"), rs.getString("nombre"), rs.getInt("idCategoria"),
							rs.getDouble("precio"), rs.getInt("stock"));

				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return articulo;
		}

		// Método para insertar articulo
//		public static boolean insertUsuario(DataSource ds, Usuario usu) {
	//
	//
//			try {
//				Connection con = ds.getConnection();
//				String sql = "INSERT INTO usuario(`dni`, `nombre`, `apellido`, `email`, `password`, `descripcion`, `direccion`, `municipio`, `provincia`, `pais`, `codigopostal`, `telefono`, `imagen`, `rol`)"
//						+ " VALUES  (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
//				PreparedStatement st = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
//				st.setString(1, dni);
	//
//				ResultSet rs = st.executeQuery(sql);
	//
//				if (rs.next()) {
//					usuario = new Usuario(rs.getString("dni"), rs.getString("nombre"), rs.getString("apellido"),
//							rs.getString("password"));
	//
//				}
	//
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
	//
//			return usuario;
//		}
		
		public static boolean deleteArticulo (DataSource ds, int id) {
			try {
	            Connection con = ds.getConnection();
	            String sql = "DELETE FROM articulo where id = ?";
	            
	            PreparedStatement st = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	            st.setInt(1, id);

	            
	            st.execute();
	            
	            
	            st.close();
	            con.close();
	            return true;
	        } catch (SQLException ex) {
	        	System.err.println(ex.getMessage());
	        }
		        
			return false;
		}

		//Método para comprobar si existe el usuario al loguearse
		public static boolean comprobarUsuario(DataSource ds, String email, String pass) {
			
			boolean existeUsuario = false;
			
			try {
				Connection con = ds.getConnection();
				String sql ="SELECT email, password FROM usuario";
				Statement st = con.createStatement();
				
				ResultSet rs = st.executeQuery(sql);
				
				while(rs.next()) {
					
					if (rs.getString("email").equals(email) && rs.getString("password").equals(pass)) {
						existeUsuario = true;
					}
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return existeUsuario;
			
		}

}
