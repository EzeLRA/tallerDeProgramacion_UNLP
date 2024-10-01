package tema4.Ejercicio2;

public abstract class Empleado {
    
    //Atributos
    private String nombre;
    private double sueldoBasico;
    private int antiguedad;
    private int porcentajeAumentar;
    
    //Constructor
    public Empleado(String nombre, double sueldoBasico, int antiguedad) {
        this.nombre = nombre;
        this.sueldoBasico = sueldoBasico;
        this.antiguedad = antiguedad;
        this.porcentajeAumentar = 10 * antiguedad;
    }
    
    //Metodos
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    public int getPorcentajeAumentar() {
        return porcentajeAumentar;
    }
    
    //Metodos Abstractos
    
    public abstract double calcularEfectividad();
    public abstract double calcularSueldoACobrar();

    @Override
    public String toString() {
        return "nombre=" + nombre + ", sueldo=" + this.calcularSueldoACobrar() + ", efectividad=" + this.calcularEfectividad() + '}';
    }
 
}
