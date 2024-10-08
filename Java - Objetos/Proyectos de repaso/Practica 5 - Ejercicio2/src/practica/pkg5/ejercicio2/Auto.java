package practica.pkg5.ejercicio2;

public class Auto {
    //Atributos
    private String nombreDuenio;
    private String patente;
    
    //Constructores
    public Auto(String nombreDuenio, String patente) {
        this.nombreDuenio = nombreDuenio;
        this.patente = patente;
    }
    
    //Metodos
    public String getNombreDuenio() {
        return nombreDuenio;
    }

    public String getPatente() {
        return patente;
    }

    @Override
    public String toString() {
        return "Auto{" + "nombreDuenio=" + nombreDuenio + ", patente=" + patente + '}';
    }
        
}
