package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import beans.LineaPedido;

public class LineaPedidoDAO {
	public static ArrayList<LineaPedido> getAllCategorias(DataSource ds) {

		ArrayList<LineaPedido> arrLineaPedido = new ArrayList<LineaPedido>();

		try {
			Connection con = ds.getConnection();
			String sql = "SELECT id, usuario, articulo, precio, cantidad, id_compra FROM lineapedido";
			Statement st = con.createStatement();

			ResultSet rs = st.executeQuery(sql);

			while (rs.next()) {
				LineaPedido lp = new LineaPedido(rs.getInt("id"), rs.getString("usuario"),rs.getInt("articulo"), rs.getDouble("precio"),
						rs.getInt("cantidad"), rs.getInt("id_compra"));

				arrLineaPedido.add(lp);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return arrLineaPedido;
	}

	// Método para coger una categoria
	public static LineaPedido getLineaPedido(DataSource ds, int id) {

		LineaPedido lp = null;

		try {
			Connection con = ds.getConnection();
			String sql = "SELECT id, usuario, articulo, precio, cantidad, id_compra FROM lineapedido where id = ?";
			PreparedStatement st = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			st.setInt(1, id);

			ResultSet rs = st.executeQuery(sql);

			if (rs.next()) {
				lp = new LineaPedido(rs.getInt("id"), rs.getString("usuario"),rs.getInt("articulo"), rs.getDouble("precio"),
						rs.getInt("cantidad"), rs.getInt("id_compra"));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return lp;
	}

	// Método para insertar categoria
		public static boolean insertLineaPedido(DataSource ds, LineaPedido lp) {
	
			try {
				Connection con = ds.getConnection();
				String sql = "INSERT INTO lineapedido (id, usuario, articulo, precio, cantidad, id_compra)"
						+ " VALUES  (?,?,?,?,?,?)";
				PreparedStatement st = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				st.setInt(1, lp.getId());
				st.setString(2, lp.getDni_usuario());
				st.setInt(3, lp.getId_articulo());
				st.setDouble(4, lp.getPrecio());
				st.setInt(5, lp.getCantidad());
				st.setInt(6, lp.getId_compra());
	
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

	public static boolean deleteLineaPedido(DataSource ds, int id) {
		try {
			Connection con = ds.getConnection();
			String sql = "DELETE FROM lineapedido where id = ?";

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
