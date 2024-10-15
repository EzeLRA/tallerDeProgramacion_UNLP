package practica.parcial.pkg16;

public class Empleado {
    //Atributos
    private String nombre,apellido;
    private int antiguedad;
    
    //Constructor
    public Empleado(String nombre, String apellido, int antiguedad) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.antiguedad = antiguedad;
    }

    public int getAntiguedad() {
        return antiguedad;
    }
    
    @Override
    public String toString() {
        return nombre + "," + apellido + "," + antiguedad ;
    }
    
    
}
