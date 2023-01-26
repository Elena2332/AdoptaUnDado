package beans;

import java.sql.Date;

public class Compra {

	private int id;
	private double total;
	private Date fecha;   // date de sql
	
	
	public Compra(int id, double total, Date fecha) {
		this.id = id;
		this.total = total;
		this.fecha = fecha;
	}

	public Compra() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public Date getFecha() {
		return fecha;
	}
	public java.util.Date getFechaUtil()   //devuelve Date de java.util
	{
		return new java.util.Date(fecha.getTime());
	}
	
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public void setFechaUtil(java.util.Date fecha)   //cambia la fecha recibiendo un Date de java.util
	{
		this.fecha = new Date(fecha.getTime());
	}
}
