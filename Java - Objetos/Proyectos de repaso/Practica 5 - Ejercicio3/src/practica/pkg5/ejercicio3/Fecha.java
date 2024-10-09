package practica.pkg5.ejercicio3;

public class Fecha {
    //Atributos
    private int fechaActuacion;
    private String nombreCiudad;

    //Constructor
    public Fecha(int fechaActuacion, String nombreCiudad) {
        this.fechaActuacion = fechaActuacion;
        this.nombreCiudad = nombreCiudad;
    }

    public String getNombreCiudad() {
        return nombreCiudad;
    }
    
}
