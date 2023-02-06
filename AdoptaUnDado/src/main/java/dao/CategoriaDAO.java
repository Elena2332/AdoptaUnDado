package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import beans.Categoria;
import beans.Usuario;

public class CategoriaDAO {
	// Método para coger todos las categorias
	public static ArrayList<Categoria> getAllCategorias(DataSource ds) {

		ArrayList<Categoria> arrCategoria = new ArrayList<Categoria>();

		try {
			Connection con = ds.getConnection();
			String sql = "SELECT id, nombre FROM categoria";
			Statement st = con.createStatement();

			ResultSet rs = st.executeQuery(sql);

			while (rs.next()) {
				Categoria cat = new Categoria(rs.getInt("id"), rs.getString("nombre"));

				arrCategoria.add(cat);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return arrCategoria;
	}

	// Método para coger una categoria
	public static Categoria getCategoria(DataSource ds, int id) {

		Categoria cat = null;

		try {
			Connection con = ds.getConnection();
			String sql = "SELECT id, nombre FROM categoria where id = ?";
			PreparedStatement st = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			st.setInt(1, id);

			ResultSet rs = st.executeQuery(sql);

			if (rs.next()) {
				cat = new Categoria(rs.getInt("id"), rs.getString("nombre"));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return cat;
	}

	// Método para insertar categoria
		public static boolean insertCategoria(DataSource ds, Categoria cat) {
	
			try {
				Connection con = ds.getConnection();
				String sql = "INSERT INTO categoria (id, nombre)"
						+ " VALUES  (?,?)";
				PreparedStatement st = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				st.setInt(1, cat.getId());
				st.setString(2, cat.getNombre());
	
				ResultSet rs = st.executeQuery(sql);
				st.execute();

				st.close();
				con.close();
				return true;
	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
			return false;
		}

	public static boolean deleteCategoria(DataSource ds, int id) {
		try {
			Connection con = ds.getConnection();
			String sql = "DELETE FROM categoria where id = ?";

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
}
