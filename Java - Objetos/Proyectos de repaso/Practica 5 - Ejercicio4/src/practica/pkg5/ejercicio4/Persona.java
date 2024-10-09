package practica.pkg5.ejercicio4;

public abstract class Persona {
    //Atributos
    private String nombre;
    private int DNI;
    private int edad;
    
    //Constructor
    public Persona(String nombre, int DNI, int edad) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.edad = edad;
    }
    
}
