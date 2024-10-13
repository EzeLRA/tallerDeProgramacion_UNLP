package practica.parcial.pkg7;

public class Participante {
    //Atributos
    private int DNI;
    private int edad;
    private String nombre;
    
    //Constructor
    public Participante(int DNI, int edad, String nombre) {
        this.DNI = DNI;
        this.edad = edad;
        this.nombre = nombre;
    }
    
    //Metodos
    public int getEdad() {
        return edad;
    }

    public String getNombre() {
        return nombre;
    }
    
    
    
}
