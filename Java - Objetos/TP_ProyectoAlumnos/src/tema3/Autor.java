package tema3;

public class Autor {
    //Atributos
    private String nombre;
    private String biografia;
    private String origen;
    
    
    //Getters y Setters
    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getBiografia() {
        return biografia;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }
    
    //Constructores

    public Autor() {
    }
 
    public Autor(String nombre, String biografia, String origen) {
        this.nombre = nombre;
        this.biografia = biografia;
        this.origen = origen;
    }
    
    
    //Metodos
    
    @Override
    public String toString() {
        return "nombre=" + nombre + ", biografia=" + biografia + ", origen=" + origen + '}';
    }
      
}
