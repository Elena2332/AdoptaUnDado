package conex;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectionPoolDB {
	private static DataSource dataSource;

	public static DataSource getDataSource() {

		if (dataSource == null) {
			try {
				InitialContext ctx = new InitialContext();
				Context env = (Context) ctx.lookup("java:comp/env");
				// nombre del recurso en el context.xml
				dataSource = (DataSource) env.lookup("jdbc/poolDadosDB");

			} catch (NamingException e) {
				e.printStackTrace();
			}
		}

		return dataSource;
	}

}
