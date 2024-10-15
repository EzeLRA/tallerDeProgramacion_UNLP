package practica.parcial.pkg15;

public abstract class Cliente {
    //Atributos
    private int DNI;
    private String nombre,apellido;
    
    //Atributos
    public Cliente(int DNI, String nombre, String apellido) {
        this.DNI = DNI;
        this.nombre = nombre;
        this.apellido = apellido;
    }
    
    //Metodos
    public int getDNI() {
        return DNI;
    }

    @Override
    public String toString() {
        return "DNI=" + DNI + ", nombre=" + nombre + ", apellido=" + apellido + '}';
    }
    
    
    
    
    
}
