package es.studium.carpetaservlets;


public class ElementoPedido
{
	private int idLibro;
	private int cantidad;
	public ElementoPedido(int idLibro, int cantidad)
	{
		this.idLibro = idLibro;
		this.cantidad = cantidad;
	}
	public int getIdLibro()
	{
		return idLibro + 1;
	}
	public void setIdLibro(int idLibro)
	{
		this.idLibro = idLibro;
	}
	public int getCantidad()
	{
		return cantidad;
	}
	public void setCantidad(int cantidad)
	{
		this.cantidad = cantidad;
	}
	public String getTitulo()
	{
		return LibreriaMVC.getTitulo(idLibro);
	}
	public double getPrecio()
	{
		return LibreriaMVC.getPrecio(idLibro);
	}
}