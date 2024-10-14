package practica.parcial.pkg14;

public class Concierto {
    //Atributos
    private String nombreArtista;
    private double precioEntrada;
    private int entradasVendidasCant;

    //Constructor
    public Concierto(String nombreArtista, double precioEntrada, int entradasVendidasCant) {
        this.nombreArtista = nombreArtista;
        this.precioEntrada = precioEntrada;
        this.entradasVendidasCant = entradasVendidasCant;
    } 
    
    //Metodos
    public double getGanancia() {
        return this.precioEntrada * this.entradasVendidasCant;
    }
    
    @Override
    public String toString() {
        return nombreArtista + "," + precioEntrada + "," + entradasVendidasCant ;
    }
    
    
    
}
