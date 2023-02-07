package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import beans.Usuario;
import conex.ConnectionPoolDB;

public class UsuarioDAO {

	// M�todo para coger todos los usuarios
	public static ArrayList<Usuario> getAllUsuarios(DataSource ds) {

		ArrayList<Usuario> arrUsuarios = new ArrayList<Usuario>();

		try {
			Connection con = ds.getConnection();
			String sql = "SELECT dni, nombre, apellido, password FROM usuario";
			Statement st = con.createStatement();

			ResultSet rs = st.executeQuery(sql);

			while (rs.next()) {
				Usuario usu = new Usuario(rs.getString("dni"), rs.getString("nombre"), rs.getString("apellido"),
						rs.getString("password"));

				arrUsuarios.add(usu);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return arrUsuarios;
	}

	// M�todo para coger todos los usuarios
	public static Usuario getUsuario(DataSource ds, String dni) {

		Usuario usuario = null;

		try {
			Connection con = ds.getConnection();
			String sql = "SELECT dni, nombre, apellido, password FROM usuario where dni = ?";
			PreparedStatement st = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			st.setString(1, dni);

			ResultSet rs = st.executeQuery(sql);

			if (rs.next()) {
				usuario = new Usuario(rs.getString("dni"), rs.getString("nombre"), rs.getString("apellido"),
						rs.getString("password"));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return usuario;
	}

	// M�todo para coger todos los usuarios
//	public static boolean insertUsuario(DataSource ds, Usuario usu) {
//
//
//		try {
//			Connection con = ds.getConnection();
//			String sql = "INSERT INTO usuario(`dni`, `nombre`, `apellido`, `email`, `password`, `descripcion`, `direccion`, `municipio`, `provincia`, `pais`, `codigopostal`, `telefono`, `imagen`, `rol`)"
//					+ " VALUES  (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
//			PreparedStatement st = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
//			st.setString(1, dni);
//
//			ResultSet rs = st.executeQuery(sql);
//
//			if (rs.next()) {
//				usuario = new Usuario(rs.getString("dni"), rs.getString("nombre"), rs.getString("apellido"),
//						rs.getString("password"));
//
//			}
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		return usuario;
//	}
	
	public static boolean deleteUsuario (DataSource ds, String dni) {
		try {
            Connection con = ds.getConnection();
            String sql = "DELETE FROM usuario where dni = ?";
            
            PreparedStatement st = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, dni);

            
            st.execute();
            
            
            st.close();
            con.close();
            return true;
        } catch (SQLException ex) {
        	System.err.println(ex.getMessage());
        }
	        
		return false;
	}

	//M�todo para comprobar si existe el usuario al loguearse
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
	
	//M�todo para sacar el dni del usuario
	public static String sacarDniUsuario(DataSource ds, String email) {
		String dniUsuario = "";
		
		try {
			Connection con = ds.getConnection();
            String sql = "SELECT dni FROM usuario where email = ?";
            
            PreparedStatement st = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, email);

            
            ResultSet rs = st.executeQuery();
			
			if(rs.next()) {
				
				dniUsuario = rs.getString("dni");
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dniUsuario;
	}

}
