package practica.parcial.pkg6;

public class Goleador {
    //Atributos
    private String nombre;
    private String nombreEquipo;
    private int goles;
    
    //Constructor
    public Goleador(String nombre, String nombreEquipo, int goles) {
        this.setNombre(nombre);
        this.setGoles(goles);
        this.setNombreEquipo(nombreEquipo);
    }
    
    //Metodos primarios

    public int getGoles() {
        return goles;
    }

    @Override
    public String toString() {
        return "Goleador{" + "nombre=" + nombre + ", nombreEquipo=" + nombreEquipo + ", goles=" + goles + '}';
    }
    
    
    
    //Metodos secundarios
    
    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    private void setNombreEquipo(String nombreEquipo) {
        this.nombreEquipo = nombreEquipo;
    }

    private void setGoles(int goles) {
        this.goles = goles;
    }
    
    
}
