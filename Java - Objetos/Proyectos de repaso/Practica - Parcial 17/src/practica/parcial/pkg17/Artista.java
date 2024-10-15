package practica.parcial.pkg17;

public class Artista {
    //Atributos
    private String nombreArtistico;
    private String categoria;

    //Constructor
    public Artista(String nombreArtistico, String categoria) {
        this.nombreArtistico = nombreArtistico;
        this.categoria = categoria;
    }
    
    //Metodos

    public String getCategoria() {
        return categoria;
    }
    
    
}
