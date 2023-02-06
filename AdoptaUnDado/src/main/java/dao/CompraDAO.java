package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import beans.Compra;

public class CompraDAO {

	
	// Método para coger todas las compras
		public static ArrayList<Compra> getAllCompras(DataSource ds) {

			ArrayList<Compra> arrCompras = new ArrayList<Compra>();

			try {
				Connection con = ds.getConnection();
				String sql = "SELECT id,total,fecha FROM compra";
				Statement st = con.createStatement();

				ResultSet rs = st.executeQuery(sql);

				while (rs.next()) {
					Compra com = new Compra(rs.getInt("id"), rs.getDouble("total"),rs.getDate("fecha"));
					arrCompras.add(com);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return arrCompras;
		}
		
	// Obtener compra por id
		public static Compra getCompra(DataSource ds, int id) {

			Compra compra = null;

			try {
				Connection con = ds.getConnection();
				String sql = "SELECT id,total,fecha FROM compra where id = ?";
				PreparedStatement st = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				st.setInt(1, id);

				ResultSet rs = st.executeQuery(sql);

				while (rs.next()) {
					compra = new Compra(rs.getInt("id"), rs.getDouble("total"),rs.getDate("fecha"));
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return compra;
		}

		
	//Crear compra 
		public static boolean insertCompra(DataSource ds, Compra com) {
			
			try {
				Connection con = ds.getConnection();
				String sql = "INSERT INTO compra (id, total, fecha)"
						+ " VALUES  (?,?,?)";
				PreparedStatement st = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				st.setInt(1, com.getId());
				st.setDouble(2, com.getTotal());
				st.setDate(2, com.getFecha());
	
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
		
		
	// Eliminar compra
		public static boolean deleteCompra (DataSource ds, int id) {
			try {
	            Connection con = ds.getConnection();
	            String sql = "DELETE FROM compra where id = ?";
	            
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
