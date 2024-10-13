package practica.practica.pkg12;

public class Producto {
    //Atributos
    private int codigo;
    private double precio;
    private String descripcion;
    
    //Constructor
    public Producto(int codigo, double precio, String descripcion) {
        this.codigo = codigo;
        this.precio = precio;
        this.descripcion = descripcion;
    }
    
    //Metodos

    public double getPrecio() {
        return precio;
    }

    @Override
    public String toString() {
        return "Producto(" + "codigo=" + codigo + ", precio=" + precio + ", descripcion=" + descripcion + ')';
    }
    
}
