package practica.parcial.pkg9;

public class Paciente {
    //Atributos
    private String nombre;
    private boolean disponeObraSocial;
    private double costoAbonar;
    
    //Constructor
    public Paciente(String nombre, boolean disponeObraSocial, double costoAbonar) {
        this.nombre = nombre;
        this.disponeObraSocial = disponeObraSocial;
        this.costoAbonar = costoAbonar;
    }
    
    //Metodos
    public String getNombre() {
        return nombre;
    }

    public double getCostoAbonar() {
        return costoAbonar;
    }
    
}
