package practica.parcial.pkg19;

public class Bien {
    //Atributos
    private String descripcion;
    private int cantidad;
    private double costoUnidad;
    
    //Constructor
    public Bien(String descripcion, int cantidad, double costoUnidad) {
        this.descripcion = descripcion;
        this.cantidad = cantidad;
        this.costoUnidad = costoUnidad;
    }
    
    //Metodos
    public double retornarCosto(){
        return this.cantidad * this.costoUnidad;
    }

    public String getDescripcion() {
        return descripcion;
    }
    
    
    
}
