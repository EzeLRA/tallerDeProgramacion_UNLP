package practica.parcial.pkg11;

public class Alumno {
    //Atributos
    private String nombre;
    private int edad;
    private String instrumento;
    private int puntajeObtenido;
    
    //Constructor
    public Alumno(String nombre, int edad, String instrumento) {
        this.nombre = nombre;
        this.edad = edad;
        this.instrumento = instrumento;
        this.puntajeObtenido = -1;
    }
    
    //Metodos
    public void setPuntajeObtenido(int puntajeObtenido) {
        this.puntajeObtenido = puntajeObtenido;
    }

    public String getNombre() {
        return nombre;
    }
    
    
    
    
}
