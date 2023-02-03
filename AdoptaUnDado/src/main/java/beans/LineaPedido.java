package beans;

public class LineaPedido {
	private int id, id_articulo, id_compra, cantidad;
	private double precio;
	private String dni_usuario;
	
	public LineaPedido(int id, int id_articulo, int id_compra, int cantidad, double precio, String dni_usuario) {
		this.id = id;
		this.id_articulo = id_articulo;
		this.id_compra = id_compra;
		this.cantidad = cantidad;
		this.precio = precio;
		this.dni_usuario = dni_usuario;
	}

	public LineaPedido(int id, int id_articulo, int cantidad, double precio, String dni_usuario) {
		this.id = id;
		this.id_articulo = id_articulo;
		this.cantidad = cantidad;
		this.precio = precio;
		this.dni_usuario = dni_usuario;
	}

	public LineaPedido() {
	}

	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId_articulo() {
		return id_articulo;
	}

	public void setId_articulo(int id_articulo) {
		this.id_articulo = id_articulo;
	}

	public int getId_compra() {
		return id_compra;
	}

	public void setId_compra(int id_compra) {
		this.id_compra = id_compra;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public String getDni_usuario() {
		return dni_usuario;
	}

	public void setDni_usuario(String dni_usuario) {
		this.dni_usuario = dni_usuario;
	}
	
	
	
}
