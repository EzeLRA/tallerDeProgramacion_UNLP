package tema4.Ejercicio4;

public abstract class EstacionPrincipal {
    //Atributos
    private String nombreBase;
    private double latitud;
    private double longitud;
    private char lat_NS;
    private char lon_OE;
    
    //Constructor
    public EstacionPrincipal(String unNombre, double lat, double lon){
        this.nombreBase = unNombre;
        this.latitud = lat;
        this.longitud = lon;
        if(this.latitud >= 0){
            this.lat_NS = 'N';
        }else{
            lat_NS = 'S';
        }
        if(this.longitud >= 0){
            this.lon_OE = 'E';
        }else{
            lon_OE = 'O';
        } 
    }
    
    //Metodos
    public abstract void generarTemperaturas();
    public abstract void registrarTemperatura(int pos1, int pos2, double temp);
    public abstract double obtenerTemperatura(int pos1, int pos2);
    public abstract String aniosMes_TemperaturaMax();
    public abstract void calcularPromedios();

    @Override
    public String toString() {
        return nombreBase + '(' + latitud + " " + lat_NS + " , " + longitud + " " + lon_OE + ")";
    }
    
    
    
}
