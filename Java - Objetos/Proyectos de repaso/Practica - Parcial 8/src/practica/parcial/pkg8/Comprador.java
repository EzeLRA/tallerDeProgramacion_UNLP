package practica.parcial.pkg8;

public class Comprador {
    //Atributos
    private int DNI;
    private String nombre,apellido,ciudad;
    
    //Constructor
    public Comprador(int DNI, String nombre, String apellido, String ciudad) {
        this.DNI = DNI;
        this.nombre = nombre;
        this.apellido = apellido;
        this.ciudad = ciudad;
    }

    @Override
    public String toString() {
        return "DNI=" + DNI + ", nombre=" + nombre + ", apellido=" + apellido + ", ciudad=" + ciudad + '}';
    }
    
    
    
}
