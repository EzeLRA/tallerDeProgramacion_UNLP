package tema4.Ejercicio4;

public abstract class EstacionPrincipal {
    //Atributos
    private String nombreBase;
    private double latitud;
    private double longitud;
    
    //Constructor
    public EstacionPrincipal(String unNombre, double lat, double lon){
        this.nombreBase = unNombre;
        this.latitud = lat;
        this.longitud = lon;
    }
    
    //Metodos
    public abstract void generarTemperaturas();
    public abstract void registrarTemperatura(int pos1, int pos2, double temp);
    public abstract double obtenerTemperatura(int pos1, int pos2);
}
