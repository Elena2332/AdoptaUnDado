package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import beans.Usuario;
import conex.ConnectionPoolDB;

public class UsuarioDAO {
	
	
	//Método para coger todos los usuarios
	public static ArrayList<Usuario> getAllUsuarios () {
		
		ArrayList<Usuario> arrUsuarios= new ArrayList<Usuario>();
		
		try {
			Connection con= ConnectionPoolDB.getDataSource().getConnection();
			String sql="SELECT dni, nombre, apellido, password FROM usuario";
			Statement st= con.createStatement();
	
			ResultSet rs= st.executeQuery(sql);
			
			
			while(rs.next()) {
				Usuario usu = new Usuario(rs.getString("dni"), rs.getString("nombre"),rs.getString("apellido"),rs.getString("password"));
			
				arrUsuarios.add(usu);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return arrUsuarios;
		
	}
	
}
