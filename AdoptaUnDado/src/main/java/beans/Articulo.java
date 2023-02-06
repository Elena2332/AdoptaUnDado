package beans;


public class Articulo {

	private int id,id_categoria, stock;
	private String nombre;
	private double precio;
	private String imagen;   //Blob
	
	public Articulo(int id,String nombre, int id_categoria, double precio, String imagen, int stock) {
		this.id = id;
		this.id_categoria = id_categoria;
		this.stock = stock;
		this.nombre = nombre;
		this.precio = precio;
		this.imagen = imagen;
	}
	
	public Articulo(int id,String nombre, int id_categoria, double precio, int stock) {
		this.id = id;
		this.id_categoria = id_categoria;
		this.stock = stock;
		this.nombre = nombre;
		this.precio = precio;
		this.imagen = "";
	}
	
	public Articulo()  
	{
		
	}

	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	

	public int getId_categoria() {
		return id_categoria;
	}

	public void setId_categoria(int id_categoria) {
		this.id_categoria = id_categoria;
	}
	

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}
	

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	
	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	
	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
	
	
	
}
